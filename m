Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF662DE92B
	for <lists+sparclinux@lfdr.de>; Fri, 18 Dec 2020 19:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbgLRSpe (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 18 Dec 2020 13:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgLRSpc (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 18 Dec 2020 13:45:32 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F6DC0611C5;
        Fri, 18 Dec 2020 10:44:21 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 23so7864300lfg.10;
        Fri, 18 Dec 2020 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=la2G2WnBZpMzhOfwd4J6YaJQy7oEb17icaGYNxUrNqo=;
        b=nY10VaF6FP6nqIhI80DaalW5i9GVIUN3fyeafrqfI6f8JUGJ73m2QBqF+bHHhTt3Kk
         KwzBoxDkoPOnxUZsL/ZeTVpuiFstCtdB6hIp2YFX5bDRJKlIOYidYUzH/mxxUO1r3YIX
         oqSxrjc2inRxfM3GWT1nqVuiBMVXQ6xih0STFZ/r+y9WdQ/EnlKac94ym/NDxLcvvesM
         0j67PUbCKRGLiKu8jfFi4/jj1pzulORKR44GSQ7zOB8RjFFAE1wC+W3dzf0RKlrzypyV
         L1sI6IH37D/aaPhq+WHX5xCeIZv19zLRiagqaUsDvvpJUD9S2bSzPuy4tKWJ4yVOZrwO
         90LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=la2G2WnBZpMzhOfwd4J6YaJQy7oEb17icaGYNxUrNqo=;
        b=oBxQ+rShPK4vx8kkxFlqG1pTsS7ia8P/4KGdE4z/NbQdlgGmaflwKr8iFmbv68Aba0
         FibAKWz4FzDvczeDX2Zf5xs7VCQJn7ZxB7WN9cGMlkGSOVRQEhfdHxpUY8Apd/KXRVWZ
         AXsLbd/pmPS7x9FA39FoRXYC7ZxUsL7Fac8wzfwFlwhvckJEzH+J/wGt9FH5FIC9Df2n
         Hc5nvXcogzwccdZW6I+Y3XxJYQT69DWDImrUlSHCVePbIzfbGVrlvtkmv7Sg7yXQe4Y5
         q+ibnrJ4hkh9NFx5lHzjcSPJtyqxlYhlrnQiSEaT8dRZgDrygAZrP25mdUxgQxa4AxSv
         2pXQ==
X-Gm-Message-State: AOAM530EZIqBqO+l9x2nq+eN0U1w59/CQYM+o+QidzpV34ELos+hnLd1
        wyHjLnZ2Z+gLFpgtG91aEn0=
X-Google-Smtp-Source: ABdhPJzRBcgTYzLQ8TqPHnudIi694q3vPQbbAzEDHID9gkictZYo2lViA7Y2mP3ogd3JHgppfes6Rw==
X-Received: by 2002:a2e:6e11:: with SMTP id j17mr2303358ljc.337.1608317059469;
        Fri, 18 Dec 2020 10:44:19 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:2c04:50ad:1138:9ea2])
        by smtp.gmail.com with ESMTPSA id s7sm1116980ljp.38.2020.12.18.10.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 10:44:18 -0800 (PST)
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
Subject: [PATCH v1 07/13] sparc32: Drop sun4m/sun4d specific irq handling
Date:   Fri, 18 Dec 2020 19:43:41 +0100
Message-Id: <20201218184347.2180772-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218184347.2180772-1-sam@ravnborg.org>
References: <20201218184347.2180772-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Some of the sun4m irq infrastructure is used by LEON too,
so keep that and drop the rest.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/irq_32.h |   1 -
 arch/sparc/kernel/Makefile      |   2 +-
 arch/sparc/kernel/irq_32.c      |  30 +-
 arch/sparc/kernel/kernel.h      |  13 -
 arch/sparc/kernel/sun4d_irq.c   | 494 --------------------------------
 arch/sparc/kernel/sun4m_irq.c   | 240 ----------------
 arch/sparc/mm/io-unit.c         |   2 -
 7 files changed, 2 insertions(+), 780 deletions(-)
 delete mode 100644 arch/sparc/kernel/sun4d_irq.c

diff --git a/arch/sparc/include/asm/irq_32.h b/arch/sparc/include/asm/irq_32.h
index 43ec2609b811..c820a6e967ae 100644
--- a/arch/sparc/include/asm/irq_32.h
+++ b/arch/sparc/include/asm/irq_32.h
@@ -18,7 +18,6 @@
 #define irq_canonicalize(irq)	(irq)
 
 void __init init_IRQ(void);
-void __init sun4d_init_sbi_irq(void);
 
 #define NO_IRQ		0xffffffff
 
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index b2735fb29c89..92a9fdbba0a5 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -30,7 +30,7 @@ obj-y                   += traps_$(BITS).o
 
 # IRQ
 obj-y                   += irq_$(BITS).o
-obj-$(CONFIG_SPARC32)   += sun4m_irq.o sun4d_irq.o
+obj-$(CONFIG_SPARC32)   += sun4m_irq.o
 
 obj-y                   += process_$(BITS).o
 obj-y                   += process.o
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index 510184c3aa17..135170f362c1 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -235,36 +235,8 @@ void handler_irq(unsigned int pil, struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
-/* djhr
- * This could probably be made indirect too and assigned in the CPU
- * bits of the code. That would be much nicer I think and would also
- * fit in with the idea of being able to tune your kernel for your machine
- * by removing unrequired machine and device support.
- *
- */
-
 void __init init_IRQ(void)
 {
-	switch (sparc_cpu_model) {
-	case sun4m:
-		pcic_probe();
-		if (pcic_present())
-			sun4m_pci_init_IRQ();
-		else
-			sun4m_init_IRQ();
-		break;
-
-	case sun4d:
-		sun4d_init_IRQ();
-		break;
-
-	case sparc_leon:
-		leon_init_IRQ();
-		break;
-
-	default:
-		prom_printf("Cannot initialize IRQs on this Sun machine...");
-		break;
-	}
+	leon_init_IRQ();
 }
 
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index e313d2e15ba9..8b7cc8899122 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -94,7 +94,6 @@ void unexpected_irq(int irq, void *dev_id, struct pt_regs * regs);
 void init_IRQ(void);
 
 /* sun4m_irq.c */
-void sun4m_init_IRQ(void);
 void sun4m_unmask_profile_irq(void);
 void sun4m_clear_profile_irq(int cpu);
 
@@ -107,18 +106,6 @@ void __init smp4m_smp_done(void);
 void smp4m_cross_call_irq(void);
 void smp4m_percpu_timer_interrupt(struct pt_regs *regs);
 
-/* sun4d_irq.c */
-extern spinlock_t sun4d_imsk_lock;
-
-void sun4d_init_IRQ(void);
-int sun4d_request_irq(unsigned int irq,
-                      irq_handler_t handler,
-                      unsigned long irqflags,
-                      const char *devname, void *dev_id);
-int show_sun4d_interrupts(struct seq_file *, void *);
-void sun4d_distribute_irqs(void);
-void sun4d_free_irq(unsigned int irq, void *dev_id);
-
 /* sun4d_smp.c */
 void sun4d_cpu_pre_starting(void *arg);
 void sun4d_cpu_pre_online(void *arg);
diff --git a/arch/sparc/kernel/sun4d_irq.c b/arch/sparc/kernel/sun4d_irq.c
deleted file mode 100644
index 7140cff04b54..000000000000
--- a/arch/sparc/kernel/sun4d_irq.c
+++ /dev/null
@@ -1,494 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * SS1000/SC2000 interrupt handling.
- *
- *  Copyright (C) 1997,1998 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- *  Heavily based on arch/sparc/kernel/irq.c.
- */
-
-#include <linux/kernel_stat.h>
-#include <linux/slab.h>
-#include <linux/seq_file.h>
-
-#include <asm/timer.h>
-#include <asm/traps.h>
-#include <asm/irq.h>
-#include <asm/io.h>
-#include <asm/sbi.h>
-#include <asm/cacheflush.h>
-#include <asm/setup.h>
-#include <asm/oplib.h>
-
-#include "kernel.h"
-#include "irq.h"
-
-/* Sun4d interrupts fall roughly into two categories.  SBUS and
- * cpu local.  CPU local interrupts cover the timer interrupts
- * and whatnot, and we encode those as normal PILs between
- * 0 and 15.
- * SBUS interrupts are encodes as a combination of board, level and slot.
- */
-
-struct sun4d_handler_data {
-	unsigned int cpuid;    /* target cpu */
-	unsigned int real_irq; /* interrupt level */
-};
-
-
-static unsigned int sun4d_encode_irq(int board, int lvl, int slot)
-{
-	return (board + 1) << 5 | (lvl << 2) | slot;
-}
-
-struct sun4d_timer_regs {
-	u32	l10_timer_limit;
-	u32	l10_cur_countx;
-	u32	l10_limit_noclear;
-	u32	ctrl;
-	u32	l10_cur_count;
-};
-
-static struct sun4d_timer_regs __iomem *sun4d_timers;
-
-#define SUN4D_TIMER_IRQ        10
-
-/* Specify which cpu handle interrupts from which board.
- * Index is board - value is cpu.
- */
-static unsigned char board_to_cpu[32];
-
-static int pil_to_sbus[] = {
-	0,
-	0,
-	1,
-	2,
-	0,
-	3,
-	0,
-	4,
-	0,
-	5,
-	0,
-	6,
-	0,
-	7,
-	0,
-	0,
-};
-
-/* Exported for sun4d_smp.c */
-DEFINE_SPINLOCK(sun4d_imsk_lock);
-
-/* SBUS interrupts are encoded integers including the board number
- * (plus one), the SBUS level, and the SBUS slot number.  Sun4D
- * IRQ dispatch is done by:
- *
- * 1) Reading the BW local interrupt table in order to get the bus
- *    interrupt mask.
- *
- *    This table is indexed by SBUS interrupt level which can be
- *    derived from the PIL we got interrupted on.
- *
- * 2) For each bus showing interrupt pending from #1, read the
- *    SBI interrupt state register.  This will indicate which slots
- *    have interrupts pending for that SBUS interrupt level.
- *
- * 3) Call the genreric IRQ support.
- */
-static void sun4d_sbus_handler_irq(int sbusl)
-{
-	unsigned int bus_mask;
-	unsigned int sbino, slot;
-	unsigned int sbil;
-
-	bus_mask = bw_get_intr_mask(sbusl) & 0x3ffff;
-	bw_clear_intr_mask(sbusl, bus_mask);
-
-	sbil = (sbusl << 2);
-	/* Loop for each pending SBI */
-	for (sbino = 0; bus_mask; sbino++, bus_mask >>= 1) {
-		unsigned int idx, mask;
-
-		if (!(bus_mask & 1))
-			continue;
-		/* XXX This seems to ACK the irq twice.  acquire_sbi()
-		 * XXX uses swap, therefore this writes 0xf << sbil,
-		 * XXX then later release_sbi() will write the individual
-		 * XXX bits which were set again.
-		 */
-		mask = acquire_sbi(SBI2DEVID(sbino), 0xf << sbil);
-		mask &= (0xf << sbil);
-
-		/* Loop for each pending SBI slot */
-		slot = (1 << sbil);
-		for (idx = 0; mask != 0; idx++, slot <<= 1) {
-			unsigned int pil;
-			struct irq_bucket *p;
-
-			if (!(mask & slot))
-				continue;
-
-			mask &= ~slot;
-			pil = sun4d_encode_irq(sbino, sbusl, idx);
-
-			p = irq_map[pil];
-			while (p) {
-				struct irq_bucket *next;
-
-				next = p->next;
-				generic_handle_irq(p->irq);
-				p = next;
-			}
-			release_sbi(SBI2DEVID(sbino), slot);
-		}
-	}
-}
-
-void sun4d_handler_irq(unsigned int pil, struct pt_regs *regs)
-{
-	struct pt_regs *old_regs;
-	/* SBUS IRQ level (1 - 7) */
-	int sbusl = pil_to_sbus[pil];
-
-	/* FIXME: Is this necessary?? */
-	cc_get_ipen();
-
-	cc_set_iclr(1 << pil);
-
-#ifdef CONFIG_SMP
-	/*
-	 * Check IPI data structures after IRQ has been cleared. Hard and Soft
-	 * IRQ can happen at the same time, so both cases are always handled.
-	 */
-	if (pil == SUN4D_IPI_IRQ)
-		sun4d_ipi_interrupt();
-#endif
-
-	old_regs = set_irq_regs(regs);
-	irq_enter();
-	if (sbusl == 0) {
-		/* cpu interrupt */
-		struct irq_bucket *p;
-
-		p = irq_map[pil];
-		while (p) {
-			struct irq_bucket *next;
-
-			next = p->next;
-			generic_handle_irq(p->irq);
-			p = next;
-		}
-	} else {
-		/* SBUS interrupt */
-		sun4d_sbus_handler_irq(sbusl);
-	}
-	irq_exit();
-	set_irq_regs(old_regs);
-}
-
-
-static void sun4d_mask_irq(struct irq_data *data)
-{
-	struct sun4d_handler_data *handler_data = irq_data_get_irq_handler_data(data);
-	unsigned int real_irq;
-#ifdef CONFIG_SMP
-	int cpuid = handler_data->cpuid;
-	unsigned long flags;
-#endif
-	real_irq = handler_data->real_irq;
-#ifdef CONFIG_SMP
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
-	cc_set_imsk_other(cpuid, cc_get_imsk_other(cpuid) | (1 << real_irq));
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
-#else
-	cc_set_imsk(cc_get_imsk() | (1 << real_irq));
-#endif
-}
-
-static void sun4d_unmask_irq(struct irq_data *data)
-{
-	struct sun4d_handler_data *handler_data = irq_data_get_irq_handler_data(data);
-	unsigned int real_irq;
-#ifdef CONFIG_SMP
-	int cpuid = handler_data->cpuid;
-	unsigned long flags;
-#endif
-	real_irq = handler_data->real_irq;
-
-#ifdef CONFIG_SMP
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
-	cc_set_imsk_other(cpuid, cc_get_imsk_other(cpuid) & ~(1 << real_irq));
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
-#else
-	cc_set_imsk(cc_get_imsk() & ~(1 << real_irq));
-#endif
-}
-
-static unsigned int sun4d_startup_irq(struct irq_data *data)
-{
-	irq_link(data->irq);
-	sun4d_unmask_irq(data);
-	return 0;
-}
-
-static void sun4d_shutdown_irq(struct irq_data *data)
-{
-	sun4d_mask_irq(data);
-	irq_unlink(data->irq);
-}
-
-static struct irq_chip sun4d_irq = {
-	.name		= "sun4d",
-	.irq_startup	= sun4d_startup_irq,
-	.irq_shutdown	= sun4d_shutdown_irq,
-	.irq_unmask	= sun4d_unmask_irq,
-	.irq_mask	= sun4d_mask_irq,
-};
-
-#ifdef CONFIG_SMP
-/* Setup IRQ distribution scheme. */
-void __init sun4d_distribute_irqs(void)
-{
-	struct device_node *dp;
-
-	int cpuid = cpu_logical_map(1);
-
-	if (cpuid == -1)
-		cpuid = cpu_logical_map(0);
-	for_each_node_by_name(dp, "sbi") {
-		int devid = of_getintprop_default(dp, "device-id", 0);
-		int board = of_getintprop_default(dp, "board#", 0);
-		board_to_cpu[board] = cpuid;
-		set_sbi_tid(devid, cpuid << 3);
-	}
-	printk(KERN_ERR "All sbus IRQs directed to CPU%d\n", cpuid);
-}
-#endif
-
-static void sun4d_clear_clock_irq(void)
-{
-	sbus_readl(&sun4d_timers->l10_timer_limit);
-}
-
-static void sun4d_load_profile_irq(int cpu, unsigned int limit)
-{
-	unsigned int value = limit ? timer_value(limit) : 0;
-	bw_set_prof_limit(cpu, value);
-}
-
-static void __init sun4d_load_profile_irqs(void)
-{
-	int cpu = 0, mid;
-
-	while (!cpu_find_by_instance(cpu, NULL, &mid)) {
-		sun4d_load_profile_irq(mid >> 3, 0);
-		cpu++;
-	}
-}
-
-static unsigned int _sun4d_build_device_irq(unsigned int real_irq,
-                                            unsigned int pil,
-                                            unsigned int board)
-{
-	struct sun4d_handler_data *handler_data;
-	unsigned int irq;
-
-	irq = irq_alloc(real_irq, pil);
-	if (irq == 0) {
-		prom_printf("IRQ: allocate for %d %d %d failed\n",
-			real_irq, pil, board);
-		goto err_out;
-	}
-
-	handler_data = irq_get_handler_data(irq);
-	if (unlikely(handler_data))
-		goto err_out;
-
-	handler_data = kzalloc(sizeof(struct sun4d_handler_data), GFP_ATOMIC);
-	if (unlikely(!handler_data)) {
-		prom_printf("IRQ: kzalloc(sun4d_handler_data) failed.\n");
-		prom_halt();
-	}
-	handler_data->cpuid    = board_to_cpu[board];
-	handler_data->real_irq = real_irq;
-	irq_set_chip_and_handler_name(irq, &sun4d_irq,
-	                              handle_level_irq, "level");
-	irq_set_handler_data(irq, handler_data);
-
-err_out:
-	return irq;
-}
-
-
-
-static unsigned int sun4d_build_device_irq(struct platform_device *op,
-                                           unsigned int real_irq)
-{
-	struct device_node *dp = op->dev.of_node;
-	struct device_node *board_parent, *bus = dp->parent;
-	char *bus_connection;
-	const struct linux_prom_registers *regs;
-	unsigned int pil;
-	unsigned int irq;
-	int board, slot;
-	int sbusl;
-
-	irq = real_irq;
-	while (bus) {
-		if (of_node_name_eq(bus, "sbi")) {
-			bus_connection = "io-unit";
-			break;
-		}
-
-		if (of_node_name_eq(bus, "bootbus")) {
-			bus_connection = "cpu-unit";
-			break;
-		}
-
-		bus = bus->parent;
-	}
-	if (!bus)
-		goto err_out;
-
-	regs = of_get_property(dp, "reg", NULL);
-	if (!regs)
-		goto err_out;
-
-	slot = regs->which_io;
-
-	/*
-	 * If Bus nodes parent is not io-unit/cpu-unit or the io-unit/cpu-unit
-	 * lacks a "board#" property, something is very wrong.
-	 */
-	if (!of_node_name_eq(bus->parent, bus_connection)) {
-		printk(KERN_ERR "%pOF: Error, parent is not %s.\n",
-			bus, bus_connection);
-		goto err_out;
-	}
-	board_parent = bus->parent;
-	board = of_getintprop_default(board_parent, "board#", -1);
-	if (board == -1) {
-		printk(KERN_ERR "%pOF: Error, lacks board# property.\n",
-			board_parent);
-		goto err_out;
-	}
-
-	sbusl = pil_to_sbus[real_irq];
-	if (sbusl)
-		pil = sun4d_encode_irq(board, sbusl, slot);
-	else
-		pil = real_irq;
-
-	irq = _sun4d_build_device_irq(real_irq, pil, board);
-err_out:
-	return irq;
-}
-
-static unsigned int sun4d_build_timer_irq(unsigned int board,
-                                          unsigned int real_irq)
-{
-	return _sun4d_build_device_irq(real_irq, real_irq, board);
-}
-
-
-static void __init sun4d_init_timers(void)
-{
-	struct device_node *dp;
-	struct resource res;
-	unsigned int irq;
-	const u32 *reg;
-	int err;
-	int board;
-
-	dp = of_find_node_by_name(NULL, "cpu-unit");
-	if (!dp) {
-		prom_printf("sun4d_init_timers: Unable to find cpu-unit\n");
-		prom_halt();
-	}
-
-	/* Which cpu-unit we use is arbitrary, we can view the bootbus timer
-	 * registers via any cpu's mapping.  The first 'reg' property is the
-	 * bootbus.
-	 */
-	reg = of_get_property(dp, "reg", NULL);
-	if (!reg) {
-		prom_printf("sun4d_init_timers: No reg property\n");
-		prom_halt();
-	}
-
-	board = of_getintprop_default(dp, "board#", -1);
-	if (board == -1) {
-		prom_printf("sun4d_init_timers: No board# property on cpu-unit\n");
-		prom_halt();
-	}
-
-	of_node_put(dp);
-
-	res.start = reg[1];
-	res.end = reg[2] - 1;
-	res.flags = reg[0] & 0xff;
-	sun4d_timers = of_ioremap(&res, BW_TIMER_LIMIT,
-				  sizeof(struct sun4d_timer_regs), "user timer");
-	if (!sun4d_timers) {
-		prom_printf("sun4d_init_timers: Can't map timer regs\n");
-		prom_halt();
-	}
-
-#ifdef CONFIG_SMP
-	sparc_config.cs_period = SBUS_CLOCK_RATE * 2;  /* 2 seconds */
-#else
-	sparc_config.cs_period = SBUS_CLOCK_RATE / HZ; /* 1/HZ sec  */
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-	sbus_writel(timer_value(sparc_config.cs_period),
-		    &sun4d_timers->l10_timer_limit);
-
-	master_l10_counter = &sun4d_timers->l10_cur_count;
-
-	irq = sun4d_build_timer_irq(board, SUN4D_TIMER_IRQ);
-	err = request_irq(irq, timer_interrupt, IRQF_TIMER, "timer", NULL);
-	if (err) {
-		prom_printf("sun4d_init_timers: request_irq() failed with %d\n",
-		             err);
-		prom_halt();
-	}
-	sun4d_load_profile_irqs();
-}
-
-void __init sun4d_init_sbi_irq(void)
-{
-	struct device_node *dp;
-	int target_cpu;
-
-	target_cpu = boot_cpu_id;
-	for_each_node_by_name(dp, "sbi") {
-		int devid = of_getintprop_default(dp, "device-id", 0);
-		int board = of_getintprop_default(dp, "board#", 0);
-		unsigned int mask;
-
-		set_sbi_tid(devid, target_cpu << 3);
-		board_to_cpu[board] = target_cpu;
-
-		/* Get rid of pending irqs from PROM */
-		mask = acquire_sbi(devid, 0xffffffff);
-		if (mask) {
-			printk(KERN_ERR "Clearing pending IRQs %08x on SBI %d\n",
-			       mask, board);
-			release_sbi(devid, mask);
-		}
-	}
-}
-
-void __init sun4d_init_IRQ(void)
-{
-	local_irq_disable();
-
-	sparc_config.init_timers      = sun4d_init_timers;
-	sparc_config.build_device_irq = sun4d_build_device_irq;
-	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
-	sparc_config.clear_clock_irq  = sun4d_clear_clock_irq;
-	sparc_config.load_profile_irq = sun4d_load_profile_irq;
-
-	/* Cannot enable interrupts until OBP ticker is disabled. */
-}
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
index 1079638986b5..1a220a2b9ac3 100644
--- a/arch/sparc/kernel/sun4m_irq.c
+++ b/arch/sparc/kernel/sun4m_irq.c
@@ -187,103 +187,6 @@ static unsigned long sun4m_imask[0x50] = {
 	0, SUN4M_INT_VME(6), 0, 0
 };
 
-static void sun4m_mask_irq(struct irq_data *data)
-{
-	struct sun4m_handler_data *handler_data;
-	int cpu = smp_processor_id();
-
-	handler_data = irq_data_get_irq_handler_data(data);
-	if (handler_data->mask) {
-		unsigned long flags;
-
-		local_irq_save(flags);
-		if (handler_data->percpu) {
-			sbus_writel(handler_data->mask, &sun4m_irq_percpu[cpu]->set);
-		} else {
-			sbus_writel(handler_data->mask, &sun4m_irq_global->mask_set);
-		}
-		local_irq_restore(flags);
-	}
-}
-
-static void sun4m_unmask_irq(struct irq_data *data)
-{
-	struct sun4m_handler_data *handler_data;
-	int cpu = smp_processor_id();
-
-	handler_data = irq_data_get_irq_handler_data(data);
-	if (handler_data->mask) {
-		unsigned long flags;
-
-		local_irq_save(flags);
-		if (handler_data->percpu) {
-			sbus_writel(handler_data->mask, &sun4m_irq_percpu[cpu]->clear);
-		} else {
-			sbus_writel(handler_data->mask, &sun4m_irq_global->mask_clear);
-		}
-		local_irq_restore(flags);
-	}
-}
-
-static unsigned int sun4m_startup_irq(struct irq_data *data)
-{
-	irq_link(data->irq);
-	sun4m_unmask_irq(data);
-	return 0;
-}
-
-static void sun4m_shutdown_irq(struct irq_data *data)
-{
-	sun4m_mask_irq(data);
-	irq_unlink(data->irq);
-}
-
-static struct irq_chip sun4m_irq = {
-	.name		= "sun4m",
-	.irq_startup	= sun4m_startup_irq,
-	.irq_shutdown	= sun4m_shutdown_irq,
-	.irq_mask	= sun4m_mask_irq,
-	.irq_unmask	= sun4m_unmask_irq,
-};
-
-
-static unsigned int sun4m_build_device_irq(struct platform_device *op,
-					   unsigned int real_irq)
-{
-	struct sun4m_handler_data *handler_data;
-	unsigned int irq;
-	unsigned int pil;
-
-	if (real_irq >= OBP_INT_LEVEL_VME) {
-		prom_printf("Bogus sun4m IRQ %u\n", real_irq);
-		prom_halt();
-	}
-	pil = (real_irq & 0xf);
-	irq = irq_alloc(real_irq, pil);
-
-	if (irq == 0)
-		goto out;
-
-	handler_data = irq_get_handler_data(irq);
-	if (unlikely(handler_data))
-		goto out;
-
-	handler_data = kzalloc(sizeof(struct sun4m_handler_data), GFP_ATOMIC);
-	if (unlikely(!handler_data)) {
-		prom_printf("IRQ: kzalloc(sun4m_handler_data) failed.\n");
-		prom_halt();
-	}
-
-	handler_data->mask = sun4m_imask[real_irq];
-	handler_data->percpu = real_irq < OBP_INT_LEVEL_ONBOARD;
-	irq_set_chip_and_handler_name(irq, &sun4m_irq,
-	                              handle_level_irq, "level");
-	irq_set_handler_data(irq, handler_data);
-
-out:
-	return irq;
-}
-
 struct sun4m_timer_percpu {
 	u32		l14_limit;
 	u32		l14_count;
@@ -293,21 +196,6 @@ struct sun4m_timer_percpu {
 
 static struct sun4m_timer_percpu __iomem *timers_percpu[SUN4M_NCPUS];
 
-struct sun4m_timer_global {
-	u32		l10_limit;
-	u32		l10_count;
-	u32		l10_limit_noclear;
-	u32		reserved;
-	u32		timer_config;
-};
-
-static struct sun4m_timer_global __iomem *timers_global;
-
-static void sun4m_clear_clock_irq(void)
-{
-	sbus_readl(&timers_global->l10_limit);
-}
-
 void sun4m_nmi(struct pt_regs *regs)
 {
 	unsigned long afsr, afar, si;
@@ -348,131 +236,3 @@ void sun4m_clear_profile_irq(int cpu)
 {
 	sbus_readl(&timers_percpu[cpu]->l14_limit);
 }
-
-static void sun4m_load_profile_irq(int cpu, unsigned int limit)
-{
-	unsigned int value = limit ? timer_value(limit) : 0;
-	sbus_writel(value, &timers_percpu[cpu]->l14_limit);
-}
-
-static void __init sun4m_init_timers(void)
-{
-	struct device_node *dp = of_find_node_by_name(NULL, "counter");
-	int i, err, len, num_cpu_timers;
-	unsigned int irq;
-	const u32 *addr;
-
-	if (!dp) {
-		printk(KERN_ERR "sun4m_init_timers: No 'counter' node.\n");
-		return;
-	}
-
-	addr = of_get_property(dp, "address", &len);
-	of_node_put(dp);
-	if (!addr) {
-		printk(KERN_ERR "sun4m_init_timers: No 'address' prop.\n");
-		return;
-	}
-
-	num_cpu_timers = (len / sizeof(u32)) - 1;
-	for (i = 0; i < num_cpu_timers; i++) {
-		timers_percpu[i] = (void __iomem *)
-			(unsigned long) addr[i];
-	}
-	timers_global = (void __iomem *)
-		(unsigned long) addr[num_cpu_timers];
-
-	/* Every per-cpu timer works in timer mode */
-	sbus_writel(0x00000000, &timers_global->timer_config);
-
-#ifdef CONFIG_SMP
-	sparc_config.cs_period = SBUS_CLOCK_RATE * 2;  /* 2 seconds */
-	sparc_config.features |= FEAT_L14_ONESHOT;
-#else
-	sparc_config.cs_period = SBUS_CLOCK_RATE / HZ; /* 1/HZ sec  */
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-	sbus_writel(timer_value(sparc_config.cs_period),
-	            &timers_global->l10_limit);
-
-	master_l10_counter = &timers_global->l10_count;
-
-	irq = sun4m_build_device_irq(NULL, SUN4M_TIMER_IRQ);
-
-	err = request_irq(irq, timer_interrupt, IRQF_TIMER, "timer", NULL);
-	if (err) {
-		printk(KERN_ERR "sun4m_init_timers: Register IRQ error %d.\n",
-			err);
-		return;
-	}
-
-	for (i = 0; i < num_cpu_timers; i++)
-		sbus_writel(0, &timers_percpu[i]->l14_limit);
-	if (num_cpu_timers == 4)
-		sbus_writel(SUN4M_INT_E14, &sun4m_irq_global->mask_set);
-
-#ifdef CONFIG_SMP
-	{
-		unsigned long flags;
-		struct tt_entry *trap_table = &sparc_ttable[SP_TRAP_IRQ1 + (14 - 1)];
-
-		/* For SMP we use the level 14 ticker, however the bootup code
-		 * has copied the firmware's level 14 vector into the boot cpu's
-		 * trap table, we must fix this now or we get squashed.
-		 */
-		local_irq_save(flags);
-		trap_table->inst_one = lvl14_save[0];
-		trap_table->inst_two = lvl14_save[1];
-		trap_table->inst_three = lvl14_save[2];
-		trap_table->inst_four = lvl14_save[3];
-		local_ops->cache_all();
-		local_irq_restore(flags);
-	}
-#endif
-}
-
-void __init sun4m_init_IRQ(void)
-{
-	struct device_node *dp = of_find_node_by_name(NULL, "interrupt");
-	int len, i, mid, num_cpu_iregs;
-	const u32 *addr;
-
-	if (!dp) {
-		printk(KERN_ERR "sun4m_init_IRQ: No 'interrupt' node.\n");
-		return;
-	}
-
-	addr = of_get_property(dp, "address", &len);
-	of_node_put(dp);
-	if (!addr) {
-		printk(KERN_ERR "sun4m_init_IRQ: No 'address' prop.\n");
-		return;
-	}
-
-	num_cpu_iregs = (len / sizeof(u32)) - 1;
-	for (i = 0; i < num_cpu_iregs; i++) {
-		sun4m_irq_percpu[i] = (void __iomem *)
-			(unsigned long) addr[i];
-	}
-	sun4m_irq_global = (void __iomem *)
-		(unsigned long) addr[num_cpu_iregs];
-
-	local_irq_disable();
-
-	sbus_writel(~SUN4M_INT_MASKALL, &sun4m_irq_global->mask_set);
-	for (i = 0; !cpu_find_by_instance(i, NULL, &mid); i++)
-		sbus_writel(~0x17fff, &sun4m_irq_percpu[mid]->clear);
-
-	if (num_cpu_iregs == 4)
-		sbus_writel(0, &sun4m_irq_global->interrupt_target);
-
-	sparc_config.init_timers      = sun4m_init_timers;
-	sparc_config.build_device_irq = sun4m_build_device_irq;
-	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
-	sparc_config.clear_clock_irq  = sun4m_clear_clock_irq;
-	sparc_config.load_profile_irq = sun4m_load_profile_irq;
-
-
-	/* Cannot enable interrupts until OBP ticker is disabled. */
-}
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index bf3e6d2fe5d9..49ded623995f 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -85,8 +85,6 @@ static int __init iounit_init(void)
 		of_propagate_archdata(op);
 	}
 
-	sun4d_init_sbi_irq();
-
 	return 0;
 }
 
-- 
2.27.0

