Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC433CBAFE
	for <lists+sparclinux@lfdr.de>; Fri, 16 Jul 2021 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhGPRTG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 16 Jul 2021 13:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhGPRTG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 16 Jul 2021 13:19:06 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11957C061762
        for <sparclinux@vger.kernel.org>; Fri, 16 Jul 2021 10:16:08 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id j27-20020a4a751b0000b029025fb3e97502so2589320ooc.12
        for <sparclinux@vger.kernel.org>; Fri, 16 Jul 2021 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jWbVndvTFPt8BOcGSAnZdQeZBgwQ39VLXMDadBgw6kk=;
        b=kycsT8OTIWrycyqND/lL5jUMQFDjltZ92oujogdg2Ndlkp+0StM8kAIg7tLjtQfeG1
         YtQp0RLCivg5nlV/zFSc1mTULVPHjZTq7Ex+9U/i2yTDKpEG7bpkN+bJ8s8tT1JaBqwM
         y2TLzY9HoTp/Uz4id24PK7R/mXY9Jq6r81ZebQ+l6yf4sVQAbW1lEdfkLQRpnnjyDDmt
         bgikzUbY3QcdoaR5eMFhAPwFnx5Vw+ejdfPoUKSNgoBP0WsPICAy2cHDBYAdl8Ac/wYr
         kP06C8cTP2tL3t0qMqlAqnL33Dxo7e9FDTC/AFaZehjspePkLl7z/2H0fI4s4//TTHjd
         wV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jWbVndvTFPt8BOcGSAnZdQeZBgwQ39VLXMDadBgw6kk=;
        b=KNfBE9tCvzoWAX32A4OhvXZNKJRmik9OTubyfbLE4GRXEgCqMKIbILMOBwBQZtDMm0
         W3BQ+TWfl3GOq0c2PJ6xZMy9tQ2AjVUhV626MSlY5ztU9sQvihH4fQuvWsrLH5N7VsXL
         wmI4+7I0gAcdChtED6YSrIgmJFRLeUl/jot+7x3a80yho/KsZtg5tp2EqmJi7kazfIfE
         gVSFMPyTxos8NLFwLU1lr2dFCSCMKIFfOgwciNtILRP0Btr3mNL9+VChf2iT1udrj+gA
         TWpzdq/rGtnbZVa5nqb0ReZwojfkQfLydKpX9GTykn5ERYB/9YZ3WLDoQ72WcUYv/Nn6
         Jc2g==
X-Gm-Message-State: AOAM5339yfMPG6rZdmuZSUTji9q7+hVlPON29sGr5XH7rqHGZNF/oYO7
        nTFUCOrGZy4ACNbiZjSird6MwjaidlA4AFLK3Nlzow==
X-Google-Smtp-Source: ABdhPJx9gk24ziK+bUUPctrm/fDAn5x21MphrWbNdm5y/1f6NtI1GUnsZkQdW2dgVWs4fHcFQbpBeYfuinN/+cxYnXU=
X-Received: by 2002:a4a:956f:: with SMTP id n44mr8396820ooi.54.1626455767094;
 Fri, 16 Jul 2021 10:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <YIpkvGrBFGlB5vNj@elver.google.com> <m11rat9f85.fsf@fess.ebiederm.org>
 <CAK8P3a0+uKYwL1NhY6Hvtieghba2hKYGD6hcKx5n8=4Gtt+pHA@mail.gmail.com>
 <m15z031z0a.fsf@fess.ebiederm.org> <YIxVWkT03TqcJLY3@elver.google.com>
 <m1zgxfs7zq.fsf_-_@fess.ebiederm.org> <87a6mnzbx2.fsf_-_@disp2133>
 <YPFybJQ7eviet341@elver.google.com> <87tukuw8a3.fsf@disp2133>
In-Reply-To: <87tukuw8a3.fsf@disp2133>
From:   Marco Elver <elver@google.com>
Date:   Fri, 16 Jul 2021 19:15:55 +0200
Message-ID: <CANpmjNMAxk5--iAmL3fL8XpPuDDFdufu1T=r0USnO+6Rn-A95A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Final si_trapno bits
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Florian Weimer <fweimer@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, 16 Jul 2021 at 18:09, Eric W. Biederman <ebiederm@xmission.com> wrote:
> Marco Elver <elver@google.com> writes:
> > On Thu, Jul 15, 2021 at 01:09PM -0500, Eric W. Biederman wrote:
> >> As a part of a fix for the ABI of the newly added SIGTRAP TRAP_PERF a
> >> si_trapno was reduced to an ordinary extention of the _sigfault case
> >> of struct siginfo.
> >>
> >> When Linus saw the complete set of changes come in as a fix he requested
> >> that the set of changes be trimmed down to just what was necessary to
> >> fix the SIGTRAP TRAP_PERF ABI.
> >>
> >> I had intended to get the rest of the changes into the merge window for
> >> v5.14 but I dropped the ball.
> >>
> >> I have made the changes to stop using __ARCH_SI_TRAPNO be per
> >> architecture so they are easier to review.  In doing so I found one
> >> place on alpha where I used send_sig_fault instead of
> >> send_sig_fault_trapno(... si_trapno = 0).  That would not have changed
> >> the userspace behavior but it did make the kernel code less clear.
> >>
> >> My rule in these patches is everywhere that siginfo layout calls
> >> for SIL_FAULT_TRAPNO the code uses either force_sig_fault_trapno
> >> or send_sig_fault_trapno.
> >>
> >> And of course I have rebased and compile tested Marco's compile time
> >> assert patches.
> >>
> >> Eric
> >>
> >>
> >> Eric W. Biederman (3):
> >>       signal/sparc: si_trapno is only used with SIGILL ILL_ILLTRP
> >>       signal/alpha: si_trapno is only used with SIGFPE and SIGTRAP TRAP_UNK
> >>       signal: Remove the generic __ARCH_SI_TRAPNO support
> >>
> >> Marco Elver (3):
> >>       sparc64: Add compile-time asserts for siginfo_t offsets
> >>       arm: Add compile-time asserts for siginfo_t offsets
> >>       arm64: Add compile-time asserts for siginfo_t offsets
> >
> > Nice, thanks for the respin. If I diffed it right, I see this is almost
> > (modulo what you mentioned above) equivalent to:
> >   https://lore.kernel.org/linux-api/m1tuni8ano.fsf_-_@fess.ebiederm.org/
> > + what's already in mainline. It's only missing:
> >
> >       signal: Verify the alignment and size of siginfo_t
> >       signal: Rename SIL_PERF_EVENT SIL_FAULT_PERF_EVENT for consistency
> >
> > Would this be appropriate for this series, or rather separately, or
> > dropped completely?
>
> Appropriate I just overlooked them.

Full series with the 2 patches just sent looks good to me.

Thanks,
-- Marco
