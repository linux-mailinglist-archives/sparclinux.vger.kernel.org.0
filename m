Return-Path: <sparclinux+bounces-6882-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S95aOMMQIWpB+wAAu9opvQ
	(envelope-from <sparclinux+bounces-6882-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 04 Jun 2026 07:44:35 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463D63D0F4
	for <lists+sparclinux@lfdr.de>; Thu, 04 Jun 2026 07:44:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FtPfhMok;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6882-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="sparclinux+bounces-6882-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D55323024603
	for <lists+sparclinux@lfdr.de>; Thu,  4 Jun 2026 05:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1B33C4B9F;
	Thu,  4 Jun 2026 05:44:32 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94028352C2B;
	Thu,  4 Jun 2026 05:44:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780551872; cv=none; b=lb39x/xgTANtvtvPCP5YkWI45uek8/QP1ZAlurv+az0ReD0nT5DesZvkYwJLG8EnDv4bIxgvvQ8X5PEzTfhXtXYcycORHblQ1Srr72Y/Dm7bz/B+grSrYYgtUdbzBU56uiwcrT1W+f8mSF+MZYkDb8Zj43nwBWV4tR2mKfibENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780551872; c=relaxed/simple;
	bh=mcTCxxOX9qnxOD3RbX1q1ypIFdLNwAoDyZX/Ca0KeWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqiOJjXAlob0O+IY5gJRtI64HWsnd9bLrFVE6R8vR32FVQlnUydt6azX8R3wjGLS3TfWb2o737Ih+TM0c3grD7IhtOEQrfVOxceuNIJP4pkKCf8SBZHktz+/1HTVjlUVJm21O4HCw0aIOupKj/c3qjZhsUdylh1jbeRS693RSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtPfhMok; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C211F00893;
	Thu,  4 Jun 2026 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780551868;
	bh=i9U2E5wM9GwBXet0D5NfI+XdIVHV58zoDfgA5pHkk0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FtPfhMok/Sq6q/EWpl0HkfZHEXB93SkrfDQ1avxGAUV0U6pC/V8iyBvjtTtkts5gq
	 d6vlMQSw4o8T3gbCW4X22yPx9/vz5b82hMCVFd1HYtcPdQyIciO3mIbCIcZc1wrmma
	 pN6gbeazjyTVMZPMXWpbMHaC0tgciwvZA+RdwFPtQuPcaS9v/lin5GSukXB4rXlAfq
	 Uah0e5RmyQV53tamwmMAV28lqbVKPQuwSxe2uLqoeZP0IEvSMZkbvjcrX0X8P4nvW/
	 aAohKKtprbmaxyiWh6xqDjRdNXm2yaFDtq2Q0KVYJ34jueUE/x8hwlvBWu738nzBWy
	 g1UVQim2kTCQg==
Date: Thu, 4 Jun 2026 08:44:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memblock: Introduce memblock_alloc_node_or_panic()
 helper
Message-ID: <aiEQscLI2LkNSj2v@kernel.org>
References: <20260604034139.2827148-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604034139.2827148-1-zhen.ni@easystack.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6882-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhen.ni@easystack.cn,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,sparclinux@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,easystack.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6463D63D0F4

On Thu, Jun 04, 2026 at 11:41:39AM +0800, Zhen Ni wrote:
> During early boot, several subsystems allocate memory from specific
> NUMA nodes using memblock_alloc_node(). When allocation fails, the
> typical requirement is to panic immediately.
> 
> Introduce memblock_alloc_node_or_panic() to automatically panic on
> allocation failure. This reduces repetitive error checking, improves code
> consistency across subsystems, and enhances code readability.

memblock_alloc_or_panic() made sense because it's the most used memblock
API.

Adding panic() versions for a handful of uses is unnecessary churn.

A better patch would be to update panic() messages to convey more useful
information.
 
> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
> ---
>  arch/sh/mm/numa.c            | 10 ++++------
>  arch/sparc/kernel/setup_64.c | 16 ++++++----------
>  arch/x86/coco/sev/core.c     |  5 ++---
>  include/linux/memblock.h     |  6 ++++++
>  mm/memblock.c                | 22 ++++++++++++++++++++++
>  mm/mm_init.c                 | 11 ++++-------
>  mm/sparse.c                  | 13 +++++--------
>  7 files changed, 49 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/sh/mm/numa.c b/arch/sh/mm/numa.c
> index 9bc212b5e762..32b01697b27f 100644
> --- a/arch/sh/mm/numa.c
> +++ b/arch/sh/mm/numa.c
> @@ -38,12 +38,10 @@ void __init setup_bootmem_node(int nid, unsigned long start, unsigned long end)
>  	__add_active_range(nid, start_pfn, end_pfn);
>  
>  	/* Node-local pgdat */
> -	NODE_DATA(nid) = memblock_alloc_node(sizeof(struct pglist_data),
> -					     SMP_CACHE_BYTES, nid);
> -	if (!NODE_DATA(nid))
> -		panic("%s: Failed to allocate %zu bytes align=0x%x nid=%d\n",
> -		      __func__, sizeof(struct pglist_data), SMP_CACHE_BYTES,
> -		      nid);
> +	NODE_DATA(nid) = memblock_alloc_node_or_panic(
> +				sizeof(struct pglist_data),
> +				SMP_CACHE_BYTES,
> +				nid);

Please don't touch this, the entire file is going away after rc1.

>  
>  	NODE_DATA(nid)->node_start_pfn = start_pfn;
>  	NODE_DATA(nid)->node_spanned_pages = end_pfn - start_pfn;

-- 
Sincerely yours,
Mike.

