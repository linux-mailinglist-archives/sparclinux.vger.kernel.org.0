Return-Path: <sparclinux+bounces-3253-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B990EA4EB52
	for <lists+sparclinux@lfdr.de>; Tue,  4 Mar 2025 19:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 386F17A24D2
	for <lists+sparclinux@lfdr.de>; Tue,  4 Mar 2025 18:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D6A2836AA;
	Tue,  4 Mar 2025 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="RFhGDprU"
X-Original-To: sparclinux@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345E228369B
	for <sparclinux@vger.kernel.org>; Tue,  4 Mar 2025 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741111861; cv=pass; b=B0RynYafkdLky/9NbsdEsGaOHiNHp6XjFwBZh6jbcYlq0n0cgGMKFgzFx3Hz2m+erKqn/PSZH3AAQbs0Hsg6/IsQp1a138E8UcNqf/FlDTj/LkIgn7+EQ+BnGgyygRjiZALwFd6M9753zKRKmi0JJqmGBJWf/KlJDYdt5PS6kLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741111861; c=relaxed/simple;
	bh=a+xzmZy+B7fCsmKmkr8eFxrN/zN1zTAx89ABihyaOnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6/VFD8PeMJi8KXJrniTtKt3TTXETT7y9MdspPOuHysw4JSC50ys7XS2A5hg0CtA0pKiG/r/qpT03prYQpKWSogs4S42clalmjRECVUevou4Xhn1lnmQX8jNRooIyJt+I73vsE/9dw3ZGqr6jpKVX6+ney97l5XUC06nPLyMgMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=RFhGDprU; arc=none smtp.client-ip=94.231.106.210; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 5F9F140D1F53
	for <sparclinux@vger.kernel.org>; Tue,  4 Mar 2025 21:10:57 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fjd5pPszG0Wf
	for <sparclinux@vger.kernel.org>; Tue,  4 Mar 2025 18:29:09 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id A018242751; Tue,  4 Mar 2025 18:28:56 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=RFhGDprU
X-Envelope-From: <linux-kernel+bounces-541835-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=RFhGDprU
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 75DBC42090
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:39:49 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 52C0A305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:39:49 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A8E188EDF1
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE29212F9A;
	Mon,  3 Mar 2025 13:39:30 +0000 (UTC)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DE211A10;
	Mon,  3 Mar 2025 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009167; cv=none; b=KLn8li1D5hW4GwoJPXJ8YMxv2SNwvFWoC6JcZbFyDxQL57i6Pr26/olgzeuq69bmBLKs0sGw+R8+JWO1ZxJAYbQHHMrrGozjhhyJp75vayfpl5RbtJOTUQk/+lFjSCAB7m7q/dDPdEqOxcUNycVDsU9R/8wmop+yrQQJEuCKFc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009167; c=relaxed/simple;
	bh=a+xzmZy+B7fCsmKmkr8eFxrN/zN1zTAx89ABihyaOnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inap1f6lcXJ1vWcihJTfQRkBrabY1czfCdXRaV09yK4eMxiIOI1U9cv4YyUad5qu7l0eeCMzVVXug/Ke81dkZEq8EeHqd5nmx0frPYL0oBYkHlj9tTWvlRcZfna92adEK7CJmJEXfjh51N3JW8zCn5Ij0E2ttvcKx27pTAcq7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=RFhGDprU; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4Z60KQ0fWkz1FbZy;
	Mon,  3 Mar 2025 14:39:22 +0100 (CET)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4Z60KP1Hk1z1DDhC;
	Mon,  3 Mar 2025 14:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1741009161;
	bh=/93h/VFBMXUYlK5HJY61WVbB5bIOZygI64XeIBe95nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RFhGDprUngIX8B/WksXu5qCl6jvG6Ue2AZeNLU2uztLVehbOrf4Be7sdpXV7apQAV
	 L5G/0zYDuoS1MZLUHtd9Cg4ltQmBCZYtoSFItZZTzSCMQlto/+shrAINuGubsl6a9Z
	 zhVJuX2/VxHBfRJjuhyVJhRfswfIwjfgKGq1o31k=
Message-ID: <b2b03b41-8442-4c68-9c00-05e524673fe0@gaisler.com>
Date: Mon, 3 Mar 2025 14:39:20 +0100
Precedence: bulk
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] sparc/mm: Disable preemption in lazy mmu mode
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-3-ryan.roberts@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20250302145555.3236789-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fjd5pPszG0Wf
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741716529.92855@XrKV/cmyZ6a2Tj+iw5sXkw
X-ITU-MailScanner-SpamCheck: not spam

On 2025-03-02 15:55, Ryan Roberts wrote:
> Since commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with
> lazy updates") it's been possible for arch_[enter|leave]_lazy_mmu_mode()
> to be called without holding a page table lock (for the kernel mappings
> case), and therefore it is possible that preemption may occur while in
> the lazy mmu mode. The Sparc lazy mmu implementation is not robust to
> preemption since it stores the lazy mode state in a per-cpu structure
> and does not attempt to manage that state on task switch.
> 
> Powerpc had the same issue and fixed it by explicitly disabling
> preemption in arch_enter_lazy_mmu_mode() and re-enabling in
> arch_leave_lazy_mmu_mode(). See commit b9ef323ea168 ("powerpc/64s:
> Disable preemption in hash lazy mmu mode").
> 
> Given Sparc's lazy mmu mode is based on powerpc's, let's fix it in the
> same way here.
> 
> Fixes: 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy updates")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/sparc/mm/tlb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 8648a50afe88..a35ddcca5e76 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,8 +52,10 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> +	struct tlb_batch *tb;
>  
> +	preempt_disable();
> +	tb = this_cpu_ptr(&tlb_batch);
>  	tb->active = 1;
>  }
>  
> @@ -64,6 +66,7 @@ void arch_leave_lazy_mmu_mode(void)
>  	if (tb->tlb_nr)
>  		flush_tlb_pending();
>  	tb->active = 0;
> +	preempt_enable();
>  }
>  
>  static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,

Acked-by: Andreas Larsson <andreas@gaisler.com>

Thanks,
Andreas


