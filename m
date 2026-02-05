Return-Path: <sparclinux+bounces-6226-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJJWOnqehGmI3wMAu9opvQ
	(envelope-from <sparclinux+bounces-6226-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 05 Feb 2026 14:43:22 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 374BDF3749
	for <lists+sparclinux@lfdr.de>; Thu, 05 Feb 2026 14:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFF56305187F
	for <lists+sparclinux@lfdr.de>; Thu,  5 Feb 2026 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBBD21CC51;
	Thu,  5 Feb 2026 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1VUZRTc"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2A1FE44A
	for <sparclinux@vger.kernel.org>; Thu,  5 Feb 2026 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298776; cv=none; b=tcI/PRabm9v4jBrMEEaTE03bXcsMOewRmli1WE2AB1BrMXiapUIsNQheH/6pEsRGKHcF3yxhRasPBiI3G90hK1HNygthu1C2bEDUw3AJ7So+hEybwK+spKD5O5vHqHsWPH9yuXjt1mOuTvV53ln9bURyqFdDfTGHITIdVK5soDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298776; c=relaxed/simple;
	bh=VSOQCs2WvUvPGTUtmQYyuFiWcil6UpDV1qcnljgAkqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uC+oSS1oLGeAV8yQkR5gXCfYV8+c6rmg7QrmZauiwSEvvvRoR7qCNDEnzgXuYwZ8Fy3vTrhjGTRbzlKtJlEKC1r23l3BAK12Qpl08R4M485T9o0lGfcJahymztqh/tpNSEw3Jk6DnR0qY4vN7goRM7Hleg8JDCKdq5CVT/Ff5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1VUZRTc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E66C4CEF7;
	Thu,  5 Feb 2026 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298775;
	bh=VSOQCs2WvUvPGTUtmQYyuFiWcil6UpDV1qcnljgAkqs=;
	h=From:To:Cc:Subject:Date:From;
	b=g1VUZRTcAqUeh58nhqicmqfwrXOjmY7aIfxzF3qiy/tOCGaBf3zXoyH7O///Uh+oX
	 G+QOCpAmeJ+seDGzsWtGWrYDYPlPNuhlu7ZjipgmmMLtLpz+2+WT959s4gbPCcLTwP
	 AjOB9tBSAq8TmarLgrVXheemBOFWUCx2q/HdSBOrGlVbGGZdL3oOM3p2etKhwd2FOZ
	 7mS/r0dKHZqcXIuMUXeoMxd72z17PmvCQWBvuIDvYzINUp2CGA3UI70oxLJMq4eW5x
	 TO5qi7jI8J4h88RfdlF/mp0+FvVP3hokenWcj8B5GqyubyDa4Uy+9fVak3l4w9mTsx
	 DoSek+LwAq22A==
From: alexs@kernel.org
To: 
Cc: Alex Shi <alexs@kernel.org>,
	kernel test robot <lkp@intel.com>,
	sparclinux@vger.kernel.org,
	Nitin Gupta <nitin.m.gupta@oracle.com>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: [PATCH v3] sparc64: fix unused variable warning
Date: Thu,  5 Feb 2026 21:39:07 +0800
Message-ID: <20260205133911.31598-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6226-lists,sparclinux=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexs@kernel.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[sparclinux];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,davemloft.net:email,intel.com:email,gaisler.com:email,oracle.com:email]
X-Rspamd-Queue-Id: 374BDF3749
X-Rspamd-Action: no action

From: Alex Shi <alexs@kernel.org>

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx'
     set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Cc: sparclinux@vger.kernel.org
CC: Nitin Gupta <nitin.m.gupta@oracle.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Alex Shi <alexs@kernel.org>
---
v2->v3:
  Change subject prefix: arch/sparc -> sparc64.
  Clean up unnecessary CCs.

 arch/sparc/mm/init_64.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index df9f7c444c39..ba19d23d4040 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -358,30 +358,24 @@ static void __init pud_huge_patch(void)
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	unsigned int hugepage_shift = ilog2(size);
-	unsigned short hv_pgsz_idx;
 	unsigned int hv_pgsz_mask;
 
 	switch (hugepage_shift) {
 	case HPAGE_16GB_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_16GB;
-		hv_pgsz_idx = HV_PGSZ_IDX_16GB;
 		pud_huge_patch();
 		break;
 	case HPAGE_2GB_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_2GB;
-		hv_pgsz_idx = HV_PGSZ_IDX_2GB;
 		break;
 	case HPAGE_256MB_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_256MB;
-		hv_pgsz_idx = HV_PGSZ_IDX_256MB;
 		break;
 	case HPAGE_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_4MB;
-		hv_pgsz_idx = HV_PGSZ_IDX_4MB;
 		break;
 	case HPAGE_64K_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_64K;
-		hv_pgsz_idx = HV_PGSZ_IDX_64K;
 		break;
 	default:
 		hv_pgsz_mask = 0;
-- 
2.43.0


