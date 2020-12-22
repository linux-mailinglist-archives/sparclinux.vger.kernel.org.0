Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56122DE930
	for <lists+sparclinux@lfdr.de>; Fri, 18 Dec 2020 19:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbgLRSpn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 18 Dec 2020 13:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgLRSpf (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 18 Dec 2020 13:45:35 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39170C0611CC;
        Fri, 18 Dec 2020 10:44:26 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o13so7955373lfr.3;
        Fri, 18 Dec 2020 10:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AJNJ4dnn/xQEXOKSPkMwYC+ElM0isCZbedzwf8ZReLQ=;
        b=k0wuECPeRLjmJdKesuIAlelwdiMcdwStMe06IsC7eufCGjE/t4IOhE2U/P9DoFSWQi
         311xp1B99amX15foq4uEYbVWqLBW0ScnPOBxVMBnAkX3Bvhhk4FWZiN6Po9ErwQLFF7D
         4DAKuK2a1eOIkHAogH7TDtQnxPGt/BCmuKRLQdcg2Yejs93wSoSzLtJKW6WXq3iwvSuj
         U2mpjuK09ytk8hJHUXLWpaCjHxeZpbF6QHhNlsoutPTzjnC4I4OzfMGzKOxC7QNiH+n0
         QXHtZRpEd/KjTxZ0o1ENkVtfvO/IURNpe9mYWmyF33WoMtq4amq3OHPV58oBxM3h1Zxa
         AXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=AJNJ4dnn/xQEXOKSPkMwYC+ElM0isCZbedzwf8ZReLQ=;
        b=QXsJS3/TrHzer+4iBAhVg0y3EXdoVyvJue+EHAVT2USjnoXLRnzWdtpCFdhXq5rd72
         X6DtUmlNQp99DpJm+/qTVvm4Wb3FK3UMoYZvH6GmK3n+/8KItQxwjVEl12g1LsLKj92C
         u5NNXSHNh4qmmoGRHEfvvDaP35mia7pCNuQIo3hamHT8XLhZ81UQBKS/8KL5+eaX1WvO
         IIzcBRE7zZwtFYcQ9KMeFgXAUVHT+Xt/eKlmtf6VKMeJgzO8TEXvaq/wxx3euZdHn6v+
         rZ9fVejjBE26VoWN9Vvboy2gkrFoZWFtjnOi9K5qIj+FK/OjeVt9eNgpswOOMbdPYmvz
         kZGA==
X-Gm-Message-State: AOAM530Vh0OfMiYb8+opEpHxcYNV4tk3j8mG7KAutvCDE6hPGsOTpfH5
        NUcjDbqeK20T/izZutXLkGs=
X-Google-Smtp-Source: ABdhPJx9GGnbgm3YXwn52gUdv4LggmqrCXu5tTkxSQ+nFhl8UFcDyfzf8G/vLfG1ufkr7S8ditxsHA==
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr2479790ljc.6.1608317064666;
        Fri, 18 Dec 2020 10:44:24 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:2c04:50ad:1138:9ea2])
        by smtp.gmail.com with ESMTPSA id s7sm1116980ljp.38.2020.12.18.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 10:44:24 -0800 (PST)
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
Subject: [PATCH v1 10/13] sparc32: Drop mbus support
Date:   Fri, 18 Dec 2020 19:43:44 +0100
Message-Id: <20201218184347.2180772-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218184347.2180772-1-sam@ravnborg.org>
References: <20201218184347.2180772-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Only used by older SAPRC HW, not used by LEON.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/elf_32.h |  2 -
 arch/sparc/include/asm/mbus.h   | 97 ---------------------------------
 arch/sparc/kernel/cpu.c         |  1 -
 arch/sparc/kernel/setup_32.c    |  1 -
 arch/sparc/mm/iommu.c           | 18 +-----
 arch/sparc/mm/srmmu.c           | 48 ----------------
 6 files changed, 3 insertions(+), 164 deletions(-)
 delete mode 100644 arch/sparc/include/asm/mbus.h

diff --git a/arch/sparc/include/asm/elf_32.h b/arch/sparc/include/asm/elf_32.h
index 37a6016c9ccd..b2cca9be55c2 100644
--- a/arch/sparc/include/asm/elf_32.h
+++ b/arch/sparc/include/asm/elf_32.h
@@ -91,8 +91,6 @@ typedef struct {
 	unsigned int	pr_q[64];
 } elf_fpregset_t;
 
-#include <asm/mbus.h>
-
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
diff --git a/arch/sparc/include/asm/mbus.h b/arch/sparc/include/asm/mbus.h
deleted file mode 100644
index 8b6dbe701b9b..000000000000
--- a/arch/sparc/include/asm/mbus.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * mbus.h:  Various defines for MBUS modules.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_MBUS_H
-#define _SPARC_MBUS_H
-
-#include <asm/ross.h>    /* HyperSparc stuff */
-#include <asm/viking.h>  /* Ugh, bug city... */
-
-enum mbus_module {
-	HyperSparc        = 0,
-	Swift_ok          = 4,
-	Swift_bad_c       = 5,
-	Swift_lots_o_bugs = 6,
-	Tsunami           = 7,
-	Viking_12         = 8,
-	Viking_2x         = 9,
-	Viking_30         = 10,
-	Viking_35         = 11,
-	Viking_new        = 12,
-	TurboSparc	  = 13,
-	SRMMU_INVAL_MOD   = 14,
-};
-
-extern enum mbus_module srmmu_modtype;
-extern unsigned int viking_rev, swift_rev, cypress_rev;
-
-/* HW Mbus module bugs we have to deal with */
-#define HWBUG_COPYBACK_BROKEN        0x00000001
-#define HWBUG_ASIFLUSH_BROKEN        0x00000002
-#define HWBUG_VACFLUSH_BITROT        0x00000004
-#define HWBUG_KERN_ACCBROKEN         0x00000008
-#define HWBUG_KERN_CBITBROKEN        0x00000010
-#define HWBUG_MODIFIED_BITROT        0x00000020
-#define HWBUG_PC_BADFAULT_ADDR       0x00000040
-#define HWBUG_SUPERSCALAR_BAD        0x00000080
-#define HWBUG_PACINIT_BITROT         0x00000100
-
-/* First the module type values. To find out which you have, just load
- * the mmu control register from ASI_M_MMUREG alternate address space and
- * shift the value right 28 bits.
- */
-/* IMPL field means the company which produced the chip. */
-#define MBUS_VIKING        0x4   /* bleech, Texas Instruments Module */
-#define MBUS_LSI           0x3   /* LSI Logics */
-#define MBUS_ROSS          0x1   /* Ross is nice */
-#define MBUS_FMI           0x0   /* Fujitsu Microelectronics/Swift */
-
-/* Ross Module versions */
-#define ROSS_604_REV_CDE        0x0   /* revisions c, d, and e */
-#define ROSS_604_REV_F          0x1   /* revision f */
-#define ROSS_605                0xf   /* revision a, a.1, and a.2 */
-#define ROSS_605_REV_B          0xe   /* revision b */
-
-/* TI Viking Module versions */
-#define VIKING_REV_12           0x1   /* Version 1.2 or SPARCclassic's CPU */
-#define VIKING_REV_2            0x2   /* Version 2.1, 2.2, 2.3, and 2.4 */
-#define VIKING_REV_30           0x3   /* Version 3.0 */
-#define VIKING_REV_35           0x4   /* Version 3.5 */
-
-/* LSI Logics. */
-#define LSI_L64815		0x0
-
-/* Fujitsu */
-#define FMI_AURORA		0x4   /* MB8690x, a Swift module... */
-#define FMI_TURBO		0x5   /* MB86907, a TurboSparc module... */
-
-/* For multiprocessor support we need to be able to obtain the CPU id and
- * the MBUS Module id.
- */
-
-/* The CPU ID is encoded in the trap base register, 20 bits to the left of
- * bit zero, with 2 bits being significant.
- */
-#define TBR_ID_SHIFT            20
-
-static inline int get_cpuid(void)
-{
-	register int retval;
-	__asm__ __volatile__("rd %%tbr, %0\n\t"
-			     "srl %0, %1, %0\n\t" :
-			     "=r" (retval) :
-			     "i" (TBR_ID_SHIFT));
-	return (retval & 3);
-}
-
-static inline int get_modid(void)
-{
-	return (get_cpuid() | 0x8);
-}
-
-	
-#endif /* !(_SPARC_MBUS_H) */
diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
index 79cd6ccfeac0..cca7de051593 100644
--- a/arch/sparc/kernel/cpu.c
+++ b/arch/sparc/kernel/cpu.c
@@ -19,7 +19,6 @@
 #include <asm/page.h>
 #include <asm/head.h>
 #include <asm/psr.h>
-#include <asm/mbus.h>
 #include <asm/cpudata.h>
 
 #include "kernel.h"
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index eea43a1aef1b..b6fd87928c73 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -42,7 +42,6 @@
 #include <asm/page.h>
 #include <asm/traps.h>
 #include <asm/vaddrs.h>
-#include <asm/mbus.h>
 #include <asm/idprom.h>
 #include <asm/cpudata.h>
 #include <asm/setup.h>
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 0c0342e5b10d..125a3e96e3d2 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -18,7 +18,6 @@
 
 #include <asm/io.h>
 #include <asm/mxcc.h>
-#include <asm/mbus.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/bitext.h>
@@ -116,13 +115,7 @@ static void __init sbus_iommu_init(struct platform_device *op)
 		prom_halt();
 	}
 	bit_map_init(&iommu->usemap, bitmap, IOMMU_NPTES);
-	/* To be coherent on HyperSparc, the page color of DVMA
-	 * and physical addresses must match.
-	 */
-	if (srmmu_modtype == HyperSparc)
-		iommu->usemap.num_colors = vac_cache_size >> PAGE_SHIFT;
-	else
-		iommu->usemap.num_colors = 1;
+	iommu->usemap.num_colors = 1;
 
 	printk(KERN_INFO "IOMMU: impl %d vers %d table 0x%p[%d B] map [%d b]\n",
 	       impl, vers, iommu->page_table,
@@ -444,11 +437,6 @@ static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
 
 void __init ld_mmu_iommu(void)
 {
-	if (viking_mxcc_present || srmmu_modtype == HyperSparc) {
-		dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
-		ioperm_noc = IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID;
-	} else {
-		dvma_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV);
-		ioperm_noc = IOPTE_WRITE | IOPTE_VALID;
-	}
+	dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
+	ioperm_noc = IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID;
 }
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index d82cec45023a..802529aa02b9 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -34,7 +34,6 @@
 #include <asm/cache.h>
 #include <asm/traps.h>
 #include <asm/oplib.h>
-#include <asm/mbus.h>
 #include <asm/page.h>
 #include <asm/asi.h>
 #include <asm/smp.h>
@@ -51,8 +50,6 @@
 
 #include "mm_32.h"
 
-enum mbus_module srmmu_modtype;
-static unsigned int hwbug_bitmask;
 int vac_cache_size;
 EXPORT_SYMBOL(vac_cache_size);
 int vac_line_size;
@@ -1116,7 +1113,6 @@ static const struct sparc32_cachetlb_ops hypersparc_ops = {
 static void __init init_hypersparc(void)
 {
 	srmmu_name = "ROSS HyperSparc";
-	srmmu_modtype = HyperSparc;
 
 	init_vac_layout();
 
@@ -1175,45 +1171,6 @@ static void __init init_swift(void)
 			     "=r" (swift_rev) :
 			     "r" (SWIFT_MASKID_ADDR), "i" (ASI_M_BYPASS));
 	srmmu_name = "Fujitsu Swift";
-	switch (swift_rev) {
-	case 0x11:
-	case 0x20:
-	case 0x23:
-	case 0x30:
-		srmmu_modtype = Swift_lots_o_bugs;
-		hwbug_bitmask |= (HWBUG_KERN_ACCBROKEN | HWBUG_KERN_CBITBROKEN);
-		/*
-		 * Gee george, I wonder why Sun is so hush hush about
-		 * this hardware bug... really braindamage stuff going
-		 * on here.  However I think we can find a way to avoid
-		 * all of the workaround overhead under Linux.  Basically,
-		 * any page fault can cause kernel pages to become user
-		 * accessible (the mmu gets confused and clears some of
-		 * the ACC bits in kernel ptes).  Aha, sounds pretty
-		 * horrible eh?  But wait, after extensive testing it appears
-		 * that if you use pgd_t level large kernel pte's (like the
-		 * 4MB pages on the Pentium) the bug does not get tripped
-		 * at all.  This avoids almost all of the major overhead.
-		 * Welcome to a world where your vendor tells you to,
-		 * "apply this kernel patch" instead of "sorry for the
-		 * broken hardware, send it back and we'll give you
-		 * properly functioning parts"
-		 */
-		break;
-	case 0x25:
-	case 0x31:
-		srmmu_modtype = Swift_bad_c;
-		hwbug_bitmask |= HWBUG_KERN_CBITBROKEN;
-		/*
-		 * You see Sun allude to this hardware bug but never
-		 * admit things directly, they'll say things like,
-		 * "the Swift chip cache problems" or similar.
-		 */
-		break;
-	default:
-		srmmu_modtype = Swift_ok;
-		break;
-	}
 
 	sparc32_cachetlb_ops = &swift_ops;
 	flush_page_for_dma_global = 0;
@@ -1366,7 +1323,6 @@ static const struct sparc32_cachetlb_ops turbosparc_ops = {
 static void __init init_turbosparc(void)
 {
 	srmmu_name = "Fujitsu TurboSparc";
-	srmmu_modtype = TurboSparc;
 	sparc32_cachetlb_ops = &turbosparc_ops;
 	poke_srmmu = poke_turbosparc;
 }
@@ -1405,7 +1361,6 @@ static void __init init_tsunami(void)
 	 */
 
 	srmmu_name = "TI Tsunami";
-	srmmu_modtype = Tsunami;
 	sparc32_cachetlb_ops = &tsunami_ops;
 	poke_srmmu = poke_tsunami;
 
@@ -1545,9 +1500,6 @@ static void __init get_srmmu_type(void)
 	unsigned long mreg, psr;
 	unsigned long mod_typ, mod_rev, psr_typ, psr_vers;
 
-	srmmu_modtype = SRMMU_INVAL_MOD;
-	hwbug_bitmask = 0;
-
 	mreg = srmmu_get_mmureg(); psr = get_psr();
 	mod_typ = (mreg & 0xf0000000) >> 28;
 	mod_rev = (mreg & 0x0f000000) >> 24;
-- 
2.27.0

