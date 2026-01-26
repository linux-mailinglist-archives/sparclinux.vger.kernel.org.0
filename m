Return-Path: <sparclinux+bounces-6191-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA3ZHR+ed2kCjQEAu9opvQ
	(envelope-from <sparclinux+bounces-6191-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 26 Jan 2026 18:02:23 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359D8B3B9
	for <lists+sparclinux@lfdr.de>; Mon, 26 Jan 2026 18:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4E34300AC9A
	for <lists+sparclinux@lfdr.de>; Mon, 26 Jan 2026 16:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62E433EB1A;
	Mon, 26 Jan 2026 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="lkWxR10E"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A029347FF8;
	Mon, 26 Jan 2026 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446686; cv=none; b=cNPk1BiwN8bMrGi+qcy24QmnPUcn1BiO4fvslhjzhrTKUKNoFBxpTPSEz2t8h9EVdf5iDvFlKX1b1qK/Tkl3ViZuVxyw0DiEJLlUAaGJzkvtd/QCzWbgBlKrdeMlXpgQx4uXkpNnJFla67fzDcC1cPk34AWtjYKAwJDMqPp6gxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446686; c=relaxed/simple;
	bh=BZfuoCsYkaYttrFWh+MNOFrBt/oD8ScKb675yifUSdw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DspU2lgI1GrcP6bq6ohjXQhOpxGlvxzHEumSJACtxLsl71c66icXHM3+rmyilIQYdKw2W5yxSC3lP052E5lqiTqQ9JuoDgxHlvTr0G8RindJ1DAe1pPrj+K3fYYRMayUoHUhdJtQUPYEgKWYIpGJkEwbtiKU7mfDCxHdCZg2yL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=lkWxR10E reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4f0F8q1N3bz1DDdl;
	Mon, 26 Jan 2026 17:58:03 +0100 (CET)
Received: from [10.10.15.30] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4f0F8p50Vgz1DHbd;
	Mon, 26 Jan 2026 17:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1769446683;
	bh=BZfuoCsYkaYttrFWh+MNOFrBt/oD8ScKb675yifUSdw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=lkWxR10E5EveL7lLh4ojq5CdAiUy+LQPbkkULPehTDELXZYBsyS5S//wuu2TtFLtt
	 h7GFRH2pe5w0wM5cwenlsgHS98jIqCmSTbtCkgKFRTfmHhHsK/ZBPXKPEnNRThEgEf
	 hl4Re43vztuaf6RiLnS9Wsg3t/50QfVJPYJGykmEag/3w6pIVObBRprCuSrl+Sgafm
	 l+ucoXX1P/wg4yTssmF5fnZNPms5KBL322ca/LucanAKiaFcblkyIQk+A09Kdda+zL
	 q/bsWyfxxTPuZqfCAgoc0XCeolLWk/JUgsVqsabiz06h8bIpXFCqsO2CpE4zZQzSgl
	 nJJ+ik3E4Hflg==
Message-ID: <e4db0322-a7a6-4e2f-ad17-70b9bb6fd519@gaisler.com>
Date: Mon, 26 Jan 2026 17:58:02 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arch/sparc: fix unused variable warning
From: Andreas Larsson <andreas@gaisler.com>
To: alexs@kernel.org, "David S. Miller" <davem@davemloft.net>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Matthew Wilcox <willy@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Zi Yan <ziy@nvidia.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20260107104145.51416-1-alexs@kernel.org>
 <494e98fe-0fa6-416c-b136-9c444c03f769@gaisler.com>
Content-Language: en-US
In-Reply-To: <494e98fe-0fa6-416c-b136-9c444c03f769@gaisler.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6191-lists,sparclinux=lfdr.de];
	DKIM_TRACE(0.00)[gaisler.com:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[sparclinux];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2359D8B3B9
X-Rspamd-Action: no action

> Other than the potentially missing Closes: line, LGTM.

Oh, and also, please use "sparc64:" instead of "arch/sparc:" in the
subject. No need for "arch/" and this change is only for sparc64.

Thanks,
Andreas


