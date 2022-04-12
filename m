Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930B64FDF3E
	for <lists+sparclinux@lfdr.de>; Tue, 12 Apr 2022 14:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350215AbiDLMGf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 12 Apr 2022 08:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352386AbiDLMC5 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 12 Apr 2022 08:02:57 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EB18023D
        for <sparclinux@vger.kernel.org>; Tue, 12 Apr 2022 04:00:09 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2ec0bb4b715so68237987b3.5
        for <sparclinux@vger.kernel.org>; Tue, 12 Apr 2022 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2zi2giavZdO2HMDfrc7yK4A4aR/ngLsqIJD3W77LNs=;
        b=b4v6GqYxeJjlJ1RbEQauF9GEIWimtem9DfI/ea+58BboREvflEEq0M6jErAnAoE93B
         tYuy5mJ/r4ba02CczLRQd8TmQ7CK9KY/1RfIbv6VC/vU5FzAIsre+zMd2kHi6JeMfPOF
         4fBT0F6bq2XsYtIaWNClXMgBpjhBJ9AS7/1/3qS47r77iP3+bY4fHCX9/uoSi8DAvTqG
         k/jDnzm69qk4dXs/N7H146ttsPkrszUV5cVSdNFLc0OGWTX1yWcUZvfGu8L3L3E878+9
         LZbWbMEWL706ypWKJhQXFIcNT9lcoZhbr2KfSuGPorip9ZdCMOWb/sRTFpPLw/dEIfsz
         NCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2zi2giavZdO2HMDfrc7yK4A4aR/ngLsqIJD3W77LNs=;
        b=jSbwDtp4hlXpj9a3Lru6+ebzqNQJgzF4KfXA5ERBnfmGN7nkxwQRALrhclrePg/CFI
         HG3XEgYg1K+knMBSwNwlJ0cb8IyI8G8X2E3sS/B3HID+TfX/qrfnp+abaCg1paInnMs+
         j8ftBVrcBGaDwUSh43UWUqM6Qoe7oKZnkkvX060vxHmhwq5MJSvStoSKgDMj+D8enkFD
         zcNSFyX9LPO8DOcbvHD5IAqUqUMzVtbuiCDIwFzKt036UawyN85h6DLBE/iLdP+sGLYB
         NhsWwgJWHhXCGxXDjUfeC9qppMvcnsayYZcRoBerVGeAR9zXEve8dMWos8TZzxnayHLX
         72Fg==
X-Gm-Message-State: AOAM532PS2CexvueYeLHzUNc1hHb7/sco78KMiuFk+VjTwamebLFdxwK
        +5Mi9HF0PaukbACvffE6rvHUK/LdXWQqViUoVI52Ng==
X-Google-Smtp-Source: ABdhPJwwqPNdGAbIJgV8Tw3Kjk4tMF7wq4HRILrI/52e/kefI6BLXOkH7KMdW6Q3t6UkDG+3QNDDwa3vKedsVrgXFAE=
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr30496791ywe.512.1649761208158; Tue, 12
 Apr 2022 04:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220404111204.935357-1-elver@google.com> <CACT4Y+YiDhmKokuqD3dhtj67HxZpTumiQvvRp35X-sR735qjqQ@mail.gmail.com>
In-Reply-To: <CACT4Y+YiDhmKokuqD3dhtj67HxZpTumiQvvRp35X-sR735qjqQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 12 Apr 2022 13:00:00 +0200
Message-ID: <CANpmjNPQ9DWzPRx4QWDnZatKGU96xLhb2qN-wgbD84zyZ6_Mig@mail.gmail.com>
Subject: Re: [PATCH] signal: Deliver SIGTRAP on perf event asynchronously if blocked
To:     Dmitry Vyukov <dvyukov@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, 5 Apr 2022 at 15:30, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Mon, 4 Apr 2022 at 13:12, Marco Elver <elver@google.com> wrote:
> > With SIGTRAP on perf events, we have encountered termination of
> > processes due to user space attempting to block delivery of SIGTRAP.
> > Consider this case:
> >
> >     <set up SIGTRAP on a perf event>
> >     ...
> >     sigset_t s;
> >     sigemptyset(&s);
> >     sigaddset(&s, SIGTRAP | <and others>);
> >     sigprocmask(SIG_BLOCK, &s, ...);
> >     ...
> >     <perf event triggers>
> >
> > When the perf event triggers, while SIGTRAP is blocked, force_sig_perf()
> > will force the signal, but revert back to the default handler, thus
> > terminating the task.
> >
> > This makes sense for error conditions, but not so much for explicitly
> > requested monitoring. However, the expectation is still that signals
> > generated by perf events are synchronous, which will no longer be the
> > case if the signal is blocked and delivered later.
> >
> > To give user space the ability to clearly distinguish synchronous from
> > asynchronous signals, introduce siginfo_t::si_perf_flags and
> > TRAP_PERF_FLAG_ASYNC (opted for flags in case more binary information is
> > required in future).
> >
> > The resolution to the problem is then to (a) no longer force the signal
> > (avoiding the terminations), but (b) tell user space via si_perf_flags
> > if the signal was synchronous or not, so that such signals can be
> > handled differently (e.g. let user space decide to ignore or consider
> > the data imprecise).
> >
> > The alternative of making the kernel ignore SIGTRAP on perf events if
> > the signal is blocked may work for some usecases, but likely causes
> > issues in others that then have to revert back to interception of
> > sigprocmask() (which we want to avoid). [ A concrete example: when using
> > breakpoint perf events to track data-flow, in a region of code where
> > signals are blocked, data-flow can no longer be tracked accurately.
> > When a relevant asynchronous signal is received after unblocking the
> > signal, the data-flow tracking logic needs to know its state is
> > imprecise. ]
> >
> > Link: https://lore.kernel.org/all/Yjmn%2FkVblV3TdoAq@elver.google.com/
> > Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Tested-by: Dmitry Vyukov <dvyukov@google.com>
>
> I've tested delivery of SIGTRAPs when it's blocked with sigprocmask,
> it does not kill the process now.
>
> And tested the case where previously I was getting infinite recursion
> and stack overflow (SIGTRAP handler causes another SIGTRAP recursively
> before being able to detect recursion and return). With this patch it
> can be handled by blocking recursive SIGTRAPs (!SA_NODEFER).

Thanks!


Should there be any further comments, please shout.

Thanks,
-- Marco
