Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFFB2A0F97
	for <lists+sparclinux@lfdr.de>; Fri, 30 Oct 2020 21:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgJ3Ug6 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 30 Oct 2020 16:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgJ3Ug5 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 30 Oct 2020 16:36:57 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB11C0613CF
        for <sparclinux@vger.kernel.org>; Fri, 30 Oct 2020 13:36:57 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o18so7992533edq.4
        for <sparclinux@vger.kernel.org>; Fri, 30 Oct 2020 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
        b=J8d/YD59wQ/au5l1BQ7ue2vwfU1yPmEzaWIbs72/a3aDX73KGLSsh/e6e4T2ilr+m6
         v7YctKloyJWKSYk1q7y81pi983c4f8E7/f/kLdP0CFwMkO7uyjtkdfJgwTbIAUd3yTgV
         b5YrSxtLonkg9fnewHN7YslOk1fl6e5oIhge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
        b=gXrG6BwlLjXrMHrZqonXt5iUqfSj9FFP6Jr7LH9CAiwEwWMTpwZfT97KWCBEbgFqXN
         h2ZULD6GvtiEcYgNwSreIBHx+NrZF/PnbxtVJ5eE+xxsCo9YTL8lLTM4PYHeSRWZXjdg
         wDaBycwilZ/eydA4n75oEf+8gf2FeJJYHjTaFFuzfAqet+9nopi2OkFoLu1rH0bfauhf
         NzZ5C3kHb+Nr2KUiX9Zju2hBfephGSBAvISRv9g5rhOf6F6K+1lhqIgLYzjFB/Mz7TSP
         da3mSvCqE40Q4sw/sVQSQ+aTjtWPvYe5MU6mnR3Z874aFdmaOi3HPuRNmTDYvgLwHESC
         KYxQ==
X-Gm-Message-State: AOAM533Fdkt3A0aNdgzlbLQwBVLrH0NrKhXIubsV3O4EYsfZX2KoqouH
        oaO7Hul5VwL4V6aZ0YSltLqWf6iJ3tH4zw==
X-Google-Smtp-Source: ABdhPJzX2MfIuoe0Ks8Xo/fgBaygvr3Wz8H3+BLw4TM868I5KUCiBtXJNwmKmrGZHDFag+hDiuS0Pg==
X-Received: by 2002:a05:6402:2d7:: with SMTP id b23mr4276308edx.196.1604090215722;
        Fri, 30 Oct 2020 13:36:55 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id h24sm309953ejg.15.2020.10.30.13.36.55
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 13:36:55 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id w25so8007843edx.2
        for <sparclinux@vger.kernel.org>; Fri, 30 Oct 2020 13:36:55 -0700 (PDT)
X-Received: by 2002:a2e:760a:: with SMTP id r10mr1661953ljc.421.1604089720167;
 Fri, 30 Oct 2020 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de> <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de> <87blgknjcw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87blgknjcw.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 30 Oct 2020 13:28:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic & friends
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Oct 30, 2020 at 2:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But then we really should not name it kmap_local. 'local' suggests
> locality, think local_irq*, local_bh* ... kmap_task would be more
> accurate then.

So the main reason I'd like to see it is because I think on a
non-highmem machine, the new kmap should be a complete no-op. IOW,
we'd make sure that there are no costs, no need to increment any
"restrict migration" counts etc.

It's been a bit of a pain to have kmap_atomic() have magical side
semantics that people might then depend on.

I think "local" could still work as a name, because it would have to
be thread-local (and maybe we'd want a debug mode where that gets
verified, as actual HIGHMEM machines are getting rare).

I'd avoid "task", because that implies (to me, at least) that it
wouldn't be good for interrupts etc that don't have a task context.

I think the main issue is that it has to be released in the same
context as it was created (ie no passing those things around to other
contexts). I think "local" is fine for that, but I could imagine other
names. The ones that come to mind are somewhat cumbersome, though
("shortterm" or "local_ctx" or something along those lines).

I dunno.

              Linus
