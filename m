Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C343E3724C9
	for <lists+sparclinux@lfdr.de>; Tue,  4 May 2021 06:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhEDEEI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 May 2021 00:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbhEDEEG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 May 2021 00:04:06 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDAAC061761
        for <sparclinux@vger.kernel.org>; Mon,  3 May 2021 21:03:12 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id y10so5343421ilv.0
        for <sparclinux@vger.kernel.org>; Mon, 03 May 2021 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=56mc9V9A73cEiKQwEt/CmT2tfj/Xb7ZTWRyNvK3LPcU=;
        b=sjWwmwPLHvAZ5OYHc8laaQYJ21h6DUy3a/1ZbzgvzYBL1ettIr/V1Cda+PHn6Ur1bg
         2TNC/juaaivWrbPCDKEXruL5l+jEg2iWLD2viU7ONt/7oMJQxYhKwYMC8toQQ8BymCah
         pDHDsCeU1JtG7utkSDDiS3o3kQmYwjw7y7jdBAVwmZgNqHYlXRcsQdh/zTWFLMRkZhqe
         khaOLGwoJ9kaQ0L5KF7nt2PfuwSqsy5zvq6NUna1Y+LUuLXlCpTPh66tMZU/dtKPCe6t
         XXDjme+ultGz/SXeYKpqZ1Omm+KnStWrmCtnr4HshaFWTL3YHKT4LhLCohAbniuX5wPv
         WNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56mc9V9A73cEiKQwEt/CmT2tfj/Xb7ZTWRyNvK3LPcU=;
        b=OcDVZV+PJIw9nUXYi29+dFCrBUN2yAPTrEolu+swfkP9CN10A6orKtaDqeDPI622SZ
         6zECm4+dPeuaZL5WzN9TRGgE6fEND5u5Aa0SNhmqc0gR2gt/DqhPFWgHlpRK8HjDEUdK
         CBkKtJU05jg+sv95wVO3B8AC2mKPYN4SBNo66ODk5JBix3eI9SJ/3bwDDOC0qWkeFFXZ
         Rm4f4GWB0zRT4dv1M2J0fxgQG6wFYNOLSTuGp5ufVIh9cKHeSD8d6zqYBYoHV6psx+at
         REjExaJfEc+HMmCvK39DfZHLm6nB2hJlI+xn19d+oeP/HHNGkpPtO5nc2I8zLrDqKbsj
         xmQA==
X-Gm-Message-State: AOAM531mbesbkPoGpxa1ycr6kkcGFWjzSimS9DAtTLqw1HSIKppVOo4H
        cNXWe/4i9ApQSR10Sn1qaQJMTOAdkodtASoC1AokSQ==
X-Google-Smtp-Source: ABdhPJxYw4qW/PxhIAcTsJBYVxgjOPDbZGLD0/ZW+c9jDDL5xLTlCYuGYFR46HXp51APom4CyuALzoxPZmKV/tvT+ME=
X-Received: by 2002:a05:6e02:13d3:: with SMTP id v19mr18182359ilj.56.1620100991437;
 Mon, 03 May 2021 21:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <m14kfjh8et.fsf_-_@fess.ebiederm.org> <20210503203814.25487-1-ebiederm@xmission.com>
 <20210503203814.25487-10-ebiederm@xmission.com> <m1o8drfs1m.fsf@fess.ebiederm.org>
 <CANpmjNNOK6Mkxkjx5nD-t-yPQ-oYtaW5Xui=hi3kpY_-Y0=2JA@mail.gmail.com> <m1lf8vb1w8.fsf@fess.ebiederm.org>
In-Reply-To: <m1lf8vb1w8.fsf@fess.ebiederm.org>
From:   Peter Collingbourne <pcc@google.com>
Date:   Mon, 3 May 2021 21:03:00 -0700
Message-ID: <CAMn1gO7+wMzHoGtp2t3=jJxRmPAGEbhnUDFLQQ0vFXZ2NP8stg@mail.gmail.com>
Subject: Re: [PATCH 10/12] signal: Redefine signinfo so 64bit fields are possible
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Marco Elver <elver@google.com>, Arnd Bergmann <arnd@arndb.de>,
        Florian Weimer <fweimer@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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

On Mon, May 3, 2021 at 8:42 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Marco Elver <elver@google.com> writes:
>
> > On Mon, 3 May 2021 at 23:04, Eric W. Biederman <ebiederm@xmission.com> wrote:
> >> "Eric W. Beiderman" <ebiederm@xmission.com> writes:
> >> > From: "Eric W. Biederman" <ebiederm@xmission.com>
> >> >
> >> > The si_perf code really wants to add a u64 field.  This change enables
> >> > that by reorganizing the definition of siginfo_t, so that a 64bit
> >> > field can be added without increasing the alignment of other fields.
> >
> > If you can, it'd be good to have an explanation for this, because it's
> > not at all obvious -- some future archeologist will wonder how we ever
> > came up with this definition of siginfo...
> >
> > (I see the trick here is that before the union would have changed
> > alignment, introducing padding after the 3 ints -- but now because the
> > 3 ints are inside the union the union's padding no longer adds padding
> > for these ints.  Perhaps you can explain it better than I can. Also
> > see below.)
>
> Yes.  The big idea is adding a 64bit field into the second union
> in the _sigfault case will increase the alignment of that second
> union to 64bit.
>
> In the 64bit case the alignment is already 64bit so it is not an
> issue.
>
> In the 32bit case there are 3 ints followed by a pointer.  When the
> 64bit member is added the alignment of _segfault becomes 64bit.  That
> 64bit alignment after 3 ints changes the location of the 32bit pointer.
>
> By moving the 3 preceding ints into _segfault that does not happen.
>
>
>
> There remains one very subtle issue that I think isn't a problem
> but I would appreciate someone else double checking me.
>
>
> The old definition of siginfo_t on 32bit almost certainly had 32bit
> alignment.  With the addition of a 64bit member siginfo_t gains 64bit
> alignment.  This difference only matters if the 64bit field is accessed.
> Accessing a 64bit field with 32bit alignment will cause unaligned access
> exceptions on some (most?) architectures.
>
> For the 64bit field to be accessed the code needs to be recompiled with
> the new headers.  Which implies that when everything is recompiled
> siginfo_t will become 64bit aligned.
>
>
> So the change should be safe unless someone is casting something with
> 32bit alignment into siginfo_t.

How about if someone has a field of type siginfo_t as an element of a
struct? For example:

struct foo {
  int x;
  siginfo_t y;
};

With this change wouldn't the y field move from offset 4 to offset 8?

Peter
