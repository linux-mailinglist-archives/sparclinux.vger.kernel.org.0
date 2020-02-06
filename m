Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB5415439D
	for <lists+sparclinux@lfdr.de>; Thu,  6 Feb 2020 12:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBFL6d (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 6 Feb 2020 06:58:33 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37688 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbgBFL6d (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 6 Feb 2020 06:58:33 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so6834464wru.4
        for <sparclinux@vger.kernel.org>; Thu, 06 Feb 2020 03:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=;
        b=E/f4IdKI2P6/z9QxBfePTmHFhbcIGjNr9wAl8FiNopZPvnZ5W9Q6N0z+yvxGMzhpGK
         HjTUEg4PKPrDWXn8lY6DOnEGppJ9G+2GsadFqlN2gmOnebrGTzH4xNStmxTxgADwNymE
         iKPOuu4mgnwecFQDT3YXV5Tp5AFvFI2PcgKuKu3oLGXPTg1DB4bmqIKQdfo5jsOguHC6
         G6AcVdRBtXFvGdss51W9zNIiOHhHFMJD5RGdNWy8TiG6BmtN3lz/8EBqRS3bUeaqFAVG
         cIeM/XLtprYYYuW0/6hv8GFNKF4WG6TTGoLpdSXntZ0Ti2byiuer4JAqAkdBr5joQu2K
         BfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ctO8Y0tUsZtI6bHpDj7/djb98AaT4cQRUxUXkkzZb4=;
        b=EXZK/MsFSECNKwRb8PS2axjQzrrPb2wY/Hjeru0EAP754DphpGqhWnfMCOiek5yIh4
         N/Osph2zLzDisvmYiuj6PXG41Ud/CQ4wjmU6NBy+xYXy5dAPv0DwRtj84e9PajLD01ir
         Z0N235DnflYiyAwjY6LvdB9fEKi2bwH+zEKgnsRwq0rLih+59mGRHcbuRIGDBJTFbf3E
         PIHxUbC8mBHltpy1zF5qIQEK0MjjA5qVm9lFnfdcVWfE9PflKCb8v8vlpYeAIPl2zV9x
         pP7cAwl7JE0UyBj0Ekr4lqtthnptgLQ57uxeSATkPDcolzx8I2s8K5u+TtD+/O0aVLkr
         eHMQ==
X-Gm-Message-State: APjAAAVtDxC6/FhXRQlLotktvsDWx4vT9lHaEiVYhyxE7x8N/6s9yuls
        1p4g0Hjwhq7pDP/Ct4Sh/1wpiw==
X-Google-Smtp-Source: APXvYqzh/u6fdU7NmBJmTsFyRggktpYhdZCXFoNO5/+L83VgI/fQBwsTCcdLJao5aIM6PhXjscV7XA==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr3281226wru.427.1580990309089;
        Thu, 06 Feb 2020 03:58:29 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id e22sm4064362wrc.13.2020.02.06.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 03:58:28 -0800 (PST)
Date:   Thu, 6 Feb 2020 11:58:26 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Anatoly Pugachev <matorola@gmail.com>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        kgdb-bugreport@lists.sourceforge.net,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] kdb: Fix compiling on architectures w/out
 DBG_MAX_REG_NUM defined
Message-ID: <20200206115826.oeltu56pp6w5jwvs@holly.lan>
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
 <20200205173042.chqij5i53mncfzar@holly.lan>
 <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=V6ovmi-zCUYyFdiyf0pG4g=i5N4hUC8JjvrWDRUzPnqQ@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Feb 05, 2020 at 10:01:17AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Feb 5, 2020 at 9:30 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> > > In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> > > if current task has no regs") I tried to clean things up by using "if"
> > > instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> > > architectures define some of the structures that the code is referring
> > > to.
> > >
> > > Let's switch to #ifdef again, but at least avoid using it inside of
> > > the function.
> > >
> > > Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> > > Reported-by: Anatoly Pugachev <matorola@gmail.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Thanks for being so quick with this (especially when if I had been less
> > delinquent with linux-next it might have been spotted sooner).
> >
> >
> > > ---
> > > I don't have a sparc64 compiler but I'm pretty sure this should work.
> > > Testing appreciated.
> >
> > I've just add sparc64 into my pre-release testing (although I have had to
> > turn off a bunch of additional compiler warnings in order to do so).
> >
> >
> > >  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
> > >  1 file changed, 11 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > > index b22292b649c4..c84e61747267 100644
> > > --- a/kernel/debug/kdb/kdb_main.c
> > > +++ b/kernel/debug/kdb/kdb_main.c
> > > @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
> > >  /*
> > >   * kdb_rd - This function implements the 'rd' command.
> > >   */
> > > +
> > > +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> > > +#if DBG_MAX_REG_NUM <= 0
> > > +static int kdb_rd(int argc, const char **argv)
> > > +{
> > > +     if (!kdb_check_regs())
> > > +             kdb_dumpregs(kdb_current_regs);
> > > +     return 0;
> > > +}
> > > +#else
> >
> > The original kdb_rd (and kdb_rm which still exists in this file) place
> > the #if inside the function and users > 0 so the common case was
> > covered at the top and the fallback at the bottom.
> >
> > Why change style when re-introducing this code?
> 
> My opinion is that #if / #ifdef leads to hard-to-follow code, so I
> have always taken the policy that #if / #ifdef don't belong anywhere
> inside a function if it can be avoided.  This seems to be the policy
> in Linux in general, though not as much in the existing kgdb code.
> IMO kgdb should be working to reduce #if / #ifdef inside functions.

I definitely agree that reducing #if and its shortcuts is a good thing.

However I would characterize the dominant pattern as using #if[def]
to replace disabled functionality with an inline nop version. Other
cases are, I think, less clear cut.


> In this case, the duplicated code is 1 line: the call to
> kdb_check_regs().  It seemed better to duplicate.  Another option that
> would avoid the #if / #ifdef in the function would be as follows.
> Happy to change my patch like this if you prefer:

I wasn't really the duplicated code that bothered me.

More that this test of DBG_MAX_REG_NUM is following a different pattern
to all other instances in the code case (for a start all others use a
DBG_MAX_REG_NUM > 0 test and put the fallback code at the bottom).


> ...or if you just want to get something quickly so we have time to
> debate the finer points, I wouldn't object to a simple Revert and I
> can put it on my plate to resubmit the patch later.

There's a degree of bikeshedding in the above (and as we both know this
are larger bits of tidying up that kdb, in particular, could benefit
from) but nevertheless I think a revert is better at this point.

I hope you don't mind but I shall interpret the above paragraph as an
Acked-by: since I'd like the record to show your diligence in jumping
on this!


Daniel.
