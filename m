Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFB629F12B
	for <lists+sparclinux@lfdr.de>; Thu, 29 Oct 2020 17:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgJ2QTl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 29 Oct 2020 12:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgJ2QTk (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 29 Oct 2020 12:19:40 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E196F20838;
        Thu, 29 Oct 2020 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603988379;
        bh=vBwurL4/Q9Hcp/7WaGQxkN1fGezdnq9akegXwjuyoXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iu1hGk5C+9KA0JuAZ9aELW2NgTQCTT7LskLXiHWtTRA4uwcYlzt218pXb7cTVqj74
         KFZPwNQijSQWol2FX9/4R0GtrYmSusx0ENyOCULN4uaa8YmjU2rVFqr972RKvBVtH4
         Js2pTF9s8Furil7Hm6afgBC8x7fq0sZqHqhgpjgc=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Christoph Lameter <cl@linux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        David Rientjes <rientjes@google.com>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Len Brown <len.brown@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>, Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-pm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        x86@kernel.org
Subject: [PATCH v2 1/4] mm: introduce debug_pagealloc_map_pages() helper
Date:   Thu, 29 Oct 2020 18:18:59 +0200
Message-Id: <20201029161902.19272-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029161902.19272-1-rppt@kernel.org>
References: <20201029161902.19272-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the kernel
direct mapping after free_pages(). The pages than need to be mapped back
before they could be used. Theese mapping operations use
__kernel_map_pages() guarded with with debug_pagealloc_enabled().

The only place that calls __kernel_map_pages() without checking whether
DEBUG_PAGEALLOC is enabled is the hibernation code that presumes
availability of this function when ARCH_HAS_SET_DIRECT_MAP is set.
Still, on arm64, __kernel_map_pages() will bail out when DEBUG_PAGEALLOC is
not enabled but set_direct_map_invalid_noflush() may render some pages not
present in the direct map and hibernation code won't be able to save such
pages.

To make page allocation debugging and hibernation interaction more robust,
the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP has to be made
more explicit.

Start with combining the guard condition and the call to
__kernel_map_pages() into a single debug_pagealloc_map_pages() function to
emphasize that __kernel_map_pages() should not be called without
DEBUG_PAGEALLOC and use this new function to map/unmap pages when page
allocation debug is enabled.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h  | 10 ++++++++++
 mm/memory_hotplug.c |  3 +--
 mm/page_alloc.c     |  6 ++----
 mm/slab.c           |  8 +++-----
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef360fe70aaf..1fc0609056dc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2936,12 +2936,22 @@ kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	__kernel_map_pages(page, numpages, enable);
 }
+
+static inline void debug_pagealloc_map_pages(struct page *page,
+					     int numpages, int enable)
+{
+	if (debug_pagealloc_enabled_static())
+		__kernel_map_pages(page, numpages, enable);
+}
+
 #ifdef CONFIG_HIBERNATION
 extern bool kernel_page_present(struct page *page);
 #endif	/* CONFIG_HIBERNATION */
 #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 static inline void
 kernel_map_pages(struct page *page, int numpages, int enable) {}
+static inline void debug_pagealloc_map_pages(struct page *page,
+					     int numpages, int enable) {}
 #ifdef CONFIG_HIBERNATION
 static inline bool kernel_page_present(struct page *page) { return true; }
 #endif	/* CONFIG_HIBERNATION */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b44d4c7ba73b..e2b6043a4428 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -614,8 +614,7 @@ void generic_online_page(struct page *page, unsigned int order)
 	 * so we should map it first. This is better than introducing a special
 	 * case in page freeing fast path.
 	 */
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 1);
+	debug_pagealloc_map_pages(page, 1 << order, 1);
 	__free_pages_core(page, order);
 	totalram_pages_add(1UL << order);
 #ifdef CONFIG_HIGHMEM
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 23f5066bd4a5..9a66a1ff9193 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1272,8 +1272,7 @@ static __always_inline bool free_pages_prepare(struct page *page,
 	 */
 	arch_free_page(page, order);
 
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 0);
+	debug_pagealloc_map_pages(page, 1 << order, 0);
 
 	kasan_free_nondeferred_pages(page, order);
 
@@ -2270,8 +2269,7 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 	set_page_refcounted(page);
 
 	arch_alloc_page(page, order);
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 1);
+	debug_pagealloc_map_pages(page, 1 << order, 1);
 	kasan_alloc_pages(page, order);
 	kernel_poison_pages(page, 1 << order, 1);
 	set_page_owner(page, order, gfp_flags);
diff --git a/mm/slab.c b/mm/slab.c
index b1113561b98b..340db0ce74c4 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -1431,10 +1431,8 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
 {
-	if (!is_debug_pagealloc_cache(cachep))
-		return;
-
-	kernel_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE, map);
+	debug_pagealloc_map_pages(virt_to_page(objp),
+				  cachep->size / PAGE_SIZE, map);
 }
 
 #else
@@ -2062,7 +2060,7 @@ int __kmem_cache_create(struct kmem_cache *cachep, slab_flags_t flags)
 
 #if DEBUG
 	/*
-	 * If we're going to use the generic kernel_map_pages()
+	 * If we're going to use the generic debug_pagealloc_map_pages()
 	 * poisoning, then it's going to smash the contents of
 	 * the redzone and userword anyhow, so switch them off.
 	 */
-- 
2.28.0

