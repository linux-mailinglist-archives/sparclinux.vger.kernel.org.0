Return-Path: <sparclinux+bounces-233-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7D8405A9
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 13:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61841F242FD
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647E657A3;
	Mon, 29 Jan 2024 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Py/5mOn6"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143CC651B4
	for <sparclinux@vger.kernel.org>; Mon, 29 Jan 2024 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532511; cv=none; b=pon2YKYrrvAS+q48AtbTU6rLJpQ2OX7xiXt4QnQCXelisPVoOxUEJON3dV3W5vZG67tlFFY7IXLzX2JMV6xGW2b1DOoy5rhNZD9OeYnebGEeaJhRznsuTck8fAdNdEaCltEJs1dZub36t6TDaXSnUjhLBWROB/D2JETL0rnpmyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532511; c=relaxed/simple;
	bh=WijXHNN6cEbo4+hvn2lkZ0k2/r3mW8vSMOQ+qEBDy2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/xdsWiW0PaTvNu1307uMJ2zLF1FyZZrG36g/+azOMRGCyNADrGm2fa1V7M9CJfaj2IXsCud222/u/zWWz3VTwHkwmUcOsYOQK7yRiHAb9MC32fg+9KiT2K18euBYPn0OH6YlHyem5EtGqq7DmA5UKzV1wLmPTxo59+9ansOzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Py/5mOn6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPofd6LlL0FntZsVxpMLUzci6vAQKc1aG/cPn5S11O0=;
	b=Py/5mOn6CqLPZzDd986sLZJNMTxa4gOV1o6XPJxqPdETgRq6BUVCFgo9K+K1QKZDjXB/RR
	z+YnbWm/uG6AikPZzdI5DmLzAi2AklHOaWH7qWKz+fNd4fTnOf5BgYp9jEz5+bkzuMbnes
	FkcEfcenchM3TQoNq/vdD7J9Jux74Mk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-PehoyRVrMfeAXOFdLIlxVA-1; Mon, 29 Jan 2024 07:48:26 -0500
X-MC-Unique: PehoyRVrMfeAXOFdLIlxVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898A186F129;
	Mon, 29 Jan 2024 12:48:25 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CC6D8B;
	Mon, 29 Jan 2024 12:48:20 +0000 (UTC)
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
Subject: [PATCH v3 15/15] mm/memory: ignore writable bit in folio_pte_batch()
Date: Mon, 29 Jan 2024 13:46:49 +0100
Message-ID: <20240129124649.189745-16-david@redhat.com>
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

... and conditionally return to the caller if any PTE except the first one
is writable. fork() has to make sure to properly write-protect in case any
PTE is writable. Other users (e.g., page unmaping) are expected to not
care.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b2ec2b6b54c7..b05fd28dbce1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -968,7 +968,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 		pte = pte_mkclean(pte);
 	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
 		pte = pte_clear_soft_dirty(pte);
-	return pte_mkold(pte);
+	return pte_wrprotect(pte_mkold(pte));
 }
 
 /*
@@ -976,21 +976,32 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * pages of the same folio.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
- * the accessed bit, dirty bit (with FPB_IGNORE_DIRTY) and soft-dirty bit
- * (with FPB_IGNORE_SOFT_DIRTY).
+ * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
+ * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
+ *
+ * If "any_writable" is set, it will indicate if any other PTE besides the
+ * first (given) PTE is writable.
  */
 static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags)
+		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
+		bool *any_writable)
 {
 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
 	const pte_t *end_ptep = start_ptep + max_nr;
 	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte), flags);
 	pte_t *ptep = start_ptep + 1;
+	bool writable;
+
+	if (any_writable)
+		*any_writable = false;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 
 	while (ptep != end_ptep) {
-		pte = __pte_batch_clear_ignored(ptep_get(ptep), flags);
+		pte = ptep_get(ptep);
+		if (any_writable)
+			writable = !!pte_write(pte);
+		pte = __pte_batch_clear_ignored(pte, flags);
 
 		if (!pte_same(pte, expected_pte))
 			break;
@@ -1003,6 +1014,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		if (pte_pfn(pte) == folio_end_pfn)
 			break;
 
+		if (any_writable)
+			*any_writable |= writable;
+
 		expected_pte = pte_next_pfn(expected_pte);
 		ptep++;
 	}
@@ -1024,6 +1038,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 {
 	struct page *page;
 	struct folio *folio;
+	bool any_writable;
 	fpb_t flags = 0;
 	int err, nr;
 
@@ -1044,7 +1059,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		if (!vma_soft_dirty_enabled(src_vma))
 			flags |= FPB_IGNORE_SOFT_DIRTY;
 
-		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags);
+		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
+				     &any_writable);
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
@@ -1058,6 +1074,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 			folio_dup_file_rmap_ptes(folio, page, nr);
 			rss[mm_counter_file(folio)] += nr;
 		}
+		if (any_writable)
+			pte = pte_mkwrite(pte, src_vma);
 		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
 				    addr, nr);
 		return nr;
-- 
2.43.0


