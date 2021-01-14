Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1746D2F59A9
	for <lists+sparclinux@lfdr.de>; Thu, 14 Jan 2021 04:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbhANDyu (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 13 Jan 2021 22:54:50 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42344 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbhANDyu (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 13 Jan 2021 22:54:50 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 6503D22D2C;
        Wed, 13 Jan 2021 22:54:06 -0500 (EST)
Date:   Thu, 14 Jan 2021 14:54:04 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Linus Walleij <linus.walleij@linaro.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Gerhard Pircher <gerhard_pircher@gmx.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: New platforms: bring out your dead, was Re: Old platforms: bring
 out your dead
In-Reply-To: <CAK8P3a3hKSVXZEjQEbkOLhtAO0oR0+UP1dL10S3jQM72EsmsWA@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2101141451370.7@nippy.intranet>
References: <ef1dc21f-694b-2433-e1c6-aa121320173e@physik.fu-berlin.de> <f48bcf43-9dcc-e48b-d29d-f75f3814398b@gmx.net> <cb5a2e11-d423-96ec-3d43-3568a109e37f@physik.fu-berlin.de> <CACRpkda4E2NwNw29J7x5gehtqn_m3M_Z2dHpc7xRgvb0b-p22A@mail.gmail.com>
 <CAK8P3a3hKSVXZEjQEbkOLhtAO0oR0+UP1dL10S3jQM72EsmsWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, 13 Jan 2021, Arnd Bergmann wrote:

> 
> It's usually one of two things that happened before a platform gets
> deleted for good:
> 
> * The platform port was (almost) exclusively done by one company
>    with a commercial interest in it, and the company shifts its priorities
>    for some reason (acquisition, bankruptcy, product cancellation,
>    accidentally laying off all competent developers, ...) that causes it to
>    stop working on it. Sometimes the previously paid maintainers
>    keep up their upstream position, but without someone pushing the
>    last missing bits into an official release, users are stuck on an old
>    BSP kernel.
> 

Yes, that's the typical product life cycle. It presumes a short window of 
opportunity for sales (suggesting that demand is not organic).

Most vendors like to avoid having to compete with their own prior product 
lines. Hence the constrained lifespan that we get from devices with 
out-of-tree Linux ports.

AFAICS open source licenses cannot really prevent this (no matter how many 
freedoms the FSF would like to confer on people). However, consumer law 
could do it, if it were to disallow products which were not servicable.

> * A platform port is done in the open and actually works for upstream
>   users, but over time the last active maintainers move on in their
>   lives. Complex platforms inevitably break when a treewide change
>   goes wrong, so we rely on users that are able to bisect and report
>   bugs when they happen. 

And without bug reports, breakage gets leveraged into deletion, using the 
bogus argument that "broken" code is proof of zero potential users.

>   After a platform has been broken for too long, even competent users 
>   may decide to just give up and stay on their last working kernel. Some 
>   of these platforms eventually recover when a new maintainer steps up 
>   or someone discovers they depend on newer kernels for products, but 
>   after a few years it's usually beyond repair.
> 

So all a vendor has to do is make maintenance a bit too difficult for 
competent users e.g. by depriving them of access to existing 
documentation.

It was only a few decades ago that every applicance you bought came with a 
printed circuit schematic. These days, every device you buy comes with 
built-in obsolescence and a customer lock-in strategy.

>       Arnd
> 
