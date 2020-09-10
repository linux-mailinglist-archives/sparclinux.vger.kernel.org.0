Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7594F264F02
	for <lists+sparclinux@lfdr.de>; Thu, 10 Sep 2020 21:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgIJTcx (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 10 Sep 2020 15:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgIJTcb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 10 Sep 2020 15:32:31 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93856C061757
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 12:32:26 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p9so10445064ejf.6
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTbGWidANXm2pjjCI9iaMQBY/df45EdumvXop+9a4ao=;
        b=gkhGKJWFcLTHyB5x5aFfN6rnXH8dCRqQWjJKd9NZmHZK/NC/oX0q6HVDmBmeekhRv6
         GTPYMsgUuX5KTeHU91CyIJtiMizZNYrRnX9QG0ENhdKweAOaB0W4mGxVSrji+PC28UP6
         VshPJp7YLq+DwXcjz/A/kXWDuc/ae+MhCxRmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTbGWidANXm2pjjCI9iaMQBY/df45EdumvXop+9a4ao=;
        b=nhG9KCTNc06AsPx8bTzWkVlmT/U1ANSU4NE7D0rCVz/4i6Y49EhMWGah25zjUyNFe1
         aPRlcE+dMCGXgQpf58f1Lj04RTP9eaAm7mKuzckoRhC3z9tug1fDYCZFgbcSw7w7z+1l
         ajmiCy2dUw7vhAXIQPCYbOyFxoFBNwI/DUfBXXNF+miCK5MbOy7UaYA+kNZZHdyN0D0U
         2zCN0eK8qjg4Eb0NSVyzDohy7yBFj1kzair7OAoLpluIItgDQZLeEBqVjLtwBNwmAPXC
         UbAtQcgw0fEiuWMez3+yYqXTVrL6eildws5hfTu8yCmWNn5hQOrLZSpe4l26xS3k0uo+
         7LgQ==
X-Gm-Message-State: AOAM531acyHwDLQkbtIl/xNEfiNTPwiJ6FzJkSwo07CYQvsMoQby+HPO
        LuzJwycRCkmd0uzLXvbwFsjHPbycYckM5A==
X-Google-Smtp-Source: ABdhPJytHnl+XyyyWg1RprX9nrs9MFYnR8jNAOIZHew2OpVJogZdeIqhIdNF2Rqm1kMuz/C8hGnt1w==
X-Received: by 2002:a17:906:8143:: with SMTP id z3mr10217307ejw.323.1599766343931;
        Thu, 10 Sep 2020 12:32:23 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id d24sm8307307edp.17.2020.09.10.12.32.22
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 12:32:23 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id e23so10450494eja.3
        for <sparclinux@vger.kernel.org>; Thu, 10 Sep 2020 12:32:22 -0700 (PDT)
X-Received: by 2002:a2e:7819:: with SMTP id t25mr5043564ljc.371.1599766341582;
 Thu, 10 Sep 2020 12:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com> <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad> <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com> <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca> <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
 <20200910211010.46d064a7@thinkpad>
In-Reply-To: <20200910211010.46d064a7@thinkpad>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Sep 2020 12:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
Message-ID: <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table folding
To:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Sep 10, 2020 at 12:11 PM Gerald Schaefer
<gerald.schaefer@linux.ibm.com> wrote:
>
> That sounds a lot like the pXd_offset_orig() from Martins first approach
> in this thread:
> https://lore.kernel.org/linuxppc-dev/20190418100218.0a4afd51@mschwideX1/

I have to admit to finding that name horrible, but aside from that, yes.

I don't think "pXd_offset_orig()" makes any sense as a name. Yes,
"orig" may make sense as the variable name (as in "this was the
original value we read"), but a function name should describe what it
*does*, not what the arguments are.

Plus "original" doesn't make sense to me anyway, since we're not
modifying it. To me, "original" means that there's a final version
too, which this interface in no way implies. It's just "this is the
value we already read".

("orig" does make some sense in that fault path - because by
definition we *are* going to modify the page table entry, that's the
whole point of the fault - we need to do something to not keep
faulting. But here, we're not at all necessarily modifying the page
table contents, we're just following them and readign the values once)

Of course, I don't know what a better name would be to describe what
is actually going on, I'm just explaining why I hate that naming.

*Maybe* something like just "pXd_offset_value()" together with a
comment explaining that it's given the upper pXd pointer _and_ the
value behind it, and it needs to return the next level offset? I
dunno. "value" doesn't really seem horribly descriptive either, but at
least it doesn't feel actively misleading to me.

Yeah, I get hung up on naming sometimes. I don't tend to care much
about private local variables ("i" is a perfectly fine variable name),
but these kinds of somewhat subtle cross-architecture definitions I
feel matter.

               Linus
