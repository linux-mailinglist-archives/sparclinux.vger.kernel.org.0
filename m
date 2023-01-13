Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5344669FA8
	for <lists+sparclinux@lfdr.de>; Fri, 13 Jan 2023 18:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjAMRQK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 13 Jan 2023 12:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjAMROr (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 13 Jan 2023 12:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FC38B744
        for <sparclinux@vger.kernel.org>; Fri, 13 Jan 2023 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673629937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vL7N3yChGOYHwNR1EQW6+on7yuH1TSRlOudQuOuT5dI=;
        b=b4a5vkMFZlfbBzSONZDImNHIXoN3a7qphSG+D9bTl9TIvX49aCtyyxTmqlsfbg5QCsX416
        vhS4023HGEYzvx+PO0i/J3TvNxXMbddk9SZ0RtzcjqbFSVWmjBltKu5eob5c8bmMic3LeX
        viUptl5vjGAu9WNuKM9LrZYw6jzW+z8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-2wVVkEYXP9C4ufK13_TE1g-1; Fri, 13 Jan 2023 12:12:12 -0500
X-MC-Unique: 2wVVkEYXP9C4ufK13_TE1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B555F29AA39A;
        Fri, 13 Jan 2023 17:12:10 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5995440C2064;
        Fri, 13 Jan 2023 17:12:03 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        David Hildenbrand <david@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH mm-unstable v1 12/26] mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date:   Fri, 13 Jan 2023 18:10:12 +0100
Message-Id: <20230113171026.582290-13-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
References: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE.

On 64bit, steal one bit from the type. Generic MM currently only uses 5
bits for the type (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively
unused.

On 32bit we're able to locate unused bits. As the PTE layout for 32 bit
is very confusing, document it a bit better.

While at it, mask the type in __swp_entry()/mk_swap_pte().

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/include/asm/pgtable-32.h | 88 ++++++++++++++++++++++++++----
 arch/mips/include/asm/pgtable-64.h | 23 ++++++--
 arch/mips/include/asm/pgtable.h    | 36 ++++++++++++
 3 files changed, 131 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index b40a0e69fccc..ba0016709a1a 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -191,49 +191,113 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ */
 #if defined(CONFIG_CPU_R3K_TLB)
 
-/* Swap entries must have VALID bit cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------- offset ------------> < type -> V G E 0 0 0 0 0 0 P
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 10) & 0x1f)
 #define __swp_offset(x)			((x).val >> 15)
-#define __swp_entry(type,offset)	((swp_entry_t) { ((type) << 10) | ((offset) << 15) })
+#define __swp_entry(type, offset)	((swp_entry_t) { (((type) & 0x1f) << 10) | ((offset) << 15) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 7)
+
 #else
 
 #if defined(CONFIG_XPA)
 
-/* Swap entries must have VALID and GLOBAL bits cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   0 0 0 0 0 0 E P <------------------ zeroes ------------------->
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------------- offset ------------------> < type -> V G 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 4) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 9)
-#define __swp_entry(type,offset)	((swp_entry_t)  { ((type) << 4) | ((offset) << 9) })
+#define __swp_entry(type, offset)	((swp_entry_t)  { (((type) & 0x1f) << 4) | ((offset) << 9) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
+/*
+ * We borrow bit 57 (bit 25 in the low PTE) to store the exclusive marker in
+ * swap PTEs.
+ */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 25)
+
 #elif defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 
-/* Swap entries must have VALID and GLOBAL bits cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <------------------ zeroes -------------------> E P 0 0 0 0 0 0
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------------- offset --------------------> < type -> V G
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 2) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 7)
-#define __swp_entry(type, offset)	((swp_entry_t)  { ((type) << 2) | ((offset) << 7) })
+#define __swp_entry(type, offset)	((swp_entry_t)  { (((type) & 0x1f) << 2) | ((offset) << 7) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
+/*
+ * We borrow bit 39 (bit 7 in the low PTE) to store the exclusive marker in swap
+ * PTEs.
+ */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 7)
+
 #else
 /*
- * Constraints:
- *      _PAGE_PRESENT at bit 0
- *      _PAGE_MODIFIED at bit 4
- *      _PAGE_GLOBAL at bit 6
- *      _PAGE_VALID at bit 7
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------- offset --------------> < type -> 0 0 0 0 0 0 E P
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused. The location of V and G varies.
  */
 #define __swp_type(x)			(((x).val >> 8) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 13)
-#define __swp_entry(type,offset)	((swp_entry_t)	{ ((type) << 8) | ((offset) << 13) })
+#define __swp_entry(type, offset)	((swp_entry_t)	{ ((type) << 8) | ((offset) << 13) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+/* We borrow bit 1 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 1)
+
 #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32) */
 
 #endif /* defined(CONFIG_CPU_R3K_TLB) */
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index c6310192b654..98e24e3e7f2b 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -320,16 +320,31 @@ extern void pud_init(void *addr);
 extern void pmd_init(void *addr);
 
 /*
- * Non-present pages:  high 40 bits are offset, next 8 bits type,
- * low 16 bits zero.
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <--------------------------- offset ---------------------------
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   --------------> E <-- type ---> <---------- zeroes ----------->
+ *
+ *  E is the exclusive marker that is not stored in swap entries.
  */
 static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
-{ pte_t pte; pte_val(pte) = (type << 16) | (offset << 24); return pte; }
+{ pte_t pte; pte_val(pte) = ((type & 0x7f) << 16) | (offset << 24); return pte; }
 
-#define __swp_type(x)		(((x).val >> 16) & 0xff)
+#define __swp_type(x)		(((x).val >> 16) & 0x7f)
 #define __swp_offset(x)		((x).val >> 24)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((type), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 23)
+
 #endif /* _ASM_PGTABLE_64_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index a68c0b01d8cd..711874cee8e4 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -528,6 +528,42 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 }
 #endif
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte.pte_low |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte.pte_low &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+#else
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+#endif
 
 extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
 	pte_t pte);
-- 
2.39.0

