Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2189B4E976
	for <lists+sparclinux@lfdr.de>; Fri, 21 Jun 2019 15:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfFUNjN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 21 Jun 2019 09:39:13 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39053 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfFUNjN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 21 Jun 2019 09:39:13 -0400
Received: by mail-qk1-f193.google.com with SMTP id i125so4409470qkd.6
        for <sparclinux@vger.kernel.org>; Fri, 21 Jun 2019 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W1v9REbUjdM2ZPgzn5WvSncnmCktMY/9EZgX6QI0HOA=;
        b=LOaqH/DlAyTiaVsb+/cJ5fNqCKK9dcYheZzqBkbU8/dJCNcbdbTdvycRRW6WsdWNrq
         s1KlIlJ8pqtzQuZr4K+pscDPf+VAoNvvbLh7zGps691WEcEWVHVgG/y+SfGLilLH8xno
         0bDlX2xF7lyCGAB4ZXKagYnPnFu5m/m8VbNEpdAbBtffvGdOG5+2xjfKlD1S7GX/sCJ8
         Tki+kAZuPALbN16uIeo3/RJOzrwHbwCpqBWSiMTS52KfM4E4JV89wOogvhl4vLh60o2b
         9hG2keijKi4DWyDadCzOTDOZpyKgf7ZyhWBT1TsI17RSZcSyUl57cSd5RfTlT2NIe0b0
         X9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W1v9REbUjdM2ZPgzn5WvSncnmCktMY/9EZgX6QI0HOA=;
        b=F/bdGpsZxZjbZmIoZpGry+jGNBsmyYSwJLCio4rFi6lF64YKr7fvPPIp1DhjPT9jkh
         zXUM8YFsKrRo1rlUe9I7gLh/D95uqpvea+LWrIC5Ymw9QeexcEAGvwHMRr86o6+eX0hR
         0sVbtQW3Yi2GCAbuaxfy0ZVS/BYiKwAs7S/ZLsbaGJyUCV17G+xbZNP3+lsZ0bAecvEe
         pSftcPiVIRw6h0wa9guo2r9qgDxxCbHcE3fk+HH/EBdkCQkBqpXxTbgI0BCHbYf4celM
         Ds22A2em6pGxJX2Ok6mFzW3wWKK75IOTLvgWFEslohLHKf62/9XVsPDifBXDcR41//dy
         MKCg==
X-Gm-Message-State: APjAAAXO3lh+Tn6daLovSp78a9DhrkwHq20Thr5FhzrRnaufTMKX9tMf
        HqkmT3ViHP88I91GVkbHbwQt4w==
X-Google-Smtp-Source: APXvYqwDjXm2EEI8RDeCs7A5M5DgZpv1lwL8EVk5ylfRpHYYLvhclwPmRsPezAJyTvAyxaG7iZQC7A==
X-Received: by 2002:a37:ef01:: with SMTP id j1mr40587433qkk.163.1561124352349;
        Fri, 21 Jun 2019 06:39:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id a6sm1525606qth.76.2019.06.21.06.39.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 06:39:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heJl1-00005R-4p; Fri, 21 Jun 2019 10:39:11 -0300
Date:   Fri, 21 Jun 2019 10:39:11 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190621133911.GL19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index ddde097cf9e4..6bb521db67ec 100644
> +++ b/mm/gup.c
> @@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  	unsigned long flags;
>  	int nr = 0;
>  
> -	start &= PAGE_MASK;
> +	start = untagged_addr(start) & PAGE_MASK;
>  	len = (unsigned long) nr_pages << PAGE_SHIFT;
>  	end = start + len;

Hmm, this function, and the other, goes on to do:

        if (unlikely(!access_ok((void __user *)start, len)))
                return 0;

and I thought that access_ok takes in the tagged pointer?

How about re-order it a bit?

diff --git a/mm/gup.c b/mm/gup.c
index ddde097cf9e410..f48747ced4723b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2148,11 +2148,12 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 
 	start &= PAGE_MASK;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
 	if (unlikely(!access_ok((void __user *)start, len)))
 		return 0;
 
+	start = untagged_ptr(start);
+	end = start + len;
+
 	/*
 	 * Disable interrupts.  We use the nested form as we can already have
 	 * interrupts disabled by get_futex_key.
