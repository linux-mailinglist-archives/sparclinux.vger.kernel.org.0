Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F14E20C00E
	for <lists+sparclinux@lfdr.de>; Sat, 27 Jun 2020 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgF0IRY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 27 Jun 2020 04:17:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgF0IRY (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 27 Jun 2020 04:17:24 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39EA22080C;
        Sat, 27 Jun 2020 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593245844;
        bh=uLrkYKjNa/dkMSZ5LXvpK5+PNYCNo8VwsFWoEPWnYZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p/vIgtbhrwJW2Y5ga+ev/A+e+fYtmAH8EaQumdhz5tFJA5tT4778DG7yK4E7ZyPyM
         72XSINLnajsadl3X84pLuhGDnN0QJehFYiIBhRdACXnHPTy7Dgq9c+Mjm9L6nFx7SE
         S/apAs82BEo1xOyDMLQ14CCe7jVEh6vjlYcriiEE=
From:   Mike Rapoport <rppt@kernel.org>
To:     sparclinux@vger.kernel.org
Cc:     David Miller <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH v2 1/2] sparc32: use PUD rather than PGD to get PMD in srmmu_inherit_prom_mappings()
Date:   Sat, 27 Jun 2020 11:16:52 +0300
Message-Id: <20200627081653.25311-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627081653.25311-1-rppt@kernel.org>
References: <20200627081653.25311-1-rppt@kernel.org>
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
index 0070f8b9a753..f5fa07958f34 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -822,7 +822,7 @@ static void __init srmmu_inherit_prom_mappings(unsigned long start,
 			memset(__nocache_fix(pmdp), 0, SRMMU_PMD_TABLE_SIZE);
 			pud_set(__nocache_fix(pudp), pmdp);
 		}
-		pmdp = pmd_offset(__nocache_fix(pgdp), start);
+		pmdp = pmd_offset(__nocache_fix(pudp), start);
 		if (what == 1) {
 			*(pmd_t *)__nocache_fix(pmdp) = __pmd(probed);
 			start += PMD_SIZE;
-- 
2.26.2

