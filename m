Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251EF2DE937
	for <lists+sparclinux@lfdr.de>; Fri, 18 Dec 2020 19:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgLRSqC (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 18 Dec 2020 13:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgLRSpc (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 18 Dec 2020 13:45:32 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A342FC0611CA;
        Fri, 18 Dec 2020 10:44:22 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a12so7916278lfl.6;
        Fri, 18 Dec 2020 10:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JboZ/a6pmfWOJ35tmMUpiKlRRNacatO47pNDJsMqOMc=;
        b=qZuByYm1Xtgedt7yKn+tbIu6+vZ39g+kaWancoQDCKXoqMLmk0cPeeKf9RUdwXV1/8
         GJvEA23ciG5wMik0G/PgqMtexJVzL1ruEulcoTc9zS+IDiwPNwjU5rQdrb0mrKuLVhe9
         O0X3NUZHFwzXr3EM4qK0Zt8k7VUm6omnmHuBj9Ej5gI2tqW/WtCJ9fYPFOsTJTqrxnBw
         fNat3iNywYMH2Ryr152qK97Z7yp5uDnZa7gI0ZomL6pYxYY2DpFhM10cp7yBVuzKVBO8
         MU/Ngiv6sEouEOW9r/BlbtFIlnxgm5Y0GuIwhCTO3CH3xopSaS0is/cdMQK3iiWe4nlT
         22Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JboZ/a6pmfWOJ35tmMUpiKlRRNacatO47pNDJsMqOMc=;
        b=Mr90hoxswtNTigBbR7CqzMisDx0CCL3dyPuYsWU6dgNsbz6LJkO3q5OdtFVUB2o+4e
         7X1p3kEnS6D31YI8LokeNBHrRsdJAt5KySNsIB7WLlux9MJdjr7XXCzy5Dr/5uJZrxI9
         FOgqwp9ZGXollH3BA0kCX4B09k87YJbHFF+FQG3sbjUMLsokI/9T78WFUwZnFdT4ZTfw
         6YxD5SYQP2eTFhWjKRHUbrnT52RKAKkZWBrFIpW8Aggn3dnsOz7xiKwTk5g/aLC7IEms
         J9P2bxXWibGMdq5xWBJFDY0ITF8FJ0HvwKqMYuL4PFd0YCpYfoKTKug10Zh36yJLtmGg
         TnAA==
X-Gm-Message-State: AOAM531DmG9IP9I9LajvMWyl7MRh1irV5DPXYHV22KobPlPjRX74l3IF
        1uT/DGvOgCZrbk0K/xC53pk=
X-Google-Smtp-Source: ABdhPJwv4eyR4j7GzJw9q5KHLLnwOlJ0EbI4oYmoKMHzvoxTHn2yQ010hSCeZDxEVtAY8bGaadBvYg==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr2314100ljk.150.1608317061094;
        Fri, 18 Dec 2020 10:44:21 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:2c04:50ad:1138:9ea2])
        by smtp.gmail.com with ESMTPSA id s7sm1116980ljp.38.2020.12.18.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 10:44:20 -0800 (PST)
Sender: Sam Ravnborg <sam.ravnborg@gmail.com>
From:   Sam Ravnborg <sam@ravnborg.org>
To:     David S Miller <davem@davemloft.net>, sparclinux@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Denis Efremov <efremov@linux.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, Willy Tarreau <w@1wt.eu>,
        linux-kernel@vger.kernel.org, debian-sparc@lists.debian.org,
        gentoo-sparc@l.g.o
Subject: [PATCH v1 08/13] sparc32: Drop sun4d/sun4m smp support
Date:   Fri, 18 Dec 2020 19:43:42 +0100
Message-Id: <20201218184347.2180772-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218184347.2180772-1-sam@ravnborg.org>
References: <20201218184347.2180772-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Drop the sun4m and sun4d smp support code.

The sparc32 kernel will not boot unless this is a LEON system,
so drop checks for other systems as they will not trigger.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/kernel/Makefile    |   2 +-
 arch/sparc/kernel/smp_32.c    | 102 +--------
 arch/sparc/kernel/sun4d_smp.c | 410 ----------------------------------
 arch/sparc/kernel/sun4m_smp.c | 273 ----------------------
 arch/sparc/mm/srmmu.c         |  10 +-
 5 files changed, 8 insertions(+), 789 deletions(-)
 delete mode 100644 arch/sparc/kernel/sun4d_smp.c
 delete mode 100644 arch/sparc/kernel/sun4m_smp.c

diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 92a9fdbba0a5..5ddc11cfd84a 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -81,7 +81,7 @@ obj-$(CONFIG_SPARC_GRPCI2)+= leon_pci_grpci2.o
 obj-$(CONFIG_SPARC_GRPCI1)+= leon_pci_grpci1.o
 
 obj-$(CONFIG_SMP)         += trampoline_$(BITS).o smp_$(BITS).o
-obj-$(CONFIG_SPARC32_SMP) += sun4m_smp.o sun4d_smp.o leon_smp.o
+obj-$(CONFIG_SPARC32_SMP) += leon_smp.o
 obj-$(CONFIG_SPARC64_SMP) += hvtramp.o
 
 obj-$(CONFIG_SPARC64)     += auxio_64.o
diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
index 50c127ab46d5..bcda7e469da9 100644
--- a/arch/sparc/kernel/smp_32.c
+++ b/arch/sparc/kernel/smp_32.c
@@ -87,29 +87,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 		num, bogosum/(500000/HZ),
 		(bogosum/(5000/HZ))%100);
 
-	switch(sparc_cpu_model) {
-	case sun4m:
-		smp4m_smp_done();
-		break;
-	case sun4d:
-		smp4d_smp_done();
-		break;
-	case sparc_leon:
-		leon_smp_done();
-		break;
-	case sun4e:
-		printk("SUN4E\n");
-		BUG();
-		break;
-	case sun4u:
-		printk("SUN4U\n");
-		BUG();
-		break;
-	default:
-		printk("UNKNOWN!\n");
-		BUG();
-		break;
-	}
+	leon_smp_done();
 }
 
 void cpu_panic(void)
@@ -196,29 +174,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 
 	smp_store_cpu_info(boot_cpu_id);
 
-	switch(sparc_cpu_model) {
-	case sun4m:
-		smp4m_boot_cpus();
-		break;
-	case sun4d:
-		smp4d_boot_cpus();
-		break;
-	case sparc_leon:
-		leon_boot_cpus();
-		break;
-	case sun4e:
-		printk("SUN4E\n");
-		BUG();
-		break;
-	case sun4u:
-		printk("SUN4U\n");
-		BUG();
-		break;
-	default:
-		printk("UNKNOWN!\n");
-		BUG();
-		break;
-	}
+	leon_boot_cpus();
 }
 
 /* Set this up early so that things like the scheduler can init
@@ -257,31 +213,7 @@ void __init smp_prepare_boot_cpu(void)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	int ret=0;
-
-	switch(sparc_cpu_model) {
-	case sun4m:
-		ret = smp4m_boot_one_cpu(cpu, tidle);
-		break;
-	case sun4d:
-		ret = smp4d_boot_one_cpu(cpu, tidle);
-		break;
-	case sparc_leon:
-		ret = leon_boot_one_cpu(cpu, tidle);
-		break;
-	case sun4e:
-		printk("SUN4E\n");
-		BUG();
-		break;
-	case sun4u:
-		printk("SUN4U\n");
-		BUG();
-		break;
-	default:
-		printk("UNKNOWN!\n");
-		BUG();
-		break;
-	}
+	int ret = leon_boot_one_cpu(cpu, tidle);
 
 	if (!ret) {
 		cpumask_set_cpu(cpu, &smp_commenced_mask);
@@ -296,19 +228,7 @@ static void arch_cpu_pre_starting(void *arg)
 	local_ops->cache_all();
 	local_ops->tlb_all();
 
-	switch(sparc_cpu_model) {
-	case sun4m:
-		sun4m_cpu_pre_starting(arg);
-		break;
-	case sun4d:
-		sun4d_cpu_pre_starting(arg);
-		break;
-	case sparc_leon:
-		leon_cpu_pre_starting(arg);
-		break;
-	default:
-		BUG();
-	}
+	leon_cpu_pre_starting(arg);
 }
 
 static void arch_cpu_pre_online(void *arg)
@@ -323,19 +243,7 @@ static void arch_cpu_pre_online(void *arg)
 	local_ops->cache_all();
 	local_ops->tlb_all();
 
-	switch(sparc_cpu_model) {
-	case sun4m:
-		sun4m_cpu_pre_online(arg);
-		break;
-	case sun4d:
-		sun4d_cpu_pre_online(arg);
-		break;
-	case sparc_leon:
-		leon_cpu_pre_online(arg);
-		break;
-	default:
-		BUG();
-	}
+	leon_cpu_pre_online(arg);
 }
 
 static void sparc_start_secondary(void *arg)
diff --git a/arch/sparc/kernel/sun4d_smp.c b/arch/sparc/kernel/sun4d_smp.c
deleted file mode 100644
index cecdda746baa..000000000000
--- a/arch/sparc/kernel/sun4d_smp.c
+++ /dev/null
@@ -1,410 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Sparc SS1000/SC2000 SMP support.
- *
- * Copyright (C) 1998 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- *
- * Based on sun4m's smp.c, which is:
- * Copyright (C) 1996 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#include <linux/clockchips.h>
-#include <linux/interrupt.h>
-#include <linux/profile.h>
-#include <linux/delay.h>
-#include <linux/sched/mm.h>
-#include <linux/cpu.h>
-
-#include <asm/cacheflush.h>
-#include <asm/switch_to.h>
-#include <asm/tlbflush.h>
-#include <asm/timer.h>
-#include <asm/oplib.h>
-#include <asm/sbi.h>
-#include <asm/mmu.h>
-
-#include "kernel.h"
-#include "irq.h"
-
-#define IRQ_CROSS_CALL		15
-
-static volatile int smp_processors_ready;
-static int smp_highest_cpu;
-
-static inline unsigned long sun4d_swap(volatile unsigned long *ptr, unsigned long val)
-{
-	__asm__ __volatile__("swap [%1], %0\n\t" :
-			     "=&r" (val), "=&r" (ptr) :
-			     "0" (val), "1" (ptr));
-	return val;
-}
-
-static void smp4d_ipi_init(void);
-
-static unsigned char cpu_leds[32];
-
-static inline void show_leds(int cpuid)
-{
-	cpuid &= 0x1e;
-	__asm__ __volatile__ ("stba %0, [%1] %2" : :
-			      "r" ((cpu_leds[cpuid] << 4) | cpu_leds[cpuid+1]),
-			      "r" (ECSR_BASE(cpuid) | BB_LEDS),
-			      "i" (ASI_M_CTL));
-}
-
-void sun4d_cpu_pre_starting(void *arg)
-{
-	int cpuid = hard_smp_processor_id();
-
-	/* Show we are alive */
-	cpu_leds[cpuid] = 0x6;
-	show_leds(cpuid);
-
-	/* Enable level15 interrupt, disable level14 interrupt for now */
-	cc_set_imsk((cc_get_imsk() & ~0x8000) | 0x4000);
-}
-
-void sun4d_cpu_pre_online(void *arg)
-{
-	unsigned long flags;
-	int cpuid;
-
-	cpuid = hard_smp_processor_id();
-
-	/* Unblock the master CPU _only_ when the scheduler state
-	 * of all secondary CPUs will be up-to-date, so after
-	 * the SMP initialization the master will be just allowed
-	 * to call the scheduler code.
-	 */
-	sun4d_swap((unsigned long *)&cpu_callin_map[cpuid], 1);
-	local_ops->cache_all();
-	local_ops->tlb_all();
-
-	while ((unsigned long)current_set[cpuid] < PAGE_OFFSET)
-		barrier();
-
-	while (current_set[cpuid]->cpu != cpuid)
-		barrier();
-
-	/* Fix idle thread fields. */
-	__asm__ __volatile__("ld [%0], %%g6\n\t"
-			     : : "r" (&current_set[cpuid])
-			     : "memory" /* paranoid */);
-
-	cpu_leds[cpuid] = 0x9;
-	show_leds(cpuid);
-
-	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
-	current->active_mm = &init_mm;
-
-	local_ops->cache_all();
-	local_ops->tlb_all();
-
-	while (!cpumask_test_cpu(cpuid, &smp_commenced_mask))
-		barrier();
-
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
-	cc_set_imsk(cc_get_imsk() & ~0x4000); /* Allow PIL 14 as well */
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
-}
-
-/*
- *	Cycle through the processors asking the PROM to start each one.
- */
-void __init smp4d_boot_cpus(void)
-{
-	smp4d_ipi_init();
-	if (boot_cpu_id)
-		current_set[0] = NULL;
-	local_ops->cache_all();
-}
-
-int smp4d_boot_one_cpu(int i, struct task_struct *idle)
-{
-	unsigned long *entry = &sun4d_cpu_startup;
-	int timeout;
-	int cpu_node;
-
-	cpu_find_by_instance(i, &cpu_node, NULL);
-	current_set[i] = task_thread_info(idle);
-	/*
-	 * Initialize the contexts table
-	 * Since the call to prom_startcpu() trashes the structure,
-	 * we need to re-initialize it for each cpu
-	 */
-	smp_penguin_ctable.which_io = 0;
-	smp_penguin_ctable.phys_addr = (unsigned int) srmmu_ctx_table_phys;
-	smp_penguin_ctable.reg_size = 0;
-
-	/* whirrr, whirrr, whirrrrrrrrr... */
-	printk(KERN_INFO "Starting CPU %d at %p\n", i, entry);
-	local_ops->cache_all();
-	prom_startcpu(cpu_node,
-		      &smp_penguin_ctable, 0, (char *)entry);
-
-	printk(KERN_INFO "prom_startcpu returned :)\n");
-
-	/* wheee... it's going... */
-	for (timeout = 0; timeout < 10000; timeout++) {
-		if (cpu_callin_map[i])
-			break;
-		udelay(200);
-	}
-
-	if (!(cpu_callin_map[i])) {
-		printk(KERN_ERR "Processor %d is stuck.\n", i);
-		return -ENODEV;
-
-	}
-	local_ops->cache_all();
-	return 0;
-}
-
-void __init smp4d_smp_done(void)
-{
-	int i, first;
-	int *prev;
-
-	/* setup cpu list for irq rotation */
-	first = 0;
-	prev = &first;
-	for_each_online_cpu(i) {
-		*prev = i;
-		prev = &cpu_data(i).next;
-	}
-	*prev = first;
-	local_ops->cache_all();
-
-	/* Ok, they are spinning and ready to go. */
-	smp_processors_ready = 1;
-	sun4d_distribute_irqs();
-}
-
-/* Memory structure giving interrupt handler information about IPI generated */
-struct sun4d_ipi_work {
-	int single;
-	int msk;
-	int resched;
-};
-
-static DEFINE_PER_CPU_SHARED_ALIGNED(struct sun4d_ipi_work, sun4d_ipi_work);
-
-/* Initialize IPIs on the SUN4D SMP machine */
-static void __init smp4d_ipi_init(void)
-{
-	int cpu;
-	struct sun4d_ipi_work *work;
-
-	printk(KERN_INFO "smp4d: setup IPI at IRQ %d\n", SUN4D_IPI_IRQ);
-
-	for_each_possible_cpu(cpu) {
-		work = &per_cpu(sun4d_ipi_work, cpu);
-		work->single = work->msk = work->resched = 0;
-	}
-}
-
-void sun4d_ipi_interrupt(void)
-{
-	struct sun4d_ipi_work *work = this_cpu_ptr(&sun4d_ipi_work);
-
-	if (work->single) {
-		work->single = 0;
-		smp_call_function_single_interrupt();
-	}
-	if (work->msk) {
-		work->msk = 0;
-		smp_call_function_interrupt();
-	}
-	if (work->resched) {
-		work->resched = 0;
-		smp_resched_interrupt();
-	}
-}
-
-/* +-------+-------------+-----------+------------------------------------+
- * | bcast |  devid      |   sid     |              levels mask           |
- * +-------+-------------+-----------+------------------------------------+
- *  31      30         23 22       15 14                                 0
- */
-#define IGEN_MESSAGE(bcast, devid, sid, levels) \
-	(((bcast) << 31) | ((devid) << 23) | ((sid) << 15) | (levels))
-
-static void sun4d_send_ipi(int cpu, int level)
-{
-	cc_set_igen(IGEN_MESSAGE(0, cpu << 3, 6 + ((level >> 1) & 7), 1 << (level - 1)));
-}
-
-static void sun4d_ipi_single(int cpu)
-{
-	struct sun4d_ipi_work *work = &per_cpu(sun4d_ipi_work, cpu);
-
-	/* Mark work */
-	work->single = 1;
-
-	/* Generate IRQ on the CPU */
-	sun4d_send_ipi(cpu, SUN4D_IPI_IRQ);
-}
-
-static void sun4d_ipi_mask_one(int cpu)
-{
-	struct sun4d_ipi_work *work = &per_cpu(sun4d_ipi_work, cpu);
-
-	/* Mark work */
-	work->msk = 1;
-
-	/* Generate IRQ on the CPU */
-	sun4d_send_ipi(cpu, SUN4D_IPI_IRQ);
-}
-
-static void sun4d_ipi_resched(int cpu)
-{
-	struct sun4d_ipi_work *work = &per_cpu(sun4d_ipi_work, cpu);
-
-	/* Mark work */
-	work->resched = 1;
-
-	/* Generate IRQ on the CPU (any IRQ will cause resched) */
-	sun4d_send_ipi(cpu, SUN4D_IPI_IRQ);
-}
-
-static struct smp_funcall {
-	smpfunc_t func;
-	unsigned long arg1;
-	unsigned long arg2;
-	unsigned long arg3;
-	unsigned long arg4;
-	unsigned long arg5;
-	unsigned char processors_in[NR_CPUS];  /* Set when ipi entered. */
-	unsigned char processors_out[NR_CPUS]; /* Set when ipi exited. */
-} ccall_info __attribute__((aligned(8)));
-
-static DEFINE_SPINLOCK(cross_call_lock);
-
-/* Cross calls must be serialized, at least currently. */
-static void sun4d_cross_call(smpfunc_t func, cpumask_t mask, unsigned long arg1,
-			     unsigned long arg2, unsigned long arg3,
-			     unsigned long arg4)
-{
-	if (smp_processors_ready) {
-		register int high = smp_highest_cpu;
-		unsigned long flags;
-
-		spin_lock_irqsave(&cross_call_lock, flags);
-
-		{
-			/*
-			 * If you make changes here, make sure
-			 * gcc generates proper code...
-			 */
-			register smpfunc_t f asm("i0") = func;
-			register unsigned long a1 asm("i1") = arg1;
-			register unsigned long a2 asm("i2") = arg2;
-			register unsigned long a3 asm("i3") = arg3;
-			register unsigned long a4 asm("i4") = arg4;
-			register unsigned long a5 asm("i5") = 0;
-
-			__asm__ __volatile__(
-				"std %0, [%6]\n\t"
-				"std %2, [%6 + 8]\n\t"
-				"std %4, [%6 + 16]\n\t" : :
-				"r"(f), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
-				"r" (&ccall_info.func));
-		}
-
-		/* Init receive/complete mapping, plus fire the IPI's off. */
-		{
-			register int i;
-
-			cpumask_clear_cpu(smp_processor_id(), &mask);
-			cpumask_and(&mask, cpu_online_mask, &mask);
-			for (i = 0; i <= high; i++) {
-				if (cpumask_test_cpu(i, &mask)) {
-					ccall_info.processors_in[i] = 0;
-					ccall_info.processors_out[i] = 0;
-					sun4d_send_ipi(i, IRQ_CROSS_CALL);
-				}
-			}
-		}
-
-		{
-			register int i;
-
-			i = 0;
-			do {
-				if (!cpumask_test_cpu(i, &mask))
-					continue;
-				while (!ccall_info.processors_in[i])
-					barrier();
-			} while (++i <= high);
-
-			i = 0;
-			do {
-				if (!cpumask_test_cpu(i, &mask))
-					continue;
-				while (!ccall_info.processors_out[i])
-					barrier();
-			} while (++i <= high);
-		}
-
-		spin_unlock_irqrestore(&cross_call_lock, flags);
-	}
-}
-
-/* Running cross calls. */
-void smp4d_cross_call_irq(void)
-{
-	int i = hard_smp_processor_id();
-
-	ccall_info.processors_in[i] = 1;
-	ccall_info.func(ccall_info.arg1, ccall_info.arg2, ccall_info.arg3,
-			ccall_info.arg4, ccall_info.arg5);
-	ccall_info.processors_out[i] = 1;
-}
-
-void smp4d_percpu_timer_interrupt(struct pt_regs *regs)
-{
-	struct pt_regs *old_regs;
-	int cpu = hard_smp_processor_id();
-	struct clock_event_device *ce;
-	static int cpu_tick[NR_CPUS];
-	static char led_mask[] = { 0xe, 0xd, 0xb, 0x7, 0xb, 0xd };
-
-	old_regs = set_irq_regs(regs);
-	bw_get_prof_limit(cpu);
-	bw_clear_intr_mask(0, 1);	/* INTR_TABLE[0] & 1 is Profile IRQ */
-
-	cpu_tick[cpu]++;
-	if (!(cpu_tick[cpu] & 15)) {
-		if (cpu_tick[cpu] == 0x60)
-			cpu_tick[cpu] = 0;
-		cpu_leds[cpu] = led_mask[cpu_tick[cpu] >> 4];
-		show_leds(cpu);
-	}
-
-	ce = &per_cpu(sparc32_clockevent, cpu);
-
-	irq_enter();
-	ce->event_handler(ce);
-	irq_exit();
-
-	set_irq_regs(old_regs);
-}
-
-static const struct sparc32_ipi_ops sun4d_ipi_ops = {
-	.cross_call = sun4d_cross_call,
-	.resched    = sun4d_ipi_resched,
-	.single     = sun4d_ipi_single,
-	.mask_one   = sun4d_ipi_mask_one,
-};
-
-void __init sun4d_init_smp(void)
-{
-	int i;
-
-	sparc32_ipi_ops = &sun4d_ipi_ops;
-
-	for (i = 0; i < NR_CPUS; i++) {
-		ccall_info.processors_in[i] = 1;
-		ccall_info.processors_out[i] = 1;
-	}
-}
diff --git a/arch/sparc/kernel/sun4m_smp.c b/arch/sparc/kernel/sun4m_smp.c
deleted file mode 100644
index 228a6527082d..000000000000
--- a/arch/sparc/kernel/sun4m_smp.c
+++ /dev/null
@@ -1,273 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  sun4m SMP support.
- *
- * Copyright (C) 1996 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#include <linux/clockchips.h>
-#include <linux/interrupt.h>
-#include <linux/profile.h>
-#include <linux/delay.h>
-#include <linux/sched/mm.h>
-#include <linux/cpu.h>
-
-#include <asm/cacheflush.h>
-#include <asm/switch_to.h>
-#include <asm/tlbflush.h>
-#include <asm/timer.h>
-#include <asm/oplib.h>
-
-#include "irq.h"
-#include "kernel.h"
-
-#define IRQ_IPI_SINGLE		12
-#define IRQ_IPI_MASK		13
-#define IRQ_IPI_RESCHED		14
-#define IRQ_CROSS_CALL		15
-
-static inline unsigned long
-swap_ulong(volatile unsigned long *ptr, unsigned long val)
-{
-	__asm__ __volatile__("swap [%1], %0\n\t" :
-			     "=&r" (val), "=&r" (ptr) :
-			     "0" (val), "1" (ptr));
-	return val;
-}
-
-void sun4m_cpu_pre_starting(void *arg)
-{
-}
-
-void sun4m_cpu_pre_online(void *arg)
-{
-	int cpuid = hard_smp_processor_id();
-
-	/* Allow master to continue. The master will then give us the
-	 * go-ahead by setting the smp_commenced_mask and will wait without
-	 * timeouts until our setup is completed fully (signified by
-	 * our bit being set in the cpu_online_mask).
-	 */
-	swap_ulong(&cpu_callin_map[cpuid], 1);
-
-	/* XXX: What's up with all the flushes? */
-	local_ops->cache_all();
-	local_ops->tlb_all();
-
-	/* Fix idle thread fields. */
-	__asm__ __volatile__("ld [%0], %%g6\n\t"
-			     : : "r" (&current_set[cpuid])
-			     : "memory" /* paranoid */);
-
-	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
-	current->active_mm = &init_mm;
-
-	while (!cpumask_test_cpu(cpuid, &smp_commenced_mask))
-		mb();
-}
-
-/*
- *	Cycle through the processors asking the PROM to start each one.
- */
-void __init smp4m_boot_cpus(void)
-{
-	sun4m_unmask_profile_irq();
-	local_ops->cache_all();
-}
-
-int smp4m_boot_one_cpu(int i, struct task_struct *idle)
-{
-	unsigned long *entry = &sun4m_cpu_startup;
-	int timeout;
-	int cpu_node;
-
-	cpu_find_by_mid(i, &cpu_node);
-	current_set[i] = task_thread_info(idle);
-
-	/* See trampoline.S for details... */
-	entry += ((i - 1) * 3);
-
-	/*
-	 * Initialize the contexts table
-	 * Since the call to prom_startcpu() trashes the structure,
-	 * we need to re-initialize it for each cpu
-	 */
-	smp_penguin_ctable.which_io = 0;
-	smp_penguin_ctable.phys_addr = (unsigned int) srmmu_ctx_table_phys;
-	smp_penguin_ctable.reg_size = 0;
-
-	/* whirrr, whirrr, whirrrrrrrrr... */
-	printk(KERN_INFO "Starting CPU %d at %p\n", i, entry);
-	local_ops->cache_all();
-	prom_startcpu(cpu_node, &smp_penguin_ctable, 0, (char *)entry);
-
-	/* wheee... it's going... */
-	for (timeout = 0; timeout < 10000; timeout++) {
-		if (cpu_callin_map[i])
-			break;
-		udelay(200);
-	}
-
-	if (!(cpu_callin_map[i])) {
-		printk(KERN_ERR "Processor %d is stuck.\n", i);
-		return -ENODEV;
-	}
-
-	local_ops->cache_all();
-	return 0;
-}
-
-void __init smp4m_smp_done(void)
-{
-	int i, first;
-	int *prev;
-
-	/* setup cpu list for irq rotation */
-	first = 0;
-	prev = &first;
-	for_each_online_cpu(i) {
-		*prev = i;
-		prev = &cpu_data(i).next;
-	}
-	*prev = first;
-	local_ops->cache_all();
-
-	/* Ok, they are spinning and ready to go. */
-}
-
-static void sun4m_send_ipi(int cpu, int level)
-{
-	sbus_writel(SUN4M_SOFT_INT(level), &sun4m_irq_percpu[cpu]->set);
-}
-
-static void sun4m_ipi_resched(int cpu)
-{
-	sun4m_send_ipi(cpu, IRQ_IPI_RESCHED);
-}
-
-static void sun4m_ipi_single(int cpu)
-{
-	sun4m_send_ipi(cpu, IRQ_IPI_SINGLE);
-}
-
-static void sun4m_ipi_mask_one(int cpu)
-{
-	sun4m_send_ipi(cpu, IRQ_IPI_MASK);
-}
-
-static struct smp_funcall {
-	smpfunc_t func;
-	unsigned long arg1;
-	unsigned long arg2;
-	unsigned long arg3;
-	unsigned long arg4;
-	unsigned long arg5;
-	unsigned long processors_in[SUN4M_NCPUS];  /* Set when ipi entered. */
-	unsigned long processors_out[SUN4M_NCPUS]; /* Set when ipi exited. */
-} ccall_info;
-
-static DEFINE_SPINLOCK(cross_call_lock);
-
-/* Cross calls must be serialized, at least currently. */
-static void sun4m_cross_call(smpfunc_t func, cpumask_t mask, unsigned long arg1,
-			     unsigned long arg2, unsigned long arg3,
-			     unsigned long arg4)
-{
-		register int ncpus = SUN4M_NCPUS;
-		unsigned long flags;
-
-		spin_lock_irqsave(&cross_call_lock, flags);
-
-		/* Init function glue. */
-		ccall_info.func = func;
-		ccall_info.arg1 = arg1;
-		ccall_info.arg2 = arg2;
-		ccall_info.arg3 = arg3;
-		ccall_info.arg4 = arg4;
-		ccall_info.arg5 = 0;
-
-		/* Init receive/complete mapping, plus fire the IPI's off. */
-		{
-			register int i;
-
-			cpumask_clear_cpu(smp_processor_id(), &mask);
-			cpumask_and(&mask, cpu_online_mask, &mask);
-			for (i = 0; i < ncpus; i++) {
-				if (cpumask_test_cpu(i, &mask)) {
-					ccall_info.processors_in[i] = 0;
-					ccall_info.processors_out[i] = 0;
-					sun4m_send_ipi(i, IRQ_CROSS_CALL);
-				} else {
-					ccall_info.processors_in[i] = 1;
-					ccall_info.processors_out[i] = 1;
-				}
-			}
-		}
-
-		{
-			register int i;
-
-			i = 0;
-			do {
-				if (!cpumask_test_cpu(i, &mask))
-					continue;
-				while (!ccall_info.processors_in[i])
-					barrier();
-			} while (++i < ncpus);
-
-			i = 0;
-			do {
-				if (!cpumask_test_cpu(i, &mask))
-					continue;
-				while (!ccall_info.processors_out[i])
-					barrier();
-			} while (++i < ncpus);
-		}
-		spin_unlock_irqrestore(&cross_call_lock, flags);
-}
-
-/* Running cross calls. */
-void smp4m_cross_call_irq(void)
-{
-	int i = smp_processor_id();
-
-	ccall_info.processors_in[i] = 1;
-	ccall_info.func(ccall_info.arg1, ccall_info.arg2, ccall_info.arg3,
-			ccall_info.arg4, ccall_info.arg5);
-	ccall_info.processors_out[i] = 1;
-}
-
-void smp4m_percpu_timer_interrupt(struct pt_regs *regs)
-{
-	struct pt_regs *old_regs;
-	struct clock_event_device *ce;
-	int cpu = smp_processor_id();
-
-	old_regs = set_irq_regs(regs);
-
-	ce = &per_cpu(sparc32_clockevent, cpu);
-
-	if (clockevent_state_periodic(ce))
-		sun4m_clear_profile_irq(cpu);
-	else
-		sparc_config.load_profile_irq(cpu, 0); /* Is this needless? */
-
-	irq_enter();
-	ce->event_handler(ce);
-	irq_exit();
-
-	set_irq_regs(old_regs);
-}
-
-static const struct sparc32_ipi_ops sun4m_ipi_ops = {
-	.cross_call = sun4m_cross_call,
-	.resched    = sun4m_ipi_resched,
-	.single     = sun4m_ipi_single,
-	.mask_one   = sun4m_ipi_mask_one,
-};
-
-void __init sun4m_init_smp(void)
-{
-	sparc32_ipi_ops = &sun4m_ipi_ops;
-}
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index a03caa5f6628..d82cec45023a 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1818,14 +1818,8 @@ void __init load_mmu(void)
 		&smp_cachetlb_ops;
 #endif
 
-	if (sparc_cpu_model != sun4d)
-		ld_mmu_iommu();
+	ld_mmu_iommu();
 #ifdef CONFIG_SMP
-	if (sparc_cpu_model == sun4d)
-		sun4d_init_smp();
-	else if (sparc_cpu_model == sparc_leon)
-		leon_init_smp();
-	else
-		sun4m_init_smp();
+	leon_init_smp();
 #endif
 }
-- 
2.27.0

