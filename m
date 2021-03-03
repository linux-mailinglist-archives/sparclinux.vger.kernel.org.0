Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3639D32C460
	for <lists+sparclinux@lfdr.de>; Thu,  4 Mar 2021 01:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbhCDANc (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 3 Mar 2021 19:13:32 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:32001 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350114AbhCCLA1 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 3 Mar 2021 06:00:27 -0500
X-Halon-ID: 745b473b-7bf9-11eb-b73f-0050569116f7
Authorized-sender: andreas@gaisler.com
Received: from andreas.got.gaisler.com (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 745b473b-7bf9-11eb-b73f-0050569116f7;
        Wed, 03 Mar 2021 09:21:34 +0100 (CET)
Subject: Re: [PATCH AUTOSEL 4.4 4/8] sparc32: Limit memblock allocation to low
 memory
To:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
References: <20210302115935.63777-1-sashal@kernel.org>
 <20210302115935.63777-4-sashal@kernel.org>
From:   Andreas Larsson <andreas@gaisler.com>
Message-ID: <c9573605-e4e3-92a5-3a21-1b324277a345@gaisler.com>
Date:   Wed, 3 Mar 2021 09:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302115935.63777-4-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2021-03-02 12:59, Sasha Levin wrote:
> From: Andreas Larsson <andreas@gaisler.com>
> 
> [ Upstream commit bda166930c37604ffa93f2425426af6921ec575a ]
> 
> Commit cca079ef8ac29a7c02192d2bad2ffe4c0c5ffdd0 changed sparc32 to use
> memblocks instead of bootmem, but also made high memory available via
> memblock allocation which does not work together with e.g. phys_to_virt
> and can lead to kernel panic.
> 
> This changes back to only low memory being allocatable in the early
> stages, now using memblock allocation.
> 
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   arch/sparc/mm/init_32.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
> index 3b7092d9ea8f..4abe4bf08377 100644
> --- a/arch/sparc/mm/init_32.c
> +++ b/arch/sparc/mm/init_32.c
> @@ -240,6 +240,9 @@ unsigned long __init bootmem_init(unsigned long *pages_avail)
>   	reserve_bootmem((bootmap_pfn << PAGE_SHIFT), size, BOOTMEM_DEFAULT);
>   	*pages_avail -= PAGE_ALIGN(size) >> PAGE_SHIFT;
>   
> +	/* Only allow low memory to be allocated via memblock allocation */
> +	memblock_set_current_limit(max_low_pfn << PAGE_SHIFT);
> +
>   	return max_pfn;
>   }
>   
> 

This is not needed for 4.4, and will not compile, as the problem it
fixes was introduced in 4.19.

-- 
Andreas Larsson
