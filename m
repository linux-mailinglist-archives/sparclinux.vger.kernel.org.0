Return-Path: <sparclinux+bounces-2999-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21681A0539E
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jan 2025 08:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062BA1660C5
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jan 2025 07:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439AA1AAA1F;
	Wed,  8 Jan 2025 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PwL4L98R"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628E1AA7AE
	for <sparclinux@vger.kernel.org>; Wed,  8 Jan 2025 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319614; cv=none; b=sU4Xm2wHITxZMg0hbXtlSU4+W7ITygTwKhAgUgVmf+5DS9L4o1U/CRohPJ76KUWQnD03nfCsi+gb/f1dhbMUmLsY9/PK9iNucJpgu24jix1Sfy/J7Qu9wB0ciolfUra7RTtk9n5sFIVLfoMi05tYtuh32k/9bkrDFlQ5sn5uiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319614; c=relaxed/simple;
	bh=VQrwZRR3rAwbwOGD5AjoKk2Z15695i3scVkWYvbG/zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kBrHSRargglxD2KSkWUbkklmuuV2BY7GAKoQowicMM15YlwOhsrHBV6Dj4xyfNDBDUizO3noLYwRoO4fXsii3omSqYtjc7UPJFowzCN5g0Snt1P1tRXAqyjAIZeDPl8E+IvrzhEOJc52cc7T7MJjg0jQ9tlCuhyLlNW59QLelXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PwL4L98R; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso829787a91.1
        for <sparclinux@vger.kernel.org>; Tue, 07 Jan 2025 23:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319601; x=1736924401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi4+N7L/R07Fq6g8WRpMxop4cD3t01a1BHl7awbkQjI=;
        b=PwL4L98Rbmpe1X6rM/dgxkxd+0TIxSikkfeVs12QRoRGeMcU8es8p7YfDdHNl+b7a6
         k8bWiuo+jVC/JQwWbmDXAqm4yE6c61Q3aQ/nV81QlS+rl8uDZhI6Z+4hVP2oOjuxrRuV
         e2rKXwb2YKeeXfZkH37z5Z8VSzi80cOwt2dFim2CZ5o9aW0mhRS9K2ZS6uahokb/qNOb
         Crktu7QOEHRgYg9uAyn1RgYokeIt5EfKmpl0Aq+Iy13QG8MDbdQ6NRDXoS9du09CGR2G
         q6Bbk+EZScLOY4ri/jl7GYCPE+XWdQXXayaZNnYGWsdgbUwjOUKZ3AYYX6oGagpOyzs+
         nbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319601; x=1736924401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hi4+N7L/R07Fq6g8WRpMxop4cD3t01a1BHl7awbkQjI=;
        b=vG7tUVSx3FjgJf7z8e2saRWlVufr4Bf24pquxWwaRYCEAvIEf+ZV+cQtQEkL/QxKmg
         lpyAX6QQY9Vahp2sOB7ODot2N/a6XU/nLDCvJCejOUYo88H2wbRZazRJ/BMYtkp7TseC
         MFofwAeaZzseG4VcD0nocUcaQuqTwmDrZmvvPZRk5qvaNciNOFFrUJiNcylmoFqaLr5O
         q8tQfEzEoWXOVXog+4GtInfu5xzwzUak5PQscN88DxUqs2vfb29fgL+nh6uSkLp4I1az
         gA5rY0/CkU0+GtiEvdHSAZgI2ToJdvjwMQ12xjBBVA67TNXBIJ8BcjFk1/LTANKPtq6l
         XKEA==
X-Forwarded-Encrypted: i=1; AJvYcCVDkxMu7/h0Pz6Ma/4kSvNIJoRWQvJoMztIsABOsc8qGt6tnu9cGeJ8MMirn0olMnzmeursq0GoxHb5@vger.kernel.org
X-Gm-Message-State: AOJu0YwZtrC9TB3o6ndRkxKFdKptKDVcjTnVa/W0gh4948GRJNtMni40
	JfuQkY6p+Bau2FGfqiQoQnXJgZNToZ8Gn3wouSd6CR3PW+FKEHp7/I0ue8Fr2js=
X-Gm-Gg: ASbGncsICAM7TQl9H4FWuNYiBF3TdFM/RWZsmOpCdOKC/mQ0cgWu/I5KUchpTDQXMFj
	6HUnenSOSp+ip3ZFqhKFrlIFZskw3PXPjeu5EJoPUI6V9CqBeVuXm81EtWbYaSbYAyWxJrE9em3
	sfjfYwDdkWDXHsiiX1Z7+wZzTgsuoySbKobtkvntkZF+Vd1D9VOdAgPkkLd5OBD0x7/OpoeMMdq
	MLIcL465FEs3v6W53JgPZ+uR/HVrl2gVd8fJH/BPajB96p66IkfRfkX86vi49t1r5i5TDVc/rky
	jzPMv67KDg8y5aWBZU/gqplDngw=
X-Google-Smtp-Source: AGHT+IGjcc9iZhJOiA9Wc8tHUVktzF7/LrG3apZd5+oOKb6c7hgnTezIflh22cvX8oiOIwiosByWAA==
X-Received: by 2002:a17:90b:4d09:b0:2ef:2980:4411 with SMTP id 98e67ed59e1d1-2f53cbd9b2fmr9342892a91.9.1736319601534;
        Tue, 07 Jan 2025 23:00:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:01 -0800 (PST)
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
Subject: [PATCH v5 03/17] asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}
Date: Wed,  8 Jan 2025 14:57:19 +0800
Message-Id: <26d69c74a29183ecc335b9b407040d8e4cd70c6a.1736317725.git.zhengqi.arch@bytedance.com>
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

From: Kevin Brodsky <kevin.brodsky@arm.com>

Four architectures currently implement 5-level pgtables: arm64,
riscv, x86 and s390. The first three have essentially the same
implementation for p4d_alloc_one() and p4d_free(), so we've got an
opportunity to reduce duplication like at the lower levels.

Provide a generic version of p4d_alloc_one() and p4d_free(), and
make use of it on those architectures.

Their implementation is the same as at PUD level, except that
p4d_free() performs a runtime check by calling mm_p4d_folded().
5-level pgtables depend on a runtime-detected hardware feature on
all supported architectures, so we might as well include this check
in the generic implementation. No runtime check is required in
p4d_alloc_one() as the top-level p4d_alloc() already does the
required check.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/arm64/include/asm/pgalloc.h | 17 ------------
 arch/riscv/include/asm/pgalloc.h | 23 ----------------
 arch/x86/include/asm/pgalloc.h   | 18 -------------
 include/asm-generic/pgalloc.h    | 45 ++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index e75422864d1bd..2965f5a7e39e3 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,23 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	gfp_t gfp = GFP_PGTABLE_USER;
-
-	if (mm == &init_mm)
-		gfp = GFP_PGTABLE_KERNEL;
-	return (p4d_t *)get_zeroed_page(gfp);
-}
-
-static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
-{
-	if (!pgtable_l5_enabled())
-		return;
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	free_page((unsigned long)p4d);
-}
-
 #define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 8ad0bbe838a24..551d614d3369c 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -105,29 +105,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 	}
 }
 
-#define p4d_alloc_one p4d_alloc_one
-static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	gfp_t gfp = GFP_PGTABLE_USER;
-
-	if (mm == &init_mm)
-		gfp = GFP_PGTABLE_KERNEL;
-	return (p4d_t *)get_zeroed_page(gfp);
-}
-
-static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-{
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	free_page((unsigned long)p4d);
-}
-
-#define p4d_free p4d_free
-static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
-{
-	if (pgtable_l5_enabled)
-		__p4d_free(mm, p4d);
-}
-
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index dcd836b59bebd..dd4841231bb9f 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -147,24 +147,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4
 	set_pgd_safe(pgd, __pgd(_PAGE_TABLE | __pa(p4d)));
 }
 
-static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	gfp_t gfp = GFP_KERNEL_ACCOUNT;
-
-	if (mm == &init_mm)
-		gfp &= ~__GFP_ACCOUNT;
-	return (p4d_t *)get_zeroed_page(gfp);
-}
-
-static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
-{
-	if (!pgtable_l5_enabled())
-		return;
-
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	free_page((unsigned long)p4d);
-}
-
 extern void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d);
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 7c48f5fbf8aa7..59131629ac9cc 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -215,6 +215,51 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 
 #endif /* CONFIG_PGTABLE_LEVELS > 3 */
 
+#if CONFIG_PGTABLE_LEVELS > 4
+
+static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
+{
+	gfp_t gfp = GFP_PGTABLE_USER;
+	struct ptdesc *ptdesc;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	gfp &= ~__GFP_HIGHMEM;
+
+	ptdesc = pagetable_alloc_noprof(gfp, 0);
+	if (!ptdesc)
+		return NULL;
+
+	return ptdesc_address(ptdesc);
+}
+#define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
+
+#ifndef __HAVE_ARCH_P4D_ALLOC_ONE
+static inline p4d_t *p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
+{
+	return __p4d_alloc_one_noprof(mm, addr);
+}
+#define p4d_alloc_one(...)	alloc_hooks(p4d_alloc_one_noprof(__VA_ARGS__))
+#endif
+
+static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	pagetable_free(ptdesc);
+}
+
+#ifndef __HAVE_ARCH_P4D_FREE
+static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
+{
+	if (!mm_p4d_folded(mm))
+		__p4d_free(mm, p4d);
+}
+#endif
+
+#endif /* CONFIG_PGTABLE_LEVELS > 4 */
+
 #ifndef __HAVE_ARCH_PGD_FREE
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-- 
2.20.1


