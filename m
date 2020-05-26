Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FA21E28E5
	for <lists+sparclinux@lfdr.de>; Tue, 26 May 2020 19:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgEZRdN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 26 May 2020 13:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgEZRdN (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 26 May 2020 13:33:13 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EAD320704;
        Tue, 26 May 2020 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590514392;
        bh=nL4T2n8UsztEgURgiWgStCCMwYr1zRevmyQ2QuQp4Vk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R9YQGX5NUTzN5UKOVDDrmYrmy2dbPy1w4OLgYF1Ag75ANXjoKvqAcSlQmZrTKC5KW
         71bVxb0yhVCDJJu9e6Op3IANjH76tNUTtHLmsj+/BxxAtCPECa4Kg2/snOB2yuAtI0
         2Q28qSNlqe30WhcXOonJG3PRIzrHeCQftR58EIBA=
From:   Will Deacon <will@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "David S . Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Rapoport <rppt@kernel.org>, kernel-team@android.com,
        "Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH 1/3] sparc32: mm: Don't try to free page-table pages if ctor() fails
Date:   Tue, 26 May 2020 18:33:00 +0100
Message-Id: <20200526173302.377-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526173302.377-1-will@kernel.org>
References: <20200526173302.377-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The pages backing page-table allocations for SRMMU are allocated via
memblock as part of the "nocache" region initialisation during
srmmu_paging_init() and should not be freed even if a later call to
pgtable_pte_page_ctor() fails.

Remove the broken call to __free_page().

Cc: David S. Miller <davem@davemloft.net>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Fixes: 1ae9ae5f7df7 ("sparc: handle pgtable_page_ctor() fail")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/sparc/mm/srmmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index c861c0f0df73..589370a21b12 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -365,7 +365,6 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
 		return NULL;
 	}
 	return ptep;
-- 
2.27.0.rc0.183.gde8f92d652-goog

