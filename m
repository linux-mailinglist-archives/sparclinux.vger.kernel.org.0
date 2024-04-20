Return-Path: <sparclinux+bounces-948-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDE8AB9D4
	for <lists+sparclinux@lfdr.de>; Sat, 20 Apr 2024 07:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE5E1C2093B
	for <lists+sparclinux@lfdr.de>; Sat, 20 Apr 2024 05:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48D412E5D;
	Sat, 20 Apr 2024 05:17:03 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294B17BC9;
	Sat, 20 Apr 2024 05:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713590223; cv=none; b=rYUhNM7iP7W/Cg9JkDlDxrUre9HbFO1AWkYHR8Vtujd2YhZlSrrl8ZKdUDRA13Hz1gwhIOM90b2wpLU635eIvS8m+Tcm5ug39s6wexWrGVEksnhqlGF2PMpy/rfD2LGb6veEzcG/eoww5zOpbMD5kq/owzyiQreyAx9SE92GWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713590223; c=relaxed/simple;
	bh=sFnCyAezPJqAAlu3qDvF7erthkLHTCeXNJjaVGL6Y6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8o1MLurG1Z1/Qe9I0zIgE8P6X90aTcOEkYqfvEnbcFwGOJDZfiCTNs77W8Oa6ArMhe3TqgMFISpf03YusdOr1NrcER/fpnSAFIVmir63b62OgAwsZkNODXiur8xZ3r9+DufpY5gbeYna0mTEPkk4FfJ75TYZCFdmHFdFm1fnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass smtp.mailfrom=shingroup.cn; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shingroup.cn
X-QQ-mid: bizesmtp79t1713590179t1j0ojyx
X-QQ-Originating-IP: usNWeg3p56fbl6S4O5hLIa/2vcCL/sUddDTvjUu6ZQk=
Received: from localhost ( [112.0.147.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 Apr 2024 13:16:17 +0800 (CST)
X-QQ-SSF: 01400000000000903000000A0000000
X-QQ-FEAT: kXE5muS/leEbbuoBaiU+TdzUdL8x1DtGffTVB18ZZSjdZkb7ukY1/vsQEbTcj
	/NXvomoV18BJGH7GSXpOT4kPYqdzRkXp2cswMMBLFO7EFgU3Pr1hY/7VYyesv4D1cvIMV6W
	HdN9MK0b25112qI1mqXixVzW4O7ZWSlEn4tPhnK/uhx+Yf+u0Bh5BtcHYZQEgfo1NFXX8wv
	W/UVodAkBuo5rh8V+NvcF7K0WOpS281MfHV1BPbqVX47V/rkPl6A6cTSDZ1r6yx7wUcs+we
	f+djCR4KWNJYQmJErZxhtT8GLtyti8qGk0+HpGKqXlwTnrDzJjwhzuCjhWrrKS2PHKS6ISU
	0GrnJu3Zc/j1deuop76NewiI7M6R27Qb2R0pBGFD8+NcYaUMb8qQGjRaC+DfZCzFBL+r4mA
	eqVicjisW3I=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 13105262653113255618
From: Dawei Li <dawei.li@shingroup.cn>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH v2 4/7] sparc/pci_msi: Remove on-stack cpumask var
Date: Sat, 20 Apr 2024 13:15:44 +0800
Message-Id: <20240420051547.3681642-5-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240420051547.3681642-1-dawei.li@shingroup.cn>
References: <20240420051547.3681642-1-dawei.li@shingroup.cn>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1

In general it's preferable to avoid placing cpumasks on the stack, as
for large values of NR_CPUS these can consume significant amounts of
stack space and make stack overflows more likely.

@cpumask of irq_set_affinity() is read-only and free of change, drop
unneeded cpumask var.

Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---
 arch/sparc/kernel/pci_msi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/sparc/kernel/pci_msi.c b/arch/sparc/kernel/pci_msi.c
index fc7402948b7b..acb2f83a1d5c 100644
--- a/arch/sparc/kernel/pci_msi.c
+++ b/arch/sparc/kernel/pci_msi.c
@@ -287,10 +287,7 @@ static int bringup_one_msi_queue(struct pci_pbm_info *pbm,
 
 	nid = pbm->numa_node;
 	if (nid != -1) {
-		cpumask_t numa_mask;
-
-		cpumask_copy(&numa_mask, cpumask_of_node(nid));
-		irq_set_affinity(irq, &numa_mask);
+		irq_set_affinity(irq, cpumask_of_node(nid));
 	}
 	err = request_irq(irq, sparc64_msiq_interrupt, 0,
 			  "MSIQ",
-- 
2.27.0


