Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612436C2F9
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2019 00:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfGQWFR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 17 Jul 2019 18:05:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36208 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbfGQWFR (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 17 Jul 2019 18:05:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so25226593ljj.3
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2019 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YSDBsvNUqnUp/t7kjQNVbtVYe15sAK39prvQBCJ8iQY=;
        b=g84+xOg5RI1fWUeKUBJwojGU94tRjD8iZnr7jFeKgSFJWGDE5P+hiJZ/fByUC7X2Ud
         Qp+qvIYxZtjYMQm2/OAIJKIyXJb/8NX7XJR0SU91SEDjU6fmhg1H4carPg11uTh9RG8E
         J486BoqJAuMyOcptmKjQRPSZoDYh89CS+IIos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YSDBsvNUqnUp/t7kjQNVbtVYe15sAK39prvQBCJ8iQY=;
        b=hb19imyF4i4x+wt85A5fT6ebj6VIaFF8rIBIr/tbbdjlp9a9/gQ+Oo5JR8nUamrNFf
         af5fIcpQNkFfnjARXCyo6Jzia574hS3JCtHd7aLamfYAMnpt3/7t7bahhIuvYugTxvoi
         ici5QJaqkkhShm+9+6SQ0EvOxTLtpSSPGiujxaK8UqAHWl9H/L2Ge4uFXUO+FL0UhQB4
         oHIl9a+6Zbao26TAHbXGNVWrGKHjvXDp147XlUbTsv/VaZDED4B7XhOkVTgv9U3HpFd3
         YORkZqCKI0GDA53XfFFYH38sTWx7iN0U9yzybQi/6L6cHF4r/Btb5QoQ5PdfRTy/6Q+a
         lVNQ==
X-Gm-Message-State: APjAAAXn9/EAvB2CJiRr+9cOppwYajscMP/W47hwu73qd650op/iiUep
        BgQG6J4ovIb4nfBhSOJjBcnnwfjcbaw=
X-Google-Smtp-Source: APXvYqwwPieegpQThI8sdk9XpKzJDFBh1uD8k16bw6sZGBHLXmwIGmH/b0ZrnJzzPucfsFZTaMrXbA==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr21676817ljj.125.1563401114029;
        Wed, 17 Jul 2019 15:05:14 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id b1sm4712435ljj.26.2019.07.17.15.05.13
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 15:05:13 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id p17so25229102ljg.1
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2019 15:05:13 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr21972538ljg.52.1563401112629;
 Wed, 17 Jul 2019 15:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190625143715.1689-1-hch@lst.de> <20190625143715.1689-10-hch@lst.de>
 <20190717215956.GA30369@altlinux.org>
In-Reply-To: <20190717215956.GA30369@altlinux.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 17 Jul 2019 15:04:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=whj_+tYSRcDsw7mDGrkmyU9tAk-a53XK271wYtDqYRzig@mail.gmail.com>
Message-ID: <CAHk-=whj_+tYSRcDsw7mDGrkmyU9tAk-a53XK271wYtDqYRzig@mail.gmail.com>
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

On Wed, Jul 17, 2019 at 2:59 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> So this ended up as commit 7b9afb86b6328f10dc2cad9223d7def12d60e505
> (thanks to Anatoly for bisecting) and introduced a regression:
> futex.test from the strace test suite now causes an Oops on sparc64
> in futex syscall.

Can you post the oops here in the same thread too? Maybe it's already
posted somewhere else, but I can't seem to find anything likely on
lkml at least..

On x86-64, it obviously just causes the (expected) EFAULT error from
the futex call.

Somebody with access to sparc64 probably needs to debug this, but
having the exact oops wouldn't hurt...

             Linus
