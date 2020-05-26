Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09CA1A8DD0
	for <lists+sparclinux@lfdr.de>; Tue, 14 Apr 2020 23:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633971AbgDNVk2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 14 Apr 2020 17:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:42254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731763AbgDNVkW (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 14 Apr 2020 17:40:22 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED9392076B;
        Tue, 14 Apr 2020 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586900422;
        bh=OfJu1/oupH8M6xcgfPxtGU4BaAPtFLjk7IzN5xySeSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aoMwkqgR4XKfLJnPFAuGZ8WduuZekzhADcKXqhg2LWjY+JzXsd9ffmeEYQDxdotXO
         t5gJeJxSTQ3I0/OlwJSuQl1VJLyg5OGZCap8KimzYtyL7L4Zs+87x03vcq5TISby9J
         9ks0ai51hG1UEqZa041Ywl7zSTGAIN/4g13IlG9k=
From:   Will Deacon <will@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Matt Fleming <matt@codeblueprint.co.uk>,
        sparclinux@vger.kernel.org, kernel-team@android.com
Subject: [RESEND PATCH 1/4] sparc32: mm: Fix argument checking in __srmmu_get_nocache()
Date:   Tue, 14 Apr 2020 22:40:08 +0100
Message-Id: <20200414214011.2699-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414214011.2699-1-will@kernel.org>
References: <20200414214011.2699-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The 'size' argument to __srmmu_get_nocache() is a number of bytes not
a shift value, so fix up the sanity checking to treat it properly.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/sparc/mm/srmmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index b7c94de70cca..cb9ded8a68b7 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -175,18 +175,18 @@ pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
  */
 static void *__srmmu_get_nocache(int size, int align)
 {
-	int offset;
+	int offset, minsz = 1 << SRMMU_NOCACHE_BITMAP_SHIFT;
 	unsigned long addr;
 
-	if (size < SRMMU_NOCACHE_BITMAP_SHIFT) {
+	if (size < minsz) {
 		printk(KERN_ERR "Size 0x%x too small for nocache request\n",
 		       size);
-		size = SRMMU_NOCACHE_BITMAP_SHIFT;
+		size = minsz;
 	}
-	if (size & (SRMMU_NOCACHE_BITMAP_SHIFT - 1)) {
-		printk(KERN_ERR "Size 0x%x unaligned int nocache request\n",
+	if (size & (minsz - 1)) {
+		printk(KERN_ERR "Size 0x%x unaligned in nocache request\n",
 		       size);
-		size += SRMMU_NOCACHE_BITMAP_SHIFT - 1;
+		size += minsz - 1;
 	}
 	BUG_ON(align > SRMMU_NOCACHE_ALIGN_MAX);
 
-- 
2.26.0.110.g2183baf09c-goog

