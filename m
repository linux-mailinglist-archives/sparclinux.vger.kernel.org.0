Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54ADD2DB494
	for <lists+sparclinux@lfdr.de>; Tue, 15 Dec 2020 20:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgLOTjE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Dec 2020 14:39:04 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:41086 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgLOTjC (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 15 Dec 2020 14:39:02 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 5F4B18065E;
        Tue, 15 Dec 2020 20:38:02 +0100 (CET)
Date:   Tue, 15 Dec 2020 20:38:00 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Marco Elver <elver@google.com>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        sparclinux <sparclinux@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] futex: mark futex_detect_cmpxchg() as 'noinline'
Message-ID: <20201215193800.GA1098247@ravnborg.org>
References: <20190307091514.2489338-1-arnd@arndb.de>
 <X9S28TcEXd2zghzp@elver.google.com>
 <87czzeg5ep.fsf@nanos.tec.linutronix.de>
 <CAK8P3a0LWjNgwm605TM4dKCsn078X7NC3sEfdBSgcMNEocQ5iA@mail.gmail.com>
 <CAJF2gTRLEbBfZJ7Y6UNOMq-cwG5OYRW=+8Pfauz6v6R8ntBjYA@mail.gmail.com>
 <CAK8P3a3+WaQNyJ6Za2qfu6=0mBgU1hApnRXrdp1b1=P7wwyRUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3+WaQNyJ6Za2qfu6=0mBgU1hApnRXrdp1b1=P7wwyRUg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=KZstDQ4antaxc6hZ8AEA:9
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Arnd,

On Tue, Dec 15, 2020 at 12:26:10PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 15, 2020 at 7:09 AM Guo Ren <guoren@kernel.org> wrote:
> > On Mon, Dec 14, 2020 at 9:15 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > I had a look at what other architectures always implement
> > > futex_atomic_cmpxchg_inatomic() or can use the asm-generic non-SMP version,
> > > and I found that it's pretty much all of them, the odd ones being just sparc32
> > > and csky, which use asm-generic/futex.h but do have an SMP option,
> > > as well as xtensa
> > >
> > > I would guess that for csky, this is a mistake, as the architecture is fairly
> > > new and should be able to implement it. Not sure about sparc32.
> >
> > The c610, c807, c810 don't support SMP, so futex_cmpxchg_enabled = 1
> > with asm-generic's implementation.
> > For c860, there is no HAVE_FUTEX_CMPXCHG and cmpxchg_inatomic/inuser
> > implementation, so futex_cmpxchg_enabled = 0.
> >
> > Thx for point it out, we'll implement cmpxchg_inatomic/inuser for C860
> > and still use asm-generic for non-smp CPUs.
> 
> Sounds good to me.
> 
> With that, I would suggest we actually remove the -ENOSYS fallback
> for arch_futex_atomic_op_inuser() and futex_atomic_cmpxchg_inatomic()
> in asm-generic/futex.h as well as the HAVE_FUTEX_CMPXCHG Kconfig
> symbol, plus these additional fixups:
> 
> - for xtensa and mips configurations without ll/sc, fall back to the
>   asm-generic version. These are all uniprocessor, while the
>   corresponding SMP machines have a working
>   arch_futex_atomic_op_inuser().
> 
> - Disable SMP support for sun4m/sun4d. From the historic git
>   tree, it's unclear how well this ever worked, and very few machines
>   of this class ever existed
Yeah, I have collection of sparc32 machines that I played around with
once. Including one sun4d that I brought from a friendly Linux fellow in
the UK. But somehow I lost interest as this is all very nice machines
but not useful for anything real work.

I think we would be better served dropping support for sun4m and sun4d
from the kernel.

Last I suggested deleting sun4m/sun4d the argument to keep sun4m was that
QEMU supports sun4m - which is a good argument for sun4m. I dunno what
would be needed to migrate QEMU to LEON, see below.

> 
> - Mark SMP for LEON as temporarily broken. As I see in the LEON
>   patch set, they have changes to enable compare-and-swap-atomic
>   instructions unconditionally, as all SMP Leons have those and
>   seem to require this support already for other things.
LEON on the other hand could have some nice future. They are right now
stuck on an older kernel and someone that was motivated should be able
to get LEON4 running on latest upstream.
We had it working in the past - but is was around the time I lost my
sparc interest and no-one jumped in to move it much more forward.

So in other words - no complains for the plan you outline.

	Sam
