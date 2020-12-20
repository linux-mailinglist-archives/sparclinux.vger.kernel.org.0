Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3128A2DF862
	for <lists+sparclinux@lfdr.de>; Mon, 21 Dec 2020 05:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgLUErt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 20 Dec 2020 23:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgLUErs (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 20 Dec 2020 23:47:48 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC4BC061285
        for <sparclinux@vger.kernel.org>; Sun, 20 Dec 2020 20:47:06 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id w5so9676220wrm.11
        for <sparclinux@vger.kernel.org>; Sun, 20 Dec 2020 20:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tCjvEtOXjUzYqZRN9dsIp4f7PWsyuSk8HXdZhU6nIbg=;
        b=RI49HEjnWHTq92R8AqWi9ovZBVaN+HbCzjNDf/nLWy10Idby2DB7w5uwAhswk4faIY
         s7AHoqhOO70GNzW4HjruZRcnhaxBkz/jWPhIVPGTcSxL8vzMpBjI+5l9bzcKhzlxSKO0
         Ys+kDsfSrUFiab+5E8URcK7zS4Hcli+tgVNAE5bAAiWE/v2W0LtEXlvKtbL1mYpTwNFh
         xM3Y4Ai4xBpdfu8EkDz6QJMLSz1/5XKhOnw0P+/5SD8kOQQ+bqiRdpQyHIttFJ453Dpl
         M5InJ+OA3+HY6uwO5F1XJC4hDad6kctiW5llozFktcFg4F2QWjx9udTquYG2v6ejkckI
         sK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tCjvEtOXjUzYqZRN9dsIp4f7PWsyuSk8HXdZhU6nIbg=;
        b=ZDX9dWYKNW2nAZOGh1qVrK543bmFgx72t1+yH3RnMdgRgp3Ok0y1yK6Tn1Pp+Q/Q6q
         hQOgoe8HJ0mERAW9IhQ2bnDsZEcyvX4PNk+4gopKfsEmLQVLJuEC9TfSMC0IMgAX0Ivq
         ge82LDN8G7jpXMwN2B+/hB4gxK9+kP3UL4B5z8syaYhw+6cGFaHhOWHhNM3xFHQ/gAnX
         uHi5BNirmO5KqVlWvD7r5MfIvF+j0YvfJBGJWkLC/jK1jN+AbXhd3mRFVIIXzXPj6Y6f
         ledM9qzECHMJJCjXVGm49Fy6ZfX9SUvgcugIg1/oN0Vb9vrAWY4XgVyIy4DcS3AnkAHy
         Rwmg==
X-Gm-Message-State: AOAM530r8Zl1o4jfzz5vdC/Ivc1n50gamP2gGWDfe7SpLqt3rOqKCWkP
        XuNPZlK3iZzWySoPgqZUhDQJiET6sYcx+X39n7A1GYun
X-Google-Smtp-Source: ABdhPJxXOwS4cwc42vuce/IE8Y5+CbGWtKSrMS0AGmiVhe6Pss5gLO4kKNdT6l20SNSCaZ67L9VXTb5zlR5ppkJekvU=
X-Received: by 2002:a05:6402:d09:: with SMTP id eb9mr13241224edb.71.1608493288198;
 Sun, 20 Dec 2020 11:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20201218184347.2180772-1-sam@ravnborg.org> <20201219214054.GB3132151@ravnborg.org>
 <CADuzgbqBx7cajLg5-9+bqoUvHV4heoNjBH-cakU5YGV549Gdxg@mail.gmail.com>
 <CAGRGNgUxGY3wz5sDVJqO8hB=yw=-symr0tGXQeQ1ovqwb6-e9w@mail.gmail.com> <CADuzgbqZQ5oMxUh5XhmzqGpVgU+m6L-42TucOhACDviKYpaCMg@mail.gmail.com>
In-Reply-To: <CADuzgbqZQ5oMxUh5XhmzqGpVgU+m6L-42TucOhACDviKYpaCMg@mail.gmail.com>
From:   chase rayfield <cusbrar1@gmail.com>
Date:   Sun, 20 Dec 2020 14:41:17 -0500
Message-ID: <CACwypyN30H4WWwQxsyAZDO=yjB7bo8dLj9Of5ygN7TB_UdaWWw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/13] sparc32: sunset sun4m and sun4d
To:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From Experience... The best way to go about Gentoo for 32bit sparcs is
in a chroot on a faster 64bit Sparc system, you could probably also
run a faster than realtime QEMU but that's a bit more of a hassle if
you have fast Sun hardware. Last time I did this was on a T2000, I
have been meaning to retrace my steps on a T4.

I did run into a bug with portage or python... it would be nice to fix
that so those could be used on Slower systems. I'd also like at some
point to compile a list of software in the vein of suckless.org
(perhaps a bit less masochistic though), that is usable on old
machines, the one I really want to dogfood is pcb-rnd and corelEDA on
a sparcstation to see how well it could compete with KiCad.

Weird thing about the LCDs not syncing... all the LCDs I have that are
1280x1024 or greater work. The problem is that sometimes the default
resolution also has a sync rate of a few hz higher than some LCDs can
handle, most of my LCDs are older higher end models (1600x1200 etc...)
so also happen to support those rates. You can get most commodity LCDs
to sync by choosing a display mode via serial port that plays nice
with standard VGA resolutions and rates.
