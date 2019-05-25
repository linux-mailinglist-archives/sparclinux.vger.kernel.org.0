Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A20842A5B4
	for <lists+sparclinux@lfdr.de>; Sat, 25 May 2019 19:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfEYRGE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 25 May 2019 13:06:04 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45227 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfEYRGE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 25 May 2019 13:06:04 -0400
Received: by mail-lf1-f68.google.com with SMTP id n22so1546432lfe.12
        for <sparclinux@vger.kernel.org>; Sat, 25 May 2019 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUnPUEw25xH84DOq6zJ0v6Aw5NodbUsM/I1jFeyU0KM=;
        b=ZvNWnuQZMG/SkUan4dFz03SkF+F6NtqRC/Cgx2fb5lXthFpCjyzEbczW/SDraYncIR
         zQgHz3FqW2dkuJzWrU9AHwiQ6MhmEIkM0Uwmoc25goSdoXSqyrERxHA6nnEdyvmvjOcJ
         rQ898QL/9J9sDjvhm9K66P/TQWm9eicsR7EOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUnPUEw25xH84DOq6zJ0v6Aw5NodbUsM/I1jFeyU0KM=;
        b=Pisz85gVHIjgnHq1JW7LqQ0l3GqNiNoKRtCg3MZsptfUJPDlboEOIiDG09oshu8yi0
         M/D5U4luGbx6AD65quLIRBSNeo783TyjHyUKY3+jMnWtMBMAr8dEV+vfuF0R8zfEPpdf
         5/dSuBYcZ0xjbqNbR4Izrt7xDN0sVK0Y4X8i5+TPhgvippNrlSCiEdOBzdIGCy4kGzjw
         T8sQVnLvGePObU6LYhYWXmPnNFA0nljrREO52ScBWaNKHc4K4KRzs7h3LczevzF7IMn4
         faiUqmA51pu89HEe5J+/GqTcKHdoB9zbFoCmIdDbNzYnxVezU8iZEmBEQLGYn/A8h7hN
         bI+A==
X-Gm-Message-State: APjAAAXYpRKxPo1enZ7XqTonVp8/yKt5EQz7Cvd6oRYRY3KvB4o5q3I5
        cmBK6kzsSlyMIvUoAGwGh0gPguiAlkM=
X-Google-Smtp-Source: APXvYqxYgjbrmPdcm/LrX1rXl23VaGpvo+cSLDur0TiwmyxjYm/xZ5HXU2ekvqp5YM6i7aRAC7TvBQ==
X-Received: by 2002:ac2:429a:: with SMTP id m26mr15756605lfh.152.1558803962334;
        Sat, 25 May 2019 10:06:02 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 1sm243295ljt.78.2019.05.25.10.06.01
        for <sparclinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 10:06:01 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id l26so9251956lfh.13
        for <sparclinux@vger.kernel.org>; Sat, 25 May 2019 10:06:01 -0700 (PDT)
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr629669lfn.52.1558803961013;
 Sat, 25 May 2019 10:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190525133203.25853-1-hch@lst.de> <20190525133203.25853-5-hch@lst.de>
In-Reply-To: <20190525133203.25853-5-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 May 2019 10:05:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
Message-ID: <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm: add a gup_fixup_start_addr hook
To:     Christoph Hellwig <hch@lst.de>,
        Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

[ Adding Khalid, who added the sparc64 code ]

On Sat, May 25, 2019 at 6:32 AM Christoph Hellwig <hch@lst.de> wrote:
>
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.  I have no idea why this
> is not required for plain old get_user_pages, but it keeps the
> existing sparc64 behavior.

This is actually generic. ARM64 has tagged pointers too. Right now the
system call interfaces are all supposed to mask off the tags, but
there's been noise about having the kernel understand them.

That said:

> +#ifndef gup_fixup_start_addr
> +#define gup_fixup_start_addr(start)    (start)
> +#endif

I'd rather name this much more specifically (ie make it very much
about "clean up pointer tags") and I'm also not clear on why sparc64
actually wants this. I thought the sparc64 rules were the same as the
(current) arm64 rules: any addresses passed to the kernel have to be
the non-tagged ones.

As you say, nothing *else* in the kernel does that address cleanup,
why should get_user_pages_fast() do it?

David? Khalid? Why does sparc64 actually need this? It looks like the
generic get_user_pages() doesn't do it.

                Linus
