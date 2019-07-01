Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFADF345DF
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 13:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfFDLsQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 07:48:16 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37323 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbfFDLsQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 07:48:16 -0400
Received: by mail-pl1-f196.google.com with SMTP id bh12so2172682plb.4
        for <sparclinux@vger.kernel.org>; Tue, 04 Jun 2019 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2lS9VXn0JOV0lrkvQPMmgSCO4r5DeMFb6G5blm/uF4=;
        b=M0DMlRQ1HKA6D9NAO0V2sm9/zYZWP+1XOjmn59ytz8n46FHwdaWXM0RmDqecELc0CD
         TyAtpGjsaLf78y28sMV5XpDdzqWkQFoLrG4JmKyB20v3AEUSZ84vFCfbahAnJbBWXTDe
         lxvooM2Tt/ajz9LaLc0YFyhDIwwZ9gPW/77cWnoFBFeW1WjBXUTE7GfRa1ThVQOHuo3s
         shP14wPYTEXFgEfcuub9qa9DcYA4fCTl4CLVznhqf/cR8S79aYCO7GCHb7p1YqEQltrO
         AQzjJKwTGzxdh+F0Gnq7lZoTrHue4pLf6ckipB1C17pl/cPtDze5tQgEM9+9n2jZCGGY
         dHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2lS9VXn0JOV0lrkvQPMmgSCO4r5DeMFb6G5blm/uF4=;
        b=QuZMQoHsiaTbig/KHe4IIwG1VfOTq2BCEh0j+FQVC7BDz2Wb1cghaL4GrCQVFQcPWr
         OYSSOxt6qDg/po4mzFh/XUDxWKqLiqPirlwNJcvDAQMBoysP/25E5LH+KoCHZZf7SPaZ
         Cbq0EeBiYy5FRyXQu7J5pSi2HVjfSwo4Li5Sp2dLS3RVNFa4D4qC6out5q+hZ5LaU/A4
         BcR+TWktDV5g2DXZyniN89pCrEdKVSb7uCKSGXG1AmadF6JPz7+V0hHNi/T4UFaVXgTa
         yygUE1PUND3M4HlTgcjjgkzC3UCLjt9pm4uSusXashKX9aQA2vmPvZTvwhg93I8m9Zzl
         Vh3g==
X-Gm-Message-State: APjAAAVaiZVFG4Hu/g6OqfEGhDbdCT3O4630Py0p8FPxApQ+1jyaWzKD
        fM1tmRm8vwmmCBboAS8yNYwDrtX2PWJ8dz8/jE9j9Q==
X-Google-Smtp-Source: APXvYqx7WlqCkdGPKLutoMBA66Kuwfxftr7iVGYrBeMeyQalyPFL29VhCLInmdVTRNyRVDkjn2/lP008/BVA4p3Szd8=
X-Received: by 2002:a17:902:bc47:: with SMTP id t7mr24049646plz.336.1559648895074;
 Tue, 04 Jun 2019 04:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <8ab5cd1813b0890f8780018e9784838456ace49e.1559648669.git.andreyknvl@google.com>
 <d74b1621-70a2-94a0-e24b-dae32adc457d@amd.com>
In-Reply-To: <d74b1621-70a2-94a0-e24b-dae32adc457d@amd.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 4 Jun 2019 13:48:03 +0200
Message-ID: <CAAeHK+w0_9QdxCJXEf=6nMgZpsb8NyrAaMO010Hh86TW75jJvw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: add noop untagged_addr definition
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 4, 2019 at 1:46 PM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 04.06.19 um 13:44 schrieb Andrey Konovalov:
> > Architectures that support memory tagging have a need to perform untagging
> > (stripping the tag) in various parts of the kernel. This patch adds an
> > untagged_addr() macro, which is defined as noop for architectures that do
> > not support memory tagging. The oncoming patch series will define it at
> > least for sparc64 and arm64.
> >
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> > Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
> >   include/linux/mm.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 0e8834ac32b7..949d43e9c0b6 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
> >   #include <asm/pgtable.h>
> >   #include <asm/processor.h>
> >
> > +#ifndef untagged_addr
> > +#define untagged_addr(addr) (addr)
> > +#endif
> > +
>
> Maybe add a comment what tagging actually is? Cause that is not really
> obvious from the context.

Hi,

Do you mean a comment in the code or an explanation in the patch description?

Thanks!

>
> Christian.
>
> >   #ifndef __pa_symbol
> >   #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
> >   #endif
>
