Return-Path: <sparclinux+bounces-2059-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647A961EBE
	for <lists+sparclinux@lfdr.de>; Wed, 28 Aug 2024 07:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEE53B23508
	for <lists+sparclinux@lfdr.de>; Wed, 28 Aug 2024 05:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF04515B140;
	Wed, 28 Aug 2024 05:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="i/DlY6+9"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD915B0F4
	for <sparclinux@vger.kernel.org>; Wed, 28 Aug 2024 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824207; cv=none; b=SQzueXYDlHcfmDrMIljZQ4hwBAA7b2dWM5T+bkSpWhOHEcA3sE3AO73Ajr3CTxMvAoLKk6VP4WmxpJiJQEgtm4DfxVXTPJXYGbfo9F7piKkB6CleEH/N8ivRMdrt5xrnTUxaHYMEOxkIt3NaCGlkXLwqksEkanJunqbvZRl51u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824207; c=relaxed/simple;
	bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDnmq4pd8x1/d0eXS6vOFBynNRKlRt5dfzQptgh3X5AgbEeMrwlErq/kaMTQscEs3S2DZTcTUjRUcGK6zVbdee8AlsVQTqxdqXs9E4y+QJbf/TNh9YgQnx3OGDGzG1V9ypVdZ5f2qOP3HiPUJnrVjOV1Qn5Ewmy0yAotN/nPT2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=i/DlY6+9; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7143185edf2so5288875b3a.0
        for <sparclinux@vger.kernel.org>; Tue, 27 Aug 2024 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824204; x=1725429004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=i/DlY6+91BMwTMLrYCJbVrcsqFZX5TnuTZHdn7NHW6At73EUQzp3275EVaiQksc5No
         vSTIWqYzrQ14jtlswG2T4nYXlWQ+MWlPGXU/p87qMpaYyfc7ZelWr/GtjOthsyv7os90
         Dt+Z2YTG6JQhRMUUEhYFJskIOslQztgaORA88y5sC9rHSb4vj3FZ+38OSUr7kjxg6dQm
         hHxlp7lp86xhC/859VTr5zUNMiHlfyL6rGszjGb51NgKxLOi4sctT08v8n+awHu6AzIt
         5MEMK/Jcm1TtIapG517Vo3XumP3cbGVg45eVwwd3IaH//US1cKHPD77lAo3rt73Rzq0J
         KLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824204; x=1725429004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPn63wqFJg/NhDtyE6TA0coeolvG0b692sVkrxs6h6w=;
        b=ZSdbq+kF7i7MaihK20WuZ1FlcyGzHyliSxvBH2pkD+xviEnDLIGwiVHdRPthphwqGF
         a4A0exP0UA9rG/NpqxbPhwmQOBRzDwME5li92ClQHPT6XCYeIBwFcBsYyAbj5msrN5Lg
         AbgiTUEp3/N4HFqQ50NBByR1zVfvELcHeL8dcd+/aO053GM5q0/MB9EjomCjuj3qtX/5
         wwLNcQri2jW3CFGD5PZUWZkwv58M/9Np9Q61wHZZA3D4Gm8K8GqpOMYa+WJy6Clk02F7
         Xe0BaWv+k9pS6677eCMdnIw2NyXwXZwghInWpBnaqVkK6lg+v8L1IJ7vG+778kAnqcKz
         0AZg==
X-Forwarded-Encrypted: i=1; AJvYcCVou0ULzeuUwlBtxih4YbEOJo+NFhz523SR1L/0cE7Yvzi4CeQJ9JkFWFSze2wbwemI8dr01AEjP1K4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0v5JPceEMZlD3oAyUGgP32jHLj+aMPUkD+S6wyfWNHkZf51t4
	pAKSEW6c4CSQnVOTAG03w/n6Nv3Vl8i3x5fMZu7xrwMT39G+Jl7dRpGle7LCnUE=
X-Google-Smtp-Source: AGHT+IExz2l4cJy30WX6CK7UJnnTV99XpNodRNjqDrqaX9iShx7VT4aEy+MVWDHksfv413xg6BHqWQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:b61c:57cb with SMTP id adf61e73a8af0-1cc8b63e7admr19641639637.53.1724824203730;
        Tue, 27 Aug 2024 22:50:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:17 -0700
Subject: [PATCH 11/16] mips: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-11-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=hr+5sO+DwZ7b30hixHrcXcBJzkXJVKP+oyQ8pDF00F0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkfk1qWxrKnZbieZ1K/6LSwKGjL0hcztOaE2KQe3
 3vFh3FJRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABMReMjwm1XqYMYTd7kZ029e
 Ywn89Unq1bGI6TwyXnVzFq65HWqvWsnIcHriXK9fRsZbv646duvxv8pFDmYGX/naxDT1E9+JfDu
 ykAsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/mips/mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 7e11d7b58761..1595fda284cd 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -79,6 +79,13 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 		info.low_limit = PAGE_SIZE;
 		info.high_limit = mm->mmap_base;
+		if (flags & MAP_BELOW_HINT)
+			/*
+			 * Subtract (STACK_TOP - mm->mmap_base) to get random
+			 * offset defined in mmap_base() in mm/util.c
+			 */
+			info.high_limit = MIN(info.high_limit,
+					      (addr + len) - (STACK_TOP - mm->mmap_base));
 		addr = vm_unmapped_area(&info);
 
 		if (!(addr & ~PAGE_MASK))
@@ -94,6 +101,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	return vm_unmapped_area(&info);
 }
 

-- 
2.45.0


