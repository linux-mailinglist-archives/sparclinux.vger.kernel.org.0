Return-Path: <sparclinux+bounces-3009-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3335EA05405
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jan 2025 08:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B270F1887642
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jan 2025 07:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D01AC891;
	Wed,  8 Jan 2025 07:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UwMWDmGP"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFA1AAE13
	for <sparclinux@vger.kernel.org>; Wed,  8 Jan 2025 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319760; cv=none; b=Cj+27ncv+NIs/N+hgWp/tWVp3fwGP9pe9HQND5Ow2Rne6Xir35Q2FxbTUFOd1Xf2c1zX2glnfD1ZZYYagJSMY0nsAq4D3IFVVTiA+/o65wEdZwNzAKeeuZbcjYS57RbHbzE85G5jFgayAeMYA3T7jHCQrfGC6RY9SQF4UeR5Ops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319760; c=relaxed/simple;
	bh=Kx0FsgNq46QBGZYoDJIY0xToNCyy11ntqe8BvR51hdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WznZm2I6EZqqDDnXDxRx+S6bC4E66VTak74E4IlXczyjuOv8PyEhnWL94g8zFuWjIp9Tb7fv3I0JfkIQIIk/bs0RgIN0ohqOnPB1nQLktErq+PMN/TYiqRV/vtqCccnPEL9ieHY3Wj4YaZhLUMqq/xbPkLfF9GdqyeVTYsqjgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UwMWDmGP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163bd70069so50543525ad.0
        for <sparclinux@vger.kernel.org>; Tue, 07 Jan 2025 23:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319757; x=1736924557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=UwMWDmGPRQyV0OPMr+JXUg8p94KGwNfE/gk3eQ2xe0hPBJYYBpIZUQYd/gvaM6nBdb
         fz1LW/ZqdT4Z1Qj/VklBy8eUQkhnfXhQMcLvZrXkJau51xQwoG3Zgge+9xRvzXcZ1N5K
         D8KGmNfhI9ZbIjqdqeNe3bGMBVHZ2T/YE+vsGFQQIZzPKoBvX+/EEb+Zv8qBeupm7oHE
         yFVwxVK+J9c5oqlj/RIr6VmPln3pac7G/qI8Fd0MzPvYdBTboPiiRKYH3H/UP9NROOWP
         R0s/iBYejwTIr43XmQTP5qn5XauQbh8Ktut2LOMexVEjKLUugB4DGNwJeBmLAgutGyzQ
         tOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319757; x=1736924557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=QttiXJP20MlEn+LkUvuHm7qayl2NAlmsA43R9fs4HFcRy8blm4CnfS4Y8GuF2/xCfG
         M3weDqTr50I6qykDu9hxtb1OY/IrJ+84xbLWjrnYB8IzRP9w7MMXY4BzrfDSgZfRfjNa
         UKpYxCZ5WBWc5vf5cnLX33RoG0Z5x8+YtG9WAIPdJxbAbTxulshx8eg9KtaQYIELme1P
         xqsbYqZ0Sh8vEkEGIzJMtWOJeJZuJOQC1k9ER6WCta8TDpRlx4rJKO8QlYUQUR0K1tgx
         nzKD8zBePoVUfW5p4n69TBbpPyyMwQ/xY+Gkbp5XwDZq6Z1cypGrpyaIxcD4PJUI1Aj1
         oumw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZ7zd+e1xkWWYyHg9V1PLtFg8qla4Ey1hKDrUw1pjYE1ZuMqy43c6mjk6/Rxu+p/0KjMXpGT2BlYY@vger.kernel.org
X-Gm-Message-State: AOJu0YwWV9j2zvZ1mwDDbX9zgyNkJ3Nb4oLuwgaZDht6yO+EtB5Oj2OQ
	N1sgnJ5Z6GQ/22z1MdUD0PqoWwLCbHv+J5bkvbFTV/7JLOKsyJSExJxUQNr8wYY=
X-Gm-Gg: ASbGnctYSS9qwjlj/2aa8RBHomfn26MeGYsPCATGyLIQs6++utmSa79iwGqxpiStFYp
	ct3naj98yY0OK8pK38apxQ0Kok/nqr+5vaUZ3PrSShGyHS8UM/J47lQIGXz4sBMvfPjw0/4Bjsz
	avCGiLzuZnE+WyK+5cf3JozhlYKuCtrb058faPRMdhA2zPlZkETfkIrMYpJwKc+s6JTGXpTbt/s
	3kgOhKjLBK+0LzIPFTFWfbuNOeOozZsw/uVYamERLNq0/G/gV5NwNfAylRi/wzzgvyMjIr0ucL/
	9POzj52szeG4sDJcQc3Y1TzRXQU=
X-Google-Smtp-Source: AGHT+IFBkkoQabtOk36FtfqYc8ZUQnhLYoik+Qreb3ophWoDY5tLIXttH+D63mfzQSCD0xoXOJPU5A==
X-Received: by 2002:a17:902:dac8:b0:215:773a:c168 with SMTP id d9443c01a7336-21a83f48cf9mr30903435ad.1.1736319757144;
        Tue, 07 Jan 2025 23:02:37 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:36 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 13/17] s390: pgtable: consolidate PxD and PTE TLB free paths
Date: Wed,  8 Jan 2025 14:57:29 +0800
Message-Id: <ac69360a5f3350ebb2f63cd14b7b45316a130ee4.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
freed - same as it is done for PTE tables. That allows consolidating
TLB free paths for all table types.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index dde847a5be545..d5b27a2445c96 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -102,7 +102,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -122,7 +121,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -141,7 +139,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 569de24d33761..c73b89811a264 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
+static void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
@@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-	struct page *page = ptdesc_page(ptdesc);
 
-	if (compound_order(page) == CRST_ALLOC_ORDER) {
-		/* pmd, pud, or p4d */
-		pagetable_free(ptdesc);
-		return;
-	}
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -211,7 +205,7 @@ static void pte_free_now(struct rcu_head *head)
 {
 	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
-- 
2.20.1


