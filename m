Return-Path: <sparclinux+bounces-232-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C80788405A7
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 13:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD802829F7
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 12:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E8A67E9B;
	Mon, 29 Jan 2024 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJ2fU9xx"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52967E8C
	for <sparclinux@vger.kernel.org>; Mon, 29 Jan 2024 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532506; cv=none; b=C5bqc+yBWD7ObVsOB5JQWPTPd1xupl4jKMYhXQs5DYyfgizsA0QPzfCmoUObsnC029ZQ2GoXitUzXc7Z8ujilUkEfYb2pNGHMojk4K0zK4qC0k3Uinec/pjFLhODbcqErvrQxdmdnU8HfkCPrHdDDQe1E83vD1VjHRaEpK4AKBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532506; c=relaxed/simple;
	bh=HqyS3uvSq9oyOXHSShmhRtcbYKCwhrCOyj2V83p6M5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSm3mRIAhT/PKFyCDuI/1UYhI+kRXUXJ6OlkHElRbPhozp1CUl73f5loL5ZcI3DRjU83d42IxHcO9j6hdlWeYMeuCBmD1maaLBdj00aLKdL6TXV0VHIJ0Wc00ViaqaKCJyBRdKx2+t1HRTIoMlQc3xDcHwGRuVV/gxzrHiG7MMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJ2fU9xx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exEdDlpMqX/TLP6WakzBspRTLcII6GNZP9MIcL4XseU=;
	b=UJ2fU9xx7cQu0se8ICmieeaAeHR5j2bVyeCVGnBVHQf8lBtJ2WiZLlNYAU0QGRGJRL4bdS
	v4C7nQcoDhqz4Orurfwnd22gc8O0NXI152IecrmfzRfPas9vIQR9SMFPWI8EGk2Qn6T0V3
	dXU8GzBqmqcQFitm6E4HDLR0PNfx7QM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-q1tX4gb6M5-rogvUSokYZw-1; Mon,
 29 Jan 2024 07:48:21 -0500
X-MC-Unique: q1tX4gb6M5-rogvUSokYZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A9C628B72E2;
	Mon, 29 Jan 2024 12:48:20 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9D738B;
	Mon, 29 Jan 2024 12:48:14 +0000 (UTC)
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
Subject: [PATCH v3 14/15] mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
Date: Mon, 29 Jan 2024 13:46:48 +0100
Message-ID: <20240129124649.189745-15-david@redhat.com>
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

Let's always ignore the accessed/young bit: we'll always mark the PTE
as old in our child process during fork, and upcoming users will
similarly not care.

Ignore the dirty bit only if we don't want to duplicate the dirty bit
into the child process during fork. Maybe, we could just set all PTEs
in the child dirty if any PTE is dirty. For now, let's keep the behavior
unchanged, this can be optimized later if required.

Ignore the soft-dirty bit only if the bit doesn't have any meaning in
the src vma, and similarly won't have any in the copied dst vma.

For now, we won't bother with the uffd-wp bit.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 86f8a0021c8e..b2ec2b6b54c7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -953,24 +953,44 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
 	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
 }
 
+/* Flags for folio_pte_batch(). */
+typedef int __bitwise fpb_t;
+
+/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
+#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
+
+/* Compare PTEs after pte_clear_soft_dirty(), ignoring the soft-dirty bit. */
+#define FPB_IGNORE_SOFT_DIRTY		((__force fpb_t)BIT(1))
+
+static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
+{
+	if (flags & FPB_IGNORE_DIRTY)
+		pte = pte_mkclean(pte);
+	if (likely(flags & FPB_IGNORE_SOFT_DIRTY))
+		pte = pte_clear_soft_dirty(pte);
+	return pte_mkold(pte);
+}
+
 /*
  * Detect a PTE batch: consecutive (present) PTEs that map consecutive
  * pages of the same folio.
  *
- * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
+ * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
+ * the accessed bit, dirty bit (with FPB_IGNORE_DIRTY) and soft-dirty bit
+ * (with FPB_IGNORE_SOFT_DIRTY).
  */
 static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr)
+		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags)
 {
 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
 	const pte_t *end_ptep = start_ptep + max_nr;
-	pte_t expected_pte = pte_next_pfn(pte);
+	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte), flags);
 	pte_t *ptep = start_ptep + 1;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 
 	while (ptep != end_ptep) {
-		pte = ptep_get(ptep);
+		pte = __pte_batch_clear_ignored(ptep_get(ptep), flags);
 
 		if (!pte_same(pte, expected_pte))
 			break;
@@ -1004,6 +1024,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 {
 	struct page *page;
 	struct folio *folio;
+	fpb_t flags = 0;
 	int err, nr;
 
 	page = vm_normal_page(src_vma, addr, pte);
@@ -1018,7 +1039,12 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	 * by keeping the batching logic separate.
 	 */
 	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
-		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
+		if (src_vma->vm_flags & VM_SHARED)
+			flags |= FPB_IGNORE_DIRTY;
+		if (!vma_soft_dirty_enabled(src_vma))
+			flags |= FPB_IGNORE_SOFT_DIRTY;
+
+		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags);
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
-- 
2.43.0


