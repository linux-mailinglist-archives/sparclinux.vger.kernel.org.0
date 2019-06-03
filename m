Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4A8335E6
	for <lists+sparclinux@lfdr.de>; Mon,  3 Jun 2019 19:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfFCRCd (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 3 Jun 2019 13:02:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42578 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfFCRCd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 3 Jun 2019 13:02:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so5810848lje.9
        for <sparclinux@vger.kernel.org>; Mon, 03 Jun 2019 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O+yPhSShogh4P3ENVap3W5oMkAXveVWtK8AHmfJ6K4g=;
        b=WxopflXf16/Ij+BgtcycHtZ4Hmf9aaeOSPmXtzqGSQ8pDwEzPIMOBMYFkAoo4wEYeT
         8VeRq+J0v+JDAfheb+586kInV+Sa1f85J5zB8gURyeRKoOLNnlPfX9pmOGSsXGwefMUi
         0J3B6sJE1Hr8n5WVFsXQ5gn72CRPCxqM1IM0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O+yPhSShogh4P3ENVap3W5oMkAXveVWtK8AHmfJ6K4g=;
        b=Pc6QxbJcLi3S/0cw1XNDrEBQotVlUIPvUQPnHdmZoEigXOJfC/44DzlbLmgk8b9dEQ
         bx8db4bihRsJuS2Hup7CHI9pO1NKj4+9FPsno/WOctGRxXdhZzt3cm8WY5iItnywvuMD
         9zlVQS9o1jcVrKxedNiwIW5SsCpNjJrp8/b/gbVKFlm1weAVX63/SL/7WCWrUThVO9LC
         92c9ZO1LOleIbUDdzS7xu0cUrV8L7fXx5sbZzvfrqm8wSjuzxJWXilNPvEoj7CIuHV/F
         +Y8mdwgHM0jM234Y41Rl9/Fd5QVY7M0rc2jo4Urb6zWBBoKOgDDGueiho6ti8Yi7orVR
         CGkw==
X-Gm-Message-State: APjAAAUp8eSRzAxtKoT/Haa4KlnMEb9un0UylAGJpLAipOy75BiYXfHj
        dW7ifbU7v4VMbqFBBv5m8GRtSpO95ZM=
X-Google-Smtp-Source: APXvYqyhJEJizSO5zY95N3X+jJSHYQQ5fZc6SZ9i2fT1qEWyhiJ/t7FcCalzxxeL8N4bvehoZpaHBA==
X-Received: by 2002:a2e:5b5b:: with SMTP id p88mr4848496ljb.192.1559581350518;
        Mon, 03 Jun 2019 10:02:30 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id e12sm1922426lfb.66.2019.06.03.10.02.27
        for <sparclinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 10:02:30 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id y198so3694433lfa.1
        for <sparclinux@vger.kernel.org>; Mon, 03 Jun 2019 10:02:27 -0700 (PDT)
X-Received: by 2002:a19:2d41:: with SMTP id t1mr13904609lft.79.1559581346039;
 Mon, 03 Jun 2019 10:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de>
 <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
 <20190603074121.GA22920@lst.de> <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
In-Reply-To: <CAHk-=wg5mww3StP8HqPN4d5eij3KmEayM743v-nDKAMgRe2J6g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Jun 2019 10:02:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjU3ycY2FvhKmYmOTi95L0qSi9Hj+yrzWTAWepW-zdBOA@mail.gmail.com>
Message-ID: <CAHk-=wjU3ycY2FvhKmYmOTi95L0qSi9Hj+yrzWTAWepW-zdBOA@mail.gmail.com>
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

On Mon, Jun 3, 2019 at 9:08 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The new code has no test at all for "nr_pages == 0", afaik.

Note that it really is important to check for that, because right now we do

        if (gup_fast_permitted(start, nr_pages)) {
                local_irq_save(flags);
                gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
                local_irq_restore(flags);
        }

and that gup_pgd_range() function *depends* on the range being
non-zero, and does

        pgdp = pgd_offset(current->mm, addr);
        do {
                pgd_t pgd = READ_ONCE(*pgdp);
...
        } while (pgdp++, addr = next, addr != end);

Note how a zero range would turn into an infinite range here.

And the only check for 0 was that

        if (nr_pages <= 0)
                return 0;

in get_user_pages_fast() that you removed.

(Admittedly, it would be much better to have that check in
__get_user_pages_fast() itself, because we do have callers that call
the double-underscore version)

Now, I sincerely hope that we don't have anybody that passes in a zero
nr_pages (or a negative one), but we do actually have a comment saying
it's ok.

Note that the check for "if (end < start)" not only does not check for
0, it also doesn't really check for negative. It checks for
_overflow_. Admittedly most negative values would be expected to
overflow, but it's still a very different issue.

Maybe you added the check for negative somewhere else (in another
patch), but I don't see it.

                Linus
