Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6130127B03B
	for <lists+sparclinux@lfdr.de>; Mon, 28 Sep 2020 16:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1OrH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 28 Sep 2020 10:47:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgI1OrG (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 28 Sep 2020 10:47:06 -0400
Received: from kernel.org (unknown [87.71.73.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBC1F2083B;
        Mon, 28 Sep 2020 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601304426;
        bh=mRi/mN+4/Qc9zWniAqYU0A/7vu7elPJ37jYr+GIxSoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lr1J6DXheHX4b59d3WlWgABdZt0B8GqLVPzBDxlFMg/AmjgP/rdyWYJhbYHxzInAm
         x3ZZFJT+AcUBV4dI13dWiwYnJFPqWonsYz2pjeq9TOpo0M2qO4my1qC2GoDI41Ceim
         CzSZ9zQ15YkSvxE8wuGtNRTJoZg3UwlAOwuhVbAY=
Date:   Mon, 28 Sep 2020 17:46:59 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc: Fix handling of page table constructor failure
Message-ID: <20200928144659.GY2142832@kernel.org>
References: <20200927151950.32725-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927151950.32725-1-willy@infradead.org>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, Sep 27, 2020 at 04:19:50PM +0100, Matthew Wilcox (Oracle) wrote:
> The page has just been allocated, so its refcount is 1.  free_unref_page()
> is for use on pages which have a zero refcount.  Use __free_page()
> like the other implementations of pte_alloc_one().
> 
> Fixes: 1ae9ae5f7df7 ("sparc: handle pgtable_page_ctor() fail")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/sparc/mm/init_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index fad6d3129904..4288f08a5736 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2898,7 +2898,7 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  	if (!page)
>  		return NULL;
>  	if (!pgtable_pte_page_ctor(page)) {
> -		free_unref_page(page);
> +		__free_page(page);
>  		return NULL;
>  	}
>  	return (pte_t *) page_address(page);
> -- 
> 2.28.0
> 

-- 
Sincerely yours,
Mike.
