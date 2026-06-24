Return-Path: <sparclinux+bounces-6938-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdyqA6BXPGq9mwgAu9opvQ
	(envelope-from <sparclinux+bounces-6938-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 25 Jun 2026 00:18:08 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDF6C1B5E
	for <lists+sparclinux@lfdr.de>; Thu, 25 Jun 2026 00:18:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SvE9YUag;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6938-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="sparclinux+bounces-6938-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07FCD3020875
	for <lists+sparclinux@lfdr.de>; Wed, 24 Jun 2026 22:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91B123F431;
	Wed, 24 Jun 2026 22:17:54 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739217DFE7;
	Wed, 24 Jun 2026 22:17:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339474; cv=none; b=BlWnMoxmOqJxjn+BreYR8S1tFRxmO7wF8uh4c6W+jDs3uwoU+jrWNesEJqlFCwNNEt1ey0Vf6h96U0B7cVlZiQeRLvKL82LTqj+brv0Dns+IdMk3zLCygyG6E9CNZd6LvoGdiMx/xA8jTcTY2ooBv6PshkN38JFzaqkTsiay8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339474; c=relaxed/simple;
	bh=KSPMwZQRtsxEMJIgiezvCmvb/UDFNf34mKuXkPVeEm4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M++xc9WSkKYB59yoOJlX6pcGGW0gmpMT11jqRfwfH9cDgjzur2BayJnNRXxDr7w03Zr7JWBR+ZAhgjsgEO6GpS3fN/AMdIJ6qYfJmeMHE7/up+PyR42040R9TomJmJ+aOF0W05l+XanTV2NzMKdeQ6/qWPWsx5OpQyi5idFaOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvE9YUag; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEE31F000E9;
	Wed, 24 Jun 2026 22:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782339473;
	bh=0tayy8BGOC5W0YdI9tXr++H7bq1BPBFofOCyIWZNyfw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SvE9YUag9H/L7wgDjYid/Ziz3/CqwIEpqjPPUFAyz4bWkljntXnjV4D7eUlzV07Bd
	 idUdwRJ6i7em0Ox8qXJnC/8MU7RRhifXeS6KTv7+0WCMdEROV+EmihLB5MPO0IDDIN
	 TmQo6MkL0AkYxVXIXw9+hlim0pBsL5NZogO8Apcq4b1rlTx2VdhankJeXkyYD9l3LR
	 xoEynY3+9cBXqSYzowhg2rY6NspQV/7Nv5BTp1cJ1+GrO9kTCUhtteb8VVMiF5kZex
	 Z26wQKvYpxzM9J7AKewJkj3TMAnDkonOgM6PX+L6pHbt6pD7JkojXuZ/3sSl9qP1ja
	 U2xwNpQzDVdXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BFE3AA6A7A;
	Wed, 24 Jun 2026 22:17:43 +0000 (UTC)
Subject: Re: [GIT PULL] sparc updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <09df8a7f-758f-47cf-9720-0de31e4dee36@gaisler.com>
References: <09df8a7f-758f-47cf-9720-0de31e4dee36@gaisler.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <09df8a7f-758f-47cf-9720-0de31e4dee36@gaisler.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git tags/sparc-for-7.2-tag1
X-PR-Tracked-Commit-Id: 5b2a3b1a98fb47c593144c2770e012d463952b70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 05874021158ae80f6c3d867a784318f7cda41df6
Message-Id: <178233946207.3002918.5805823640178053717.pr-tracker-bot@kernel.org>
Date: Wed, 24 Jun 2026 22:17:42 +0000
To: Andreas Larsson <andreas@gaisler.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andreas@gaisler.com,m:torvalds@linux-foundation.org,m:davem@davemloft.net,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6938-lists,sparclinux=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,sparclinux@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,sparclinux@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66CDF6C1B5E

The pull request you sent on Wed, 24 Jun 2026 09:31:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git tags/sparc-for-7.2-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/05874021158ae80f6c3d867a784318f7cda41df6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

