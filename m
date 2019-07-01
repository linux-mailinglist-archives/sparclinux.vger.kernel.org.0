Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E52954E06
	for <lists+sparclinux@lfdr.de>; Tue, 25 Jun 2019 13:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfFYL4Q (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 25 Jun 2019 07:56:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44876 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732359AbfFYL4Q (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 25 Jun 2019 07:56:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id x47so17967889qtk.11
        for <sparclinux@vger.kernel.org>; Tue, 25 Jun 2019 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fvKANBJdXNXYIeZ/L8y6ph5Ezo3tgbjUcpe/Mc2NV2o=;
        b=EJRqkA+Wa+2yuhExyLU8Eail2cNMSKRlyq+nyaUncHcGsgxKcs1Sr27rWWPyQ3UTrB
         cMuPzb9Z50gDAZFEwVZrXYSwVpLDqhyoJKVcX3zqSCKfqGnqquaMARKFxeOFyW8rB9v8
         jr8CU8j5ySeuXjYBbGTSI57V744cpPQESxf93yY5iy18Va9ZEqkNrNrZ0wCGg02RJ3JA
         r5NbagwGrwXFZDv3ukSXLA1uRvHbeXlvc3o0PAo+oEEBwferAW9/XgegyzdhnpEkAbuO
         8J0rVpLZNN7V7DMRLZuQKxHv2O074zq201ScyzNZLnpy9zB3grhcnmsth2ZOqQC4k+TL
         yUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fvKANBJdXNXYIeZ/L8y6ph5Ezo3tgbjUcpe/Mc2NV2o=;
        b=H+/gmNEHb9ciNgY7qp8dmJYYefXd2BYuQbELUWWYa+dtB8JpYKLaUFLEBQ5JV/lMjF
         E0HItrmG6MQ4MdlcxQNKFhlyRCUvEDPG2z2aAOymz17A04lQVtt2DcsJLbR4NvJtLfXO
         gL/WJ9R2zFZQTSejJtU6RjOYgpJssXej+r6xdbwVbT9LdyJ0sTgWMd2C7nTSdXPg0BvT
         ACvsNLLA/G7K7Fg5dPjfOzwo3bJtkEiqQnopM6s55isBggp9P52+WSp2uKcFLCiLue8q
         w+id0aXFYZLOHmJQdDprY52UUS4KvSSWUL61qFz1bDP8sG4DMCNYCHFzKw/EMbvAiRu0
         XtLA==
X-Gm-Message-State: APjAAAU37ei2PSl8Lcz5DUdRx8hlKT60x8jr77qvhenLg3lMTtA50Bm7
        e7E5aImwGh5xhYiT4Hz0HLvtFuNQdM6nxQ==
X-Google-Smtp-Source: APXvYqyDewrQnE99HjPqs/AAVHvyzq2HO2LnRgTekknR3UF/nZYhm98dWnU6mW2wKUuKLbin6gnbcg==
X-Received: by 2002:ac8:1a1c:: with SMTP id v28mr129005789qtj.270.1561463774976;
        Tue, 25 Jun 2019 04:56:14 -0700 (PDT)
Received: from ziepe.ca (209-213-91-242.bos.ma.meganet.net. [209.213.91.242])
        by smtp.gmail.com with ESMTPSA id g2sm6682374qkm.31.2019.06.25.04.56.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 04:56:13 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hfk3Z-0000yk-Gl; Tue, 25 Jun 2019 08:56:13 -0300
Date:   Tue, 25 Jun 2019 08:56:13 -0300
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
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages* implementations
Message-ID: <20190625115613.GB3711@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-12-hch@lst.de>
 <20190621144131.GQ19891@ziepe.ca>
 <20190625075650.GF30815@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625075650.GF30815@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 25, 2019 at 09:56:50AM +0200, Christoph Hellwig wrote:
> On Fri, Jun 21, 2019 at 11:41:31AM -0300, Jason Gunthorpe wrote:
> > >  static bool gup_fast_permitted(unsigned long start, unsigned long end)
> > >  {
> > > -	return true;
> > > +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;
> > 
> > The ?: is needed with IS_ENABLED?
> 
> It shouldn't, I'll fix it up.
> 
> > I'd suggest to revise this block a tiny bit:
> > 
> > -#ifndef gup_fast_permitted
> > +#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
> >  /*
> >   * Check if it's allowed to use __get_user_pages_fast() for the range, or
> >   * we need to fall back to the slow version:
> >   */
> > -bool gup_fast_permitted(unsigned long start, int nr_pages)
> > +static bool gup_fast_permitted(unsigned long start, int nr_pages)
> >  {
> > 
> > Just in case some future arch code mismatches the header and kconfig..
> 
> IS_ENABLED outside a function doesn't really make sense.  But I'll
> just life the IS_ENABLED(CONFIG_HAVE_FAST_GUP) checks into the two
> callers.

I often see '#if IS_ENABLED(CONFIG_X)', IIRC last I looked at that, it
was needed because the usual #ifdef CONFIG_X didn't work if the value
was =m?

Would be interested to know if that is not the right way to use
kconfig

Jason
