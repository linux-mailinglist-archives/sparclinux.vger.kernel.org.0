Return-Path: <sparclinux+bounces-2813-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E33589EDBA2
	for <lists+sparclinux@lfdr.de>; Thu, 12 Dec 2024 00:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 684CD1889F39
	for <lists+sparclinux@lfdr.de>; Wed, 11 Dec 2024 23:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43C01FCD0F;
	Wed, 11 Dec 2024 23:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7+FEnVj"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34811FCD11
	for <sparclinux@vger.kernel.org>; Wed, 11 Dec 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959706; cv=none; b=i2jdEOFb631P6EG4XeuzeaIc8ZDmj2CmX9l2b4JvDEzhr9RqPUwuj/BXs/Ea1o2QF0kw/58Ve9atDuNBIoiQcMMhZDo7X0yfNGshI/FUuKSPiOje9CA0ve+s40jYYEmvYCV2C7IdWJaUcN96GU/dfEq+T5HJYRrTahTSy7nkboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959706; c=relaxed/simple;
	bh=TGkiChoIiuc2VpG2S0Af0lfN/4uYZUOoXh2Df7S0kBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r1/s3398Hm99DxyHMjKNRNaxtK4LL0SNTl7Hz1QJJKewDD9maLv7sJkejn7wHD5VcpDXUUoyj3RH8dqDJDSd8hMDAAmHe/BMrCbOfWqLAZz4XCMaSiAdp6IathaElnku8DfcKUgCdXJ4G/tlxEj1+riSql869yM5RI7yvl8lii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7+FEnVj; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728e4e30163so19496b3a.1
        for <sparclinux@vger.kernel.org>; Wed, 11 Dec 2024 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959702; x=1734564502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=I7+FEnVjVtOUVOnpssEOCkYksACpupBbaEG/ro2qNAXyfwRxiXIRYgEEEIRF5+7znv
         g+arOY3w9EzyMeFVEGV3ruicaP5uayjC+Jg9OBOKINRionEoNBDEhNzaCSDpUthTGzP3
         g2EoITzgriVjT7Du4LMuG4rarP84UVdYDgRO1/n8XTbORpqnUH4Lt4kD05BbLouoGmZs
         PrhUyyWaDycCPbH3Fn5EsrLI6V+daQO2z6hrMtbeodHlAivw1Fsg/hD+47MSDixllBvb
         1e6fLKzBMcdRdgjwZHxVQsG5kf35D1ie8P82G8jOvcPOUKVjFu1QY6pmc1y98IQuXGXW
         3kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959702; x=1734564502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLForDZ3L8G53NDE8CmnbZXOU/eHam8tpqogo1+J+z4=;
        b=otF7+K3UwYaSyV3oRscXb/j6m/GdnTbqkJtNdwDCQqp2yNEeCsBwkrHadilGlZSmx+
         DwHuyLF3VUk7pnlNJ2N8V+y02FWF69gFpKqyixB1bYcgJZjYAEKXLI3Rb+lxwnZ0S2Eh
         WhoOECramGStZ3eMXdGh/ZYFCQAc4PV0pNTd6rfAhLW3m4XkWjWB9TgdtP131x8jOp5Y
         LjFg4LhB8rPFxwvklIK6TV3+9yjRdN8vJbvq/rR3IDI86zMds4YD/5zTexKnm9/iVu5j
         yhhR3vO5GD6JpvF7zeORJA1n5K+0nVHIenSZrV4cgTk07Jin5zcAX4ezvrXmYC90HYrc
         TgaA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMn6Ba5JDr3JffgqzQ3Ak00t6ZBcLfF1P0jK7v/I17pdfUtMOYHYek7lP0SLpNrFDCnvshNNjqu/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw608vqruqKguI+L/a/2INkji7FHtEYzXYQR6Za7vcmHPKPfdmh
	hx8VOPqxSvsJAEXzQJUVDnJ0VOCj5KmLxpQJgFjKghUT8IEOMuhO0jpSJTrkmjxJS4wdEcx3vug
	FzhIceJgG2KfGSbyg6lat4g==
X-Google-Smtp-Source: AGHT+IGWTEcN8NSoCgFvsRpfbkF7zue8+P2XAq5n+JVkXUUPL+bOWBEsvAKL/CZzz2D8WnFsu8nT+1urmYWqTc7eRw==
X-Received: from pfaw10.prod.google.com ([2002:a05:6a00:ab8a:b0:725:ee5e:6efd])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:92a6:b0:727:3cd0:1145 with SMTP id d2e1a72fcca58-728fa9a8139mr1688780b3a.2.1733959702467;
 Wed, 11 Dec 2024 15:28:22 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:51 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 13/16] mm: sparc64: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 96 +++++++++++------------------
 2 files changed, 37 insertions(+), 60 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..e44d55b30a84 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,17 +98,19 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
-	unsigned long task_size = TASK_SIZE;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	unsigned long task_size;
+	bool do_color_align;
+	bool file_hugepage;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return -ENOMEM;
+
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -120,26 +122,29 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	if (test_thread_flag(TIF_32BIT))
-		task_size = STACK_TOP32;
-	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
-		return -ENOMEM;
+	do_color_align = (filp || (flags & MAP_SHARED)) && !file_hugepage;
 
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	unsigned long task_size;
+	bool file_hugepage;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	task_size = test_thread_flag(TIF_32BIT) ? STACK_TOP32 : TASK_SIZE;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
@@ -164,49 +169,20 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 			  const unsigned long len, const unsigned long pgoff,
 			  const unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
-	unsigned long task_size = STACK_TOP32;
 	unsigned long addr = addr0;
-	int do_color_align;
 	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
 
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
-
-	if (flags & MAP_FIXED) {
-		/* We do not accept a shared mapping if it would violate
-		 * cache aliasing constraints.
-		 */
-		if (!file_hugepage && (flags & MAP_SHARED) &&
-		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (unlikely(len > task_size))
-		return -ENOMEM;
-
-	do_color_align = 0;
-	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
-		do_color_align = 1;
-
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


