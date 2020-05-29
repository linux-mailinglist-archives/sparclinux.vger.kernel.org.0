Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B5A1E8A54
	for <lists+sparclinux@lfdr.de>; Fri, 29 May 2020 23:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgE2Vpx (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 29 May 2020 17:45:53 -0400
Received: from merlin.infradead.org ([205.233.59.134]:55474 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2Vpx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 29 May 2020 17:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
        Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To;
        bh=KH3+WKue09LOhKAEhCwMprCxbHbnHF4Fq/FH08Thxfg=; b=DkmPZP+maPD0g3GUtzRwC54YVT
        7+6aOb09jDEMAKjJZDf9reHY3jx8d6NJ+gI4vXOFMBfeWpmtRZaMO5KHVMWkJiPqW+p8N8zU84vB+
        IMlBXbqDp2vffdJihZ8AN7/Bmmss46YGDf3C0xg7Zez4tfaQxLeTrs6ImYCrP3L8LyvkeAkyuuBkb
        VpRCboFoqimdQXFTUw+ecEVgFGkyOfl6eIY8C6N4eC/syDttJR8CDgsOzoVV8biBY7qsKRDu7kycL
        NbfGdvlUhlrvhFKPQ7IaaAioAqCqvtxmNmMIoEPZxvmfu3T5StlSQm54Q7BrCNfIAu+E9TaIUg7D0
        RLeDEFnw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jemmL-0007TK-CT; Fri, 29 May 2020 21:43:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 24BB9306574;
        Fri, 29 May 2020 23:42:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
        id D222E2B9B1BC5; Fri, 29 May 2020 23:42:57 +0200 (CEST)
Message-ID: <20200529214203.729797639@infradead.org>
User-Agent: quilt/0.66
Date:   Fri, 29 May 2020 23:35:52 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     mingo@kernel.org, will@kernel.org, tglx@linutronix.de
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        a.darwish@linutronix.de, rostedt@goodmis.org,
        bigeasy@linutronix.de, peterz@infradead.org, davem@davemloft.net,
        sparclinux@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, heiko.carstens@de.ibm.com,
        linux-s390@vger.kernel.org
Subject: [PATCH v3 2/5] powerpc64: Break asm/percpu.h vs spinlock_types.h dependency
References: <20200529213550.683440625@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

In order to use <asm/percpu.h> in lockdep.h, we need to make sure
asm/percpu.h does not itself depend on lockdep.

The below seems to make that so and builds powerpc64-defconfig +
PROVE_LOCKING.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/powerpc/include/asm/dtl.h         |   52 +++++++++++++++++++++++++++++++++
 arch/powerpc/include/asm/lppaca.h      |   44 ---------------------------
 arch/powerpc/kernel/time.c             |    1 
 arch/powerpc/kvm/book3s_hv.c           |    1 
 arch/powerpc/platforms/pseries/dtl.c   |    1 
 arch/powerpc/platforms/pseries/lpar.c  |    1 
 arch/powerpc/platforms/pseries/setup.c |    1 
 arch/powerpc/platforms/pseries/svm.c   |    1 
 8 files changed, 58 insertions(+), 44 deletions(-)

--- /dev/null
+++ b/arch/powerpc/include/asm/dtl.h
@@ -0,0 +1,52 @@
+#ifndef _ASM_POWERPC_DTL_H
+#define _ASM_POWERPC_DTL_H
+
+#include <asm/lppaca.h>
+#include <linux/spinlock_types.h>
+
+/*
+ * Layout of entries in the hypervisor's dispatch trace log buffer.
+ */
+struct dtl_entry {
+	u8	dispatch_reason;
+	u8	preempt_reason;
+	__be16	processor_id;
+	__be32	enqueue_to_dispatch_time;
+	__be32	ready_to_enqueue_time;
+	__be32	waiting_to_ready_time;
+	__be64	timebase;
+	__be64	fault_addr;
+	__be64	srr0;
+	__be64	srr1;
+};
+
+#define DISPATCH_LOG_BYTES	4096	/* bytes per cpu */
+#define N_DISPATCH_LOG		(DISPATCH_LOG_BYTES / sizeof(struct dtl_entry))
+
+/*
+ * Dispatch trace log event enable mask:
+ *   0x1: voluntary virtual processor waits
+ *   0x2: time-slice preempts
+ *   0x4: virtual partition memory page faults
+ */
+#define DTL_LOG_CEDE		0x1
+#define DTL_LOG_PREEMPT		0x2
+#define DTL_LOG_FAULT		0x4
+#define DTL_LOG_ALL		(DTL_LOG_CEDE | DTL_LOG_PREEMPT | DTL_LOG_FAULT)
+
+extern struct kmem_cache *dtl_cache;
+extern rwlock_t dtl_access_lock;
+
+/*
+ * When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE = y, the cpu accounting code controls
+ * reading from the dispatch trace log.  If other code wants to consume
+ * DTL entries, it can set this pointer to a function that will get
+ * called once for each DTL entry that gets processed.
+ */
+extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
+
+extern void register_dtl_buffer(int cpu);
+extern void alloc_dtl_buffers(unsigned long *time_limit);
+extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
+
+#endif /* _ASM_POWERPC_DTL_H */
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -42,7 +42,6 @@
  */
 #include <linux/cache.h>
 #include <linux/threads.h>
-#include <linux/spinlock_types.h>
 #include <asm/types.h>
 #include <asm/mmu.h>
 #include <asm/firmware.h>
@@ -146,49 +145,6 @@ struct slb_shadow {
 	} save_area[SLB_NUM_BOLTED];
 } ____cacheline_aligned;
 
-/*
- * Layout of entries in the hypervisor's dispatch trace log buffer.
- */
-struct dtl_entry {
-	u8	dispatch_reason;
-	u8	preempt_reason;
-	__be16	processor_id;
-	__be32	enqueue_to_dispatch_time;
-	__be32	ready_to_enqueue_time;
-	__be32	waiting_to_ready_time;
-	__be64	timebase;
-	__be64	fault_addr;
-	__be64	srr0;
-	__be64	srr1;
-};
-
-#define DISPATCH_LOG_BYTES	4096	/* bytes per cpu */
-#define N_DISPATCH_LOG		(DISPATCH_LOG_BYTES / sizeof(struct dtl_entry))
-
-/*
- * Dispatch trace log event enable mask:
- *   0x1: voluntary virtual processor waits
- *   0x2: time-slice preempts
- *   0x4: virtual partition memory page faults
- */
-#define DTL_LOG_CEDE		0x1
-#define DTL_LOG_PREEMPT		0x2
-#define DTL_LOG_FAULT		0x4
-#define DTL_LOG_ALL		(DTL_LOG_CEDE | DTL_LOG_PREEMPT | DTL_LOG_FAULT)
-
-extern struct kmem_cache *dtl_cache;
-extern rwlock_t dtl_access_lock;
-
-/*
- * When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE = y, the cpu accounting code controls
- * reading from the dispatch trace log.  If other code wants to consume
- * DTL entries, it can set this pointer to a function that will get
- * called once for each DTL entry that gets processed.
- */
-extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
-
-extern void register_dtl_buffer(int cpu);
-extern void alloc_dtl_buffers(unsigned long *time_limit);
 extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
 
 #endif /* CONFIG_PPC_BOOK3S */
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -69,6 +69,7 @@
 #include <asm/vdso_datapage.h>
 #include <asm/firmware.h>
 #include <asm/asm-prototypes.h>
+#include <asm/dtl.h>
 
 /* powerpc clocksource/clockevent code */
 
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -74,6 +74,7 @@
 #include <asm/hw_breakpoint.h>
 #include <asm/kvm_book3s_uvmem.h>
 #include <asm/ultravisor.h>
+#include <asm/dtl.h>
 
 #include "book3s.h"
 
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -12,6 +12,7 @@
 #include <asm/smp.h>
 #include <linux/uaccess.h>
 #include <asm/firmware.h>
+#include <asm/dtl.h>
 #include <asm/lppaca.h>
 #include <asm/debugfs.h>
 #include <asm/plpar_wrappers.h>
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -40,6 +40,7 @@
 #include <asm/fadump.h>
 #include <asm/asm-prototypes.h>
 #include <asm/debugfs.h>
+#include <asm/dtl.h>
 
 #include "pseries.h"
 
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -70,6 +70,7 @@
 #include <asm/asm-const.h>
 #include <asm/swiotlb.h>
 #include <asm/svm.h>
+#include <asm/dtl.h>
 
 #include "pseries.h"
 #include "../../../../drivers/pci/pci.h"
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -11,6 +11,7 @@
 #include <asm/svm.h>
 #include <asm/swiotlb.h>
 #include <asm/ultravisor.h>
+#include <asm/dtl.h>
 
 static int __init init_svm(void)
 {


