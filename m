Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9FB1C6853
	for <lists+sparclinux@lfdr.de>; Wed,  6 May 2020 08:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEFGRt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 6 May 2020 02:17:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58184 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725873AbgEFGRt (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 6 May 2020 02:17:49 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id AD4FED3E8FAC46294EF1;
        Wed,  6 May 2020 14:17:46 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 14:17:37 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <davem@davemloft.net>, <akpm@linux-foundation.org>,
        <rppt@linux.ibm.com>, <sparclinux@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] sparc: mm: return true,false in kern_addr_valid()
Date:   Wed, 6 May 2020 14:16:59 +0800
Message-ID: <20200506061659.19128-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This function's return type is bool and returns both true/false and 0/1.
This fixes the following coccicheck warning:

arch/sparc/mm/init_64.c:1652:9-10: WARNING: return of 0/1 in function
'kern_addr_valid' with return type bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/sparc/mm/init_64.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 5774529ceb43..2ef6826a6ca6 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1649,29 +1649,29 @@ bool kern_addr_valid(unsigned long addr)
 
 	pgd = pgd_offset_k(addr);
 	if (pgd_none(*pgd))
-		return 0;
+		return false;
 
 	p4d = p4d_offset(pgd, addr);
 	if (p4d_none(*p4d))
-		return 0;
+		return false;
 
 	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud))
-		return 0;
+		return false;
 
 	if (pud_large(*pud))
 		return pfn_valid(pud_pfn(*pud));
 
 	pmd = pmd_offset(pud, addr);
 	if (pmd_none(*pmd))
-		return 0;
+		return false;
 
 	if (pmd_large(*pmd))
 		return pfn_valid(pmd_pfn(*pmd));
 
 	pte = pte_offset_kernel(pmd, addr);
 	if (pte_none(*pte))
-		return 0;
+		return false;
 
 	return pfn_valid(pte_pfn(*pte));
 }
-- 
2.21.1

