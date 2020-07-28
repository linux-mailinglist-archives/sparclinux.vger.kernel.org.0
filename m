Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01264230179
	for <lists+sparclinux@lfdr.de>; Tue, 28 Jul 2020 07:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgG1FON (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 28 Jul 2020 01:14:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgG1FON (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 28 Jul 2020 01:14:13 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE1BB2177B;
        Tue, 28 Jul 2020 05:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595913252;
        bh=bF6u1b2xSJfR5LFcmr0wMIvbICUVRWRo3SVxT3/BRkA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zI6O4WxGRHtN69TBHy6P1q7jtlTY61K+2UeaGKxUPdpVjDPb59Zh5VVyy9qmeOtXI
         yD6PMQi5AAzFDxeV8MvEVlVNU9NQbubABmx0w898OV9szgIG4ym3AfVG9IIh1boSMa
         LlBz47EyMi2hkAVTdRGR5MxaWlSQegTXZTFeCqjw=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: [PATCH 12/15] arch, mm: replace for_each_memblock() with for_each_mem_pfn_range()
Date:   Tue, 28 Jul 2020 08:11:50 +0300
Message-Id: <20200728051153.1590-13-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

There are several occurrences of the following pattern:

	for_each_memblock(memory, reg) {
		start_pfn = memblock_region_memory_base_pfn(reg);
		end_pfn = memblock_region_memory_end_pfn(reg);

		/* do something with start_pfn and end_pfn */
	}

Rather than iterate over all memblock.memory regions and each time query
for their start and end PFNs, use for_each_mem_pfn_range() iterator to get
simpler and clearer code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm/mm/init.c           | 11 ++++-------
 arch/arm64/mm/init.c         | 11 ++++-------
 arch/powerpc/kernel/fadump.c | 11 ++++++-----
 arch/powerpc/mm/mem.c        | 15 ++++++++-------
 arch/powerpc/mm/numa.c       |  7 ++-----
 arch/s390/mm/page-states.c   |  6 ++----
 arch/sh/mm/init.c            |  9 +++------
 mm/memblock.c                |  6 ++----
 mm/sparse.c                  | 10 ++++------
 9 files changed, 35 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 626af348eb8f..bb56668b4f54 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -304,16 +304,14 @@ free_memmap(unsigned long start_pfn, unsigned long end_pfn)
  */
 static void __init free_unused_memmap(void)
 {
-	unsigned long start, prev_end = 0;
-	struct memblock_region *reg;
+	unsigned long start, end, prev_end = 0;
+	int i;
 
 	/*
 	 * This relies on each bank being in address order.
 	 * The banks are sorted previously in bootmem_init().
 	 */
-	for_each_memblock(memory, reg) {
-		start = memblock_region_memory_base_pfn(reg);
-
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start, &end, NULL) {
 #ifdef CONFIG_SPARSEMEM
 		/*
 		 * Take care not to free memmap entries that don't exist
@@ -341,8 +339,7 @@ static void __init free_unused_memmap(void)
 		 * memmap entries are valid from the bank end aligned to
 		 * MAX_ORDER_NR_PAGES.
 		 */
-		prev_end = ALIGN(memblock_region_memory_end_pfn(reg),
-				 MAX_ORDER_NR_PAGES);
+		prev_end = ALIGN(end, MAX_ORDER_NR_PAGES);
 	}
 
 #ifdef CONFIG_SPARSEMEM
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 1e93cfc7c47a..271a8ea32482 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -473,12 +473,10 @@ static inline void free_memmap(unsigned long start_pfn, unsigned long end_pfn)
  */
 static void __init free_unused_memmap(void)
 {
-	unsigned long start, prev_end = 0;
-	struct memblock_region *reg;
-
-	for_each_memblock(memory, reg) {
-		start = __phys_to_pfn(reg->base);
+	unsigned long start, end, prev_end = 0;
+	int i;
 
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start, &end, NULL) {
 #ifdef CONFIG_SPARSEMEM
 		/*
 		 * Take care not to free memmap entries that don't exist due
@@ -498,8 +496,7 @@ static void __init free_unused_memmap(void)
 		 * memmap entries are valid from the bank end aligned to
 		 * MAX_ORDER_NR_PAGES.
 		 */
-		prev_end = ALIGN(__phys_to_pfn(reg->base + reg->size),
-				 MAX_ORDER_NR_PAGES);
+		prev_end = ALIGN(end, MAX_ORDER_NR_PAGES);
 	}
 
 #ifdef CONFIG_SPARSEMEM
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 2446a61e3c25..fdbafe417139 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1216,14 +1216,15 @@ static void fadump_free_reserved_memory(unsigned long start_pfn,
  */
 static void fadump_release_reserved_area(u64 start, u64 end)
 {
-	u64 tstart, tend, spfn, epfn;
-	struct memblock_region *reg;
+	u64 tstart, tend, spfn, epfn, reg_spfn, reg_epfn, i;
 
 	spfn = PHYS_PFN(start);
 	epfn = PHYS_PFN(end);
-	for_each_memblock(memory, reg) {
-		tstart = max_t(u64, spfn, memblock_region_memory_base_pfn(reg));
-		tend   = min_t(u64, epfn, memblock_region_memory_end_pfn(reg));
+
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &reg_spfn, &reg_epfn, NULL) {
+		tstart = max_t(u64, spfn, reg_spfn);
+		tend   = min_t(u64, epfn, reg_epfn);
+
 		if (tstart < tend) {
 			fadump_free_reserved_memory(tstart, tend);
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..38d1acd7c8ef 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -192,15 +192,16 @@ void __init initmem_init(void)
 /* mark pages that don't exist as nosave */
 static int __init mark_nonram_nosave(void)
 {
-	struct memblock_region *reg, *prev = NULL;
+	unsigned long spfn, epfn, prev = 0;
+	int i;
 
-	for_each_memblock(memory, reg) {
-		if (prev &&
-		    memblock_region_memory_end_pfn(prev) < memblock_region_memory_base_pfn(reg))
-			register_nosave_region(memblock_region_memory_end_pfn(prev),
-					       memblock_region_memory_base_pfn(reg));
-		prev = reg;
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &spfn, &epfn, NULL) {
+		if (prev && prev < spfn)
+			register_nosave_region(prev, spfn);
+
+		prev = epfn;
 	}
+
 	return 0;
 }
 #else /* CONFIG_NEED_MULTIPLE_NODES */
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..53254afae725 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -800,17 +800,14 @@ static void __init setup_nonnuma(void)
 	unsigned long total_ram = memblock_phys_mem_size();
 	unsigned long start_pfn, end_pfn;
 	unsigned int nid = 0;
-	struct memblock_region *reg;
+	int i;
 
 	printk(KERN_DEBUG "Top of RAM: 0x%lx, Total RAM: 0x%lx\n",
 	       top_of_ram, total_ram);
 	printk(KERN_DEBUG "Memory hole size: %ldMB\n",
 	       (top_of_ram - total_ram) >> 20);
 
-	for_each_memblock(memory, reg) {
-		start_pfn = memblock_region_memory_base_pfn(reg);
-		end_pfn = memblock_region_memory_end_pfn(reg);
-
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start_pfn, &end_pfn, NULL) {
 		fake_numa_create_new_node(end_pfn, &nid);
 		memblock_set_node(PFN_PHYS(start_pfn),
 				  PFN_PHYS(end_pfn - start_pfn),
diff --git a/arch/s390/mm/page-states.c b/arch/s390/mm/page-states.c
index fc141893d028..8909f7b7b053 100644
--- a/arch/s390/mm/page-states.c
+++ b/arch/s390/mm/page-states.c
@@ -183,9 +183,9 @@ static void mark_kernel_pgd(void)
 
 void __init cmma_init_nodat(void)
 {
-	struct memblock_region *reg;
 	struct page *page;
 	unsigned long start, end, ix;
+	int i;
 
 	if (cmma_flag < 2)
 		return;
@@ -193,9 +193,7 @@ void __init cmma_init_nodat(void)
 	mark_kernel_pgd();
 
 	/* Set all kernel pages not used for page tables to stable/no-dat */
-	for_each_memblock(memory, reg) {
-		start = memblock_region_memory_base_pfn(reg);
-		end = memblock_region_memory_end_pfn(reg);
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start, &end, NULL) {
 		page = pfn_to_page(start);
 		for (ix = start; ix < end; ix++, page++) {
 			if (__test_and_clear_bit(PG_arch_1, &page->flags))
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 62b8f03ffc80..398ee363e3e3 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -224,15 +224,12 @@ void __init allocate_pgdat(unsigned int nid)
 
 static void __init do_init_bootmem(void)
 {
-	struct memblock_region *reg;
+	unsigned long start_pfn, end_pfn;
+	int i;
 
 	/* Add active regions with valid PFNs. */
-	for_each_memblock(memory, reg) {
-		unsigned long start_pfn, end_pfn;
-		start_pfn = memblock_region_memory_base_pfn(reg);
-		end_pfn = memblock_region_memory_end_pfn(reg);
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start_pfn, &end_pfn, NULL)
 		__add_active_range(0, start_pfn, end_pfn);
-	}
 
 	/* All of system RAM sits in node 0 for the non-NUMA case */
 	allocate_pgdat(0);
diff --git a/mm/memblock.c b/mm/memblock.c
index 824938849f6d..2ad5e6e47215 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1659,12 +1659,10 @@ phys_addr_t __init_memblock memblock_reserved_size(void)
 phys_addr_t __init memblock_mem_size(unsigned long limit_pfn)
 {
 	unsigned long pages = 0;
-	struct memblock_region *r;
 	unsigned long start_pfn, end_pfn;
+	int i;
 
-	for_each_memblock(memory, r) {
-		start_pfn = memblock_region_memory_base_pfn(r);
-		end_pfn = memblock_region_memory_end_pfn(r);
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start_pfn, &end_pfn, NULL) {
 		start_pfn = min_t(unsigned long, start_pfn, limit_pfn);
 		end_pfn = min_t(unsigned long, end_pfn, limit_pfn);
 		pages += end_pfn - start_pfn;
diff --git a/mm/sparse.c b/mm/sparse.c
index b2b9a3e34696..8bdaddb40453 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -292,13 +292,11 @@ void __init memory_present(int nid, unsigned long start, unsigned long end)
  */
 void __init memblocks_present(void)
 {
-	struct memblock_region *reg;
+	unsigned long start, end;
+	int i, nid;
 
-	for_each_memblock(memory, reg) {
-		memory_present(memblock_get_region_node(reg),
-			       memblock_region_memory_base_pfn(reg),
-			       memblock_region_memory_end_pfn(reg));
-	}
+	for_each_mem_pfn_range(i, NUMA_NO_NODE, &start, &end, &nid)
+		memory_present(nid, start, end);
 }
 
 /*
-- 
2.26.2

