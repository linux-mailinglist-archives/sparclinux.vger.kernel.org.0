Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B004265EAE
	for <lists+sparclinux@lfdr.de>; Fri, 11 Sep 2020 13:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgIKLTv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 11 Sep 2020 07:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKLTe (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 11 Sep 2020 07:19:34 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFD6C061756
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 04:19:33 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w16so9472483qkj.7
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RF/fhPo5kBauAi3eDmZJgpqIrahl3Q40enwZDmyVW/Y=;
        b=MranxbqI0sbZTUHr/5nRrvvNnaOGVKUaAfIpgrguT3kotqu2/+vaLtFjLBr7Dchw8g
         JJmcJV/C0jOxv4hRKHMp+z8brOgZNv7zPlHzEFTxIGRfWe+oDWMX2pQve/8jTAvpKMiT
         7RN3juzzMtOiuIWBUDCT1BvIFCKf6bxkwXrdAtvSLUiKX/5kI+sFcR6JdpWoUm6ixgyF
         dLqTOenPUtqGXVDIBwggt4h+6OsbKY/DS4ZW5VLOTe31mPZEk/NO9CEvKD3cWUNhjl7s
         kxOAXY9+GRt4ctbpbjP727YWsJahqV0QyR6AL3DhYyp7rVFeR5dvwtqaEjOc69J99Ry7
         iGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RF/fhPo5kBauAi3eDmZJgpqIrahl3Q40enwZDmyVW/Y=;
        b=e/9f7QtONr7I+u7+H7Bpb3vzUK//yUcCyIMXXFqUIRLF8C7A2iEuU8Yp8xEV6ATsMp
         DUaCZvDNovV2Oa8Fyc7v/2PASgzXDNIv2twiEJUBCjwCGAF0Pgms0pCxfNQ/gkzGZUyj
         /yvjrtUrInwhbzMflmjjk6RW6z3pRAKN98Lu1dLs4OWBCFCrA3BStsOTIlvC9NZtXLFD
         g41rbiuF0M2Y5zPqI8et9UKeyZ0yrfTI8Z/P0DNDHDRQKLHxZLNOJOYGWzQ0l+Q9SOQB
         IccJEXhXO/kFnyH7eZ0zYXEpkbRrIQ5J+r/5dWJmzvFG32SawGjGEcUU4wSr/3xCmlmo
         rBNQ==
X-Gm-Message-State: AOAM530BuyP5+ko0qHMCTFBx4V6i5mW7NSBly1K4EVZ4gKyHKtP4PUPE
        Am71gsEF+Zmu3ehmr/O7nccHPg==
X-Google-Smtp-Source: ABdhPJzPJMV+cEWYRmvlb24Nbw7GCKp+KbSMxPhKphhah1G5lDmq4fX9f/inMOZg7Se/iCqj4A8+eA==
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr1042066qke.83.1599823172826;
        Fri, 11 Sep 2020 04:19:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id k185sm2269296qkd.94.2020.09.11.04.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 04:19:31 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kGh5W-004ktM-DO; Fri, 11 Sep 2020 08:19:30 -0300
Date:   Fri, 11 Sep 2020 08:19:30 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     peterz@infradead.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dave Hansen <dave.hansen@intel.com>,
        John Hubbard <jhubbard@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Mike Rapoport <rppt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        linux-x86 <x86@kernel.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        linux-power <linuxppc-dev@lists.ozlabs.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200911111930.GS87483@ziepe.ca>
References: <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
 <20200910211010.46d064a7@thinkpad>
 <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
 <20200910215921.GP87483@ziepe.ca>
 <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Sep 11, 2020 at 09:09:39AM +0200, peterz@infradead.org wrote:
> On Thu, Sep 10, 2020 at 06:59:21PM -0300, Jason Gunthorpe wrote:
> > So, I suggest pXX_offset_unlocked()
> 
> Urgh, no. Elsewhere in gup _unlocked() means it will take the lock
> itself (get_user_pages_unlocked()) -- although often it seems to mean
> the lock is already held (git grep _unlocked and marvel).
>
> What we want is _lockless().

This is clear to me!

Thanks,
Jason 
