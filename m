Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7FB285BB4
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 11:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgJGJOq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 05:14:46 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgJGJOq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 05:14:46 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGi6k-1kDUMI2Erq-00DsFL; Wed, 07 Oct 2020 11:14:44 +0200
Received: by mail-lf1-f41.google.com with SMTP id a9so1441018lfc.7;
        Wed, 07 Oct 2020 02:14:44 -0700 (PDT)
X-Gm-Message-State: AOAM532VAEaz4GwAwzyuR2MRbU3KQH1dvT7uRfoxrSlmlE+TbAyUZ6N4
        Nqtcaqt6Q8GViXuVyzu4BBHfHlcUfdf/jEeUf4w=
X-Google-Smtp-Source: ABdhPJw2gnzs2qy9RvszF/Ejh/VyDEIZYOzzBnaZ8DUrYzebu70+BDP/QGgBJfoHplJXH7w9rmZ4qqJginNm0O/UfFY=
X-Received: by 2002:a05:6512:2fb:: with SMTP id m27mr615293lfq.0.1602062083930;
 Wed, 07 Oct 2020 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-4-hch@lst.de>
In-Reply-To: <20201007074447.797968-4-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 11:14:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kojDb55g8qG9BUrS+Oh9H5dNqs=JXZ7vsoDb+0-Qr+Q@mail.gmail.com>
Message-ID: <CAK8P3a0kojDb55g8qG9BUrS+Oh9H5dNqs=JXZ7vsoDb+0-Qr+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] fbdev/sbuslib: avoid compat_alloc_user_space in fbiogetputcmap
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:u8SrlooR3eWQCZssL0FH0NdNpWQIacTUIMVjthJ4J7E0l38Fu9w
 aw/rilYtEZqcjcjnjwJkLocbuMVSyW7Fq7vSxVpaUi6rbdxHXKJuOq8vd1q1GesuSqzL2/Z
 h16UxsjGs0rzXKJmtRYDgeG7HWZ/HR6Ts+1coqt9LoulxMrS9BhGSwPoRDYCSax5R98LI4w
 nZxzJWnPwqYZkapIVTbkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ik+HGvae854=:WoklRvRo8Y6LT+mNq/OzVP
 G5dV0eYBKJKbYuNooaGsREQY3b3UTJvNVuPtMHOpxGvo624fNZ6xGEy/6GwQCLtA4YXWPrhxy
 +aqTnUY623xraSsCOUalCE9FunxZgfVE9TVuTl3nFBFbMdY2Fz6NY8akliKE+ATuSV1REtbjR
 B8JP+ZughLZMZ3ax/RorG9a/ekLrh30SBHQxrfbR0MVZAAO32SvNeFEMaPvr2sJ0WDM7D+mIK
 7Fw0RPoHkZEMS7yfLmAv6N3+kol6Q/Y7aNWwc9AKzrHTectPdtBRT0Y/CZPEKkZKZczZTRlk2
 AS+/Qu7lHI7ldaZ2ZTU/Hr9qtwZO2UxwObfg7FmNY+9Js+NC3NMi+pr3tkjhsQlg+dDSMDcCA
 nc2lv4/Ax1n25R94WXqLJnJW8ACqehS9PzNJYVAdrE2PWPbn/7qkfCnjVymlydKjAjMPq3MYF
 JpP/5JiSb31z74qEdGZdFCU/vXfuLxs7cnNGh4DVss7eFMw0UTglPgRsGvJ5ESd9gWbCwdPYO
 nPI+8Z4pW7HcVqv+q+eGo4wsk2ppbjv7Z2Noq7thxmD40eRLo73kyNaHH0H5AfSu6n7eBFa0F
 KZ+kFghPDR/aqhogrJcdpneI6WZlE7ILxibBs4LZvFJZJV60Sa20Ds172xvZFgJGJDumzzJyW
 S4phMufewcuKfaMqIfnqmh4r2zPe8zQKs2oRSgUc3IHXRCwPH7VV/0DRvkzPDe72YTWp7bDKt
 8q6bdTzt2sscNzZhGQyBowLQmqJqK1rXLs2OuSl8DrwHe2UXKDWiIuiEXW/LBbDKtszJrDwGx
 Uk1itn9EGonr35wkJEhSCBomnTLOzyVsfSFtGsN8gNpqu7cJ4/HcvncnalbPXj0NsH75vs4X4
 +LgA1skqpz69nqqLUS4oNY/+yQoj48Fu4U1cO1CgarWTIOYBw4z5YZz8FSCuimO8Vhckfz2TO
 TgSU2AffpEc+Iiern3QNK0XfTBpesdGgip5V7GV0SAP83KwSAmX35
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Rewrite fbiogetputcmap to call the low-level sbusfb_ioctl_{put,get}cmap
> helpers directly and thus avoid usage of the deprecated
> compat_alloc_user_space API.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This is another one that I had already addressed in a somewhat inferior way.
I attempted the same kind of cleanup that you did in patch 2/3 but failed to
convince myself that I had managed to avoid regressions, so my patch just
copy-pasted the native implementation into the compat handler with minor
changes.

Provided that your preparation patch is correct, this version is clearly better
than mine, but again I don't know the state of that patch after Sam had
said he applied it already.

     Arnd
