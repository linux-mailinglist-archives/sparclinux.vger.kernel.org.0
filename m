Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3AC6C3C4
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2019 02:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfGRARi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 17 Jul 2019 20:17:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46403 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbfGRARi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 17 Jul 2019 20:17:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so13516447lfh.13
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2019 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0omOYCeBkj3DClmy7cN352yT9rYjsx3u2yS4CxQowY=;
        b=BvTuMTyXw/kDbnoeAOdMjWZXqMnUi8pjAXkhvdYVsYGuIIDkcsJie3V1m70FCbZdKm
         0rMYzTZbhZpCiT6SqOeMP1CeLmtdHF3hRJVHwmZetf7zBpR2DIPEOAQl9ThV4uq0HD3S
         RKrrQmecpZjF5xWKdw5hXLilgdnrSnHHhHExw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0omOYCeBkj3DClmy7cN352yT9rYjsx3u2yS4CxQowY=;
        b=fYAfAveeGrKzcCGnqaCuaYwtKiEN/UtyfxWNel5jWNwUUGAyvuCLzTyER6oHCNkcLX
         ZYhHa43HtKZ9Ir2RbrUEPXDtFrlL5JYYq27JEiLEFtgTa9xa2ra86exc3o8L2bal4oeQ
         uF6+QXbV6ZXBczKcnqsaq94+nJ67oq1Jz7/PG+z8mxscGt8WwiWUhhEhxB9gIC1LiKDJ
         YdYYCs9lfJIqHjDMIjr3TOM3uvG38UvC0wvTDF3xKz5RhUA+RpwGSgeeVawBzJA1FNkT
         IEws87HQ+i5+C3IJUnMxPLV5RFcezsi1ioGlWcDi5DcuFnlugyKbr8KNR60cEyUcllkV
         UCww==
X-Gm-Message-State: APjAAAWzDAsfu9L/svsRAx/BnHGgHZhDgPBTN6J27Veg3un52x3YpR0q
        3zujmEpQBhQuWBZ+oAAXVUspwsQnf04=
X-Google-Smtp-Source: APXvYqwy50qavdLUqJGgQAfPLqOvLCw8jOEvTmz10A0YBAQWduwkM1LloFqACpduCQO9xDTGts3mcQ==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr19990837lfc.60.1563409055100;
        Wed, 17 Jul 2019 17:17:35 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id v2sm3681870lfi.3.2019.07.17.17.17.33
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 17:17:34 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id c9so17788171lfh.4
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2019 17:17:33 -0700 (PDT)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr19380093lft.79.1563409053376;
 Wed, 17 Jul 2019 17:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190625143715.1689-1-hch@lst.de> <20190625143715.1689-10-hch@lst.de>
 <20190717215956.GA30369@altlinux.org> <CAHk-=whj_+tYSRcDsw7mDGrkmyU9tAk-a53XK271wYtDqYRzig@mail.gmail.com>
 <20190717233031.GB30369@altlinux.org>
In-Reply-To: <20190717233031.GB30369@altlinux.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 17 Jul 2019 17:17:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjmt2i37nn9v+nGC0m8-DdLBMEs=NC=TV-u+9XAzA61g@mail.gmail.com>
Message-ID: <CAHk-=wgjmt2i37nn9v+nGC0m8-DdLBMEs=NC=TV-u+9XAzA61g@mail.gmail.com>
Subject: Re: [PATCH 09/16] sparc64: use the generic get_user_pages_fast code
To:     "Dmitry V. Levin" <ldv@altlinux.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anatoly Pugachev <matorola@gmail.com>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Jul 17, 2019 at 4:30 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> Sure, here it is:

Hmm. I'm not seeing anything obviously wrong in the generic gup conversion.

From the oops, I assume that the problem is that get_user_pages_fast()
returned an invalid page, causing the bad access later in
get_futex_key(). But that's odd too, considering that
get_user_pages_fast() had already accessed the page (both for looking
up the head, and for then doing things like SetPageReferenced(page)).

The only half-way subtle thing is the pte_access_permitted() movement,
but it looks like it matches what gup_pte_range() did in the original
sparc64 code. And the address masking is done the same way too, as far
as I can tell.

So clearly there's something wrong there, but I'm not seeing it. Maybe
I'm incorrectly looking at that pte case, and the problem happened
earlier.

Anyway, I suspect some sparc64 person needs to delve into it.

I know this got reviewed by sparc64 people (the final commit message
only has a single Reviewed-by, but I see an Ack by Davem in my maill
that seems to have gotten lost by the time the patch made it in), but
maybe actually nobody ever _tested_ it until it hit my tree?

                   Linus
