Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AF02F6D1D
	for <lists+sparclinux@lfdr.de>; Thu, 14 Jan 2021 22:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbhANVWK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 14 Jan 2021 16:22:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:47744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbhANVWJ (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 14 Jan 2021 16:22:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 634EE23A5E;
        Thu, 14 Jan 2021 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610659288;
        bh=exDx3N9UxMKaKzUanpc8BaY/OrILHl27M9lK/yFzYew=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A/DAgRkeqR3k1BszeZ4l75lWc3GkKU0L58ALQ7FgfdzoEfFSkKQSSblJyR8+XmdHk
         lD0Wyz9RmKwvbWODj9d0vVK5qwl1gZ0XGRa0RAi+J7p7cLVoNwCp1FmHs/+uqPUS2t
         zmeCVeZG/aTNd8rZxn56tggXJbglmczpsGN6dSlwDN8+O0rKO8v9n2Yfh8+/HHw/EK
         QDr2orYVQk41kO3y3dR3WraRR2GjprRlGJVEGmKgPHkIsFYiWCzGjYeaDs9n+ndRbZ
         L417QH4pUG5vYVTQ1qS1eguA8eG7ozEa/2gh+a/zHKns8ORrcXx3leWJrpmHdsE5RN
         bJ62tbXQbw/cw==
Received: by mail-ot1-f51.google.com with SMTP id r9so6549715otk.11;
        Thu, 14 Jan 2021 13:21:28 -0800 (PST)
X-Gm-Message-State: AOAM531yoqtnILIumKqVZ/DBFRyoVY4LUPq2VGpb87A+JKvmzjEYxkEB
        B+OYDuu4bnvyscAteT6OY+3Juf+aKwFUSKPGyW0=
X-Google-Smtp-Source: ABdhPJwk2+FfIBOvjjJhKgtw+HdNsV979FfRK+PzXDX7F5XBm1lFwrx01qQnMO280W6OJFf77IreTeFp7kHgmaZCDZs=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr5941598otm.305.1610659287591;
 Thu, 14 Jan 2021 13:21:27 -0800 (PST)
MIME-Version: 1.0
References: <ef1dc21f-694b-2433-e1c6-aa121320173e@physik.fu-berlin.de>
 <f48bcf43-9dcc-e48b-d29d-f75f3814398b@gmx.net> <cb5a2e11-d423-96ec-3d43-3568a109e37f@physik.fu-berlin.de>
 <CACRpkda4E2NwNw29J7x5gehtqn_m3M_Z2dHpc7xRgvb0b-p22A@mail.gmail.com> <1be37673-db0e-f09d-68c8-f929be4019ab@physik.fu-berlin.de>
In-Reply-To: <1be37673-db0e-f09d-68c8-f929be4019ab@physik.fu-berlin.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 14 Jan 2021 22:21:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1+SdAW8VKnvMdXNVcpR-ykNdPoqLqb59uxzB+jNFJRtg@mail.gmail.com>
Message-ID: <CAK8P3a1+SdAW8VKnvMdXNVcpR-ykNdPoqLqb59uxzB+jNFJRtg@mail.gmail.com>
Subject: Re: Old platforms: bring out your dead
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Gerhard Pircher <gerhard_pircher@gmx.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Jan 14, 2021 at 10:43 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/12/21 11:46 PM, Linus Walleij wrote:
> > On Tue, Jan 12, 2021 at 3:45 PM John Paul Adrian Glaubitz > <glaubitz@physik.fu-berlin.de> wrote:
> > This is actually one of the most interesting things written in this discussion.
> >
> > I have both revamped and deleted subarchitectures in the ARM tree. We
> > never deleted anyone's pet project *unless* they were clearly unwilling to
> > work on it (such as simply testning new patches) and agreed that it will
> > not go on.
>
> I'm not arguing this. This was more about killing (sub-)architectures because they
> haven't seen git activity for a long time which I think is poor metric to determine
> whether a port is dead or not. And reading through the other answers in this thread,
> it seems I'm not alone with this stance.

I think it's mainly a misunderstanding of what I am trying to do
in finding the platforms that have been completely abandoned.
There are now eight platforms on the list that are unmaintained
and have no known users. All of them were actively getting patched
and tested in the past as can be easily seen from the changelog,
but then the maintainers stopped sending patches five years or
longer ago, which indicates that something changed: either the platform
port was now perfect and has been working fine ever since
(e.g. highbank, digicolor, nspire, ...), or the maintainers (or rather
their employers) gave up and never continued the job (picoxcell,
prima2, efm32, ...).

I can usually guess which one is the case, but the only way to be
sure is to ask, which is what I did in that email.

> > 3. Migrate old systems to use the
> >    contemporary hardware descriptions (such as device tree or ACPI)
> >    because it makes things so much easier to maintain. Some
> >    upfront work, but a great win for everyone. Especially for
> >    subsystem maintainers.
>
> There is such a patch set for arch/sh to add device tree support, but so far it has not
> been merged yet, unfortunately. Apparently, it causes some regression on LANDISK devices
> according to Rich Felker.
>
> Maybe we can finally get it merged this year:
>
> > https://lore.kernel.org/patchwork/cover/693910/
>
> Since Geert also has a LANDISK SH device now for testing, he might be able to help.

Doing a proper device tree conversion for arch/sh/ is a huge task,
so unless someone is going to work on that full-time for a while,
I don't see this going anywhere. If nobody has even rebased that
patch series in the past five years, it's fairly unlikely that they will
do it soon.

One of the bigger problems is converting to CONFIG_COMMON_CLK,
as was done for one of the simpler chips in the patch series you
reference above.

> > And if your arch uses highmem then please get rid of highmem. I'm
> > trying to do this a bit right now for ARM let's see how it goes.
>
> Is there a list of architectures which still need highmem?

These are the architectures that currently allow highmem:

| arch/arm/Kconfig:config HIGHMEM

We're working on CONFIG_VMSPLIT_4G_4G as a replacement
to keep ARMv7VE based platforms working after highmem gets
removed, and possibly use ZSWAP to help platforms for
which this is not enough. There are a few users on ARMV7VE
with more than 4GB (keystone2, highbank, armadaxp, some
broadcom STB SoCs) or ARMv7-A with more than 2GB (imx6q,
tegra3), but those memory configurations were shipped in
minute quantities compared to smaller memory versions of the
same boards, so the plan is to wait until the known users have
all stopped needing kernel updates, possibly around 2025.

| arch/arc/Kconfig:config HIGHMEM
| arch/microblaze/Kconfig:config HIGHMEM

I don't think we have upstream support for platforms with a need for
highmem, but these are both used in deeply embedded systems
that tend to not follow mainline kernels. Also, both have hardware
support for 64-bit cores, which I guess will be used in the future
on systems that have more than a gigabyte of RAM.

| arch/csky/Kconfig:config HIGHMEM
| arch/nds32/Kconfig.cpu:config HIGHMEM

These were only merged fairly recently, and as far as I can
tell, highmem support was mainly added for the purpose of
completeness, not because of actual user requirements.
Both architectures are getting replaced with RV64 cores from
the respective companies (Andes and C-Sky/T-Head).

| arch/powerpc/Kconfig:config HIGHMEM
| arch/sparc/Kconfig:config HIGHMEM
| arch/x86/Kconfig:config HIGHMEM

Highmem was used extensively on these in the past, but mainly
on older machines. Most o the x86 users here would already
be on 64-bit hardware and can just change their kernels to
x86-64, but 32-bit machines from around 2004 to 2006
on both powerpc and x86, as well as some older servers, are
likely to lose some of their memory or may have to use ZSWAP
instead.

| arch/mips/Kconfig:config HIGHMEM
| arch/xtensa/Kconfig:config HIGHMEM

AFAICT On MIPS (prior to MIPS32r3) and xtensa, you have at
most 512MB in the linear map, so the VMSPLIT_2G or VMSPLIT_4G_4G
tricks won't work. OTOH, most mips platforms that support
highmem are on older 64-bit cores and can probably move to
64-bit kernels as well, but some can not (ingenic xburst,
loongson1, bmips, ...)

P5600 (Baikal-T1) is often used with 4GB or at most 8GB on
desktops, this will be interesting to migrate. Since it's MIPS32r5,
this may use more than 512MB of lowmem with some tricks that
need to be implemented.

Most of the embedded MIPS32 ones support less than those 512MB
of RAM and are not affected.

I have no idea who uses xtensa systems with lots of memory on
modern kernels.




      Arnd
