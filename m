Return-Path: <sparclinux+bounces-693-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1D87F0D7
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 21:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0A17B23109
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 20:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EB25B1EA;
	Mon, 18 Mar 2024 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkytdXhD"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD865A782
	for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 20:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792263; cv=none; b=CFWGCX7C3ViO8M1Osco5/1G1bQgDWuv/lFkFN9CXQeLxn2RS2rU26pAFYmQ14w7OSwiTWsSRn8OvrSD4gHdJKaAhFlFLia7u8I9WWTyd4dgboYE4T83QHsS8dGTvteedz0o7Q69PR6QIFHfo79HWykIAheBnnfdzpe8oKja9jnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792263; c=relaxed/simple;
	bh=t18R28ny76a7TFkmozYcxNFR6pN9FqPc0sZ3mbG+iGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkMGo/QHkj6lfvks3jYP3Hx8BofIYEl0UmjFT+NrpoUw5c1u0c55AczDaoLPi4ctbsrSVl4eFeEjRgan3ZDAj3uzgegUEZJfVMJoA9zsWD7UqVLxb06a6a4OebuDU14OOl8Mq9QFR/dpmFBE3TXjmGoo1x1DJHOZ2+biHo5y7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DkytdXhD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
	b=DkytdXhD1GrMYt24VWx3kLetZvGHbfiaO7TcY892sitrLuC/qiRd3P0klYF292EtTrPL5R
	MBngzXYeTG0BMbSx3cYXpx/z8hpjxpmnpfuo8Kd0JoNawqqFq6islEuhqTcsUUcijeHdhI
	pP78hSJf10DTUpKi8lQsvud63ir9ubY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-OOkzq_AIO6O0kYkUFoy9nQ-1; Mon, 18 Mar 2024 16:04:19 -0400
X-MC-Unique: OOkzq_AIO6O0kYkUFoy9nQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-690c19ee50bso14534066d6.0
        for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 13:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792258; x=1711397058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
        b=Sl0AgdAXOxzgaxiBx1xTTolvbqUFo4Y3VGJo/TucEBIWoS8KqbSLUviEn0ppUZRJa+
         qqSRTe8YUaQx9d019FlTh/Jf5ef4p2Z+ggWrCFs2H4RxWz2lj5M3FBYGIYWk15+OXWTd
         fEq+Xtj+W/MnZ/a/jE1v6/KG1A5Ls9n4msQCLxhIj557dsvQMOq5nZsWeirDck9IGUas
         cWywmnegCp43OC4zHSYH0GJhWTOr7Bmz5KxBg6h9ORx9JfmGvdDZ3U8Ruvebs/nqNfch
         wRHzevpxWDEJvBsOEug4cUy0VSPCF+O3PeviSNK+qqixBwfSApwBo31ljA9S68LndWgE
         sEkw==
X-Forwarded-Encrypted: i=1; AJvYcCUVf4EFzAFhEdUAjWKp2dLKt+BIYe7Lsn9St59fMbLFHs9IHpJcteOreMA7asooNaoVBbpsratcPZQSlgke/Hve+5NfBbDV0WU8gQ==
X-Gm-Message-State: AOJu0YyAhWylVd3XCoaENmreKBN/qs8QzXUwN7vnSLkbn21soGU3QFXs
	rTeIxtphmWuXe7Brnps/JoFMs37bK4JRq8jz6k2h8oUsdIjMYpCPCnz1v4XpGnoSwoHUoU82mdI
	3J04oSEUVhUleeyNNH6P2pJnck9SJsW7t4VdCsPJ0CEZtTyPndHCse782i2mxxxlCzTc=
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr462668qvb.3.1710792258407;
        Mon, 18 Mar 2024 13:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPMjFRvOQnrQWtPInqAdggXMmLflMtETkazIbCBO67t5p2Mbipn5U9tbb0PWyioZzi1AzvbQ==
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr462644qvb.3.1710792258055;
        Mon, 18 Mar 2024 13:04:18 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	x86@kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	peterx@redhat.com,
	Mark Salter <msalter@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 08/14] mm/arm64: Merge pXd_huge() and pXd_leaf() definitions
Date: Mon, 18 Mar 2024 16:03:58 -0400
Message-ID: <20240318200404.448346-9-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Xu <peterx@redhat.com>

Unlike most archs, aarch64 defines pXd_huge() and pXd_leaf() slightly
differently.  Redefine the pXd_huge() with pXd_leaf().

There used to be two traps for old aarch64 definitions over these APIs that
I found when reading the code around, they're:

 (1) 4797ec2dc83a ("arm64: fix pud_huge() for 2-level pagetables")
 (2) 23bc8f69f0ec ("arm64: mm: fix p?d_leaf()")

Define pXd_huge() with the current pXd_leaf() will make sure (2) isn't a
problem (on PROT_NONE checks). To make sure it also works for (1), we move
over the __PAGETABLE_PMD_FOLDED check to pud_leaf(), allowing it to
constantly returning "false" for 2-level pgtables, which looks even safer
to cover both now.

Cc: Muchun Song <muchun.song@linux.dev>
Cc: Mark Salter <msalter@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/hugetlbpage.c      | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 401087e8a43d..14d24c357c7a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -704,7 +704,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		(!pud_table(pud))
 #define pud_present(pud)	pte_present(pud_pte(pud))
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
+#else
+#define pud_leaf(pud)		false
+#endif
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 #define pud_user(pud)		pte_user(pud_pte(pud))
 #define pud_user_exec(pud)	pte_user_exec(pud_pte(pud))
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0f0e10bb0a95..1234bbaef5bf 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -81,16 +81,12 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
+	return pmd_leaf(pmd);
 }
 
 int pud_huge(pud_t pud)
 {
-#ifndef __PAGETABLE_PMD_FOLDED
-	return pud_val(pud) && !(pud_val(pud) & PUD_TABLE_BIT);
-#else
-	return 0;
-#endif
+	return pud_leaf(pud);
 }
 
 static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-- 
2.44.0


