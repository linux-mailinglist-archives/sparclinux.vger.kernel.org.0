Return-Path: <sparclinux+bounces-1662-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A8693447E
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2024 00:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE44283283
	for <lists+sparclinux@lfdr.de>; Wed, 17 Jul 2024 22:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C074646426;
	Wed, 17 Jul 2024 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifEIV2Qe"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F86BB5B
	for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2024 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721253760; cv=none; b=aDqOdo48CaZyFtMNALq8ebl7xF9hfmUs9Ptoe4Vy9PPzy2kow13zwGRVq4vpa1bvJUSQbjs324h5l0Fe9WsobE7PL/rFbeKeI8I9dkLnTqG49RFljDh0KmF41CYoP08f8rVcp6AziPfzKwEnFOwr7+HkgIa5HZkJW3/Raa+Zi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721253760; c=relaxed/simple;
	bh=nCsCTFa0Z1yw3QiGtMINtHrc9hkNSxx4hxdCmu5+jNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwGzEoaOyIHpiA97tAhBrSbsbUtQnx06q547+ZVRGLrZ8XgsKGkorpKA9oC9BWaN70WbCwCAQzwdtqTul5tY6uATChFOYRQWQDCa26t70K9VA7q52llCkOELmRbSwPEHFA6cefHHHVjREURzRLHLIAy0xIc5DQKa+kGmCm4ajlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifEIV2Qe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cM3uv1r2lWcW+xf+zoFP/LGFvU433fJ+6ETuZi6JTtc=;
	b=ifEIV2QevkQW3WJ7R5ymsIHtVkTW0vhO3Re7ofEA7qhpDfRWj3bX2mzK4dvPwTCnAmsLN+
	k9yXrWuK/tPeQ4QKJw+Wr1Gk7cX7Ad5b//wk4dR0U21nClpCx0XVLMzyuBZ3VCDorUh5HR
	Sl1wS4Z95gReLbl7ANBjZoLbxbGBxPg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-1avgy1CrNT2HT_JnpsEPFA-1; Wed, 17 Jul 2024 18:02:36 -0400
X-MC-Unique: 1avgy1CrNT2HT_JnpsEPFA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44aeacbf2baso259681cf.2
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2024 15:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253755; x=1721858555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cM3uv1r2lWcW+xf+zoFP/LGFvU433fJ+6ETuZi6JTtc=;
        b=wMA+WzC0eMFkn0LLvDRSn/qsHVK6H3PnfrXtlniODae2Vyos5vpeB9MJctykBLUIMf
         h4IGlEunbJWDg+JuMAuoH+He5Qp9yiXGmIEsIZVr+eeedo8oZnkVr3+eDuz+qbbXPH49
         IHBn6zEtyUqMQAu9iJYxEYmobPTLo7unB2G1l43MlZj+EWTvp0VJmK0znqTjvq/zNzaC
         dcbSB2yC9VFz2pxS1LkZJz82sko4z8opfdY/E5SHqvrxJo9J6m9Q6ppkq787bHTcn6aL
         5xN8f3QflAT26llmgj7sEqBWpaJ+nLiGpR6S4uvsdKwu1icPDHDx1j+q9U2vjwyLt+2E
         z1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXiRSiKlJgqPstTxb2+lO4I1a3UM9sSTFsdm4++ieJGwaAUQcdH3sUEq38UPv8kzyB4aTWPcU5UR3P3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5n6MOnRb/7WABrBKjpM1yhmjwrE5Q1XPkYDyqpnVkeJcPWH54
	oryvQxzyrUszKJQfpXzTqmqnh8qAjn2/fg2NJfmF2HyTbaIkGcRUykGN3GUPeYBnvPKmyjUZb1g
	Y+xPYjFIzWvXd0hCp/tICffhTlqS2KO36q8UeubgPITzlLbh5QvUtFSql+y4=
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22372981cf.1.1721253755326;
        Wed, 17 Jul 2024 15:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QsOTDoliMPT3fo+/7Outqv1nF7W8rzQA7PybYEjXwyS1q7X3t8IYBAe2znVX4XcYe4OF/A==
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22372781cf.1.1721253754848;
        Wed, 17 Jul 2024 15:02:34 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	peterx@redhat.com,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH RFC 6/6] mm: Convert "*_trans_huge() || *_devmap()" to use *_leaf()
Date: Wed, 17 Jul 2024 18:02:19 -0400
Message-ID: <20240717220219.3743374-7-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch converted all such checks into one *_leaf() check under common
mm/, as "thp+devmap" should compose everything for a *_leaf() for now.  I
didn't yet touch arch code in other directories, as some arch may need some
special attention, so I left those separately.

It should start to save some cycles on such check and pave way for the new
leaf types.  E.g., when a new type of leaf is introduced, it'll naturally
go the same route to what we have now for thp+devmap.

Here one issue with pxx_leaf() API is that such API will be defined by arch
but it doesn't consider kernel config.  For example, below "if" branch
cannot be automatically optimized:

  if (pmd_leaf()) { ... }

Even if both THP && HUGETLB are not enabled (which means pmd_leaf() can
never return true).

To provide a chance for compilers to optimize and omit code when possible,
introduce a light wrapper for them and call them pxx_is_leaf().  That will
take kernel config into account and properly allow omitting branches when
the compiler knows it'll constantly returns false.  This tries to mimic
what we used to have with pxx_trans_huge() when !THP, so it now also
applies to pxx_leaf() API.

Cc: Alistair Popple <apopple@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h    |  6 +++---
 include/linux/pgtable.h    | 30 +++++++++++++++++++++++++++++-
 mm/hmm.c                   |  4 ++--
 mm/huge_mapping_pmd.c      |  9 +++------
 mm/huge_mapping_pud.c      |  6 +++---
 mm/mapping_dirty_helpers.c |  4 ++--
 mm/memory.c                | 14 ++++++--------
 mm/migrate_device.c        |  2 +-
 mm/mprotect.c              |  4 ++--
 mm/mremap.c                |  5 ++---
 mm/page_vma_mapped.c       |  5 ++---
 mm/pgtable-generic.c       |  7 +++----
 12 files changed, 58 insertions(+), 38 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index aea2784df8ef..a5b026d0731e 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -27,7 +27,7 @@ spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);
 static inline spinlock_t *
 pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 {
-	if (pud_trans_huge(*pud) || pud_devmap(*pud))
+	if (pud_is_leaf(*pud))
 		return __pud_trans_huge_lock(pud, vma);
 	else
 		return NULL;
@@ -36,7 +36,7 @@ pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 #define split_huge_pud(__vma, __pud, __address)				\
 	do {								\
 		pud_t *____pud = (__pud);				\
-		if (pud_trans_huge(*____pud) || pud_devmap(*____pud))	\
+		if (pud_is_leaf(*____pud))				\
 			__split_huge_pud(__vma, __pud, __address);	\
 	}  while (0)
 #else  /* CONFIG_PGTABLE_HAS_PUD_LEAVES */
@@ -125,7 +125,7 @@ static inline int is_swap_pmd(pmd_t pmd)
 static inline spinlock_t *
 pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 {
-	if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
+	if (is_swap_pmd(*pmd) || pmd_is_leaf(*pmd))
 		return __pmd_trans_huge_lock(pmd, vma);
 	else
 		return NULL;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5e505373b113..af7709a132aa 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1641,7 +1641,7 @@ static inline int pud_trans_unstable(pud_t *pud)
 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 	pud_t pudval = READ_ONCE(*pud);
 
-	if (pud_none(pudval) || pud_trans_huge(pudval) || pud_devmap(pudval))
+	if (pud_none(pudval) || pud_leaf(pudval))
 		return 1;
 	if (unlikely(pud_bad(pudval))) {
 		pud_clear_bad(pud);
@@ -1901,6 +1901,34 @@ typedef unsigned int pgtbl_mod_mask;
 #define pmd_leaf(x)	false
 #endif
 
+/*
+ * Wrapper of pxx_leaf() helpers.
+ *
+ * Comparing to pxx_leaf() API, the only difference is: using these macros
+ * can help code generation, so unnecessary code can be omitted when the
+ * specific level of leaf is not possible due to kernel config.  It is
+ * needed because normally pxx_leaf() can be defined in arch code without
+ * knowing the kernel config.
+ *
+ * Currently we only need pmd/pud versions, because the largest leaf Linux
+ * supports so far is pud.
+ *
+ * Defining here also means that in arch's pgtable headers these macros
+ * cannot be used, pxx_leaf()s need to be used instead, because this file
+ * will not be included in arch's pgtable headers.
+ */
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+#define pmd_is_leaf(x)  pmd_leaf(x)
+#else
+#define pmd_is_leaf(x)  false
+#endif
+
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
+#define pud_is_leaf(x)  pud_leaf(x)
+#else
+#define pud_is_leaf(x)  false
+#endif
+
 #ifndef pgd_leaf_size
 #define pgd_leaf_size(x) (1ULL << PGDIR_SHIFT)
 #endif
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..8d985bbbfee9 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -351,7 +351,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
 
-	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
+	if (pmd_is_leaf(pmd)) {
 		/*
 		 * No need to take pmd_lock here, even if some other thread
 		 * is splitting the huge pmd we will get that event through
@@ -362,7 +362,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		 * values.
 		 */
 		pmd = pmdp_get_lockless(pmdp);
-		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
+		if (!pmd_is_leaf(pmd))
 			goto again;
 
 		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
diff --git a/mm/huge_mapping_pmd.c b/mm/huge_mapping_pmd.c
index 7b85e2a564d6..d30c60685f66 100644
--- a/mm/huge_mapping_pmd.c
+++ b/mm/huge_mapping_pmd.c
@@ -60,8 +60,7 @@ spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 	spinlock_t *ptl;
 
 	ptl = pmd_lock(vma->vm_mm, pmd);
-	if (likely(is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) ||
-		   pmd_devmap(*pmd)))
+	if (likely(is_swap_pmd(*pmd) || pmd_is_leaf(*pmd)))
 		return ptl;
 	spin_unlock(ptl);
 	return NULL;
@@ -627,8 +626,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
-		  !pmd_devmap(*pmd));
+	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_is_leaf(*pmd));
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	count_vm_event(THP_SPLIT_PMD);
@@ -845,8 +843,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 	 * require a folio to check the PMD against. Otherwise, there
 	 * is a risk of replacing the wrong folio.
 	 */
-	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
-	    is_pmd_migration_entry(*pmd)) {
+	if (pmd_is_leaf(*pmd) || is_pmd_migration_entry(*pmd)) {
 		if (folio && folio != pmd_folio(*pmd))
 			return;
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
diff --git a/mm/huge_mapping_pud.c b/mm/huge_mapping_pud.c
index c3a6bffe2871..58871dd74df2 100644
--- a/mm/huge_mapping_pud.c
+++ b/mm/huge_mapping_pud.c
@@ -57,7 +57,7 @@ spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 	spinlock_t *ptl;
 
 	ptl = pud_lock(vma->vm_mm, pud);
-	if (likely(pud_trans_huge(*pud) || pud_devmap(*pud)))
+	if (likely(pud_is_leaf(*pud)))
 		return ptl;
 	spin_unlock(ptl);
 	return NULL;
@@ -90,7 +90,7 @@ int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 	ret = -EAGAIN;
 	pud = *src_pud;
-	if (unlikely(!pud_trans_huge(pud) && !pud_devmap(pud)))
+	if (unlikely(!pud_leaf(pud)))
 		goto out_unlock;
 
 	/*
@@ -225,7 +225,7 @@ void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 				(address & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	ptl = pud_lock(vma->vm_mm, pud);
-	if (unlikely(!pud_trans_huge(*pud) && !pud_devmap(*pud)))
+	if (unlikely(!pud_is_leaf(*pud)))
 		goto out;
 	__split_huge_pud_locked(vma, pud, range.start);
 
diff --git a/mm/mapping_dirty_helpers.c b/mm/mapping_dirty_helpers.c
index 2f8829b3541a..a9ea767d2d73 100644
--- a/mm/mapping_dirty_helpers.c
+++ b/mm/mapping_dirty_helpers.c
@@ -129,7 +129,7 @@ static int wp_clean_pmd_entry(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pmd_t pmdval = pmdp_get_lockless(pmd);
 
 	/* Do not split a huge pmd, present or migrated */
-	if (pmd_trans_huge(pmdval) || pmd_devmap(pmdval)) {
+	if (pmd_is_leaf(pmdval)) {
 		WARN_ON(pmd_write(pmdval) || pmd_dirty(pmdval));
 		walk->action = ACTION_CONTINUE;
 	}
@@ -152,7 +152,7 @@ static int wp_clean_pud_entry(pud_t *pud, unsigned long addr, unsigned long end,
 	pud_t pudval = READ_ONCE(*pud);
 
 	/* Do not split a huge pud */
-	if (pud_trans_huge(pudval) || pud_devmap(pudval)) {
+	if (pud_is_leaf(pudval)) {
 		WARN_ON(pud_write(pudval) || pud_dirty(pudval));
 		walk->action = ACTION_CONTINUE;
 	}
diff --git a/mm/memory.c b/mm/memory.c
index 126ee0903c79..6dc92c514bb7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1235,8 +1235,7 @@ copy_pmd_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	src_pmd = pmd_offset(src_pud, addr);
 	do {
 		next = pmd_addr_end(addr, end);
-		if (is_swap_pmd(*src_pmd) || pmd_trans_huge(*src_pmd)
-			|| pmd_devmap(*src_pmd)) {
+		if (is_swap_pmd(*src_pmd) || pmd_is_leaf(*src_pmd)) {
 			int err;
 			VM_BUG_ON_VMA(next-addr != HPAGE_PMD_SIZE, src_vma);
 			err = copy_huge_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
@@ -1272,7 +1271,7 @@ copy_pud_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	src_pud = pud_offset(src_p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
-		if (pud_trans_huge(*src_pud) || pud_devmap(*src_pud)) {
+		if (pud_is_leaf(*src_pud)) {
 			int err;
 
 			VM_BUG_ON_VMA(next-addr != HPAGE_PUD_SIZE, src_vma);
@@ -1710,7 +1709,7 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
 	pmd = pmd_offset(pud, addr);
 	do {
 		next = pmd_addr_end(addr, end);
-		if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd)) {
+		if (is_swap_pmd(*pmd) || pmd_is_leaf(*pmd)) {
 			if (next - addr != HPAGE_PMD_SIZE)
 				__split_huge_pmd(vma, pmd, addr, false, NULL);
 			else if (zap_huge_pmd(tlb, vma, pmd, addr)) {
@@ -1752,7 +1751,7 @@ static inline unsigned long zap_pud_range(struct mmu_gather *tlb,
 	pud = pud_offset(p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
-		if (pud_trans_huge(*pud) || pud_devmap(*pud)) {
+		if (pud_is_leaf(*pud)) {
 			if (next - addr != HPAGE_PUD_SIZE) {
 				mmap_assert_locked(tlb->mm);
 				split_huge_pud(vma, pud, addr);
@@ -5605,8 +5604,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		pud_t orig_pud = *vmf.pud;
 
 		barrier();
-		if (pud_trans_huge(orig_pud) || pud_devmap(orig_pud)) {
-
+		if (pud_is_leaf(orig_pud)) {
 			/*
 			 * TODO once we support anonymous PUDs: NUMA case and
 			 * FAULT_FLAG_UNSHARE handling.
@@ -5646,7 +5644,7 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
 		}
-		if (pmd_trans_huge(vmf.orig_pmd) || pmd_devmap(vmf.orig_pmd)) {
+		if (pmd_is_leaf(vmf.orig_pmd)) {
 			if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
 				return do_huge_pmd_numa_page(&vmf);
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 6d66dc1c6ffa..1fbeee9619c8 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -596,7 +596,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp) || pmd_devmap(*pmdp))
+	if (pmd_leaf(*pmdp))
 		goto abort;
 	if (pte_alloc(mm, pmdp))
 		goto abort;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 694f13b83864..ddfee216a02b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -381,7 +381,7 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
 			goto next;
 
 		_pmd = pmdp_get_lockless(pmd);
-		if (is_swap_pmd(_pmd) || pmd_trans_huge(_pmd) || pmd_devmap(_pmd)) {
+		if (is_swap_pmd(_pmd) || pmd_is_leaf(_pmd)) {
 			if ((next - addr != HPAGE_PMD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
 				__split_huge_pmd(vma, pmd, addr, false, NULL);
@@ -452,7 +452,7 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 			mmu_notifier_invalidate_range_start(&range);
 		}
 
-		if (pud_leaf(pud)) {
+		if (pud_is_leaf(pud)) {
 			if ((next - addr != PUD_SIZE) ||
 			    pgtable_split_needed(vma, cp_flags)) {
 				__split_huge_pud(vma, pudp, addr);
diff --git a/mm/mremap.c b/mm/mremap.c
index e7ae140fc640..f5c9884ea1f8 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -587,7 +587,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
 		if (!new_pud)
 			break;
-		if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
+		if (pud_is_leaf(*old_pud)) {
 			if (extent == HPAGE_PUD_SIZE) {
 				move_pgt_entry(HPAGE_PUD, vma, old_addr, new_addr,
 					       old_pud, new_pud, need_rmap_locks);
@@ -609,8 +609,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		if (!new_pmd)
 			break;
 again:
-		if (is_swap_pmd(*old_pmd) || pmd_trans_huge(*old_pmd) ||
-		    pmd_devmap(*old_pmd)) {
+		if (is_swap_pmd(*old_pmd) || pmd_is_leaf(*old_pmd)) {
 			if (extent == HPAGE_PMD_SIZE &&
 			    move_pgt_entry(HPAGE_PMD, vma, old_addr, new_addr,
 					   old_pmd, new_pmd, need_rmap_locks))
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa208..891bea8062d2 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -235,8 +235,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 		 */
 		pmde = pmdp_get_lockless(pvmw->pmd);
 
-		if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde) ||
-		    (pmd_present(pmde) && pmd_devmap(pmde))) {
+		if (pmd_is_leaf(pmde) || is_pmd_migration_entry(pmde)) {
 			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 			pmde = *pvmw->pmd;
 			if (!pmd_present(pmde)) {
@@ -251,7 +250,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 					return not_found(pvmw);
 				return true;
 			}
-			if (likely(pmd_trans_huge(pmde) || pmd_devmap(pmde))) {
+			if (likely(pmd_is_leaf(pmde))) {
 				if (pvmw->flags & PVMW_MIGRATION)
 					return not_found(pvmw);
 				if (!check_pmd(pmd_pfn(pmde), pvmw))
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index e9fc3f6774a6..c7b7a803f4ad 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -139,8 +139,7 @@ pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 {
 	pmd_t pmd;
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
-	VM_BUG_ON(pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
-			   !pmd_devmap(*pmdp));
+	VM_BUG_ON(pmd_present(*pmdp) && !pmd_leaf(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
 	return pmd;
@@ -247,7 +246,7 @@ pud_t pudp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 	pud_t pud;
 
 	VM_BUG_ON(address & ~HPAGE_PUD_MASK);
-	VM_BUG_ON(!pud_trans_huge(*pudp) && !pud_devmap(*pudp));
+	VM_BUG_ON(!pud_leaf(*pudp));
 	pud = pudp_huge_get_and_clear(vma->vm_mm, address, pudp);
 	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
 	return pud;
@@ -293,7 +292,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		*pmdvalp = pmdval;
 	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
 		goto nomap;
-	if (unlikely(pmd_trans_huge(pmdval) || pmd_devmap(pmdval)))
+	if (unlikely(pmd_leaf(pmdval)))
 		goto nomap;
 	if (unlikely(pmd_bad(pmdval))) {
 		pmd_clear_bad(pmd);
-- 
2.45.0


