Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4F71AF4C8
	for <lists+sparclinux@lfdr.de>; Sat, 18 Apr 2020 22:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgDRUVs (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 18 Apr 2020 16:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728608AbgDRUUi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Sat, 18 Apr 2020 16:20:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9842C061A0C
        for <sparclinux@vger.kernel.org>; Sat, 18 Apr 2020 13:20:37 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t14so7126040wrw.12
        for <sparclinux@vger.kernel.org>; Sat, 18 Apr 2020 13:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtc/0k/27wMEJDXgbVIQe2rsiV0S3iSzsyKo7pDB7fw=;
        b=SRVPkLa/P5zm7EFNpI8tQGM8IRFyIbkRpTw45j/JzRGBaiIKlPXR6sr37rYGv8zej0
         yleYid4ikYPvCdXdowcswACqYEUsQ3Hc7iZteAFlU1dyU210LbRtbCs0/32heCizHvML
         CXWEd8kxGNfgZxeQ4ePlKVa6+DrlJzxADfLy3ngkzR5oxNOeNVtQrjwQ80xYXbTSO4ni
         RIoz3VHZvDyq4uPMYGwOSALTped9J2FxcnKlDqa3kvSNt/KPwtRQDS907VWa8E6OW5Wf
         14HEkyI1a5bf47APVC6rOafr1u44BLTKwK4AWJ5tfLKFPzHfZN32hz4Hdf9jUY+hXesY
         ERXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtc/0k/27wMEJDXgbVIQe2rsiV0S3iSzsyKo7pDB7fw=;
        b=bxypXibNPIZSBCsVkeeHkF1UV9G3ppWiXV3yLDuONE9uLW7e11UiM/VS74wpNkytar
         fUhRXUgTRi/86Z6fAA7oGvuyAurCYto8EkmJ4GybTKt0iLLgQ7vagferNouz7YX2Dxo9
         KLmzCq/HmUmOPfLtNqn/vmmuPsQMqpZg++uHfS1ZVVKF1Ax0YwY0/h9611WIvhMi9aw9
         iR+J5nNR6X28gj603ibqF882lBXXrlTwsPW0xf+vsVyHJLy7cnQD9R+YflvYEutPQPTm
         GovTg4dqIK/xEKR3OKJZZzp0SK6acMUJgKzUiJKMwKNhLzr7e0LpWDEWKyYHEgeUK33K
         LGSA==
X-Gm-Message-State: AGi0PuaiN/YzVuLtlutgCJ0XK5DJMGts8jU9mbEYddiX3Db4yByy+X/x
        mIYV9BCo0rnfqfcE4nTp5HfNAA==
X-Google-Smtp-Source: APiQypKyem7/Bm22YNmIm+yusqua17x5av2cf7Ly8gAXFE+5gCTDqjKnb4Fv0xipR7HqarRAyefWXA==
X-Received: by 2002:adf:fa03:: with SMTP id m3mr10544816wrr.68.1587241236552;
        Sat, 18 Apr 2020 13:20:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:36 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCHv3 34/50] sparc: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:28 +0100
Message-Id: <20200418201944.482088-35-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sparc/kernel/process_32.c | 17 ++++++++++++-----
 arch/sparc/kernel/traps_64.c   | 15 +++++++++++----
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 26cca65e9246..0b07de5618e5 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -145,10 +145,12 @@ void show_regs(struct pt_regs *r)
 }
 
 /*
- * The show_stack is an external API which we do not use ourselves.
+ * The show_stack(), show_stack_loglvl() are external APIs which
+ * we do not use ourselves.
  * The oops is printed in die_if_kernel.
  */
-void show_stack(struct task_struct *tsk, unsigned long *_ksp)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *_ksp,
+		       const char *loglvl)
 {
 	unsigned long pc, fp;
 	unsigned long task_base;
@@ -170,11 +172,16 @@ void show_stack(struct task_struct *tsk, unsigned long *_ksp)
 			break;
 		rw = (struct reg_window32 *) fp;
 		pc = rw->ins[7];
-		printk("[%08lx : ", pc);
-		printk("%pS ] ", (void *) pc);
+		printk("%s[%08lx : ", loglvl, pc);
+		printk("%s%pS ] ", loglvl, (void *) pc);
 		fp = rw->ins[6];
 	} while (++count < 16);
-	printk("\n");
+	printk("%s\n", loglvl);
+}
+
+void show_stack(struct task_struct *task, unsigned long *sp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT);
 }
 
 /*
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 27778b65a965..8715bc93bd9d 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -18,6 +18,7 @@
 #include <linux/smp.h>
 #include <linux/mm.h>
 #include <linux/init.h>
+#include <linux/kallsyms.h>
 #include <linux/kdebug.h>
 #include <linux/ftrace.h>
 #include <linux/reboot.h>
@@ -2452,7 +2453,8 @@ static void user_instruction_dump(unsigned int __user *pc)
 	printk("\n");
 }
 
-void show_stack(struct task_struct *tsk, unsigned long *_ksp)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *_ksp,
+			 const char *loglvl)
 {
 	unsigned long fp, ksp;
 	struct thread_info *tp;
@@ -2476,7 +2478,7 @@ void show_stack(struct task_struct *tsk, unsigned long *_ksp)
 
 	fp = ksp + STACK_BIAS;
 
-	printk("Call Trace:\n");
+	printk("%sCall Trace:\n", loglvl);
 	do {
 		struct sparc_stackf *sf;
 		struct pt_regs *regs;
@@ -2497,14 +2499,14 @@ void show_stack(struct task_struct *tsk, unsigned long *_ksp)
 			fp = (unsigned long)sf->fp + STACK_BIAS;
 		}
 
-		printk(" [%016lx] %pS\n", pc, (void *) pc);
+		print_ip_sym(loglvl, pc);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 		if ((pc + 8UL) == (unsigned long) &return_to_handler) {
 			struct ftrace_ret_stack *ret_stack;
 			ret_stack = ftrace_graph_get_ret_stack(tsk, graph);
 			if (ret_stack) {
 				pc = ret_stack->ret;
-				printk(" [%016lx] %pS\n", pc, (void *) pc);
+				print_ip_sym(loglvl, pc);
 				graph++;
 			}
 		}
@@ -2512,6 +2514,11 @@ void show_stack(struct task_struct *tsk, unsigned long *_ksp)
 	} while (++count < 16);
 }
 
+void show_stack(struct task_struct *tsk, unsigned long *_ksp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT);
+}
+
 static inline struct reg_window *kernel_stack_up(struct reg_window *rw)
 {
 	unsigned long fp = rw->ins[6];
-- 
2.26.0

