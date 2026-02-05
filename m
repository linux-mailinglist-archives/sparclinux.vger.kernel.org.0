Return-Path: <sparclinux+bounces-6227-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNBhFrKehGmI3wMAu9opvQ
	(envelope-from <sparclinux+bounces-6227-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 05 Feb 2026 14:44:18 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC277F377D
	for <lists+sparclinux@lfdr.de>; Thu, 05 Feb 2026 14:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D57883061CD3
	for <lists+sparclinux@lfdr.de>; Thu,  5 Feb 2026 13:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EA522DA1C;
	Thu,  5 Feb 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQFtKBtz"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F222A4D6
	for <sparclinux@vger.kernel.org>; Thu,  5 Feb 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298823; cv=none; b=P6Lkopnistn1FIZ/htW6nhqgaveclvE7geFeWz1ioGnae3GlNDoRzXJKCAG4gPIdzo25EHZ5IkrQTq/aSCGAq+o5VQZjTpGBGJOjN6bc8Z3rr1LIgsccOmRD3PHMjtGjtC22/RFe8ayZ35YusreHxBgtW9hr28pDhqjEaMM1ecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298823; c=relaxed/simple;
	bh=SsI9AbF+M4sRTUlIYuRSIpvqIQsoogaUtAPhCHpHM9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4p6T/iWLx4QsxVfvKNby+GRUqZInxsoVN6PfFH7D7qWTimYy8U9X6noFG9bMPqz2NGGwrBOMf0cDNJ71BKthc6C5wqFYgn9YnUhKDdX0pCsjNI6NyrYMCU792tjPCk7kchw/43Bn31t13bn2ox52pge93hOChTryBdayboahQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQFtKBtz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9ACC4CEF7;
	Thu,  5 Feb 2026 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298823;
	bh=SsI9AbF+M4sRTUlIYuRSIpvqIQsoogaUtAPhCHpHM9I=;
	h=From:To:Cc:Subject:Date:From;
	b=HQFtKBtzxcTDGxgU7qV1Br4x2uMK7LtjT14p+iX09ng4ZIYRkQlyOViixMm7zc3CH
	 PY+Pj8NADp8qKmnEsFIgrfL8Qt9g7eqHWEa2HH/M5GBY2odLcZ2dtt0xNcRHrj3jEQ
	 rBiIUJdLNbzJsdouq4oJ0eAk2xeSItp+KQ2jzDkibIOPLPP9TNar9RWkapNU0VNF7+
	 fzyMVcdpnUr/FoIEOHnIwXC+jwkJ7XGAJpBqTox4TSym2VTVmmE/TNCMQ5JUaE+Vhz
	 nRzTLyhhmEJlVGsSichNKsBnWsA2YTyX/GUh1MYc4GcILWqHtWDo7ZDnPDcbkaeNql
	 FXDx05LTm3j3Q==
From: alexs@kernel.org
To: 
Cc: Alex Shi <alexs@kernel.org>,
	kernel test robot <lkp@intel.com>,
	sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH v2] sparc: remove unused variable strtab
Date: Thu,  5 Feb 2026 21:39:59 +0800
Message-ID: <20260205134007.31647-1-alexs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6227-lists,sparclinux=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,davemloft.net:email,intel.com:email]
X-Rspamd-Queue-Id: CC277F377D
X-Rspamd-Action: no action

From: Alex Shi <alexs@kernel.org>

The commit 1b35a57b1c178 ("sparc32: Kill off software 32-bit multiply/divide
 routines") removed the last usage of strtab in funtion module_frob_arch_sections
Therefore, it can be removed now.

Reported-by: kernel test robot <lkp@intel.com>
Cc: sparclinux@vger.kernel.org
Cc: David S. Miller <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: Alex Shi <alexs@kernel.org>
---
v1->v2:
 Change subject prefix: arch/sparc32 -> sparc

 arch/sparc/kernel/module.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index 49740450a685..2a8770369beb 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -29,7 +29,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 {
 	unsigned int symidx;
 	Elf_Sym *sym;
-	char *strtab;
 	int i;
 
 	for (symidx = 0; sechdrs[symidx].sh_type != SHT_SYMTAB; symidx++) {
@@ -39,7 +38,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 		}
 	}
 	sym = (Elf_Sym *)sechdrs[symidx].sh_addr;
-	strtab = (char *)sechdrs[sechdrs[symidx].sh_link].sh_addr;
 
 	for (i = 1; i < sechdrs[symidx].sh_size / sizeof(Elf_Sym); i++) {
 		if (sym[i].st_shndx == SHN_UNDEF) {
-- 
2.43.0


