Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B17027A1A0
	for <lists+sparclinux@lfdr.de>; Sun, 27 Sep 2020 17:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0PUL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 27 Sep 2020 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgI0PUL (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 27 Sep 2020 11:20:11 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E41DC0613CE
        for <sparclinux@vger.kernel.org>; Sun, 27 Sep 2020 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=re1tpNFKIbvywnA97X593r5EJv1UtE7RbaYxBK4PY9E=; b=pwB4xSCCKzTrpd1AFjzor7yMYa
        cPFFYpMrrdu3LllNsH79cv+Q28smBP4Cf7GqDETVGOE+p6avU6xr+/eXcE2jkdEykbAIrAj4kS12m
        x8bMuoQm9ddH+Q2YrQ9XieddIfb083yPpJrrhUA1VKLdgjisdLgynCtMqpq8xEI/Ctkb8cHlA137n
        fak6JpNWSOCyYnd+0gr2O84t6BRgfUkz0gKVj3GnQhJjGX0lxtVKiWIaC0QcjbIP3TjH8u/+5KD2p
        PI/Z164UsENE6ae8RIMqNh95evnY9I+eK/Hbfl22quWdhGra1vVMFCiDqJ2upqJ2XVr+yRBZMyLU6
        zLmMgMXw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kMYT0-00007w-Qh; Sun, 27 Sep 2020 15:19:58 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        sparclinux@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] sparc: Fix handling of page table constructor failure
Date:   Sun, 27 Sep 2020 16:19:50 +0100
Message-Id: <20200927151950.32725-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The page has just been allocated, so its refcount is 1.  free_unref_page()
is for use on pages which have a zero refcount.  Use __free_page()
like the other implementations of pte_alloc_one().

Fixes: 1ae9ae5f7df7 ("sparc: handle pgtable_page_ctor() fail")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 arch/sparc/mm/init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index fad6d3129904..4288f08a5736 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2898,7 +2898,7 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 	if (!page)
 		return NULL;
 	if (!pgtable_pte_page_ctor(page)) {
-		free_unref_page(page);
+		__free_page(page);
 		return NULL;
 	}
 	return (pte_t *) page_address(page);
-- 
2.28.0

