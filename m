Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F792266956
	for <lists+sparclinux@lfdr.de>; Fri, 11 Sep 2020 22:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgIKUFQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 11 Sep 2020 16:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIKUFO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 11 Sep 2020 16:05:14 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3412AC061757
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 13:05:14 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id a19so5528665ilq.10
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lkQcTqH4VEZ3iEgT/GD9JP5N85keOg351zxTDmOcIaI=;
        b=I9voHxb8dJ7Hpr77FARBSPzOQ+MPVMwPkwF0luH+LKCeQ2lgpDwGcralZQ0FGAYrwc
         BVvqLhsKXRb6YcR4pkKP2c34FkKNgqX6pj64qFDH7oE4338e+VgL2+G3FMKW2FPuHDYW
         MOKS2lLDde3qke8PUPdIqAr1Lc/lVhX7oeWxLzC+beM8ycXu9dGfsOKsCsNwUr3jtzLk
         5mkQWm2rxczvKT5Nvh/ZTiFFTOW6UPc+/aWP2W0F+b+rADWmR1dpfaY8WBd7QI32TkZL
         3etlwSquQXvam+E6vRIK7GF1RHnaGGDJvV4v5yGgCZRyA8h08sygo6M84bfQ7xFbLqxr
         cOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lkQcTqH4VEZ3iEgT/GD9JP5N85keOg351zxTDmOcIaI=;
        b=r5PUoWSTI74XP0Y9TYpDmWkZGg1cdZMaRQELWq6+IMVouGVIha8hRG5bFyWBvrhJHn
         QvPgIGVfMDVEMOSkJ30Lo/ixv6Fs5FBdL/OBBd4puKlYW8XCwgbxrPpaXwybiavWAZWh
         N0r8stCgFnJ8GmtL1OjBI435gN6oIyxnSe6/5LyBq1UQ+88MKaEJ87/6FGzr6lNrRKuF
         /kOhzX/9EEihAMlmHFeJ84/WEczh3fMTmt+zlUf2j0+Ek2I4iUg5ldsECyPXcEoufqIu
         qhBFrlcAA/Vbqd4K40glOUZftnmrUG43YbcL+MiTjQw7cXvRPwE7wKzIEUTLEclUUUQf
         vA/A==
X-Gm-Message-State: AOAM532YJ/2p/ryXR46YNqNE4EymWKR5sIPTeFon/U79C0y5gRtR86PR
        SMLcaW7qUl+v84ZSE6c8rq2WqA==
X-Google-Smtp-Source: ABdhPJwYA/rzSMaXI+K0i70ikIv3tpbBn8J3glPlyteqvWFcMv0jpWCYFK3IcfJC1YHXSV5pVRNS1g==
X-Received: by 2002:a92:c791:: with SMTP id c17mr3247679ilk.107.1599854713521;
        Fri, 11 Sep 2020 13:05:13 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id j62sm1648212iof.53.2020.09.11.13.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 13:05:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kGpIF-005AGU-JV; Fri, 11 Sep 2020 17:05:11 -0300
Date:   Fri, 11 Sep 2020 17:05:11 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@intel.com>,
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
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH] mm/gup: fix gup_fast with dynamic page table folding
Message-ID: <20200911200511.GC1221970@ziepe.ca>
References: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
 <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
 <20200911194000.GB1221970@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911194000.GB1221970@ziepe.ca>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Sep 11, 2020 at 04:40:00PM -0300, Jason Gunthorpe wrote:
> These would probably be better as static inlines though, as only s390
> compiles will type check pudp like this.

Never mind, it must be a macro - still need brackets though

Jason
