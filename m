Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B56248D07
	for <lists+sparclinux@lfdr.de>; Tue, 18 Aug 2020 19:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgHRRel (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 18 Aug 2020 13:34:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52427 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgHRRed (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 18 Aug 2020 13:34:33 -0400
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11] helo=wittgenstein.fritz.box)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1k85VG-0003E9-B8; Tue, 18 Aug 2020 17:34:30 +0000
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Christoph Hewllig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Stafford Horne <shorne@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kars de Jong <jongk@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>,
        Greentime Hu <green.hu@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Xiao Yang <yangx.jy@cn.fujitsu.com>, linux-doc@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        linux-kselftest@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 07/11] x86: switch to kernel_clone()
Date:   Tue, 18 Aug 2020 19:34:07 +0200
Message-Id: <20200818173411.404104-8-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818173411.404104-1-christian.brauner@ubuntu.com>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
The latter adheres to naming conventions for kernel internal syscall helpers.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 arch/x86/kernel/sys_ia32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sys_ia32.c b/arch/x86/kernel/sys_ia32.c
index 720cde885042..6cf65397d225 100644
--- a/arch/x86/kernel/sys_ia32.c
+++ b/arch/x86/kernel/sys_ia32.c
@@ -251,6 +251,6 @@ COMPAT_SYSCALL_DEFINE5(ia32_clone, unsigned long, clone_flags,
 		.tls		= tls_val,
 	};
 
-	return _do_fork(&args);
+	return kernel_clone(&args);
 }
 #endif /* CONFIG_IA32_EMULATION */
-- 
2.28.0

