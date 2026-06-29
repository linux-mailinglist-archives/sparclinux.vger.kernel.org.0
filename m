Return-Path: <sparclinux+bounces-6946-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeqLD+upQmps/QkAu9opvQ
	(envelope-from <sparclinux+bounces-6946-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 19:22:51 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A671B6DDA5B
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 19:22:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=uTo5qVX1;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6946-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="sparclinux+bounces-6946-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC84B3039804
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 17:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B3643DA4C;
	Mon, 29 Jun 2026 17:22:18 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0803F0AB1;
	Mon, 29 Jun 2026 17:22:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782753738; cv=none; b=ROsk+GlnPituVmPJSEqYY86pDAqxfIBtLEsbZFYqvB/Wy4DGdubDr5ApbjC+YpKtP1bIWjrwr4xZg7aqhGbYN99PJSSDwUOCtYZOziHHRL0WbeVLbXKj6Xso66Q7CKKx/GI5ATdyMVfVrBVLs1q0dulj35R+ox6Bugs44QLSMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782753738; c=relaxed/simple;
	bh=j1PfHP4HnPwoNeH5tZBhuEu0+2T+JkdlEUy7P8dUAss=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BxBcVOMxnPVRfpudyg2dT3H8vnFGiS2QX7LL1tRoqAPNI4FeW7U2I41QZMU+RYLX0cPeDb6UeHgsbgkSZF5OqmzSn8I0Y9RRswcOLZaE7Ig8IhNt3/fBcYcy0wENEIVRMr9RFexd5v32r5aWv84A+0BVMakCaWZU4qYhH6TtT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uTo5qVX1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2699C1F000E9;
	Mon, 29 Jun 2026 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782753736;
	bh=juWgsiwKrfmDYFjWzFD07h7xasT5wM0m/CbZLCSQTVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uTo5qVX1WCofU7ArQgIge3U5uPhkOafXY7LAqEvLoUorCsTnMWFkxpUZNTf8CHCZr
	 AeASxor7XbYPpI6VrMzqtE0MppRB7PPFVbH5MjKJ2vTBtq/2HgmS2d0vYeRlCftWN8
	 M4yhQnX7V544cg53/WuFnz9XZQ23NxJnaDdSzFfA=
Date: Mon, 29 Jun 2026 10:22:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jann Horn <jannh@google.com>, Peter Zijlstra
 <peterz@infradead.org>, "Oscar Salvador (SUSE)" <osalvador@kernel.org>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] mm: drop pte_clear_not_present_full()
Message-Id: <20260629102215.09605f0e9ef66c5f58fe0932@linux-foundation.org>
In-Reply-To: <20260629-clear_not_present_full_ptes-v2-2-96089871a1e7@kernel.org>
References: <20260629-clear_not_present_full_ptes-v2-0-96089871a1e7@kernel.org>
	<20260629-clear_not_present_full_ptes-v2-2-96089871a1e7@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6946-lists,sparclinux=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A671B6DDA5B

On Mon, 29 Jun 2026 15:49:48 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> In general, there is no good reason to do anything special when clearing
> non-present PTEs.
> 
> In theory, HW that does have to invalidate TLBs for non-present PTEs could
> benefit from a "full" parameter, but fortunately
> pte_clear_not_present_full() is not wired up anymore ... and there would
> have to be something very convincing for us to care about that to re-add
> it.
> 
> So, let's just use pte_clear() directly now. To avoid the compiler
> complaining on some configs about unused "addr" parameter, silence that
> here.

Wait, which configs do that?

> @@ -1022,8 +1007,10 @@ static inline void pte_clear_not_present_full(struct mm_struct *mm,
>  static inline void clear_not_present_full_ptes(struct mm_struct *mm,
>  		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
>  {
> +	(void)addr;
> +

We heavily rely on this warning not happening.

eg, one of thousands:

static inline bool page_range_contiguous(const struct page *page,
		unsigned long nr_pages)
{
	return true;
}

So... what's happening here?

