Return-Path: <sparclinux+bounces-6282-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGuaAOWVlGneFgIAu9opvQ
	(envelope-from <sparclinux+bounces-6282-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 17:23:01 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA514E192
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 17:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B303004F7C
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 16:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918F836E46C;
	Tue, 17 Feb 2026 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="RfUog+uI"
X-Original-To: sparclinux@vger.kernel.org
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0C25A2B4;
	Tue, 17 Feb 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345373; cv=none; b=EktGxwS0S1MZGPLe1R2gFzPsdOSJRHv7+lWM/fiA+Vw3U9aXFKbk9WhTG++FmSIcG10yrcQrMzSQ3xAXR8yy4jC0/I2zrerFA+xfIfe2el+HTZvWFK/xPyPYAZRDDuyVKtHSdCHLD+sUURoJIy1F3KowlLlfVgPzZ2Q10LEydo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345373; c=relaxed/simple;
	bh=cZRESduuMWoAR13yxOlmObdV48WvzCc/jspFd5i9oZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBsQdsNRJH2gazAAI2QthXoFGie6GYLDL+qw3Eo25F4sAM1SZKcv3T2zu9RKnV7nSOPPVzRPPWL4W1Zb1shSr4O3W6AfXxpgsnPmN82Q3fdIBG0mFkqaWmsg3YJBZTQM6zWxv2gWil9jH+2Oii0TO1C04VS3xfJw949OCwmDRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=RfUog+uI; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
From: stian@itx.no
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1771345369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O/rNNNVOo99JcBGw4RaapcGajdexVh+n5IYwXg3+YpM=;
	b=RfUog+uIpCUfNrLE63vGvUFVwCHApjOfaeEqMsHrY5nBZAqWOXVIGTPM/39UXUSeAnu5b2
	2NQA4XxbAmHimgZX5oiuSWd3SF3FcqRqVwa4GUKdIA9o9piyD9GsOB98z5/QX/0pCz5vbR
	7tGTLcVFmgl8r59GgqgqaPQ5c96t1SI=
To: 
Cc: Stian Halseth <stian@itx.no>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Leon Romanovsky <leon@kernel.org>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sparc: iommu/pci_sun4v: fix page alignment in dma mapping
Date: Tue, 17 Feb 2026 17:21:13 +0100
Message-ID: <20260217162141.4669-2-stian@itx.no>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[itx.no,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[itx.no:s=mx.itx.no];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-6282-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[itx.no:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stian@itx.no,sparclinux@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[sparclinux];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: 54FA514E192
X-Rspamd-Action: no action

From: Stian Halseth <stian@itx.no>

'phys' may include an offset within the page, while 'base_paddr' is already page-aligned.

This caused incorrect DMA mapping in dma_4u_map_phys and dma_4v_map_phys.

Fix both functions by masking phys with IO_PAGE_MASK or subtracting the page offset.

Fixes: 38c0d0ebf520 ("sparc: Use physical address DMA mapping")

Reported-by: Stian Halseth <stian@itx.no>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Stian Halseth <stian@itx.no>
---
 arch/sparc/kernel/iommu.c     | 2 ++
 arch/sparc/kernel/pci_sun4v.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 46ef88bc9c26..f3755a388ac7 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -312,6 +312,8 @@ static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
 	if (direction != DMA_TO_DEVICE)
 		iopte_protection |= IOPTE_WRITE;
 
+	phys -= offset_in_page(phys);
+
 	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
 		iopte_val(*base) = iopte_protection | phys;
 
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index 791f0a76665f..2f30eeac4861 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -411,7 +411,7 @@ static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
 	iommu_batch_start(dev, prot, entry);
 
 	for (i = 0; i < npages; i++, phys += IO_PAGE_SIZE) {
-		long err = iommu_batch_add(phys, mask);
+		long err = iommu_batch_add(phys & IO_PAGE_MASK, mask);
 		if (unlikely(err < 0L))
 			goto iommu_map_fail;
 	}
-- 
2.53.0


