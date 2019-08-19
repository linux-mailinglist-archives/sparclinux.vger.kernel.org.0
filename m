Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82DE91CCD
	for <lists+sparclinux@lfdr.de>; Mon, 19 Aug 2019 07:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbfHSF6u (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 19 Aug 2019 01:58:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38932 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfHSF6u (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 19 Aug 2019 01:58:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so571227ljj.6
        for <sparclinux@vger.kernel.org>; Sun, 18 Aug 2019 22:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qP0Q+V8rdR98jQB/sJB729Uy2R6bN+lBSR3BvEBKD1k=;
        b=FQPd+TvKBxNoYFOegMWyRQXi+sQkeptqUISGGZZ6kJ0W/4o7K3Wm+vcl6ghsFTq6rj
         AiY0TXtF4581wMRMd+cs62v0Xy6UoKJ1XmBxyLzLxNX5ppBxchAYRyDw0VXjfQpsJNcm
         ffhwQkamjK7/eQBrdKxceLNSYbQZ+bStx6PEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qP0Q+V8rdR98jQB/sJB729Uy2R6bN+lBSR3BvEBKD1k=;
        b=DpRm85XSk1Nm2fmnpZw7D5S3XF97Y5T9VEBy8yh2gJcETT6bF+wZTU9l3Tb1GjFoH2
         LDQ1u4zqPUlB2hqeUsh1vxQEjj/6dx+CstiOKbNdF9rxscmgWzyv6SINlPQTECVcRc96
         Ulr0fQswBDQQb5UixQRpY9JtnqoqTJZJpLLOM+En2k1S7Ic1ER83/YIGpJHtid4rfDXh
         tnRzXLAoKFR+AcSc8d4CijJEQGcw7Hnf/KDn/TS0LgX7GnxjkZVdMRqueXWW+qOGSY4l
         f/Yu+3LVLsEeYhM3DEtEdYmSWZQxuERhfWqlX8Dpv/+stxKxvgZmmM1QLL4xYnNXBUeH
         aDMg==
X-Gm-Message-State: APjAAAXUqRZ4vmyIc564ikxGZH8cpRTgJN9zNmsELrJCeYUcjijDnKKs
        f6Ca4k9PEGKd/+CUNUKZ0CAgs8RZqek=
X-Google-Smtp-Source: APXvYqxbL8dJuaG59b+4gAAMf0WAZhXcIMAXgNiVCA9XpcjzJKHQ9kXwT0YoxnlCmt+57w44G40DEw==
X-Received: by 2002:a2e:6111:: with SMTP id v17mr7461625ljb.30.1566194327994;
        Sun, 18 Aug 2019 22:58:47 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id z30sm2385809lfj.63.2019.08.18.22.58.47
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 22:58:47 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id h15so561899ljg.10
        for <sparclinux@vger.kernel.org>; Sun, 18 Aug 2019 22:58:47 -0700 (PDT)
X-Received: by 2002:a2e:8ed5:: with SMTP id e21mr11793943ljl.156.1566194326796;
 Sun, 18 Aug 2019 22:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
 <20190818070137.GA22731@infradead.org> <20190818.123943.1491620523133670968.davem@davemloft.net>
 <20190819051055.GA32118@infradead.org>
In-Reply-To: <20190819051055.GA32118@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 18 Aug 2019 22:58:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
Message-ID: <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
To:     Christoph Hellwig <hch@infradead.org>
Cc:     David Miller <davem@davemloft.net>, mroos@linux.ee,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, Aug 18, 2019 at 10:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Aug 18, 2019 at 12:39:43PM -0700, David Miller wrote:
> > From: Christoph Hellwig <hch@infradead.org>
> > Date: Sun, 18 Aug 2019 00:01:37 -0700
> >
> > > I think for now we'll simply have to disable HAVE_FAST_GUP for sparc,
> > > until someone who really knows low-level sparc page table handling
> > > finds some time to audit the generic fast gup code and arch hooks.
> >
> > It's a regression, we don't disable features in those circumstances
> > usually right?
>
> Well, it isn't exactly a feature we lost, but an optimization that makes
> operations go faster vs not allowing them.  Them other option would be
> to revert the whole stack of patches, which is the groundwork for
> fixing the get_user_pages vs truncate and co races, so I'm not very
> eager to do that for sparc64.
>
> But in the end Linus will have to decide.

It does sound like we should just disable HAVE_FAST_GUP for sparc. And
yes, it's "only" an optimization, disabling it shouldn't bvreak
anything. get_user_pages_fast() will fall back on the regular
get_user_pages() logic if there is not fast-GUP.

(In fact, even if there *is* fast-GUP, the whole design of fast-GUP is
to fail for any "hard" case, so that fallback is fundamental).

If it was something more generic I'd argue for reverting, but it does
seem to be very sparc-specific, and there just aren't enough sparc
users to argue for the optimization being critical.

I still can't see what might be wrong in the generic code. It's quite
different from the previous sparc64 code, but just about all the
differences are about how it supports a lot more cases (devmap,
5-level page tables, the crazy powepc "hugepd" thing etc), but all of
those differences should just compile away on sparc64.

There are other small differences. For example, the old sparc64
gup_huge_pud() code did this:

        if (!(pud_val(pud) & _PAGE_VALID))
                return 0;

        if (write && !pud_write(pud))
                return 0;

and the generic gup_huge_pud() code instead does

        if (!pud_access_permitted(orig, flags & FOLL_WRITE))
                return 0;

which does the same thing, but expresses it differently (because sparc
doesn't have its own specific one):

  #define pud_access_permitted(pud, write) \
          (pud_present(pud) && (!(write) || pud_write(pud)))

and "pud_present()" for sparc64 is actually defined as

  #define pud_present(pud)            (pud_val(pud) != 0U)

(notice the difference between checking _PAGE_VALID and checking all bits.

Can there be pud values that are non-zero but also not valid? Maybe.
If so, you'd get different results here.

So both versions look sane, but they aren't identical, and there might
be some sparc64 oddity that just triggers here.

The code apparently works for David for his compiler and hardware
configuration. So it's not *entirely* broken even on sparc64. But yes,
without somebody with the resources to understand why some specific
sparc64 situations don't work, I think we just need to disable
FAST_GUP on sparc64.

               Linus
