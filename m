Return-Path: <sparclinux+bounces-696-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11387F0DF
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 21:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82E928430D
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 20:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4655C5E4;
	Mon, 18 Mar 2024 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Viuar6UQ"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730455B67B
	for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792270; cv=none; b=JQxwhinothMEH1IKqtL1mtLrhcWYLUtdLEMXpYxXXt7smfTK4laBuNeyh8HFcg7H2gr52A8n3IED7o7SsTuR8hPpz5++BPVdQb8MY1z4yh1DTkxM5DFyV+2/iz+so4L5gYMat9skfqZyMmeCMlcmqn2y3dG27NSlAOmtQ4hEc8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792270; c=relaxed/simple;
	bh=re8gayKJqX7wtB2aUip/dTMGnIaKcXRJtJft1bXrpLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg+y3pFI95xbu+W+iCXombyTEnPn5GeN7q1jo3n9vO4EHmKJMjw9KEJC7ammsHcQx7dFsbGhWNWai6vOca9F5SrIReljp45N2WUoLS8t5sYQf3atnxDdosreq/IH435OkbESMZvpFknChbw/s4RkQC9b0hMNB5K/kQkWrNnXsV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Viuar6UQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5IYGWVxUA2LCxblG8GUdWUManYweqkS1nMwnfIC++w=;
	b=Viuar6UQ/srzw08KJ2bPhP73yVEJrJdeZt2Z2T+0HlCTo/rQcXyBvbcdFpQwUrjiXTEbyZ
	FqZj90EdimAA6OrOFeerlRjwng2y05egiquXSoic/WzkNzvPMzGtdgj72ul2oZiC4Gk/Be
	YhNro7adTx48LwhgO+VBaTvwJgSyfp8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-L9ysjaaoNtSCwLQQcB0jzg-1; Mon, 18 Mar 2024 16:04:23 -0400
X-MC-Unique: L9ysjaaoNtSCwLQQcB0jzg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42ef59a624fso3565001cf.0
        for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792263; x=1711397063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5IYGWVxUA2LCxblG8GUdWUManYweqkS1nMwnfIC++w=;
        b=wS4cdRGhHUHKq4y9UXPV0S2SMxzQK4VZPCtCQD819rsyFo6CBlrVTWfaa1KldCKpzY
         S+4q0QTPTh2lh6LF06cjTITQk0QOku36lFeClyRbY2FvumQ6RNRDjmFucM3I5llfvnyJ
         0xBU4JEI66GytiSKrG8G38bodeohSVsqwkA2zn36IyMLB4c4EG6O/IsnHu5dJEnVrM7g
         NowWBKhk0jbLGzM4GOWVkOOI5iWqI7MQHbd7bpDKSnQ2cHD9ib7To57PWi2a7E3WYJPm
         ptWYxjcNfjDqUEcBDifkSdH5C0yt06sfoE4Wlv+59y0fvySx2rMgyhZWuEkE7oEssU0o
         tgfA==
X-Forwarded-Encrypted: i=1; AJvYcCXUnlDfjjBSrJKw7gwnuA5+b03zuz19ltAQLNYCb6dsEfvjIyqxDwz68ce2UwZ1ugArfLCuPYuuSsEvQh6+BRiyFA3mu0cAfTVTlg==
X-Gm-Message-State: AOJu0YzxC6YRb15ZPyLZmXqDzsH3wcxDwNPtrydg2PyhlA39gn7eswbS
	fr7Pug9Ri+hwuRW2fk56WYr9T9D7ReybiqUNgqNJpRpxCou6ppuxJD+TKrwrbUcCiybvwL4ppOf
	B4A4/8TE5Wyjan5t4cOM84Kp28usBOxagmKvf7oHpoNJkaUpwwR6XiSV3UVk=
X-Received: by 2002:ac8:5f94:0:b0:430:a3bd:178b with SMTP id j20-20020ac85f94000000b00430a3bd178bmr450218qta.2.1710792263102;
        Mon, 18 Mar 2024 13:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp9pbq1yp/IEiDWtUuy/HeuR42qObaCDKOoRIIvKhBVTuD6LDz0uhx2Vxyh/zWi2fCOK+MTg==
X-Received: by 2002:ac8:5f94:0:b0:430:a3bd:178b with SMTP id j20-20020ac85f94000000b00430a3bd178bmr450185qta.2.1710792262668;
        Mon, 18 Mar 2024 13:04:22 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:22 -0700 (PDT)
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
Subject: [PATCH v2 11/14] mm/treewide: Replace pXd_huge() with pXd_leaf()
Date: Mon, 18 Mar 2024 16:04:01 -0400
Message-ID: <20240318200404.448346-12-peterx@redhat.com>
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
index e2415e9789bc..8e04a04ef138 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -778,7 +778,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d = READ_ONCE(*p4dp);
 	if (!p4d_present(p4d))
 		return no_page_table(vma, flags);
-	BUILD_BUG_ON(p4d_huge(p4d));
+	BUILD_BUG_ON(p4d_leaf(p4d));
 	if (unlikely(p4d_bad(p4d)))
 		return no_page_table(vma, flags);
 
@@ -3070,7 +3070,7 @@ static int gup_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr, unsigned lo
 		next = p4d_addr_end(addr, end);
 		if (!p4d_present(p4d))
 			return 0;
-		BUILD_BUG_ON(p4d_huge(p4d));
+		BUILD_BUG_ON(p4d_leaf(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
 			if (!gup_huge_pd(__hugepd(p4d_val(p4d)), addr,
 					 P4D_SHIFT, next, flags, pages, nr))
diff --git a/mm/hmm.c b/mm/hmm.c
index c95b9ec5d95f..93aebd9cc130 100644
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
index 904f70b99498..baee777dcd2d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2765,7 +2765,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
 	unsigned long next;
 	int err = 0;
 
-	BUG_ON(pud_huge(*pud));
+	BUG_ON(pud_leaf(*pud));
 
 	if (create) {
 		pmd = pmd_alloc_track(mm, pud, addr, mask);
-- 
2.44.0


