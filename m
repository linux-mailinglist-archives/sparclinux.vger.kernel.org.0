Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE42285A10
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 10:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgJGIFu (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 04:05:50 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:45279 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgJGIFt (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 04:05:49 -0400
Received: by mail-oo1-f65.google.com with SMTP id h8so385610ooc.12;
        Wed, 07 Oct 2020 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=veShSx9NyaM6ZMMmIsmrDUqCLvApy53cWyLPd+hfj64=;
        b=sN+/rKRuqmslVQVRKRXVZ2b8vMPlzY79+/UKv6gPX33O7bA7MKNDw/p0vHI8+U6fl6
         XVTCsrmgEvdoh5KTpvSHEOSIU4ih+L4Uj2KsjwhGt5FmQO30KwD3PO2c8i0bitA1aJSv
         Y4wmfjzxSAgRQg004wlaTAVOGW/yLM5wRrmTATYzZmpSXS9fp8KpBj5xURlDu5GrsjUO
         J7+3+WDapX3UP6nn1NzprxXIultdvUkBURzJ6sW6aYqUEo/ABlJxtsCXgpn6BWuUoH6W
         fGEmVO7B3RSbQA/WH3+QPeThpOrMtITH69P0LKTu4m44zRHAfNyXZUHq2kybQEHB1/Zt
         UvwQ==
X-Gm-Message-State: AOAM531JffC0zEG9ubWNYLxOqMiu3nGeFTSqI7gLlKimAQuRXy1t5I+1
        sWZLf+AdP0R0cVgwHlkihTRexA598co+Ocq92gc=
X-Google-Smtp-Source: ABdhPJw6tQeaS54MV7wtrabdeH7AwMFF1L5NcQ211BbGEBnnUEUZ4/gBgMNObsvyTKJaG4o39A72OeKy86K8Ebh3w1s=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr1290256ooa.1.1602057947124;
 Wed, 07 Oct 2020 01:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
In-Reply-To: <20201007074447.797968-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Oct 2020 10:05:36 +0200
Message-ID: <CAMuHMdV4EQpT1iGKj6KfMueGVd13nzCXajyY_vq=Bm=rN9V9Lg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> don't bother with a compat handler for it, and remove the remaining
> definitions as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
