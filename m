Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98BD31FF6
	for <lists+sparclinux@lfdr.de>; Sat,  1 Jun 2019 18:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfFAQVR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 1 Jun 2019 12:21:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36079 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAQVQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 1 Jun 2019 12:21:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id m22so12208717ljc.3
        for <sparclinux@vger.kernel.org>; Sat, 01 Jun 2019 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
        b=RdmXCPI1V+CWEuQQLIpoDnZHvNbMKl90LuqFIcI1YnEKXhPCSK5AUEFPNd650/ERUV
         Qh10sm7MSlB6HnOBHykL5KhchRGHirJ9ssAdIkVcDYKPumYo1Zi2YYM6BhTRVFDVSg7U
         Nczzjs9o+pp1b0tTsgtO9YPvDZ1uwi7oKCdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKTAJ8E7sNy2vEZhocfTI/IVyiugHenGqfHPAGmTqUU=;
        b=dE6k8xIcb5lwyc6KZhRd/P0SiNlxjCasrdDIDSk5UEHFRtDG/Rh6gO8542RIuE+JwO
         U5P293jl5+rzPwC3ZkyYujAtAK5Jpay6z9Vy1ogjk6YFyHaKrnkCMwj73aZqVfsBY8R1
         KwO5yrLjg+MfPnn/oNvGfsLrO48PD0otfTD68IBbK4T0idKEAOh8+mPBzbt5/LsM0e8l
         a8PC1tsgcchAxSXkWSFEeM/W77Uorhpik5vgXJgkOWWXeI1U+XIrCR4q6SwaU/OXNCYQ
         bDeNtCLoj3OlEgEvB/CpKp9r2djBypX6NNJg+R/eTk3PjbbAEQ8/7llFmCM69il3sJzb
         fpJg==
X-Gm-Message-State: APjAAAUA3PXztz+eR86leQiMKZQhY2O1TxMzL3Jlq/frPQKl6YhQ1zEs
        2isGnP88flBI0kCyC+9k1zv7FXHjikI=
X-Google-Smtp-Source: APXvYqxTTJrzDR8nPTf0nDKDBV89pEWLJT59eiZ7JASy+ubZxPVBzESc58tAPsl1bmbNAt51vetGLg==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr1590407ljk.3.1559406074638;
        Sat, 01 Jun 2019 09:21:14 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 69sm1896475ljs.21.2019.06.01.09.21.14
        for <sparclinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 09:21:14 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id y13so10337341lfh.9
        for <sparclinux@vger.kernel.org>; Sat, 01 Jun 2019 09:21:14 -0700 (PDT)
X-Received: by 2002:a19:ae01:: with SMTP id f1mr8899724lfc.29.1559405673566;
 Sat, 01 Jun 2019 09:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-4-hch@lst.de>
In-Reply-To: <20190601074959.14036-4-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 1 Jun 2019 09:14:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
Message-ID: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
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

On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Pass in the already calculated end value instead of recomputing it, and
> leave the end > start check in the callers instead of duplicating them
> in the arch code.

Good cleanup, except it's wrong.

> -       if (nr_pages <= 0)
> +       if (end < start)
>                 return 0;

You moved the overflow test to generic code - good.

You removed the sign and zero test on nr_pages - bad.

The zero test in particular is _important_ - the GUP range operators
know and depend on the fact that they are passed a non-empty range.

The sign test it less so, but is definitely appropriate. It might be
even better to check that the "<< PAGE_SHIFT" doesn't overflow in
"long", of course, but with callers being supposed to be trusted, the
sign test at least checks for stupid underflow issues.

So at the very least that "(end < start)" needs to be "(end <=
start)", but honestly, I think the sign of the nr_pages should be
continued to be checked.

                      Linus
