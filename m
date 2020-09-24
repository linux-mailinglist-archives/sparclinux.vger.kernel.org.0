Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB20E276795
	for <lists+sparclinux@lfdr.de>; Thu, 24 Sep 2020 06:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIXEP3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 24 Sep 2020 00:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgIXEP3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 24 Sep 2020 00:15:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DF9C0613CE
        for <sparclinux@vger.kernel.org>; Wed, 23 Sep 2020 21:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=N8Jxhj03RzRxRUtjJsmqny8Ri6xj62wFeX5QQiTfJPA=; b=sQDDpgCi/3lteDluJL8yI2Snp5
        wMP6bKs+03Owgs8/RpOUjpjuV5/v7kMN+6iaPZje81hRplPexYvzq7FNYVhfHd3raotM/vwknAqa0
        3YiTtSHORrDsB7TvpzvJqQYHqLOkVUfsDSRDR82hOGwjI1Hb1Kx1dF3Ey+3KMsU+SmoMwT7vaQ1py
        HwJreXDGEWcAgAWxEhmgKb6ZpeClYuNFXOgFKoRK3r4ChY2Qj6IOYX2g0ffTtF4QXLFJt5dBIX+XN
        aNv/LH5FNBlJjr52SnjbH3ngbYPcii9EO7FWKWSv7aP4rIqZtJHT7+rihLYmBG1ikwP3RL1rUei4i
        HARosKGw==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLIfF-0001hb-1E; Thu, 24 Sep 2020 04:15:25 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     davem@davemloft.net
Cc:     sparclinux@vger.kernel.org
Subject: [PATCH] sparc64: switch defconfig from the legacy ide driver to libata
Date:   Thu, 24 Sep 2020 06:15:23 +0200
Message-Id: <20200924041523.521143-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Replace the ide options with the equivalent libata options.  This has
been carried by various downstreams like the linux-build-test repo
for years already.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sparc/configs/sparc64_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index bde4d21a8ac8e7..35a32adbbc59d2 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -66,9 +66,8 @@ CONFIG_CDROM_PKTCDVD=m
 CONFIG_CDROM_PKTCDVD_WCACHE=y
 CONFIG_ATA_OVER_ETH=m
 CONFIG_SUNVDC=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_ALI15X3=y
+CONFIG_ATA=y
+CONFIG_PATA_ALI=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
-- 
2.28.0

