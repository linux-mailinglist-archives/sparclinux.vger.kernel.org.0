Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9573349F
	for <lists+sparclinux@lfdr.de>; Mon,  3 Jun 2019 18:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfFCQJE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 3 Jun 2019 12:09:04 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35393 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfFCQJE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 3 Jun 2019 12:09:04 -0400
Received: by mail-lf1-f68.google.com with SMTP id a25so14069113lfg.2
        for <sparclinux@vger.kernel.org>; Mon, 03 Jun 2019 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgsfrWNkeAwXitTJcoIdmm+S5jV0yGJC2wH7GAyc/RM=;
        b=WCXqjpyK9CxskKR1Rsa2JsUVjNbLjTBCO3DKbpdiCOAgDG3/x4OwA5zT3oR9AF+TAb
         KoxRzjysV3/yPddUMg57RzzWz8pj3wl00UXp/zI8qmqY5Pxb0GSO0BkOluklf9MnQYLn
         o8mf30F5cjoqsx0tY+OcCybKIrmRF+OMKq7aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgsfrWNkeAwXitTJcoIdmm+S5jV0yGJC2wH7GAyc/RM=;
        b=gZ+GSZiMXTUMzfHdg6q1k1NZu/LqQ8b78xv3/eAKuP5Nve1IjmXc3HfsEGpLQR0pqZ
         gHacyf77mp6foBnlACiIRvtAhVmtwviZ7y7vuKwXqKBuhlhKbqb4dItGZ96YNcASz45A
         WZ9ayr6kIUzmPCVjpba8D63ybyrsbG/BzHYczFaAkHcsHfGpQIOji4+s9N8KRGzTOS+9
         b7H24hclKCzbVDAKISrtwHgxD/K59+o0Um/QJTKF2KnY40gLFDAUcysQNbN5sNSOeg/R
         SVOUEgvduqCdE/4rp2szSlbpWSsY7HMioysU9V+hZ8I6Wk/AU6PoaDPiT1ctsknxHJ5L
         ND/Q==
X-Gm-Message-State: APjAAAUm++snR7pOLFKNdDDnATg1PDDggMYfhQWIk7yKjLvixU6G4fA9
        nFkJw0Hue8FqnGdZyq9VgVG3MmIHU4E=
X-Google-Smtp-Source: APXvYqyAI1pLPYcRNBYLhbJbLCDnJutvD2eJrlgpIF1sD3IEz5FNcwgwKtm+MC6Q41l1FUEtcaIA5A==
X-Received: by 2002:a19:ed0c:: with SMTP id y12mr13426312lfy.191.1559578142145;
        Mon, 03 Jun 2019 09:09:02 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id q11sm3226672lfh.47.2019.06.03.09.08.59
        for <sparclinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id h11so16803134ljb.2
        for <sparclinux@vger.kernel.org>; Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
X-Received: by 2002:a2e:4246:: with SMTP id p67mr14377820lja.44.1559578139147;
 Mon, 03 Jun 2019 09:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de>
 <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com> <20190603074121.GA22920@lst.de>
In-Reply-To: <20190603074121.GA22920@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jun 2019 09:08:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
Message-ID: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Jun 3, 2019 at 12:41 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I only removed a duplicate of it.

I don't see any remaining cases.

> The full (old) code in get_user_pages_fast() looks like this:
>
>         if (nr_pages <= 0)
>                 return 0;
>
>         if (unlikely(!access_ok((void __user *)start, len)))
>                 return -EFAULT;
>
>         if (gup_fast_permitted(start, nr_pages)) {

Yes, and that code was correct.

The new code has no test at all for "nr_pages == 0", afaik.

                 Linus
