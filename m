Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C49E2654A0
	for <lists+sparclinux@lfdr.de>; Thu, 10 Sep 2020 23:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgIJV7d (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 10 Sep 2020 17:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgIJV7Z (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 10 Sep 2020 17:59:25 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E06CC061573
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 14:59:24 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id o16so7740050qkj.10
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 14:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RBvq+OOZpOHz7JVY1b9A66StBw0lh3lNMqv01GrhYLE=;
        b=XGa+1wtiJPkykbDWCfESpB/MvI1RBtyH5dvDVcm14/sCZlt15vU51OB/uvdf8x4ZQa
         kQYpCVOD4ExSpYHPDOteT1PnQSYpcVDio5gc9zCACzdojqAlh6SwMKMRY4M2jHdso8pC
         o1SCOD1e7CU5P94+lNcRXuJe4cmvhxIpYDyRzl6AlKYd1iDVs+vkgkgFbjeoHTVRj1ST
         1yBIDBY0FM4tBgJQZxvv5cNNGM4bu8ROu2teyjXMmbtUrBhHsMF7QLWMp1o0b0abexEB
         POsgnb1rV2g2SN+GvDFk4nRwxlB7GR1NoIs/6jzxofpKRolvj4glG/Y8VK7FoDyzwgcR
         PZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RBvq+OOZpOHz7JVY1b9A66StBw0lh3lNMqv01GrhYLE=;
        b=UN39LdXJGWRQSPeW4T7j4wRdiSobXqOMd7ciIyeb/wzBRGoFc6pHkmtlysuNmiEcFH
         R2VcybkAaBPSTozDn2SKfYMGW9IyHqlnlHf5bHJW3IJwmEARNMx5ArGTHiZxgmXOpk0Q
         4+noo7MQJ+Ti9wEuMC4Y60WNpSfRqjBVhrqJY5iID8x+T/PGOflQ5sN6kwhebqpzi+Hy
         xOOiTU8IC4z0UMUbk5wR9XKgqf+W+3AT9FpRmLpDXopGWTQm/Lb9PSXS2SDGw7+yrYEg
         tt9/84dwx/JAY0IIFue3sG/gwNm77g2krl9D2UgdcHaZw6F2KlWg1iT7mXzOpNUrvuaE
         fDIg==
X-Gm-Message-State: AOAM531egA6KwLx5gofWKEXsa8iq2RypP1eB8k/4egxNLXdCc/e8Js6f
        ivL1ZpmXMUSuDhVf3JC+Lkn7bQ==
X-Google-Smtp-Source: ABdhPJzg7+n4mPFpbsKeMom2f+wjc9snf2MnK4gNUYWrTQr71TGF5AizTC8kCaHgs9VlFTOngDCTww==
X-Received: by 2002:ae9:c015:: with SMTP id u21mr10626371qkk.268.1599775163249;
        Thu, 10 Sep 2020 14:59:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id j88sm32038qte.96.2020.09.10.14.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 14:59:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kGUbB-004RUb-H7; Thu, 10 Sep 2020 18:59:21 -0300
Date:   Thu, 10 Sep 2020 18:59:21 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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
        Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20200910215921.GP87483@ziepe.ca>
References: <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
 <20200910211010.46d064a7@thinkpad>
 <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Sep 10, 2020 at 12:32:05PM -0700, Linus Torvalds wrote:
> Yeah, I get hung up on naming sometimes. I don't tend to care much
> about private local variables ("i" is a perfectly fine variable name),
> but these kinds of somewhat subtle cross-architecture definitions I
> feel matter.

One of the first replys to this patch was to ask "when would I use
_orig vs normal", so you are not alone. The name should convey it..

So, I suggest pXX_offset_unlocked()

Since it is safe to call without the page table lock, while pXX_offset()
requires the page table lock to be held as the internal *pXX is a data
race otherwise.

Patch 1 might be OK for a stable backport, but to get to a clear
pXX_offset_unlocked() all the arches would want to be changed to
implement that API and the generic code would provide the wrapper:

#define pXX_offset(pXXp, address) pXX_offset_unlocked(pXXp, *(pXXp), address)

Arches would not have a *pXX inside their code.

Then we can talk about auditing call sites of pXX_offset and think
about using the _unlocked version in places where the page table lock
is not held.

For instance mm/pagewalk.c should be changed. So should
huge_pte_offset() and probably other places. These places might
already be exsting data-race bugs.

It is code-as-documentation indicating an unlocked page table walk.

Now it is not just a S390 story but a change that makes the data
concurrency much clearer, so I think I prefer this version to the
addr_end one too.

Regards,
Jason
