Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9007266519
	for <lists+sparclinux@lfdr.de>; Fri, 11 Sep 2020 18:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgIKQx0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 11 Sep 2020 12:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgIKQwO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 11 Sep 2020 12:52:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBCFC061573
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 09:52:14 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so12968227ljk.8
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymUunqCLw2vPuQ1VbXcUDi5LPgcqHOLwtMhV+h1hP00=;
        b=LzixW8IE64pueJHPc4pkVfB4hu8uL7V9KR6+6qOQDiBrSui1M4vSI9xeqysgklBESL
         0IQ4jxvW89dAuyt0txhLnLuupNLcl3TzUTNbKM8yk1mUHFyRH5GgOM7DPBaXlmnovHXl
         RwxBgeTE5qnMUevVAeinQ8lEe8Rzs7ehh51xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymUunqCLw2vPuQ1VbXcUDi5LPgcqHOLwtMhV+h1hP00=;
        b=RPuMiy3PGayWMzg7nsb96P/pbWhZ7jmhXkrkgi+VcCxcCuY/uslptyViC5byLQ02Xy
         wS5GRW4xPt7+tIuxpjGfxlSvGBIgV8mfCNZWcV6Ax1cszv1abincdjn2Qzpj/qdJxR1G
         Wr8hPC+Rf2StLYqGnt6wbLrDcjc+tp9thspNgjbjLhniJHM8vs1B3GZ7j5eEhm5MYL/4
         tpJ6MGlnqgAum9smbMJS1gZXlPvkBNhl6AVWTQDzn0DUMU0KX3FLdnH3cxZpDJ4CvzDg
         q5bboE/dicOzE+mpFW6JJoYb7v35M5lmRsolpGASFS89/dpfe+eR+EJcCljhc6jzMBl6
         PZxw==
X-Gm-Message-State: AOAM532w3VDgYntY9sMMmPO2+IsaKoCngZeVgNYwdkpUCCiFBmyYCkMM
        a8KjP0/yCdR/ps+IpBkdsZPTUNhxHmXOwQ==
X-Google-Smtp-Source: ABdhPJw36sv7PL5cacdv7doOczTXCenEylnV1cU/I3kyz+w+m+ewZ2vXwWIWouWVOo+DuWuwsHFvjQ==
X-Received: by 2002:a2e:a175:: with SMTP id u21mr1059920ljl.7.1599843132522;
        Fri, 11 Sep 2020 09:52:12 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 8sm145866lfl.102.2020.09.11.09.52.12
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 09:52:12 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id v23so13056425ljd.1
        for <sparclinux@vger.kernel.org>; Fri, 11 Sep 2020 09:52:12 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr585120lfg.344.1599842749970;
 Fri, 11 Sep 2020 09:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad> <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com> <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca> <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
 <20200910221116.GQ87483@ziepe.ca> <20200911121955.GA10250@oc3871087118.ibm.com>
In-Reply-To: <20200911121955.GA10250@oc3871087118.ibm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Sep 2020 09:45:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiEUD_XvNnXysYsKiT4B3SajWbZ4VKY3jYk-17EEaaiA@mail.gmail.com>
Message-ID: <CAHk-=wiiEUD_XvNnXysYsKiT4B3SajWbZ4VKY3jYk-17EEaaiA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table folding
To:     Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Sep 11, 2020 at 5:20 AM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> What if the entry is still pud_present, but got remapped after
> READ_ONCE(*pudp)? IOW, it is still valid, but points elsewhere?

That can't happen.

The GUP walk doesn't hold any locks, but it *is* done with interrupts
disabled, and anybody who is modifying the page tables needs to do the
TLB flush, and/or RCU-free them.

The interrupt disable means that on architectures where the TLB flush
involves an IPI, it will be delayed until afterwards, but it also acts
as a big RCU read lock hammer.

So the page tables can get modified under us, but the old pages won't
be released and re-used.

                Linus
