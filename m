Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7C5285BD9
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 11:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgJGJ3S (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 05:29:18 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35987 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgJGJ3S (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 05:29:18 -0400
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M3mHT-1kQMjw3r19-000vc9; Wed, 07 Oct 2020 11:29:16 +0200
Received: by mail-qv1-f50.google.com with SMTP id b19so753807qvm.6;
        Wed, 07 Oct 2020 02:29:15 -0700 (PDT)
X-Gm-Message-State: AOAM533vIwxLKB00EmoKGJpY8LtNLPdQVkRoCngbo4UhaUCYVpT1hWB0
        KX8/k3O5rYQtOHrsk3pZ/nvhTtqGYFDKSRYIHKE=
X-Google-Smtp-Source: ABdhPJzsxFndaaRwZ3U5rVgOmiJcVtZPOoHewULoEnsw7Jee9ymhitQEl66Qm1onFjPl2v+KzYJZL0R3o7dDqsqgqKE=
X-Received: by 2002:a05:6214:1873:: with SMTP id eh19mr2334325qvb.16.1602062954728;
 Wed, 07 Oct 2020 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com> <20201007085911.GA17356@lst.de>
In-Reply-To: <20201007085911.GA17356@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 11:28:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
Message-ID: <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h/m5T5sv8TWoM1PE1t3utqKdUPKe95vEd4AoTD/8w+UPhReeEsS
 YgIjKDT9qrPJamMeJ1Y3MAh3OjyVgVgVWewrbLpAtYaJrA0mfKtImea5WD/6GmhuK44gM4+
 SzDgeQs1z/nEeKNT0r/IqZidvMl0JrY9Rbs+11EbR5tmlG5NpvAKU1dqSCF4Gj4uQZZaVSU
 9+F0i10HjDtY7nECx8K6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DE2i59QD5FM=:3gOvwS1aSaa7MTwybggzcm
 spIKhs6S9mjB6/u5dT1xCOvPXcklmtOf3w4nFL9qejhOuZZjiDSkQcFGCduV+RYEvjgWFbINi
 pyUbuCAUj0Wt2v3Y+PMmg2hmo5fTD5LjSzGXm7ROF3vhCE9z7XKgmyzEO8FoBNGgJlZ345Za3
 XAweJ9zcPg6TJBHVHxlaxGON2wskUiop74rMAEXL31GRDkBdwi3Qcw6PnrGwTBUUbViGTRHi7
 YVcAR1JkZ86ex9RE2ZOCPcSZr8KbsoSFZSMW21S/5jA/CsXpAPNwFNRpyyoQoWRa4p8Crq/iz
 tjrvrF8sCvrUqvYKBTkBilLBgbIaZIb+b+A2KwAyHnmZjTmD8e4YugQ9xrlUsInSgcyF4ZAFK
 MNRCEcrKWCgh3SVCkrL5JfF9RqQSxKidCRBZf3lchlcqSjE+W5Q21VUseVH7HM4As8HtxjSJC
 9vZ/D2BHwgk0B4ao74oFpeSeWtUXnjMJDz1aDhKF+GZnkDTWpj+9Fc2zmhEP7dV5zm/HapubE
 TmGuNAc34tUPmL8u6+0G3wyua5GJ25um3YExx0GlFXhQl22+UwJqhLcqNMtWVPbJ6AtY67ZoI
 jmhaLtKzEB2btx/Z7ihXttG1peVe36ODwVteipkOA1ZDHA6+W01+QqSIXWdcQ9ruvhvkFESXY
 Rf7El+96mZDFfcwYwQBTJy+J03VN26P3V3cu5VtGgVhR2WBkxWpJCRdpzEDQfx8lqq+YT4eNo
 e15csth6RZgKy1uKxqmTRcMb1riQMy8z5tgj0WcFq4baq4mchCEn+uiJ8K0m9jV2+IdhOWHC/
 pzdaST/lY0Uf+uikyKVkMFxOQwrJF6glJJDedbTaQ43C5iBO9f3rgNwdDtthWY5nWBD8qYjTj
 FKfn2jrv+U2nYWrMeRdcm8sFyJ0G0JmKK5XK3BvaUpVwvRZB5feBahkhrj2O6s+9lXVfBease
 jeBiMgnMciF2FzjHmUpxXpj9TzcFytdDhX3byY7mDP6btQruGN9tn
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 10:59 AM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Oct 07, 2020 at 10:54:19AM +0200, Arnd Bergmann wrote:
> > On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> > > don't bother with a compat handler for it, and remove the remaining
> > > definitions as well.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
> > drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
> > what the state is.
> >
> > My version only removed the compat handling, not the data structures,
> > so I'm happy to see your version used instead if mine got lost.
>
> Oh, sorry.  I thought in your summary you decided to give up on
> the sbuslib ones.

Here is what I have pending at the moment for set_fs() and
compat_alloc_user_space():

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=compat-alloc-user-space-2

The only one I have actually given up on is the atomisp staging driver,
which uses an awful hack, copying the x86 implementation of
copy_in_user()/compat_alloc_user_space() into the driver.

This is based on last week's linux-next, as I plan to resubmit after the
merge window.

     Arnd
