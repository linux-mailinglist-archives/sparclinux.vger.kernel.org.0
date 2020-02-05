Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38755153726
	for <lists+sparclinux@lfdr.de>; Wed,  5 Feb 2020 19:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgBESBc (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 Feb 2020 13:01:32 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:36822 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgBESBc (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 5 Feb 2020 13:01:32 -0500
Received: by mail-vk1-f193.google.com with SMTP id i4so817328vkc.3
        for <sparclinux@vger.kernel.org>; Wed, 05 Feb 2020 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=;
        b=oVpH+7hbPNdJnNsLjdBlqZ71TWR1mX/Dt0ANmSlQg+wjEIEYcnIMa/ZCjtuvTu8Y+f
         lCVBpkS9eO35HQytqbp7j4bcqcVd9+uKbZwVawuzrzSvB4eVvCdhMu5aVmOy8WGjnK11
         myPmLTbHd+oIm9FFyuy3G1w83Z8aW2eC71Gdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tcERuPTreB1RdPPHaPDmwJiWCBqhIbQ/kkvuwoX6k74=;
        b=pawsUhNtVrarlMGpMOOy/hbQzn8S0eVTarJW1mzg1IUW3mp68CHo852UDoM/EhcFk6
         FseRy/qNKFdWv5R522j1hH/reDl+Uu67/24crQ4H5g93f2mDcSruKTKlRws9eCSqt/Uu
         /GUjjMrzfXfp+XX/XXlCnCKi4mWA4+33A6liPBKpbC9Y+b41nLuDdKi8iJAQE4LXFoT7
         nGZVHIKKUs6xoBAgUzrtw04BoY3VG1QIbNJRFWE+4Vr23OERCktCcGCUafzMU4JAeOiN
         5Rt4DMYhjJKL07h4WDo+Jxc5ahAStFikBfmafpaVsCaZ+ma/ohvwy09mvwnG8YeotgNd
         yhyA==
X-Gm-Message-State: APjAAAVMKPkLX+lf2GUZyfXEib5Ug3qdTNml3NPx9s2RPuDtHj8bydhv
        u9CnQlAhWdLGzBP5ZIFWQ+ss85R3n4A=
X-Google-Smtp-Source: APXvYqyBed1l+xVzmy0uqvrOoQMktaEfdo+JIhMqKhfrUDiHKxtaL0lBMdI1w8JsTnTuDQSDKJaCTg==
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr2455523vkd.66.1580925691042;
        Wed, 05 Feb 2020 10:01:31 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id d25sm152777vko.46.2020.02.05.10.01.29
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 10:01:29 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id o42so1181050uad.10
        for <sparclinux@vger.kernel.org>; Wed, 05 Feb 2020 10:01:29 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr21945531uap.0.1580925689110;
 Wed, 05 Feb 2020 10:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan>
In-Reply-To: <20200205173042.chqij5i53mncfzar@holly.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 10:01:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
Message-ID: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
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

On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > if current task has no regs") I tried to clean things up by using "if"
> > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > architectures define some of the structures that the code is referring
> > to.
> >
> > Let's switch to #ifdef again, but at least avoid using it inside of
> > the function.
> >
> > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks for being so quick with this (especially when if I had been less
> delinquent with linux-next it might have been spotted sooner).
>
>
> > ---
> > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > Testing appreciated.
>
> I've just add sparc64 into my pre-release testing (although I have had to
> turn off a bunch of additional compiler warnings in order to do so).
>
>
> >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index b22292b649c4..c84e61747267 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> >  /*
> >   * kdb_rd - This function implements the 'rd' command.
> >   */
> > +
> > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > +#if DBG_MAX_REG_NUM <= 0
> > +static int kdb_rd(int argc, const char **argv)
> > +{
> > +     if (!kdb_check_regs())
> > +             kdb_dumpregs(kdb_current_regs);
> > +     return 0;
> > +}
> > +#else
>
> The original kdb_rd (and kdb_rm which still exists in this file) place
> the #if inside the function and users > 0 so the common case was
> covered at the top and the fallback at the bottom.
>
> Why change style when re-introducing this code?

My opinion is that #if / #ifdef leads to hard-to-follow code, so I
have always taken the policy that #if / #ifdef don't belong anywhere
inside a function if it can be avoided.  This seems to be the policy
in Linux in general, though not as much in the existing kgdb code.
IMO kgdb should be working to reduce #if / #ifdef inside functions.

In this case, the duplicated code is 1 line: the call to
kdb_check_regs().  It seemed better to duplicate.  Another option that
would avoid the #if / #ifdef in the function would be as follows.
Happy to change my patch like this if you prefer:

#if DBG_MAX_REG_NUM <= 0
static int _kdb_rd(void)
{
  kdb_dumpregs(kdb_current_regs);
  return 0;
}
#else
static int _kdb_rd(void)
{
 ...
}
#endif

static int kdb_rd(int argc, const char **argv)
{
  if (kdb_check_regs())
    return 0;
  return _kdb_rd();
}

...or if you just want to get something quickly so we have time to
debate the finer points, I wouldn't object to a simple Revert and I
can put it on my plate to resubmit the patch later.

-Doug
