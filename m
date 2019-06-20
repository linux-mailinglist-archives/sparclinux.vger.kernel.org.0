Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A374D4B8
	for <lists+sparclinux@lfdr.de>; Thu, 20 Jun 2019 19:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFTRWH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Jun 2019 13:22:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45045 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFTRWH (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Jun 2019 13:22:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so3420429ljc.11
        for <sparclinux@vger.kernel.org>; Thu, 20 Jun 2019 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
        b=g1mjJHSB+/44ZB7V3d991RQ8lmWdxyz7cRKmwtk9byrjcNUD9YP2uS+RZIIrKE7lKn
         tVpZNvyJkolb6AtIXbb56yLA6c56wf2OFIIZEIPMa1TRDMJb6FE75meYgwCBSBqSYdRC
         O8jEDgU+LfyGIAqseIIvIOnHddyiMVgjB9lIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
        b=VhGVGPWtJMMl3MX7NPa0bufUL/FRhb/liDe4wpcI3DPw8Djo2EqF5KQWnC/7eNAJbS
         ptNuRY+ZBa57NQOo0ujrAYJtxG4UkqMhxm0znU7BunOzFEbLRs+th+B7Oks/lQ2/e3DS
         LSQTA+Yp89fAXgpG2L0dSqhhOkjhIXnURSJVc6aQL/agLkVKCluKY5SotD1La6YYqoTV
         fIQZ11eGEs6P/mNmtkvDZ0zZCFOUtqL1NSZhnfVmsUjgXLLoiQMZ+w/u/e4h9JfbGfIX
         UYCyz8tIOIojgy08hso42UqxV2EC/wdjhQW1/wXkZBTRkbldOd0wCoyytL2LGMTbr0Ew
         Ve8Q==
X-Gm-Message-State: APjAAAVbdO5hu7Tg2SfEDKZvD04CqwJFp0Y7np+cWBE6pAFDmJ3xDD9T
        JwPF2hEmdy8NPCj5lBf+A9yn4fTZQWE=
X-Google-Smtp-Source: APXvYqyrh5NIuxfaxkt+wtELzQUGVhOX2GyOeEElmIGp/Mde2R+sDEtFgny5f8I7nUfq+NA2HMQkbA==
X-Received: by 2002:a2e:9212:: with SMTP id k18mr23695066ljg.15.1561051324046;
        Thu, 20 Jun 2019 10:22:04 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id w28sm30414ljd.12.2019.06.20.10.22.02
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j29so2984824lfk.10
        for <sparclinux@vger.kernel.org>; Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
X-Received: by 2002:ac2:5601:: with SMTP id v1mr51955604lfd.106.1561051322002;
 Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none> <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
 <1561032202.0qfct43s2c.astroid@bobo.none>
In-Reply-To: <1561032202.0qfct43s2c.astroid@bobo.none>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Jun 2019 10:21:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paul.burton@mips.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Jun 20, 2019 at 5:19 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> The processor aliasing problem happens because the struct will
> be initialised with stores using one base register (e.g., stack
> register), and then same memory is loaded using a different
> register (e.g., parameter register).

Hmm. Honestly, I've never seen anything like that in any kernel profiles.

Compared to the problems I _do_ see (which is usually the obvious
cache misses, and locking), it must either be in the noise or it's
some problem specific to whatever CPU you are doing performance work
on?

I've occasionally seen pipeline hiccups in profiles, but it's usually
been either some serious glass jaw of the core, or it's been something
really stupid we did (or occasionally that the compiler did: one in
particular I remember was how there was a time when gcc would narrow
stores when it could, so if you set a bit in a word, it would do it
with a byte store, and then when you read the whole word afterwards
you'd get a major pipeline stall and it happened to show up in some
really hot paths).

            Linus
