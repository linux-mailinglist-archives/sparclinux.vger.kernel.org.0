Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DBD32017A
	for <lists+sparclinux@lfdr.de>; Fri, 19 Feb 2021 23:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhBSWvP (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 19 Feb 2021 17:51:15 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:60876 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhBSWvP (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 19 Feb 2021 17:51:15 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 20AF88A309F;
        Sat, 20 Feb 2021 01:50:31 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id E7F7A7CC8A2; Sat, 20 Feb 2021 01:50:30 +0300 (MSK)
Date:   Sat, 20 Feb 2021 01:50:30 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Anatoly Pugachev <matorola@gmail.com>,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] sparc: make copy_thread honor pid namespaces
Message-ID: <20210219225030.GA23520@altlinux.org>
References: <20210217080000.GA25861@altlinux.org>
 <m1tuq9nsnf.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m1tuq9nsnf.fsf@fess.ebiederm.org>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On sparc, fork and clone syscalls have an unusual semantics of
returning the pid of the parent process to the child process.

Apparently, the implementation did not honor pid namespaces at all,
so the child used to get the pid of its parent in the init namespace.

Fortunately, most users of these syscalls are not affected by this bug
because they use another register to distinguish the parent process
from its child, and the pid of the parent process is often discarded.

Reproducer:

  $ gcc -Wall -O2 -xc - <<'EOF'
  #define _GNU_SOURCE
  #include <err.h>
  #include <errno.h>
  #include <sched.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <sys/wait.h>
  #include <unistd.h>
  #include <asm/unistd.h>
  #include <linux/sched.h>
  static void test_fork(void)
  {
  	int pid = syscall(__NR_fork);
  	if (pid < 0)
  		err(1, "fork");
  	fprintf(stderr, "current: %d, parent: %d, fork returned: %d\n",
  		getpid(), getppid(), pid);
  	int status;
  	if (wait(&status) < 0) {
  		if (errno == ECHILD)
  			_exit(0);
  		err(1, "wait");
  	}
  	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
  		errx(1, "wait: %#x", status);
  }
  int main(void)
  {
  	test_fork();
  	if (unshare(CLONE_NEWPID | CLONE_NEWUSER) < 0)
  		err(1, "unshare");
  	test_fork();
  	return 0;
  }
  EOF
  $ sh -c ./a.out
  current: 10001, parent: 10000, fork returned: 10002
  current: 10002, parent: 10001, fork returned: 10001
  current: 10001, parent: 10000, fork returned: 10003
  current: 1, parent: 0, fork returned: 10001

This bug was found by strace test suite.

Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---

v2: Replaced task_active_pid_ns(p) with current->nsproxy->pid_ns_for_children
    as suggested by Eric.

 arch/sparc/kernel/process_32.c | 3 ++-
 arch/sparc/kernel/process_64.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index a02363735915..3be653e40204 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -368,7 +368,8 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 #endif
 
 	/* Set the return value for the child. */
-	childregs->u_regs[UREG_I0] = current->pid;
+	childregs->u_regs[UREG_I0] =
+		task_pid_nr_ns(current, current->nsproxy->pid_ns_for_children);
 	childregs->u_regs[UREG_I1] = 1;
 
 	/* Set the return value for the parent. */
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index 6f8c7822fc06..f53ef5cff46a 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -629,7 +629,8 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
 		t->utraps[0]++;
 
 	/* Set the return value for the child. */
-	t->kregs->u_regs[UREG_I0] = current->pid;
+	t->kregs->u_regs[UREG_I0] =
+		task_pid_nr_ns(current, current->nsproxy->pid_ns_for_children);
 	t->kregs->u_regs[UREG_I1] = 1;
 
 	/* Set the second return value for the parent. */
-- 
ldv
