Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599441E0082
	for <lists+sparclinux@lfdr.de>; Sun, 24 May 2020 18:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387694AbgEXQWB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 24 May 2020 12:22:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387682AbgEXQWB (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sun, 24 May 2020 12:22:01 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EAEE20826;
        Sun, 24 May 2020 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590337320;
        bh=166PijwSqC0mJ2xobUxWhSyxa1QrBlfY9w8mD3UkF3U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=erwEK8gLhYdL0ceSKsnlrU4XZfGMqg/fLTdbgtcyu4fkohvGYX2cX/cyAMdK/TQ/z
         gYcBk3ihCW+QoIfZ4YsOqj3LVvnH5RurM3OqYLixd7fXqrouqIJQo1uATLx5ezyKPj
         zJZScmI6swLTPljZFnvHelhy7PjkthqtZaQnjv08=
From:   Mike Rapoport <rppt@kernel.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 1/2] sparc32: use PUD rather than PGD to get PMD in srmmu_inherit_prom_mappings()
Date:   Sun, 24 May 2020 19:21:50 +0300
Message-Id: <20200524162151.3493-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200524162151.3493-1-rppt@kernel.org>
References: <20200524162151.3493-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

This is a misprint in the page table traversal in
srmmu_inherit_prom_mappings`() function which accessed a PMD entry using
PGD rather than PUD.

Since sparc32 has only 3 page table levels, the PGD and PUD are
essentially the same and usage of __nocache_fix() removed the type
checking.

Use PUD for the consistency and to avoid breakage because of upcoming
addition of type checking into __nocache_fix().

Fixes: 7235db268a2777bc38 ("sparc32: use pgtable-nopud instead of 4level-fixup")
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/sparc/mm/srmmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index a8c2f2615fc6..dbf5334dd084 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -848,7 +848,7 @@ static void __init srmmu_inherit_prom_mappings(unsigned long start,
 			memset(__nocache_fix(pmdp), 0, SRMMU_PMD_TABLE_SIZE);
 			pud_set(__nocache_fix(pudp), pmdp);
 		}
-		pmdp = pmd_offset(__nocache_fix(pgdp), start);
+		pmdp = pmd_offset(__nocache_fix(pudp), start);
 		if (srmmu_pmd_none(*(pmd_t *)__nocache_fix(pmdp))) {
 			ptep = __srmmu_get_nocache(PTE_SIZE, PTE_SIZE);
 			if (ptep == NULL)
-- 
2.26.2

