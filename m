Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB2A4035BD
	for <lists+sparclinux@lfdr.de>; Wed,  8 Sep 2021 09:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhIHH4B (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 8 Sep 2021 03:56:01 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:38789 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237361AbhIHHz7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 8 Sep 2021 03:55:59 -0400
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Sep 2021 03:55:59 EDT
X-Halon-ID: 2a06a1c6-1079-11ec-8aa7-005056917f90
Authorized-sender: andreas@gaisler.com
Received: from andreas.got.gaisler.com (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 2a06a1c6-1079-11ec-8aa7-005056917f90;
        Wed, 08 Sep 2021 09:48:35 +0200 (CEST)
From:   Andreas Larsson <andreas@gaisler.com>
To:     David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        linux-kernel@vger.kernel.org, software@gaisler.com
Subject: [PATCH] sparc32: Page align size in arch_dma_alloc
Date:   Wed,  8 Sep 2021 09:48:22 +0200
Message-Id: <20210908074822.16793-1-andreas@gaisler.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Commit 53b7670e5735 ("sparc: factor the dma coherent mapping into
helper") lost the page align for the calls to dma_make_coherent and
srmmu_unmapiorange. The latter cannot handle a non page aligned len
argument.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/kernel/ioport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 8e1d72a16759..7ceae24b0ca9 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -356,7 +356,9 @@ void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_addr, unsigned long attrs)
 {
-	if (!sparc_dma_free_resource(cpu_addr, PAGE_ALIGN(size)))
+	size = PAGE_ALIGN(size);
+
+	if (!sparc_dma_free_resource(cpu_addr, size))
 		return;
 
 	dma_make_coherent(dma_addr, size);
-- 
2.17.1

