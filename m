Return-Path: <sparclinux+bounces-6853-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJUfCgoLFGr6JAcAu9opvQ
	(envelope-from <sparclinux+bounces-6853-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 10:40:42 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 971995C7E7B
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 10:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C36943024199
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 08:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6513E317D;
	Mon, 25 May 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kMwlgSUa"
X-Original-To: sparclinux@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563923E3C48;
	Mon, 25 May 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698220; cv=none; b=VuVRosma8xpev/934/WMpyqzr4l1vTYjkufjfcs4QR/JtBK8JQrJFveOjRSgutxlipv2udOwWX9r+Vp2gY5BPj+CLxcgOaXBW3b9U/FWgXQSgMUst0AkGumpr8dZ7r0VLJuiL+UcDR5e7Ihebz+6RW/T3Fjwjzl4J5Gof24Y+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698220; c=relaxed/simple;
	bh=hZcjvh/b6YIrmkhO9/S17K4LZba4K+rV1ze5hwGwNPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QbVlMbHJoJzTZOhjsvdCZz5OqIWGUq2YNVekwJBhHLRmhrt9jm71ecGFyeztrSHrUCpxlMtF1bujuiknwd45UHfmb0nZtMnHewGUh5tpZb253TyzK8256fq6su0vcwIoDWMPLa4Yo54fwGmf70mjPTEMQKjTn1I/FC51JbjT834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kMwlgSUa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779698215;
	bh=hZcjvh/b6YIrmkhO9/S17K4LZba4K+rV1ze5hwGwNPU=;
	h=From:Date:Subject:To:Cc:From;
	b=kMwlgSUazX5xtI01iuETvj2xb69oKG/gq5uh2Y1MMNNcjA/OKuD48D1wXT5KTrOqF
	 vPLG5ttNJts12+aZ4KMtMKYhX5oDJvPMjXa8FL7IMJtGfhMdizsea4SDvBZdvuYVJs
	 FGwqtvpk0rZcohwyZxgPR7aYbhzYT4xlmJXZJ2qc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 25 May 2026 10:36:21 +0200
Subject: [PATCH v2] sparc: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260525-sparc-clear_user_page-v2-1-e7a47fbcf439@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0K6tqbUUoSV9zCElDLaGgPYaVFDu
 LsFNa5c/sn7/81EEJwFJGUyEQejRdt3MfBNQrRR3RmobWMmnHHJMr6jOCinqb6CcnWI5XpQEcq
 F2EtZKC5ySWJ3cHCyj3X3WL0zhuYC2i9jH8LBLUSh/2HGou/dc/1mTJfrVyz+iMeUprRRKmsKB
 lnL2sMdLCJqE8y2A0+qeZ5f0nwb0uYAAAA=
X-Change-ID: 20260523-sparc-clear_user_page-7448669a2476
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779698215; l=2092;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hZcjvh/b6YIrmkhO9/S17K4LZba4K+rV1ze5hwGwNPU=;
 b=tEncDkxa347xo1WBve5NbwO2T97Z8Mnqep1NtaTixr7xQ9xGBz+bgUTSV9NqJSH2dWfEhXOXx
 huNZltyTy6UD42JgIySQbdeqhSxzdxpRB6lJgnVPfZYDA5iCjBVw4TH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6853-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,sparclinux@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,weissschuh.net:email,weissschuh.net:mid,weissschuh.net:dkim,msgid.link:url]
X-Rspamd-Queue-Id: 971995C7E7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The loop in clear_user_pages() iterates over all pages and calls
clear_user_page() for each of them. During the loop "vaddr" is modified.
However on sparc clear_user() is a macro which does not use "vaddr".
The compiler sees a variable which is modified but never used and emits
a warning for that:

	include/linux/highmem.h: In function 'clear_user_pages':
	include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
		static inline void clear_user_pages(void *addr, unsigned long vaddr,

Other architectures use an inline function for clear_user_page() which
avoids the warning. This is not possible on sparc, as
sparc_flush_page_to_ram() is not yet declared where clear_user_page() is
defined. Including cacheflush_32.h will trigger recursive and lots of
other issues.

So hide the warning with a cast to (void) instead.

While we are here, do the same for copy_user_page().

Fixes: 62a9f5a85b98 ("mm: introduce clear_pages() and clear_user_pages()")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Put parens around vaddr.
- Link to v1: https://patch.msgid.link/20260524-sparc-clear_user_page-v1-1-baa5b90e5d0d@weissschuh.net
---
 arch/sparc/include/asm/page_32.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
index c1bccbedf567..9f0b54f70908 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -20,10 +20,12 @@
 #define clear_user_page(addr, vaddr, page)	\
 	do { 	clear_page(addr);		\
 		sparc_flush_page_to_ram(page);	\
+		(void)(vaddr);			\
 	} while (0)
 #define copy_user_page(to, from, vaddr, page)	\
 	do {	copy_page(to, from);		\
 		sparc_flush_page_to_ram(page);	\
+		(void)(vaddr);			\
 	} while (0)
 
 /* The following structure is used to hold the physical

---
base-commit: d87895ce6e45997825cfe1b3565a1843e8ac8011
change-id: 20260523-sparc-clear_user_page-7448669a2476

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


