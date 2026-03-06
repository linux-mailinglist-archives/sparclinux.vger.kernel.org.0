Return-Path: <sparclinux+bounces-6447-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNyuNA1Oq2lYcAEAu9opvQ
	(envelope-from <sparclinux+bounces-6447-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Fri, 06 Mar 2026 22:58:37 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B571228287
	for <lists+sparclinux@lfdr.de>; Fri, 06 Mar 2026 22:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C540D30363A2
	for <lists+sparclinux@lfdr.de>; Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086F36E479;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pynADD+N"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2ED370D79;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834209; cv=none; b=DdtrhQEGe+z2JtpXJfJepWfYL+J5NFsK34YV1CdBd1UwdQp4paI4ujRZr6p2Yl/4IRMwrhLfQ0/SEaB+t7ElK8ucp2yo1zM7pgNulnXV/RkVUZEDM5HPeYr4K+V9Bk3i13PTQHk9cmMUBE3ZWFg3gAdpUqYuPv/UjHKYTa73Dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834209; c=relaxed/simple;
	bh=ZKUAk3Py0MLvTnII3IjzjaZ48QiVaitPzY9QDZiF778=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F5LzuctlwbYAusCkde4W8mbDmUFPakoJGLPh4zrjB9xLqV2cxtSrX/xEPQEiJUva/Lb8Zn2kVvnX63Im3U1yy5RYP5m2Gd9bUfK9wpiYjq6u8rYmcIsS9evSJ8k/Py4yMM6/nXMY0/ngW1FP1vuTd7QQpbT7HSCbjsvkCb0x594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pynADD+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1894BC4CEF7;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772834209;
	bh=ZKUAk3Py0MLvTnII3IjzjaZ48QiVaitPzY9QDZiF778=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pynADD+NMFEUI2F2rTrU4x0Jw3AfEjEFPOCrqTf81cJ+TGibwfYrLx+wxguHkHyWI
	 gSkJP4A5ai7BrOmmDHT5LhmBiOAbMvEdHxTEWnCeM0w9Q0YGwdgwP2TCaxF8fxRFO3
	 3UKJnYBmBmFFSFBJpbeBYUHpsY/ls7UvRXyekuccbiz2Q7lldcvq3Z7hbOWXjIK17A
	 v6SzbQzndHCRNKqZoSG7KGnrefbLsxQ1pcK3zOOr6lTUQKOBZh2D9ApT6w4HDS7Ym3
	 ZzwDTcYX90qaHdUYvs2xGdc2GjhRQWxsNScUsgw0UoYuQDq+wreMU79QDti+DzBbiS
	 4rqxtBR9Z3o6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D1173808200;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Subject: Re: [GIT PULL] PCI fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260306212338.GA241358@bhelgaas>
References: <20260306212338.GA241358@bhelgaas>
X-PR-Tracked-List-Id: <sparclinux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260306212338.GA241358@bhelgaas>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v7.0-fixes-3
X-PR-Tracked-Commit-Id: 9f2c7349b2810c671badfc1adc804f711a83e420
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 325a118c12045239076b7ea9e66391dd6f56f72e
Message-Id: <177283420819.65918.18439522893056731414.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 21:56:48 +0000
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Nilay Shroff <nilay@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Nam Cao <namcao@linutronix.de>, Vivian Wang <wangruikang@iscas.ac.cn>, Madhavan Srinivasan <maddy@linux.ibm.com>, Han Gao <gaohan@iscas.ac.cn>, Nathaniel Roach <nroach44@nroach44.id.au>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@linux.intel.com>, Joyce Ooi <joyce.ooi@intel.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3B571228287
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6447-lists,sparclinux=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,sparclinux@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Fri, 6 Mar 2026 15:23:38 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v7.0-fixes-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/325a118c12045239076b7ea9e66391dd6f56f72e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

