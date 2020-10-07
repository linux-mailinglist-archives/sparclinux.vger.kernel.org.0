Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5D285B54
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgJGIyj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 04:54:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50463 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgJGIyi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 04:54:38 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3DBb-1kMWRd3GST-003hRK; Wed, 07 Oct 2020 10:54:36 +0200
Received: by mail-lj1-f170.google.com with SMTP id f21so1166781ljh.7;
        Wed, 07 Oct 2020 01:54:36 -0700 (PDT)
X-Gm-Message-State: AOAM532tVjk1ePk6GStwW2C+comChVk2yUo0SjQ/p4bhxNsQphl2+jb+
        gDxKFPQi55VJToZO7adDFWihLV6ACKif+opjDQQ=
X-Google-Smtp-Source: ABdhPJyu4xMUiED6tphuvJBDmrMqYuzph3Rbz32Jq9pG9Bet45lBRMBSkcwUI4qjIUAVco1htJKz2ohJp7aKLcNUE6w=
X-Received: by 2002:a2e:9c57:: with SMTP id t23mr791138ljj.189.1602060876152;
 Wed, 07 Oct 2020 01:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
In-Reply-To: <20201007074447.797968-2-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 10:54:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
Message-ID: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
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
X-Provags-ID: V03:K1:ZEyC4MF0l1RZyPKRTCfu81JIu27k9A3358IIBQUNOk4Xp2Vfnvf
 DQAzypmtQeUR0EyntYfZGVQMcwOSaPIWUwxBIlICshhX2w5VfM00mCVdthrGgqoCca6IPIw
 lz552zGqEUHARQdyjLZHjeOX4IYGSumueH3FqMFOUvKOStX7AX9kkurFBWuz1v92qnqD0lc
 VkPeABXeImuvIN+vI49ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rZAibQtWfAg=:xYKQG3/mQSDuQx+3ReQzLF
 Un26s3NnQokEhRTz+CTdC+eoneVJd4iBE+Rf9/a3QDpoJRGT4oHsY6LikrAy1b+MXIjNhkDfH
 m//h31o24R7FbPZb8rYibXU4WKvs29Hodv5B1xPZ6x5zXe6RH5hKm0skhKqrDHRfQL6JYB9T6
 6xHvOGa7mrcpxeV/G6xJA3EZdsgSto44+jp+lpOEZtMfWjT4jsJIHDGxwl6186yj7awtFZJ00
 1Zopqdw4XlIvlgz6ShBKeI7H/dXDLC69mFP7vbER/OwGXjiyFJB6ihgfbis2sHNqZy2ETZmH3
 i9ToErPxGhrPYsJDmB9lvCqTn9cup3F/55dDvfPNQqMeFyNnPotVvcDWDULEGE/T2FtmC9fVa
 gu9zJADdyI1HNNQ3kmZlLEbUlRzpCZqo2sIpF+zJgQIutX5MXmCx42SIiHJR/bQ+B/5CQt2GH
 XP/5T5kygY/tQw4uG4TX/SQRptFZYFfd9wOJ+r8igZKoL6W/c3uh249DhnWcEZ9hFIV1FDqUQ
 cmCHysMa4ZnMNh3eHw4uND+d2wFXAaxZp4lMxnepT/cA38fPmArRAhtTFbtTEQ+98dQEpenwK
 bJqayLmhK/f/kQZenHdCkBgwaAMpMdGiW2yWRMH3W6vic7Nyjj4wOpQWtZRFDq94t1ZgwVB/O
 nB0+hFTxRBLnBNk+9w8yESWBeC+pcWwTfAy2QmrfaQyUDPOLcgwdimfqpEj4dEz3Xu1ag+mov
 0dczoh3u7IQkk0fQBH8kd9qP0x7vgW/GNJdhRMkhYvSrBbT7oBItuIWGgSuZiWrA1W8atqWg3
 o/eYlOLCe0P0vXMWL/I458zS6UFMKKduw57FS97+EdXJX1l+9oh5oFhm6AsnNrvknxJ68+q
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> don't bother with a compat handler for it, and remove the remaining
> definitions as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
what the state is.

My version only removed the compat handling, not the data structures,
so I'm happy to see your version used instead if mine got lost.

Acked-by: Arnd Bergmann <arnd@arndb.de>
