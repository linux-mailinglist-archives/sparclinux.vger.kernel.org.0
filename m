Return-Path: <sparclinux+bounces-6948-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id up2DGu/eQmoBGAoAu9opvQ
	(envelope-from <sparclinux+bounces-6948-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 23:09:03 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CB6DEC89
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 23:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=Nd31O+T4;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6948-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="sparclinux+bounces-6948-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD6E1303B5A7
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 21:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53831D45E8;
	Mon, 29 Jun 2026 21:09:00 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12F3B3C05;
	Mon, 29 Jun 2026 21:08:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767340; cv=none; b=d+FDTohmXGYUH6H+9AYDCVmD3vpXGLq5CcnNjVfRYnXqX9cEV6ARCWsSQNCEDaA3+bNUOM3x9Z8QtiV8iMUSeo9tokVo6PGC8QfcZRK3t/rKKfL4XwOc8s01/j3+tiPBkgGc47HyPEUsR+FfCB5OGQ+Bp5iw3kEOwRVMYpSl8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767340; c=relaxed/simple;
	bh=CpQxhn1X1KGgUW8KpCRdSQQ1xxzUaIIcAgcZHsE3ICs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NXVig2Kwgh2XMEDqA8oh68zta4VqF9FkHfvm2X/D6G7tNSS03yDs0vcgG+F3d85ZzL0N+M5VVwcLuYAfou7ydBXwMVO+i/joNlU6fz46EokUu8HjYEssBNfMSq4woxuo4aove5Z1G1TTbmxeqmCqnZmY/aVqe1KcwaoAARcfD4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Nd31O+T4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D73A1F000E9;
	Mon, 29 Jun 2026 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782767336;
	bh=Qg0jkovDHOQp4wjev5J5mR8Y9cw9SpdhVKuP5+MzNkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Nd31O+T4SwPacQvW01Y4halbn4fnaEYGVGkOPWbyakLXiuuOyznSyd1J4OXuTSTEW
	 nc4LWPrEZl+CrzggOcBD8dnto3D45scDybFn+sPq91x+LvE/sQxZPCJONY14Dh2TNm
	 chJh92007puaNUQwyI8du3eTxwY5wQS5lrgW1Qmg=
Date: Mon, 29 Jun 2026 14:08:55 -0700
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
Message-Id: <20260629140855.584366abb95888a2ecbf4a8b@linux-foundation.org>
In-Reply-To: <fd1b4199-ebbc-420b-afe4-3bea4b9149fc@kernel.org>
References: <20260629-clear_not_present_full_ptes-v2-0-96089871a1e7@kernel.org>
	<20260629-clear_not_present_full_ptes-v2-2-96089871a1e7@kernel.org>
	<20260629102215.09605f0e9ef66c5f58fe0932@linux-foundation.org>
	<fd1b4199-ebbc-420b-afe4-3bea4b9149fc@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6948-lists,sparclinux=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D24CB6DEC89

On Mon, 29 Jun 2026 19:43:53 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> > So... what's happening here?
> 
> "nr_pages" are not modified in the function, so the compile does not complain.
> See below.
> 
> 
> A private build bot barked at me after v1 for
> 
> 	arm-linux-gnueabi-gcc
> 	openrisc-allnoconfig
> 	um-allmodconfig
> 
> For example:
> 
> https://lore.kernel.org/all/202606121420.Wke8Ipgx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kasan.h:38,
>                     from include/linux/slab.h:264,
>                     from lib/test_bitops.c:12:
>    include/linux/pgtable.h: In function 'clear_not_present_full_ptes':
> >> include/linux/pgtable.h:974:31: error: parameter 'addr' set but not used
> [-Werror=unused-but-set-parameter=]
>      974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int
> full)
>          |                 ~~~~~~~~~~~~~~^~~~
>    cc1: all warnings being treated as errors
> 
> 
> The problem is that addr is updated (written) in the function but never read.

Oh, OK, thanks.  I altered the changelog to read

"To prevent the compiler complaining on some configs about "set but not
used" addr parameter, silence that here."


