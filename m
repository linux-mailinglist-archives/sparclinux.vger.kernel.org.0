Return-Path: <sparclinux+bounces-697-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342E87F0E0
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 21:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D391F24196
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 20:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496E35C5E6;
	Mon, 18 Mar 2024 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QpKbSJlq"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463535BAE6
	for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792270; cv=none; b=nlpSyMa79/IFfcti+UFOvuZmWUesYU+VbfXkczj3Sh0Qeb0AfFtQgYG8SN1rjzbABUxh2CysrMf72AJX5GY0t2O4UZwXGF/YcdCVWcv4WumRSqf1RFd6mvPXXbhcaTBCT91EDEzF4nFjS5fwqOi+8fMUjhK9XNt6viIBA7yYxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792270; c=relaxed/simple;
	bh=O0+KZoNJkyqgkkBm880il/b9aGWCTEsuXpCU+/TiYmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+hvgmlsap8ZtTGIuAOBTSPmYPBd3GFnHHuy8pUM3R2qwo5H1zza13H9RZn0asbbTjzDz8CqSOeB4R2iIZOKh6FHs4BXq8kMzoO53v4YgeYMEf9eiUUTVmTZayHtjHNPfObuRBeTpBZzyK9x/4s0DKHtwUktqtCp5MYhn7dLtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QpKbSJlq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmTR2+cqTF97dN4Qm56qtqK3b7/RsOHhzWGdzkuQ/Hs=;
	b=QpKbSJlqHtLlsrlOlI30duF9X+tvMpJvRqpivc/AaG+pzrM6s71H1jvF6uLn1yWq+SbrNV
	IFpjyYZLu+VCsrOeUqmcXV0b3XVvlF1QQvQYxc/sfBtiCki/daEjVCfCiMXF8SuXl+kBwt
	OVzhlVwUBLZGk2TzeDkCwDPJF+b+QA4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-klfqE-TINMKljYWGtIRnHw-1; Mon, 18 Mar 2024 16:04:25 -0400
X-MC-Unique: klfqE-TINMKljYWGtIRnHw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c38c51b542so208465b6e.1
        for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 13:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792265; x=1711397065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmTR2+cqTF97dN4Qm56qtqK3b7/RsOHhzWGdzkuQ/Hs=;
        b=HbzNuhVC8AiOBCvRuUJjYTmSScnyuuodpwEHCRCxR1MilEsAi1FOwrasFi95qVljtr
         fgu0gMJjOXHytyfaTYhfXc9atXF+7WbywoNOXpK65CCLld/LCCyEBXatt01sPJaeHhsk
         5D0DtmNIUl5FkscN87m5GhW56A5aTtcwQD5i+/9ZvWzC41qk0Fnhw3zJENUjqVfNpLo/
         j3zn/D7KwCMTBXF36cl58a16omG9O6G3NmhBn6A8Y7Lhc2cyMqV1cac+8hEjmlv93DNb
         wUiuf/zEVd89wO3t4qBkFf9zvfqmeQf4XudMgNU3NFrYBl86VPX51zVo/C1iKqF65+sy
         CBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA85ipDrZ/geJMvNkX7HiaeBaV/bw/qeyirM5+pbfhdDup5z/a2oZkquTB41cHswQc7l35pJAlqyt9KwhOzTTycUL0NdYRegKQNg==
X-Gm-Message-State: AOJu0YwV1mY6zLZV+WfNdWZRgjFPCSs4U6SU+/Fn6ZX8Y0vQAA0MXPnK
	B1ZqOYy3f6GZrMKzLVCRX0UsZZHUOPn1s5RWTgGTk8govPoQvsrvV8gBmJO0RE3dDsjVRES0Qus
	CeJCKsxk0EJSCZzT+umeLTk4lsU2USdm435TBd1vF0CFf6w5tvJvW+zJyZKGiXR/5qJI=
X-Received: by 2002:a05:6808:3099:b0:3c3:816a:529d with SMTP id bl25-20020a056808309900b003c3816a529dmr156856oib.2.1710792264820;
        Mon, 18 Mar 2024 13:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdX31Zs3vW9gDCMmxaZRHxj3gvfM6vQ7QYtr0ffkzhN3BJe5PTlph43w9winY6TmAlwQnXRQ==
X-Received: by 2002:a05:6808:3099:b0:3c3:816a:529d with SMTP id bl25-20020a056808309900b003c3816a529dmr156814oib.2.1710792264362;
        Mon, 18 Mar 2024 13:04:24 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:23 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	x86@kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	peterx@redhat.com
Subject: [PATCH v2 12/14] mm/treewide: Remove pXd_huge()
Date: Mon, 18 Mar 2024 16:04:02 -0400
Message-ID: <20240318200404.448346-13-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Xu <peterx@redhat.com>

This API is not used anymore, drop it for the whole tree.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/mm/Makefile                          |  1 -
 arch/arm/mm/hugetlbpage.c                     | 29 -------------------
 arch/arm64/mm/hugetlbpage.c                   | 10 -------
 arch/loongarch/mm/hugetlbpage.c               | 10 -------
 arch/mips/include/asm/pgtable-32.h            |  2 +-
 arch/mips/include/asm/pgtable-64.h            |  2 +-
 arch/mips/mm/hugetlbpage.c                    | 10 -------
 arch/parisc/mm/hugetlbpage.c                  | 11 -------
 .../include/asm/book3s/64/pgtable-4k.h        | 10 -------
 .../include/asm/book3s/64/pgtable-64k.h       | 25 ----------------
 arch/powerpc/include/asm/nohash/pgtable.h     | 10 -------
 arch/riscv/mm/hugetlbpage.c                   | 10 -------
 arch/s390/mm/hugetlbpage.c                    | 10 -------
 arch/sh/mm/hugetlbpage.c                      | 10 -------
 arch/sparc/mm/hugetlbpage.c                   | 10 -------
 arch/x86/mm/hugetlbpage.c                     | 16 ----------
 include/linux/hugetlb.h                       | 24 ---------------
 17 files changed, 2 insertions(+), 198 deletions(-)
 delete mode 100644 arch/arm/mm/hugetlbpage.c

diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index 71b858c9b10c..1779e12db085 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -21,7 +21,6 @@ KASAN_SANITIZE_physaddr.o	:= n
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
-obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.o
 
 obj-$(CONFIG_CPU_ABRT_NOMMU)	+= abort-nommu.o
diff --git a/arch/arm/mm/hugetlbpage.c b/arch/arm/mm/hugetlbpage.c
deleted file mode 100644
index c2fa643f6bb5..000000000000
--- a/arch/arm/mm/hugetlbpage.c
+++ /dev/null
@@ -1,29 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mm/hugetlbpage.c
- *
- * Copyright (C) 2012 ARM Ltd.
- *
- * Based on arch/x86/include/asm/hugetlb.h and Bill Carson's patches
- */
-
-#include <linux/init.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/hugetlb.h>
-#include <linux/pagemap.h>
-#include <linux/err.h>
-#include <linux/sysctl.h>
-#include <asm/mman.h>
-#include <asm/tlb.h>
-#include <asm/tlbflush.h>
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index f494fc31201f..ca58210d6c07 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -79,16 +79,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 }
 #endif
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, size_t *pgsize)
 {
diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index a4e78e74aa21..12222c56cb59 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -50,16 +50,6 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 	return (pte_t *) pmd;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return (pmd_val(pmd) & _PAGE_HUGE) != 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return (pud_val(pud) & _PAGE_HUGE) != 0;
-}
-
 uint64_t pmd_to_entrylo(unsigned long pmd_val)
 {
 	uint64_t val;
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 0e196650f4f4..92b7591aac2a 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -129,7 +129,7 @@ static inline int pmd_none(pmd_t pmd)
 static inline int pmd_bad(pmd_t pmd)
 {
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-	/* pmd_huge(pmd) but inline */
+	/* pmd_leaf(pmd) but inline */
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
 		return 0;
 #endif
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 20ca48c1b606..7c28510b3768 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -245,7 +245,7 @@ static inline int pmd_none(pmd_t pmd)
 static inline int pmd_bad(pmd_t pmd)
 {
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-	/* pmd_huge(pmd) but inline */
+	/* pmd_leaf(pmd) but inline */
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
 		return 0;
 #endif
diff --git a/arch/mips/mm/hugetlbpage.c b/arch/mips/mm/hugetlbpage.c
index 7eaff5b07873..0b9e15555b59 100644
--- a/arch/mips/mm/hugetlbpage.c
+++ b/arch/mips/mm/hugetlbpage.c
@@ -57,13 +57,3 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 	}
 	return (pte_t *) pmd;
 }
-
-int pmd_huge(pmd_t pmd)
-{
-	return (pmd_val(pmd) & _PAGE_HUGE) != 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return (pud_val(pud) & _PAGE_HUGE) != 0;
-}
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index a9f7e21f6656..0356199bd9e7 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -180,14 +180,3 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	}
 	return changed;
 }
-
-
-int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 92545981bb49..baf934578c3a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -6,16 +6,6 @@
  */
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_HUGETLB_PAGE
-static inline int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 /*
  * With radix , we have hugepage ptes in the pud and pmd entries. We don't
  * need to setup hugepage directory for them. Our pte and page directory format
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index 2fce3498b000..579a7153857f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -4,31 +4,6 @@
 
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_HUGETLB_PAGE
-/*
- * We have PGD_INDEX_SIZ = 12 and PTE_INDEX_SIZE = 8, so that we can have
- * 16GB hugepage pte in PGD and 16MB hugepage pte at PMD;
- *
- * Defined in such a way that we can optimize away code block at build time
- * if CONFIG_HUGETLB_PAGE=n.
- *
- * returns true for pmd migration entries, THP, devmap, hugetlb
- * But compile time dependent on CONFIG_HUGETLB_PAGE
- */
-static inline int pmd_huge(pmd_t pmd)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-}
 
 /*
  * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 427db14292c9..f5f39d4f03c8 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -351,16 +351,6 @@ static inline int hugepd_ok(hugepd_t hpd)
 #endif
 }
 
-static inline int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
 #define is_hugepd(hpd)		(hugepd_ok(hpd))
 #endif
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 29c7606414d2..9a4bc4bd2a01 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -399,16 +399,6 @@ static bool is_napot_size(unsigned long size)
 
 #endif /*CONFIG_RISCV_ISA_SVNAPOT*/
 
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
 static bool __hugetlb_valid_size(unsigned long size)
 {
 	if (size == HPAGE_SIZE)
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index c2e8242bd15d..ca43b6fce71c 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -233,16 +233,6 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return (pte_t *) pmdp;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	if (MACHINE_HAS_EDAT1 && size == PMD_SIZE)
diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 6cb0ad73dbb9..ff209b55285a 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -70,13 +70,3 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
 	return pte;
 }
-
-int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index d31c2cec35c9..8ed5bdf95d25 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -407,16 +407,6 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return entry;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);;
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
 			   unsigned long addr)
 {
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 8362953a24ce..dab6db288e5b 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -19,22 +19,6 @@
 #include <asm/tlbflush.h>
 #include <asm/elf.h>
 
-/*
- * pmd_huge() returns 1 if @pmd is hugetlb related entry.
- */
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-/*
- * pud_huge() returns 1 if @pud is hugetlb related entry.
- */
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 #ifdef CONFIG_HUGETLB_PAGE
 static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		unsigned long addr, unsigned long len,
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 77b30a8c6076..300de33c6fde 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -272,13 +272,9 @@ void hugetlb_vma_unlock_write(struct vm_area_struct *vma);
 int hugetlb_vma_trylock_write(struct vm_area_struct *vma);
 void hugetlb_vma_assert_locked(struct vm_area_struct *vma);
 void hugetlb_vma_lock_release(struct kref *kref);
-
-int pmd_huge(pmd_t pmd);
-int pud_huge(pud_t pud);
 long hugetlb_change_protection(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, pgprot_t newprot,
 		unsigned long cp_flags);
-
 bool is_hugetlb_entry_migration(pte_t pte);
 bool is_hugetlb_entry_hwpoisoned(pte_t pte);
 void hugetlb_unshare_all_pmds(struct vm_area_struct *vma);
@@ -399,16 +395,6 @@ static inline void hugetlb_vma_assert_locked(struct vm_area_struct *vma)
 {
 }
 
-static inline int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
 static inline int is_hugepage_only_range(struct mm_struct *mm,
 					unsigned long addr, unsigned long len)
 {
@@ -493,16 +479,6 @@ static inline vm_fault_t hugetlb_fault(struct mm_struct *mm,
 static inline void hugetlb_unshare_all_pmds(struct vm_area_struct *vma) { }
 
 #endif /* !CONFIG_HUGETLB_PAGE */
-/*
- * hugepages at page global directory. If arch support
- * hugepages at pgd level, they need to define this.
- */
-#ifndef pgd_huge
-#define pgd_huge(x)	0
-#endif
-#ifndef p4d_huge
-#define p4d_huge(x)	0
-#endif
 
 #ifndef pgd_write
 static inline int pgd_write(pgd_t pgd)
-- 
2.44.0


