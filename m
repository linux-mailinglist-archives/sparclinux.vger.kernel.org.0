Return-Path: <sparclinux+bounces-2869-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E799FAC41
	for <lists+sparclinux@lfdr.de>; Mon, 23 Dec 2024 10:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD70718823BD
	for <lists+sparclinux@lfdr.de>; Mon, 23 Dec 2024 09:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8C1192D68;
	Mon, 23 Dec 2024 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JPUmuaOP"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11D192B6D
	for <sparclinux@vger.kernel.org>; Mon, 23 Dec 2024 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947023; cv=none; b=UkOXw55N6gaMSs+mYQjBz1ygTYfZ7lBqSZAhCxjhhcDZ2vsEULTA0lWnjtGEggZraUJfjuGsFOkaNL+CfQl/5XCXsiTVA9yx1vkLguxdvRsX2AMvcMZP38Bc3yzf27K4U3uUj2wSwUkzd4NrHk16Tl821LTQrB2Kz9Bp3AcrEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947023; c=relaxed/simple;
	bh=VQrwZRR3rAwbwOGD5AjoKk2Z15695i3scVkWYvbG/zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lAKddvMzGHQ/ajrWRr0GKdoqdGQY+Vd4rk99nAe9oThl573DgvyUikaf290capVrBK8CQc8vARTSzVkvZmFuYhPFSe9/FZSPqY8KsGwhIzrB/n0GpZNHozo7aUSVHGzQgmXKHFc5btyVvu03AF2otg0GGASNnM101ACkNhVz7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JPUmuaOP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7292a83264eso3434621b3a.0
        for <sparclinux@vger.kernel.org>; Mon, 23 Dec 2024 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947021; x=1735551821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi4+N7L/R07Fq6g8WRpMxop4cD3t01a1BHl7awbkQjI=;
        b=JPUmuaOPuA4moEtR3+nkJAAS+UWaHQmu8+3/UVFPRQoDUa+aAB6ZPcBzTcHrdKjHQg
         eXTGAKDwiH8eLobHFSfjz2QegBQbj+1Hq9P8k+xW6btmrBNWchhurTRgXDkNVlOs3tDR
         nDqYSAJ/RQ7c6WJUQ/kM/TMl9uqlaB4CMQWBVDfKZdOLoRpLf3MpOGCUM2YnIM6flr/I
         XtJx0aXH5OWx7mNyq/AvlHUMO5iGkbAqihzPbbTFSSEEfcb7zDo3lzKpoW5/CAEImlsu
         cAf8YDW8S/ropBXYs+qTaHz2Apc8pdwRpDJw91YMy33glp3QSuPjrf/QtiWGe6Kl0qO8
         4xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947021; x=1735551821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hi4+N7L/R07Fq6g8WRpMxop4cD3t01a1BHl7awbkQjI=;
        b=OsQy7QUEtcIgSr0bbMrj+vsG2q6VjcCpamuNiwkZu1JCa4sGmHFq4lOIHSUPBsl2Q/
         RC2xgyKPuRet+KQ5qvy6eFS52z9iK7ejYQDsd95EWev8c/kEDPgn1knv7WROuBJsJnQN
         oVK6o4qImO9Ya6hSWrumH6NGqE0lXtYJVUuM4fSuyxMRJV27cqkhROPnF10XPgnjuW+u
         hAv0OKBp+UzpZnmezhP2u4rJ/OL+HQQQSE2gZ1ZQNhcSpbP1U3s1gyuL+pPoxfyn9V62
         k0l0rTjEEkmnitHZ2xHFpMAK07hl8h0DaLyLImuMhlad9OqAYLhsTq1Ch9IWoX6z7URP
         Qs2w==
X-Forwarded-Encrypted: i=1; AJvYcCWitR1m2S1qVfKZRdLMFJP9CXne1b1reBMPuAT4nUnuxPtwQp8Cj9r6pZQhWGeGYspwQgnMAcE1CcAY@vger.kernel.org
X-Gm-Message-State: AOJu0YwyESbd/3AMDWYu+mxMQTzKaaymYRTYKILhwCKprf9NKZGI1XYN
	rBol8QP0lZ4oPfgBb7kixBpkgDiHVZu+WObqGMCdtUy3/6CHWQekyxIE9PKqwG4=
X-Gm-Gg: ASbGncvMmcHOlTJZEa9Q5lgnTrTkXLTt0wf+H8gqgOXUSLB+AqcbhjjLkp2VS5kOEgF
	e3BSdFXDUIMDCGXZfn1XDjrljegPBzHLEw6w1G/tL/cDf5/XIzqr3rwjy9T04yDze9VpRpRzvyV
	dkLPJSms93/MF3KhHLbuZXnUvhRhXAz8MKdXDV7KGFd5jZ41p8wydM2KrbLK4NnAPLjszw50bSl
	3lRUg1vQWoA0Sz0tW10g2ml1KDfu7Wy9H8iGACa/5BqNMpjO/YRqirEx2UnkO4dU/T+K+pK8Xn8
	dM2imAIkyR0qNyQA3dKZlA==
X-Google-Smtp-Source: AGHT+IHP/sWNqLjbiRRokya3RRzP3A7lT6GiLvDE2E3HVCuxopdI/+yKYyLcU7/i5H4uYS+gGEKb/A==
X-Received: by 2002:a05:6a21:9017:b0:1e5:ddac:1eff with SMTP id adf61e73a8af0-1e5e04a0c7cmr19747203637.20.1734947021430;
        Mon, 23 Dec 2024 01:43:41 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:40 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 03/17] asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}
Date: Mon, 23 Dec 2024 17:40:49 +0800
Message-Id: <4c4bcc1aa565c6252183553aecd5e5cbd1a0f6ea.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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


