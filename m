Return-Path: <sparclinux+bounces-6251-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCDdBqu9immmNQAAu9opvQ
	(envelope-from <sparclinux+bounces-6251-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 10 Feb 2026 06:10:03 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA3116F9A
	for <lists+sparclinux@lfdr.de>; Tue, 10 Feb 2026 06:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8CB303C506
	for <lists+sparclinux@lfdr.de>; Tue, 10 Feb 2026 05:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3156B32BF32;
	Tue, 10 Feb 2026 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHAhfc3I"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D501329E62;
	Tue, 10 Feb 2026 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700116; cv=none; b=O1mR+NG+EpHM6s6WGgSmr68L8z8QOcKa1BTEA2ijxyM/EbA1m1zt0GLLSax5rOxjug1aosBpOGcIFEZmWUi/xwv/8XdLAJIfZrcV7JnCmcLp5Z2p1Hwe47W36iDrl6KTTpoxQ3/t6BzFSoR9AY9GQwI3P/d/r72qxNnalc6DtrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700116; c=relaxed/simple;
	bh=tUsVShrv0gERDHlQThcOh505NQlB7qGnWvVGcozhfck=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MhzRrnb3s9J76UQ87/gp9n+1Ct+nmfv5Fhv/YGIPZT+FJ+atLKapvQFZNYB7BReD4fA0J/jgjD6V/88San4ze1WL7RAvJK6qUx2QCVvxvrefz2kJejcd417cv6z7idn15tiioDrONzyUY98Pd0sQ5gXxiyj2Ou/vRhzTqvUCpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHAhfc3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E731EC116C6;
	Tue, 10 Feb 2026 05:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700115;
	bh=tUsVShrv0gERDHlQThcOh505NQlB7qGnWvVGcozhfck=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jHAhfc3IF2RsfZOAv2mp3dtTtTSPWIjMz7mt3tzOpKZ4efAU1YWb8W2gmZwrwluWw
	 u6d2w0rIb5/+VciTQWKu3/8PbhUEzN5i4K6RbbuIkUQH/dJR8r+xURuBrHIox5Oz2h
	 wJHs1SAKaWfePoChkOu8YWMq3GV2Nu0yocjgqEaNCVcgqhr6ZG1dTByQ0cEVmaa1I8
	 eyOgQ2oHKwsL555LkW1OWq7rncdKtnO2Iqzq+duAiRWedh51TfhhJ+UqLBJGhrpTgO
	 1dV8wNcWoBbdG25fmPa8GLWjbTFA+hVS1hfLfAz4wCvR3XXKDCiXT6zD+zEswzWIE0
	 V/G1KL5Sco6dA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2267380AA5E;
	Tue, 10 Feb 2026 05:08:32 +0000 (UTC)
Subject: Re: [GIT PULL] sparc updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <4908fe5d-4d42-45e0-9dba-e78e8a5b084f@gaisler.com>
References: <4908fe5d-4d42-45e0-9dba-e78e8a5b084f@gaisler.com>
X-PR-Tracked-List-Id: <sparclinux.vger.kernel.org>
X-PR-Tracked-Message-Id: <4908fe5d-4d42-45e0-9dba-e78e8a5b084f@gaisler.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git tags/sparc-for-7.0-tag1
X-PR-Tracked-Commit-Id: d844152d85cfcc7d2ef9430a25882604c12da279
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e3a1e0cccbf6d9bcc05e2710f53a480639cf81d
Message-Id: <177070011130.3352335.7810979505332788517.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:31 +0000
To: Andreas Larsson <andreas@gaisler.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6251-lists,sparclinux=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,sparclinux@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87DA3116F9A
X-Rspamd-Action: no action

The pull request you sent on Mon, 9 Feb 2026 13:21:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git tags/sparc-for-7.0-tag1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e3a1e0cccbf6d9bcc05e2710f53a480639cf81d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

