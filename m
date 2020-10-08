Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C93287CA9
	for <lists+sparclinux@lfdr.de>; Thu,  8 Oct 2020 21:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgJHTyI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 8 Oct 2020 15:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbgJHTyI (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 8 Oct 2020 15:54:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8D6C0613D2
        for <sparclinux@vger.kernel.org>; Thu,  8 Oct 2020 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4EhDrMA1vgac7xlPvTmCJbH2gHcwRUoU9DKu4x1ExBE=; b=kZFsNrRGH9dfq/VDmbQIcaofOv
        QXXz7oc+pZjOPvSC8WXnRZsufXq7B9MdONHcr9Unu73n1axYCyGCFEPXKYhujWy+VJAnAvrqAzDRv
        2uvjtMdsO9pcVb9ghJMHA4PuNHIO0bvoaBLugqr4VSapXjj8IIfLq6JCBvIqU2iBCMHJMTj9bIzZi
        28nnTkhhJdlT1gvxanJdUdSril4wArFt5QfqtzBmehl6l5FVYax1OfA+CVOGMYzw0cxLMuvqxNFdD
        5k2gbhq+yrClwkmOcuY2ezp0SW9eYoglvB/oHzyxcEzzs7Lf75qkvVPx/gnP0owucywDOaN21J4qn
        Q2YK5jwg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQbzB-0000fO-4Z; Thu, 08 Oct 2020 19:53:58 +0000
Date:   Thu, 8 Oct 2020 20:53:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc: Fix handling of page table constructor failure
Message-ID: <20201008195357.GO20115@casper.infradead.org>
References: <20200927151950.32725-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927151950.32725-1-willy@infradead.org>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

ping

On Sun, Sep 27, 2020 at 04:19:50PM +0100, Matthew Wilcox (Oracle) wrote:
> The page has just been allocated, so its refcount is 1.  free_unref_page()
> is for use on pages which have a zero refcount.  Use __free_page()
> like the other implementations of pte_alloc_one().
> 
> Fixes: 1ae9ae5f7df7 ("sparc: handle pgtable_page_ctor() fail")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
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
