Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB751548ED
	for <lists+sparclinux@lfdr.de>; Thu,  6 Feb 2020 17:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgBFQQO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 6 Feb 2020 11:16:14 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33328 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbgBFQQO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 6 Feb 2020 11:16:14 -0500
Received: by mail-vs1-f68.google.com with SMTP id n27so4148588vsa.0
        for <sparclinux@vger.kernel.org>; Thu, 06 Feb 2020 08:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=;
        b=EIzYnnnQa8E7suKKVeTQY2aMwT8WhXZwnuzb0SDixpYBjgkX1W7WuCrwO+41Hpmqpp
         OCd8RlKKrN4JpSsgPxwBO7Hy81KVa/X678GlNgbQuzTTnNtQL+2yD02IDtKvFt0lR1aJ
         Y5ORYF+7c15kuUTy+ooKE1uipKe0LMrLgaDds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=khdAdINHrbF0yvYt+hGIc2ksicOYuTBGDLSCy6ujc8Q=;
        b=G+tLF1m8jHTWr0ThSzjOkqivT5NbmboOtsx5oy+p/rYs3EK0rdt3kvxsBZTRbTIYsQ
         8+AYC3i1OzzIlr+OsdAz6CLcfAkh4b9yG97YAflOwg1H99x7M+OlesHNvkrIEvHMoVSz
         tgVeyIDkkcY1G9EPahvY6XJ8xXJAFsrplv3lIXlYR0ciBi1gfhVDgWwleBCc2X2S1B52
         6WLt9OQutMnhrDTV3ZG82eueXwcNx6eEsva6C/5gX3sH+Dn2XYOtfUSoVw1MV+MsxhiQ
         C1ZpAS+BphFGYvaBjK6WHqIP/WzlKZBDYtNGfNuVJJZRJk09oXLJBh+A/Hshp6WyjBw1
         uAeA==
X-Gm-Message-State: APjAAAWgSv11JEk7GV6zm+NWH7x/KsHVLYndQAI6LCskSpSqcu/K8GXB
        ixC2s8w7EC6mQ5D6wMFqLFs0O+T+nSQ=
X-Google-Smtp-Source: APXvYqyNMca573ME0HTkbYaEMGdCQ+vym7kp7Oy3EIJTgjGh62f1sVywWebcW+B6PHyADL7L7RFRgQ==
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr2258016vso.173.1581005772001;
        Thu, 06 Feb 2020 08:16:12 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id h187sm19569vkb.40.2020.02.06.08.16.10
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 08:16:11 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id g7so1752747vkl.12
        for <sparclinux@vger.kernel.org>; Thu, 06 Feb 2020 08:16:10 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr2201558vkl.92.1581005770288;
 Thu, 06 Feb 2020 08:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan> <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
 <20200206115826.oeltu56pp6w5jwvs@holly.lan>
In-Reply-To: <20200206115826.oeltu56pp6w5jwvs@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Feb 2020 08:15:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpUwWyxoEOdOGf=hDQSmQgU7VV0gOPHdvN1L4AqGok1A@mail.gmail.com>
Message-ID: <CAD=FV=XpUwWyxoEOdOGf=hDQSmQgU7VV0gOPHdvN1L4AqGok1A@mail.gmail.com>
Subject: Re: [PATCH] kdb: Fix compiling on architectures w/out DBG_MAX_REG_NUM defined
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Anatoly Pugachev <matorola@gmail.com>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        kgdb-bugreport@lists.sourceforge.net,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi,

On Thu, Feb 6, 2020 at 3:58 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Feb 05, 2020 at 10:01:17AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > > > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > > > if current task has no regs") I tried to clean things up by using "if"
> > > > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > > > architectures define some of the structures that the code is referring
> > > > to.
> > > >
> > > > Let's switch to #ifdef again, but at least avoid using it inside of
> > > > the function.
> > > >
> > > > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > > > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Thanks for being so quick with this (especially when if I had been less
> > > delinquent with linux-next it might have been spotted sooner).
> > >
> > >
> > > > ---
> > > > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > > > Testing appreciated.
> > >
> > > I've just add sparc64 into my pre-release testing (although I have had to
> > > turn off a bunch of additional compiler warnings in order to do so).
> > >
> > >
> > > >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> > > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > > index b22292b649c4..c84e61747267 100644
> > > > --- a/kernel/debug/kdb/kdb_main.c
> > > > +++ b/kernel/debug/kdb/kdb_main.c
> > > > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> > > >  /*
> > > >   * kdb_rd - This function implements the 'rd' command.
> > > >   */
> > > > +
> > > > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > > > +#if DBG_MAX_REG_NUM <= 0
> > > > +static int kdb_rd(int argc, const char **argv)
> > > > +{
> > > > +     if (!kdb_check_regs())
> > > > +             kdb_dumpregs(kdb_current_regs);
> > > > +     return 0;
> > > > +}
> > > > +#else
> > >
> > > The original kdb_rd (and kdb_rm which still exists in this file) place
> > > the #if inside the function and users > 0 so the common case was
> > > covered at the top and the fallback at the bottom.
> > >
> > > Why change style when re-introducing this code?
> >
> > My opinion is that #if / #ifdef leads to hard-to-follow code, so I
> > have always taken the policy that #if / #ifdef don't belong anywhere
> > inside a function if it can be avoided.  This seems to be the policy
> > in Linux in general, though not as much in the existing kgdb code.
> > IMO kgdb should be working to reduce #if / #ifdef inside functions.
>
> I definitely agree that reducing #if and its shortcuts is a good thing.
>
> However I would characterize the dominant pattern as using #if[def]
> to replace disabled functionality with an inline nop version. Other
> cases are, I think, less clear cut.
>
>
> > In this case, the duplicated code is 1 line: the call to
> > kdb_check_regs().  It seemed better to duplicate.  Another option that
> > would avoid the #if / #ifdef in the function would be as follows.
> > Happy to change my patch like this if you prefer:
>
> I wasn't really the duplicated code that bothered me.
>
> More that this test of DBG_MAX_REG_NUM is following a different pattern
> to all other instances in the code case (for a start all others use a
> DBG_MAX_REG_NUM > 0 test and put the fallback code at the bottom).

Ah, got it.  I'll give a shot at a new version then.


> > ...or if you just want to get something quickly so we have time to
> > debate the finer points, I wouldn't object to a simple Revert and I
> > can put it on my plate to resubmit the patch later.
>
> There's a degree of bikeshedding in the above (and as we both know this
> are larger bits of tidying up that kdb, in particular, could benefit
> from) but nevertheless I think a revert is better at this point.
>
> I hope you don't mind but I shall interpret the above paragraph as an
> Acked-by: since I'd like the record to show your diligence in jumping
> on this!

Sounds perfect.  Thanks for the revert and adding exra tests for the
future to keep me from shooting myself in the foot.

-Doug
