Return-Path: <sparclinux+bounces-7083-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0utIAzv+VWopxgAAu9opvQ
	(envelope-from <sparclinux+bounces-7083-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 11:15:39 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A5752B81
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 11:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-7083-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-7083-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAA8030252AB
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 09:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614AD43D4E8;
	Tue, 14 Jul 2026 09:14:22 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B043CEE9;
	Tue, 14 Jul 2026 09:14:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020462; cv=none; b=VhlBDjiiEFSOq7gn9iNBDzzSVW4D+j4bS2b06JbXL3der++sEhJwnhKCXu3jdOUUIkkPxPB1mljXGJbiEn6h4cYk/6mRFT/sjOX9EyQifvo3DMO0iCNUlNPuMSJVAcUvwmZvX2XP9V2MpXqicN3esyL7EwnyBKh8rKNhD1qkZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020462; c=relaxed/simple;
	bh=TGjwDLWm8OgJ1SgQvLvIUr20LmXPnjHtwYakKzdGUuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxyjG3W0R6n07niJpKv1oImoSlTHV/qChS4g7JnGVk8TmgBvihMrrXOQ2PGDBKI6accxR1Ww6IgeLfZrdnJZzSdL4XLvkp5VlRywaboptWcM/dAAz+/iQLld/so8wILNU7E8Ufugjrcqbvfv33Xm3fLYLakMihJzuoFfjJw13Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
X-UUID: 5ff038007f6411f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:83b3b263-8d9e-4e6b-b62d-319302d392a5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:20fca517386fb6f0bb7c881d153baa0f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ff038007f6411f1aa26b74ffac11d73-20260714
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1164100889; Tue, 14 Jul 2026 17:14:10 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: davem@davemloft.net,
	andreas@gaisler.com,
	kees@kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] ioport: Use kzalloc() instead of kmalloc()/memset() in _sparc_alloc_io()
Date: Tue, 14 Jul 2026 17:13:49 +0800
Message-ID: <20260714091350.511-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:kees@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yanlonglong@kylinos.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7083-lists,sparclinux=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yanlonglong@kylinos.cn,sparclinux@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanlonglong@kylinos.cn,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[sparclinux];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:from_mime,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 400A5752B81

Replace kmalloc+memset by kzalloc for better readability and simplicity.
This addresses the warning below:
WARNING: kzalloc should be used for data, instead of kmalloc/memset

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 arch/sparc/kernel/ioport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index cbc0680a4642..df73439b290c 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -184,9 +184,8 @@ static void __iomem *_sparc_alloc_io(unsigned int busno, unsigned long phys,
 			printed_full = 1;
 		}
 		tlen = strlen(name);
-		tack = kmalloc(sizeof (struct resource) + tlen + 1, GFP_KERNEL);
+		tack = kzalloc(sizeof (struct resource) + tlen + 1, GFP_KERNEL);
 		if (tack == NULL) return NULL;
-		memset(tack, 0, sizeof(struct resource));
 		res = (struct resource *) tack;
 		tack += sizeof (struct resource);
 	}
-- 
2.43.0


