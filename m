Return-Path: <sparclinux+bounces-229-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6D84059E
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 13:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EAD5B20A2E
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 12:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A2364CFE;
	Mon, 29 Jan 2024 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTTuNq45"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49864CFD
	for <sparclinux@vger.kernel.org>; Mon, 29 Jan 2024 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532494; cv=none; b=Ljxz13HYJwDWJJZR/ugXZiQaIAUCy8qPjJgLOLrlybiBZvcd+Ad998K+Gn6eCJyDKmaqU7SgMJf8BwYRAFfcKwBTRaOAW8jnq+e6LQ1+RryW9jcNy6EjKiCLIL4rWDW3Fluhhg7gkShCo62TaCV9aGd6vcF+jwnuXty0Xooj5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532494; c=relaxed/simple;
	bh=ByrEYHigCz/kRN5i/X/hP7nAwoCtSTm/annNcKKZ7M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iP92V6rN8OMTYrx/erK0SyjFSF56gKlRiZ3TfEx05edE+3TxC/LaOOBKkiTr3cFbu8zMopr6/g+89l3iDJpJO4p5VbPWp6gzApKc+xQ8zOXKTgjHiEZSjMkfba2biKdBtEBxwT4sKjhGb6tM1LtCe97MGvwEA9X9/DVMqxbUFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eTTuNq45; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7wzDgEVUWhg5ZER45HLd710ycKB3fz8RPuXE32SMZA=;
	b=eTTuNq45oW0kzAUAafl3DD1BkdZXNK1TRX5z3OXPM3GuHNPccMyX3DgxMt5bPTCiflAnYI
	r5BhSqJh+yoEMOibm1BzvzIgQmd/Y6AjFl1+vohmRLe7KeUH/+/FtdaMpbpdjXT3k3AnJi
	NdtWvjXpenouhavEnMC/LuQ9Zd55pbo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-9ly1pTIPMpeLAWW3OrQO1g-1; Mon,
 29 Jan 2024 07:48:04 -0500
X-MC-Unique: 9ly1pTIPMpeLAWW3OrQO1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD4A3CBD50E;
	Mon, 29 Jan 2024 12:48:03 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0D28B;
	Mon, 29 Jan 2024 12:47:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 11/15] mm/memory: factor out copying the actual PTE in copy_present_pte()
Date: Mon, 29 Jan 2024 13:46:45 +0100
Message-ID: <20240129124649.189745-12-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Let's prepare for further changes.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 63 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8d14ba440929..a3bdb25f4c8d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -930,6 +930,29 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	return 0;
 }
 
+static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
+		pte_t pte, unsigned long addr)
+{
+	struct mm_struct *src_mm = src_vma->vm_mm;
+
+	/* If it's a COW mapping, write protect it both processes. */
+	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
+		ptep_set_wrprotect(src_mm, addr, src_pte);
+		pte = pte_wrprotect(pte);
+	}
+
+	/* If it's a shared mapping, mark it clean in the child. */
+	if (src_vma->vm_flags & VM_SHARED)
+		pte = pte_mkclean(pte);
+	pte = pte_mkold(pte);
+
+	if (!userfaultfd_wp(dst_vma))
+		pte = pte_clear_uffd_wp(pte);
+
+	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
+}
+
 /*
  * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
  * is required to copy this pte.
@@ -939,23 +962,23 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
 		 struct folio **prealloc)
 {
-	struct mm_struct *src_mm = src_vma->vm_mm;
-	unsigned long vm_flags = src_vma->vm_flags;
 	pte_t pte = ptep_get(src_pte);
 	struct page *page;
 	struct folio *folio;
 
 	page = vm_normal_page(src_vma, addr, pte);
-	if (page)
-		folio = page_folio(page);
-	if (page && folio_test_anon(folio)) {
+	if (unlikely(!page))
+		goto copy_pte;
+
+	folio = page_folio(page);
+	folio_get(folio);
+	if (folio_test_anon(folio)) {
 		/*
 		 * If this page may have been pinned by the parent process,
 		 * copy the page immediately for the child so that we'll always
 		 * guarantee the pinned page won't be randomly replaced in the
 		 * future.
 		 */
-		folio_get(folio);
 		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
 			/* Page may be pinned, we have to copy. */
 			folio_put(folio);
@@ -963,34 +986,14 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 						 addr, rss, prealloc, page);
 		}
 		rss[MM_ANONPAGES]++;
-	} else if (page) {
-		folio_get(folio);
+		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
+	} else {
 		folio_dup_file_rmap_pte(folio, page);
 		rss[mm_counter_file(folio)]++;
 	}
 
-	/*
-	 * If it's a COW mapping, write protect it both
-	 * in the parent and the child
-	 */
-	if (is_cow_mapping(vm_flags) && pte_write(pte)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
-		pte = pte_wrprotect(pte);
-	}
-	VM_BUG_ON(page && folio_test_anon(folio) && PageAnonExclusive(page));
-
-	/*
-	 * If it's a shared mapping, mark it clean in
-	 * the child
-	 */
-	if (vm_flags & VM_SHARED)
-		pte = pte_mkclean(pte);
-	pte = pte_mkold(pte);
-
-	if (!userfaultfd_wp(dst_vma))
-		pte = pte_clear_uffd_wp(pte);
-
-	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
+copy_pte:
+	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
 	return 0;
 }
 
-- 
2.43.0


