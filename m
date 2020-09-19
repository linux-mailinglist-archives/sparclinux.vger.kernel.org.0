Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E873427102C
	for <lists+sparclinux@lfdr.de>; Sat, 19 Sep 2020 21:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgISTUq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 19 Sep 2020 15:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgISTUq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 19 Sep 2020 15:20:46 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B28C0613CE
        for <sparclinux@vger.kernel.org>; Sat, 19 Sep 2020 12:20:45 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n22so9205460edt.4
        for <sparclinux@vger.kernel.org>; Sat, 19 Sep 2020 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
        b=SNvzyY/D28nrQ/9in1B6Dzi002SQEpeIWQ8e1hzmI9hVRDCDcHjzeJE8AlbYJKjj8B
         G7NnpY7h0luEeygyoDxqLDk2AWGbQCdyloo3Y9XIxWLvxZdXjZ/NeK2kaD/mL0YWoior
         T+0jhpZUK76WT2Sz7na41qAPiBNog2OUpnoIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
        b=MaoUP25BmufqJ+yhoIsVoibCegy43NiRI46u7H5KuufzWWZ7teD/ZNGYa+rxt61fpx
         42oE3gy2/hjH0xu+rGoyR6+UmStG0b8eyTBomwPFdjv3/k9xI/Pr/0y1w9c13Mlf7kj+
         6b0O/VrV1peapH7FbV9YH38fcBdyNmgciu96tZ+LppBNdyATfVG18H1dHbqdntwQ2YCD
         HUq+GVDSbOIVUVM/85OoXjIffOuhwv2YfAwNw2use6ZNNmo5CGVKBz0WLQuMGgOV+99T
         fGcALHfTBioGVbbJHkRQWU/Ta1Wxqi8g6TRbjh4heWjvnSKS9mFhuILodwgj2sJji/Tn
         9pyA==
X-Gm-Message-State: AOAM533xu9Oo6NgYkIaBi5XOZ1qKxyOTsESjgCWp3d0RWTcdarU6gEi1
        fZGoSuJa/JvsLPYh9xcN4Xh2RuHPujfBCw==
X-Google-Smtp-Source: ABdhPJx2ESXafvc9YRCF12L0CH/8wRvzYPyoDcKF38Hs+5HF0MtrCbPKgA7MOu57ODs5a9+gpkxaDA==
X-Received: by 2002:aa7:d891:: with SMTP id u17mr39904348edq.188.1600543244155;
        Sat, 19 Sep 2020 12:20:44 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id r8sm4854100edy.87.2020.09.19.12.20.43
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 12:20:43 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id w5so8826309wrp.8
        for <sparclinux@vger.kernel.org>; Sat, 19 Sep 2020 12:20:43 -0700 (PDT)
X-Received: by 2002:a19:8907:: with SMTP id l7mr12464193lfd.105.1600542797553;
 Sat, 19 Sep 2020 12:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de> <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <20200919173906.GQ32101@casper.infradead.org>
In-Reply-To: <20200919173906.GQ32101@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 19 Sep 2020 12:13:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sat, Sep 19, 2020 at 10:39 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> My concern with that is people might use kmap() and then pass the address
> to a different task.  So we need to audit the current users of kmap()
> and convert any that do that into using vmap() instead.

Ahh. Yes, I guess they might do that. It sounds strange, but not
entirely crazy - I could imagine some "PIO thread" that does IO to a
page that has been set up by somebody else using kmap(). Or similar.

                Linus
