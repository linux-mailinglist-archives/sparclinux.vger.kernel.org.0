Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBF32F750
	for <lists+sparclinux@lfdr.de>; Thu, 30 May 2019 07:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfE3F4f (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 30 May 2019 01:56:35 -0400
Received: from foss.arm.com ([217.140.101.70]:59328 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbfE3F4f (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 30 May 2019 01:56:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B439A78;
        Wed, 29 May 2019 22:56:34 -0700 (PDT)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.40.143])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D1333F5AF;
        Wed, 29 May 2019 22:56:25 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrey Konovalov <andreyknvl@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "David S. Miller" <davem@davemloft.net>
Subject: [RFC] mm: Generalize notify_page_fault()
Date:   Thu, 30 May 2019 11:25:13 +0530
Message-Id: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Similar notify_page_fault() definitions are being used by architectures
duplicating much of the same code. This attempts to unify them into a
single implementation, generalize it and then move it to a common place.
kprobes_built_in() can detect CONFIG_KPROBES, hence notify_page_fault()
must not be wrapped again within CONFIG_KPROBES. Trap number argument can
now contain upto an 'unsigned int' accommodating all possible platforms.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "David S. Miller" <davem@davemloft.net>
---
Boot tested on arm64 and build tested on some others.

 arch/arm/mm/fault.c      | 22 ----------------------
 arch/arm64/mm/fault.c    | 22 ----------------------
 arch/ia64/mm/fault.c     | 22 ----------------------
 arch/powerpc/mm/fault.c  | 23 ++---------------------
 arch/s390/mm/fault.c     | 16 +---------------
 arch/sh/mm/fault.c       | 14 --------------
 arch/sparc/mm/fault_64.c | 16 +---------------
 include/linux/mm.h       |  1 +
 mm/memory.c              | 14 ++++++++++++++
 9 files changed, 19 insertions(+), 131 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 58f69fa..1bc3b18 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -30,28 +30,6 @@
 
 #ifdef CONFIG_MMU
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)
-{
-	int ret = 0;
-
-	if (!user_mode(regs)) {
-		/* kprobe_running() needs smp_processor_id() */
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, fsr))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)
-{
-	return 0;
-}
-#endif
-
 /*
  * This is useful to dump out the page tables associated with
  * 'addr' in mm 'mm'.
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index a30818e..152f1f1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -70,28 +70,6 @@ static inline const struct fault_info *esr_to_debug_fault_info(unsigned int esr)
 	return debug_fault_info + DBG_ESR_EVT(esr);
 }
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int esr)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (!user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, esr))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int esr)
-{
-	return 0;
-}
-#endif
-
 static void data_abort_decode(unsigned int esr)
 {
 	pr_alert("Data abort info:\n");
diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index 5baeb02..64283d2 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -21,28 +21,6 @@
 
 extern int die(char *, struct pt_regs *, long);
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	int ret = 0;
-
-	if (!user_mode(regs)) {
-		/* kprobe_running() needs smp_processor_id() */
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, trap))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	return 0;
-}
-#endif
-
 /*
  * Return TRUE if ADDRESS points at a page in the kernel's mapped segment
  * (inside region 5, on ia64) and that page is present.
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b5d3578..5a0d71f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -46,26 +46,6 @@
 #include <asm/debug.h>
 #include <asm/kup.h>
 
-static inline bool notify_page_fault(struct pt_regs *regs)
-{
-	bool ret = false;
-
-#ifdef CONFIG_KPROBES
-	/* kprobe_running() needs smp_processor_id() */
-	if (!user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 11))
-			ret = true;
-		preempt_enable();
-	}
-#endif /* CONFIG_KPROBES */
-
-	if (unlikely(debugger_fault_handler(regs)))
-		ret = true;
-
-	return ret;
-}
-
 /*
  * Check whether the instruction inst is a store using
  * an update addressing form which will update r1.
@@ -466,8 +446,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
 	bool must_retry = false;
+	int kprobe_fault = notify_page_fault(regs, 11);
 
-	if (notify_page_fault(regs))
+	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
 
 	if (unlikely(page_fault_is_bad(error_code))) {
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index c220399..d317263 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -67,20 +67,6 @@ static int __init fault_init(void)
 }
 early_initcall(fault_init);
 
-static inline int notify_page_fault(struct pt_regs *regs)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 14))
-			ret = 1;
-		preempt_enable();
-	}
-	return ret;
-}
-
 /*
  * Find out which address space caused the exception.
  * Access register mode is impossible, ignore space == 3.
@@ -409,7 +395,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 	 */
 	clear_pt_regs_flag(regs, PIF_PER_TRAP);
 
-	if (notify_page_fault(regs))
+	if (notify_page_fault(regs, 14))
 		return 0;
 
 	mm = tsk->mm;
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 6defd2c6..94bdfcb 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -24,20 +24,6 @@
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
 
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	int ret = 0;
-
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, trap))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-
 static void
 force_sig_info_fault(int si_signo, int si_code, unsigned long address,
 		     struct task_struct *tsk)
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 8f8a604..e5557a1 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -38,20 +38,6 @@
 
 int show_unhandled_signals = 1;
 
-static inline __kprobes int notify_page_fault(struct pt_regs *regs)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 0))
-			ret = 1;
-		preempt_enable();
-	}
-	return ret;
-}
-
 static void __kprobes unhandled_fault(unsigned long address,
 				      struct task_struct *tsk,
 				      struct pt_regs *regs)
@@ -285,7 +271,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 
 	fault_code = get_thread_fault_code();
 
-	if (notify_page_fault(regs))
+	if (notify_page_fault(regs, 0))
 		goto exit_exception;
 
 	si_code = SEGV_MAPERR;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834a..c5a8dcf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1778,6 +1778,7 @@ static inline int pte_devmap(pte_t pte)
 }
 #endif
 
+int notify_page_fault(struct pt_regs *regs, unsigned int trap);
 int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
 
 extern pte_t *__get_locked_pte(struct mm_struct *mm, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index ddf20bd..82022d7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -52,6 +52,7 @@
 #include <linux/pagemap.h>
 #include <linux/memremap.h>
 #include <linux/ksm.h>
+#include <linux/kprobes.h>
 #include <linux/rmap.h>
 #include <linux/export.h>
 #include <linux/delayacct.h>
@@ -141,6 +142,19 @@ static int __init init_zero_pfn(void)
 core_initcall(init_zero_pfn);
 
 
+int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
+{
+	int ret = 0;
+
+	if (kprobes_built_in() && !user_mode(regs)) {
+		preempt_disable();
+		if (kprobe_running() && kprobe_fault_handler(regs, trap))
+			ret = 1;
+		preempt_enable();
+	}
+	return ret;
+}
+
 #if defined(SPLIT_RSS_COUNTING)
 
 void sync_mm_rss(struct mm_struct *mm)
-- 
2.7.4

