Return-Path: <sparclinux+bounces-540-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2AC8734A5
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 11:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3841C2235A
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 10:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F40760BB6;
	Wed,  6 Mar 2024 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJQue2x9"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A7604A7
	for <sparclinux@vger.kernel.org>; Wed,  6 Mar 2024 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721812; cv=none; b=R6RIYJv4zos7Nk88lOdch2aNQXX+qOH+h4DTLkGiWvBIU5qqhYDYyRO+JfKMd0Zb4z3ATVGkMzs2lZb/pC0c9JAaM64vitWbPC54swjcV/TtaBkvFNlJcXpPx+/O7PljSqaRPMmDe9ylyTHwYShpiMdFnOU7dmRm8P8ET2VOfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721812; c=relaxed/simple;
	bh=1AOoamXcuacx71meTjn7bLO8VLc0lsCwheV0GNk8lTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocGfCifkz6qHaefPPh2SNBBK8lDSwJ60UEKHioXsPtNeBdTb+t52Id2IvjV7xNvq0fSGs8SEiLjOje8hUo/WDK71nqN8U2GD7eNa0vjLl1yMUxwLXQlD4ruepjMF5qrdSGr96ACD6c302+OzCAzaRBCCwtfAZ8XdVAMpKDozL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJQue2x9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvhYOoORCLpxz/No1Zw0ldOZIymUNMLffxfrF8V0mdw=;
	b=OJQue2x9sfWqeg2mVYJt3BZsKIaMzg6IOJNRmSnBx+tSSQfh6zWxGA74Jm1dMjz0lT/AlW
	rDEACp5fnzl+A6UjOoedkWptUCQytijkchpW+eef7GM3RLDXqYtCVVpo1lxZ3gs0N65bZ0
	M/WZQeIJ2B9GE6unpgHDzlqB1B0kE1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-M8jx121_PeO5YuMfMxkl1g-1; Wed, 06 Mar 2024 05:43:24 -0500
X-MC-Unique: M8jx121_PeO5YuMfMxkl1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32C3C800262;
	Wed,  6 Mar 2024 10:43:24 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5593111DD03;
	Wed,  6 Mar 2024 10:43:17 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Jason Gunthorpe <jgg@nvidia.com>,
	peterx@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	x86@kernel.org,
	sparclinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC 11/13] mm/treewide: Replace pXd_huge() with pXd_leaf()
Date: Wed,  6 Mar 2024 18:41:45 +0800
Message-ID: <20240306104147.193052-12-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

From: Peter Xu <peterx@redhat.com>

Now after we're sure all pXd_huge() definitions are the same as pXd_leaf(),
reuse it.  Luckily, pXd_huge() isn't widely used.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/include/asm/pgtable-3level.h | 2 +-
 arch/arm64/include/asm/pgtable.h      | 2 +-
 arch/arm64/mm/hugetlbpage.c           | 4 ++--
 arch/loongarch/mm/hugetlbpage.c       | 2 +-
 arch/mips/mm/tlb-r4k.c                | 2 +-
 arch/powerpc/mm/pgtable_64.c          | 6 +++---
 arch/x86/mm/pgtable.c                 | 4 ++--
 mm/gup.c                              | 4 ++--
 mm/hmm.c                              | 2 +-
 mm/memory.c                           | 2 +-
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index e7aecbef75c9..9e3c44f0aea2 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -190,7 +190,7 @@ static inline pte_t pte_mkspecial(pte_t pte)
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
 
 #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
-#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_trans_huge(pmd)	(pmd_val(pmd) && !pmd_table(pmd))
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 14d24c357c7a..c4efa47fed5f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -512,7 +512,7 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return pmd;
 }
 
-#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1234bbaef5bf..f494fc31201f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -321,7 +321,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	if (sz != PUD_SIZE && pud_none(pud))
 		return NULL;
 	/* hugepage or swap? */
-	if (pud_huge(pud) || !pud_present(pud))
+	if (pud_leaf(pud) || !pud_present(pud))
 		return (pte_t *)pudp;
 	/* table; check the next level */
 
@@ -333,7 +333,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	if (!(sz == PMD_SIZE || sz == CONT_PMD_SIZE) &&
 	    pmd_none(pmd))
 		return NULL;
-	if (pmd_huge(pmd) || !pmd_present(pmd))
+	if (pmd_leaf(pmd) || !pmd_present(pmd))
 		return (pte_t *)pmdp;
 
 	if (sz == CONT_PTE_SIZE)
diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index 1e76fcb83093..a4e78e74aa21 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -64,7 +64,7 @@ uint64_t pmd_to_entrylo(unsigned long pmd_val)
 {
 	uint64_t val;
 	/* PMD as PTE. Must be huge page */
-	if (!pmd_huge(__pmd(pmd_val)))
+	if (!pmd_leaf(__pmd(pmd_val)))
 		panic("%s", __func__);
 
 	val = pmd_val ^ _PAGE_HUGE;
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 4106084e57d7..76f3b9c0a9f0 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -326,7 +326,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	idx = read_c0_index();
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
-	if (pmd_huge(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		unsigned long lo;
 		write_c0_pagemask(PM_HUGE_MASK);
 		ptep = (pte_t *)pmdp;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 9b99113cb51a..6621cfc3baf8 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -102,7 +102,7 @@ struct page *p4d_page(p4d_t p4d)
 {
 	if (p4d_leaf(p4d)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!p4d_huge(p4d));
+			VM_WARN_ON(!p4d_leaf(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
 	return virt_to_page(p4d_pgtable(p4d));
@@ -113,7 +113,7 @@ struct page *pud_page(pud_t pud)
 {
 	if (pud_leaf(pud)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!pud_huge(pud));
+			VM_WARN_ON(!pud_leaf(pud));
 		return pte_page(pud_pte(pud));
 	}
 	return virt_to_page(pud_pgtable(pud));
@@ -132,7 +132,7 @@ struct page *pmd_page(pmd_t pmd)
 		 * enabled so these checks can't be used.
 		 */
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!(pmd_leaf(pmd) || pmd_huge(pmd)));
+			VM_WARN_ON(!pmd_leaf(pmd));
 		return pte_page(pmd_pte(pmd));
 	}
 	return virt_to_page(pmd_page_vaddr(pmd));
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index ff690ddc2334..d74f0814e086 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -731,7 +731,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 		return 0;
 
 	/* Bail out if we are we on a populated non-leaf entry: */
-	if (pud_present(*pud) && !pud_huge(*pud))
+	if (pud_present(*pud) && !pud_leaf(*pud))
 		return 0;
 
 	set_pte((pte_t *)pud, pfn_pte(
@@ -760,7 +760,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	}
 
 	/* Bail out if we are we on a populated non-leaf entry: */
-	if (pmd_present(*pmd) && !pmd_huge(*pmd))
+	if (pmd_present(*pmd) && !pmd_leaf(*pmd))
 		return 0;
 
 	set_pte((pte_t *)pmd, pfn_pte(
diff --git a/mm/gup.c b/mm/gup.c
index de7188d2af86..9c0bc9d49c32 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -778,7 +778,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d = READ_ONCE(*p4dp);
 	if (p4d_none(p4d) || !p4d_present(p4d))
 		return no_page_table(vma, flags);
-	BUILD_BUG_ON(p4d_huge(p4d));
+	BUILD_BUG_ON(p4d_leaf(p4d));
 	if (unlikely(p4d_bad(p4d)))
 		return no_page_table(vma, flags);
 
@@ -3070,7 +3070,7 @@ static int gup_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr, unsigned lo
 		next = p4d_addr_end(addr, end);
 		if (p4d_none(p4d) || !p4d_present(p4d))
 			return 0;
-		BUILD_BUG_ON(p4d_huge(p4d));
+		BUILD_BUG_ON(p4d_leaf(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
 			if (!gup_huge_pd(__hugepd(p4d_val(p4d)), addr,
 					 P4D_SHIFT, next, flags, pages, nr))
diff --git a/mm/hmm.c b/mm/hmm.c
index c44391a0246e..3b526c529b55 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
 
-	if (pud_huge(pud) && pud_devmap(pud)) {
+	if (pud_leaf(pud) && pud_devmap(pud)) {
 		unsigned long i, npages, pfn;
 		unsigned int required_fault;
 		unsigned long *hmm_pfns;
diff --git a/mm/memory.c b/mm/memory.c
index e17669d4f72f..96562053be9c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2763,7 +2763,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
 	unsigned long next;
 	int err = 0;
 
-	BUG_ON(pud_huge(*pud));
+	BUG_ON(pud_leaf(*pud));
 
 	if (create) {
 		pmd = pmd_alloc_track(mm, pud, addr, mask);
-- 
2.44.0


