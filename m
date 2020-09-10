Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7769E264B0C
	for <lists+sparclinux@lfdr.de>; Thu, 10 Sep 2020 19:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgIJRUy (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 10 Sep 2020 13:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgIJRUA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 10 Sep 2020 13:20:00 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A008C061757
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 10:20:00 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g3so5452907qtq.10
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wS3Cxs+LxMo6gPPzfzs9JS4wraYUHvaNngFKImlbYPQ=;
        b=R7muKjGsMqQxjYn/v3laT3wxz696cPiiZUGTarCqWEmD8sEHzFMnpmRv1NbdWuvxUl
         ES4sa/jWMnYWk8X4X6idi0ndI491v7kNFTPa5GqC+PbSliK0PxcG7BbrKL1SGaFULExx
         kGCtyImpN4w3JYZEvlwpotauF+GyY/wqoWRoFKEJsIkkaaCf8ZEqmuepKdImBUgzQsFC
         Vc+IXldSoElxGSHRRDrr1U2IvhE0zAiCRYQ16d8EWEqzrgIPV6ZfSpzmZYP6/ZBNfv4U
         wV4KH/FXvtzAig33Lc4SwlzTJpcb6YSdw29FHxZ2Fklak2OM0YAdYreU9PkLtv7plyJk
         DE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wS3Cxs+LxMo6gPPzfzs9JS4wraYUHvaNngFKImlbYPQ=;
        b=aumydFLdC5Anvr7CqEGVk0eiBWXyQ8vFyZhmJN0ASavh/hh2/2iSeAZGbkJiidZ7VV
         31qAw/x9XbeAlBdAxcNI9OBND/KQAD8nkpioTG7y4Dsg9mWVOV5afrWetpBji6m68ZTx
         tMlzr8lGTHDx/TH+1QSpeNeAQuQi0hlpknBaTTE+brod1ZrmWS35K99paMLgr3W+9Vde
         7LS/pD9gIycRLtqpiIT/7mWwrEy0t3k5HsC68gTGI+f8mOJZiebA6x5mM7pp1ixBG0SL
         2TgDCzMaLa6Ty+36LGadyzxgpxs04hegUGGH72MZWhdhOfVWsd4C4J02BeQy9LedTUYi
         9V2w==
X-Gm-Message-State: AOAM5309wodu8Ffsm1lnAjzLJf36B3XmIfEgo8MV28dQjl+FZdfRUz/B
        b62vDNCf+882joh2/n/OZXey5A==
X-Google-Smtp-Source: ABdhPJzOK6FcVm6akWqNTL2Hu85OsyALxMrEucVBwOeXC6OwPNTX8vss/Xw7hopiKEc6u3QVNfxIcg==
X-Received: by 2002:ac8:54a:: with SMTP id c10mr9299916qth.251.1599758398248;
        Thu, 10 Sep 2020 10:19:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id x126sm6934696qkb.101.2020.09.10.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 10:19:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kGQEm-004NzL-RL; Thu, 10 Sep 2020 14:19:56 -0300
Date:   Thu, 10 Sep 2020 14:19:56 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dave Hansen <dave.hansen@intel.com>,
        John Hubbard <jhubbard@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <20200910171956.GM87483@ziepe.ca>
References: <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <20200910130233.GK87483@ziepe.ca>
 <20200910152803.1a930afc@thinkpad>
 <20200910151026.GL87483@ziepe.ca>
 <20200910190757.153319d4@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910190757.153319d4@thinkpad>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Sep 10, 2020 at 07:07:57PM +0200, Gerald Schaefer wrote:

> I might have lost track a bit. Are we still talking about possible
> functional impacts of either our current pagetable walking with s390
> (apart from gup_fast), or the proposed generic change (for s390, or
> others?)?

I'm looking for an more understandable explanation what is wrong with
the S390 implementation.

If the page operations require the invariant I described then it is
quite easy to explain the problem and understand the solution.

Jason
