Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA7B264B8E
	for <lists+sparclinux@lfdr.de>; Thu, 10 Sep 2020 19:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgIJRkL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 10 Sep 2020 13:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgIJRgA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 10 Sep 2020 13:36:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA4CC061757
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 10:35:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so9949091ejb.4
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tV9NvYryEbzez94zd9hdsCWt3FfBuGGawTOfDap0eBk=;
        b=CyoQUM+SKXH6085O6WtByg3nDuki2CTSBORvYvwm25BqShZutFnNs6mSZACayZwSEH
         qcd6gDs3XmrAOcCBysWWLpsCbEXmLRDCQnQxo0ENK46fWC+ppV/l5rSOr47qH79HuDsY
         BAC6cJAHl7u65bYmrM5WLZPBZBfoI7ltEXEKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tV9NvYryEbzez94zd9hdsCWt3FfBuGGawTOfDap0eBk=;
        b=oaIs9YQv6DS84vxygu2nJfexMFOkfFBjMoNODJTKNit1hpVAnnzhkQZlF3DopIV+mz
         0nwcbPFdNLw/6/8ffQ6qSvsUxM7iSAcfw1DtJCu7xFDxe14e3KtZomITQVveLCUcsy5c
         AaXayMTXD1iYbGfZHWAwOvyVJiZ6FqJ6J7e/fpZ8HEpcxbhS9H0I7Fus6K1CpeGzOP5P
         1r6h55WsjJp7+bAKze+dWGk1VE80s8zCrsqjD7tNt7/Wdx0l389a3QUraiffq2poCO8S
         EI/B+5igzXXaTHmk1aS8X7WffsxTGu18n1Qb3/q/6C7yq6JmZ0xCfOb4B+fbfCSMqxi/
         vDeQ==
X-Gm-Message-State: AOAM531bJfTJ5XLyS5/hHPQv6vVswJhG/CqnMyhgU35bK20eBZbTa0LT
        0vGthoj8S/fDnaCSKuHxumq4fFOy7OoYlQ==
X-Google-Smtp-Source: ABdhPJx/1SOhq/c/LEoQH3ILD0TYVaHd+MqN4NFz2fC0K/V7IP30frcwA21HtAUvm940cHvalCqw2A==
X-Received: by 2002:a17:907:37b:: with SMTP id rs27mr10671753ejb.0.1599759357332;
        Thu, 10 Sep 2020 10:35:57 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a5sm8126119edl.6.2020.09.10.10.35.55
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 10:35:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id e23so9962822eja.3
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 10:35:55 -0700 (PDT)
X-Received: by 2002:a19:7d8b:: with SMTP id y133mr4765702lfc.152.1599759354367;
 Thu, 10 Sep 2020 10:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com> <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad> <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca> <20200910093925.GB29166@oc3871087118.ibm.com>
In-Reply-To: <20200910093925.GB29166@oc3871087118.ibm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Sep 2020 10:35:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
Message-ID: <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table folding
To:     Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Sep 10, 2020 at 2:40 AM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> It is only gup_fast case that exposes the issue. It hits because
> pointers to stack copies are passed to gup_pXd_range iterators, not
> pointers to real page tables itself.

Can we possibly change fast-gup to not do the stack copies?

I'd actually rather do something like that, than the "addr_end" thing.

As you say, none of the other page table walking code does what the
GUP code does, and I don't think it's required.

The GUP code is kind of strange, I'm not quite sure why. Some of it
unusually came from the powerpc code that handled their special odd
hugepage model, and that may be why it's so different.

How painful would it be to just pass the pmd (etc) _pointers_ around,
rather than do the odd "take the address of local copies"?

                  Linus
