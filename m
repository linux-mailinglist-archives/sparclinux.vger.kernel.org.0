Return-Path: <sparclinux+bounces-6940-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJX/LD43PmpkBgkAu9opvQ
	(envelope-from <sparclinux+bounces-6940-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Fri, 26 Jun 2026 10:24:30 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E76CB4F7
	for <lists+sparclinux@lfdr.de>; Fri, 26 Jun 2026 10:24:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TplBEdU4;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6940-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-6940-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DBC8302FCA4
	for <lists+sparclinux@lfdr.de>; Fri, 26 Jun 2026 08:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCA93E9284;
	Fri, 26 Jun 2026 08:21:30 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FF3E834F;
	Fri, 26 Jun 2026 08:21:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462090; cv=none; b=UCqJNIkPZSghA7Hatz3YiNUtBWLWXJTCf9+NntmQDP9/0pB2frI93v3OrPnmfJdI2bzHiMVEscamktNUOLVjDTDuGk1aA5/RXjN+SU5yc3PV/LTWf6Ccv+S896LO3KBXoahUHzZyM3Xar1oclWzts85mz/4RDkMd+3Sc8aVwLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462090; c=relaxed/simple;
	bh=Hx+qi2oa6VNdtzhKQzuQ+50ZrB4omidZvKjdgW+vH2Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VUAtbrMRSDP3jA/Pt4F0ANBawYuoK2Eq3YFWmjNYwfLkgpKjqMQrT9YDAmE4vRXjjj9FksO8j09C+CQvevNvUXnPZANuZcKYtqm2pXkVqfv9ADpnZrF6n7GZNgiNZNn1SZm4Fg3QlalC+vPKxQaJ+A0cQD/NfNrfiFXgNUDRdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TplBEdU4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D0F1F000E9;
	Fri, 26 Jun 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462089;
	bh=keBQ1PB9E9ulKt7uMx/nDlIJ5ohwmy4K2SVXnXfXhTo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TplBEdU4A/z/qEhUSGn77hXstHEYmJOXCCuN+UkQKeu1/I9KO0Qz+9fznYYYSxVbt
	 dEAkmVaUPl8uqq97GQ/QBYwsoc0KXBtQgIVRDSYX/BmQNjUqy58m/JzNQhPXP76cbH
	 796cf9T9XiQ2YthX//6M6kR5Jr/1DPvD/uF3QDIJADTCir7yryOiUIqr5YUUx2BjPK
	 rvUwIDrGMOB+2M+QznofiRmp9MYhl1iLrv41oa8p2m3DTiKv9PvMLlh8ejFDHpLNcB
	 rrMyEjK3cKyesdAwr/ZAIB8POB86Ebs36xbPg+VMubfbzyEUyPcu+wH7WOhXQQF2f0
	 BKzdbh/NP1Frg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9393539389E8;
	Fri, 26 Jun 2026 08:21:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] mm/sparse-vmemmap: provide generic
 vmemmap_set_pmd()
 and vmemmap_check_pmd()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <178246207624.3816447.4177031772329695086.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:16 +0000
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
In-Reply-To: <20260404122105.3989557-1-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, davem@davemloft.net, andreas@gaisler.com,
 akpm@linux-foundation.org, david@kernel.org, linux-mm@kvack.org,
 muchun.song@linux.dev, kernel@xen0n.name, alex@ghiti.fr, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, ryan.roberts@arm.com,
 kevin.brodsky@arm.com, dev.jain@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ptesarik@suse.com,
 vishal.moola@gmail.com, junhui.liu@pigmoral.tech, austin.kim@lge.com,
 chengkaitao@kylinos.cn, willy@infradead.org, alexs@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,arm.com,kernel.org,dabbelt.com,eecs.berkeley.edu,davemloft.net,gaisler.com,linux-foundation.org,kvack.org,linux.dev,xen0n.name,ghiti.fr,oracle.com,google.com,suse.com,os.amperecomputing.com,gmail.com,pigmoral.tech,lge.com,kylinos.cn,infradead.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6940-lists,sparclinux=lfdr.de,linux-riscv];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,sparclinux@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:songmuchun@bytedance.com,m:linux-riscv@lists.infradead.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:linux-mm@kvack.org,m:muchun.song@linux.dev,m:kernel@xen0n.name,m:alex@ghiti.fr,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:ryan.roberts@arm.com,m:kevin.brodsky@arm.com,m:dev.jain@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ptesarik@suse.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:austin.kim@lge.com,m:chengkaitao@kylinos.cn,m:willy@infradead.org,m:alexs@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,sparclinux@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA8E76CB4F7

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat,  4 Apr 2026 20:20:53 +0800 you wrote:
> The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
> currently no-ops on every architecture, forcing each platform that needs
> them to duplicate the same handful of lines. Provide a generic implementation:
> 
> - vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.
> 
> - vmemmap_check_pmd() verifies that the PMD is present and leaf,
>   then calls the existing vmemmap_verify() helper.
> 
> [...]

Here is the summary with links:
  - [v2,3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



