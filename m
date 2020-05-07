Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261921C930C
	for <lists+sparclinux@lfdr.de>; Thu,  7 May 2020 17:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGPAS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 7 May 2020 11:00:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:4207 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgEGPAQ (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 7 May 2020 11:00:16 -0400
IronPort-SDR: EpzMgQJzEKFktUnOWBtWA+7dfNiMTfwJJ1U8pAEommdT02gdB87wKN+I1kjKNNmMzopL6W69Ek
 x9i+ap/9Psug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 08:00:13 -0700
IronPort-SDR: rItSlL4hsyBNkXMqNql+Ys5NswC+4JXGqRysaI2kTLNQAY2D5Loizqww6p54Idpm9iU3xvV6ff
 CCjw69mcPYbg==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; 
   d="scan'208";a="462168553"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 08:00:13 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH V3 05/15] {x86,powerpc,microblaze}/kmap: Move preempt disable
Date:   Thu,  7 May 2020 07:59:53 -0700
Message-Id: <20200507150004.1423069-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

During this kmap() conversion series we must maintain bisect-ability.
To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
remain functional.

Create a temporary inline version of kmap_atomic_prot within these
architectures so we can rework their kmap_atomic() calls and then lift
kmap_atomic_prot() to the core.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	Fix microblaze not being static inline

Changes from V1:
	New patch
---
 arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
 arch/microblaze/mm/highmem.c          | 10 ++--------
 arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
 arch/powerpc/mm/highmem.c             |  9 ++-------
 arch/x86/include/asm/highmem.h        | 11 ++++++++++-
 arch/x86/mm/highmem_32.c              | 10 ++--------
 6 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 0c94046f2d58..c38d920a1171 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
+extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+
+	return kmap_atomic_high_prot(page, prot);
+}
 extern void __kunmap_atomic(void *kvaddr);
 
 static inline void *kmap_atomic(struct page *page)
diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index d7569f77fa15..0e3efaa8a004 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -32,18 +32,12 @@
  */
 #include <asm/tlbflush.h>
 
-void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -55,7 +49,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 
 	return (void *) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_prot);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index ba3371977d49..d049806a8354 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -59,7 +59,16 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
+extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+
+	return kmap_atomic_high_prot(page, prot);
+}
 extern void __kunmap_atomic(void *kvaddr);
 
 static inline void *kmap_atomic(struct page *page)
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 320c1672b2ae..f075cef6d663 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -30,16 +30,11 @@
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -49,7 +44,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 
 	return (void*) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_prot);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index 90b96594d6c5..61f47fef40e5 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -58,7 +58,16 @@ extern unsigned long highstart_pfn, highend_pfn;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-void *kmap_atomic_prot(struct page *page, pgprot_t prot);
+extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+
+	return kmap_atomic_high_prot(page, prot);
+}
 void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index c4ebfd0ae401..48b56b1af902 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -12,17 +12,11 @@
  * However when holding an atomic kmap it is not legal to sleep, so atomic
  * kmaps are appropriate for short, tight code paths only.
  */
-void *kmap_atomic_prot(struct page *page, pgprot_t prot)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -32,7 +26,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_prot);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void *kmap_atomic(struct page *page)
 {
-- 
2.25.1

