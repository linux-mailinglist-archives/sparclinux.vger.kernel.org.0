Return-Path: <sparclinux+bounces-692-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A150187F0D5
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 21:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16BB51F23DA2
	for <lists+sparclinux@lfdr.de>; Mon, 18 Mar 2024 20:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615975A799;
	Mon, 18 Mar 2024 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q4pSmCqs"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EC5A4C7
	for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792262; cv=none; b=upFwF/QAF6KqoOwDktJLEsOEDmUcBzH8ZMXzpS44LfBFHJKxno4BaLJn4bsKzAjAeGwZ3MFaImGaUcAi4sQKuOavpifVML4cs03DKGnWn1rhdlxPlVWu/1GVlBImd7+wDbXwXvbo3QC5McHL0tZ67LdK2QCgS8pMM5wkZ9CK0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792262; c=relaxed/simple;
	bh=5RHxSgtdvJKVCp5Pr7PrdSJPxWg3TC/UA6xoLVOm0PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtU/n2/jQaHp/xqYysABgxVTrxnj/zWq+3fCP7uMkvTw6bROFmxH6/IZ29je2sXFjpuATqXZdzsHgve8sg77lCmtnSCM6A7qTwr3xHFVuk6QJ6kmDQpWu07QfnyRIx7pjBkM1odOXQ640VswxwPnGMtiBCOGmmaeb9TJvJOQxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q4pSmCqs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
	b=Q4pSmCqsAEUSRMQIAZlKkFU4pvuON9ds096d1EDQeGDqj50BeVFZe+bY9sOZlWKANnK7fz
	2Wx9hRaNILhQfMRzRgBYsydoh2WLwe5tp8ZvlNDuoXwieiGh4t0dNZGr69N9bxFU0bisK4
	VVH4ZxO2sqjSL6kXrn70nKNHnb2vi+k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-FNmq79Z7Ppui1w9vxpghZg-1; Mon, 18 Mar 2024 16:04:17 -0400
X-MC-Unique: FNmq79Z7Ppui1w9vxpghZg-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e4fe655c93so1708763a34.1
        for <sparclinux@vger.kernel.org>; Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792257; x=1711397057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C+lWpN1qDfU+nymiqOVXkY7IqPiijqTb8F5rFjpmTU=;
        b=pxXo5DT6omggKJYl86mDZ9DMKXPU5C2mRN6xvN+EOwgoj+F7WH0xNXDepWq+UivdZj
         hGRN4gRe3Hha4xzruPQtrTmVzmS3/ct6VfI8vcBPBZIUctFnzkUvZNF+K3Dp7p35mfLF
         ioKGtu82uUWw/Px9DWlNi2tGpzezdHHcFGQUrW5Z19Sl5Zwnc5afoEtxKBPbomlBMaiD
         dv+acGhUurIeSXj2qPZoVsu6e5yNKPuIRIEo9FcFfU476ChgYzHo3C/jeP1qQj0DZF5M
         LUu8oBi77/X+xPDsD7P3FCLGWVLQaeOkRLZPOCNTlhGOu6KZEO7yrCI4qXbVzyqoQoKz
         TeBg==
X-Forwarded-Encrypted: i=1; AJvYcCWohn9emoEh585yMc1FvrdSOQof6HwHz2HU12N/CytsGsCv7nl0nU1cJjT7jU3pAPEzEiAtddEerXoX/0aSjD7VVVpKSzstTS/RKA==
X-Gm-Message-State: AOJu0YzFSRr0i9cMFb2S2TzSd4YzcqjS6CdZMNtCtjcGN5gWG2Xic+Ls
	dwI2sFC+1eV28glPCbfyh3slWrH6EiEYZWg8W+B3W52bIp+DUg5crYZzWf28VaxMUBLEYv75A/3
	9H61A5BTz+krwD1n05zvU8Z53xVwijX5vXtuCFAiRk2GlXoQwpa6r6Yixxl0=
X-Received: by 2002:a05:6830:33eb:b0:6e5:14d1:54bc with SMTP id i11-20020a05683033eb00b006e514d154bcmr11071062otu.0.1710792257067;
        Mon, 18 Mar 2024 13:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa6+F4MLCWW6AG4iEABFfgYmZgzy20NeyXKIcAPU+wG9nL9kvLpyVpLWIkaaqT6A2sxlc6og==
X-Received: by 2002:a05:6830:33eb:b0:6e5:14d1:54bc with SMTP id i11-20020a05683033eb00b006e514d154bcmr11071025otu.0.1710792256645;
        Mon, 18 Mar 2024 13:04:16 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:16 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 07/14] mm/arm: Redefine pmd_huge() with pmd_leaf()
Date: Mon, 18 Mar 2024 16:03:57 -0400
Message-ID: <20240318200404.448346-8-peterx@redhat.com>
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

Most of the archs already define these two APIs the same way.  ARM is more
complicated in two aspects:

  - For pXd_huge() it's always checking against !PXD_TABLE_BIT, while for
    pXd_leaf() it's always checking against PXD_TYPE_SECT.

  - SECT/TABLE bits are defined differently on 2-level v.s. 3-level ARM
    pgtables, which makes the whole thing even harder to follow.

Luckily, the second complexity should be hidden by the pmd_leaf()
implementation against 2-level v.s. 3-level headers.  Invoke pmd_leaf()
directly for pmd_huge(), to remove the first part of complexity.  This
prepares to drop pXd_huge() API globally.

When at it, drop the obsolete comments - it's outdated.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Fabio Estevam <festevam@denx.de>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/mm/hugetlbpage.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mm/hugetlbpage.c b/arch/arm/mm/hugetlbpage.c
index dd7a0277c5c0..c2fa643f6bb5 100644
--- a/arch/arm/mm/hugetlbpage.c
+++ b/arch/arm/mm/hugetlbpage.c
@@ -18,11 +18,6 @@
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
 
-/*
- * On ARM, huge pages are backed by pmd's rather than pte's, so we do a lot
- * of type casting from pmd_t * to pte_t *.
- */
-
 int pud_huge(pud_t pud)
 {
 	return 0;
@@ -30,5 +25,5 @@ int pud_huge(pud_t pud)
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
+	return pmd_leaf(pmd);
 }
-- 
2.44.0


