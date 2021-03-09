Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA0233292E
	for <lists+sparclinux@lfdr.de>; Tue,  9 Mar 2021 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCIOwh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Mar 2021 09:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhCIOw0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 9 Mar 2021 09:52:26 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9C9C06174A
        for <sparclinux@vger.kernel.org>; Tue,  9 Mar 2021 06:52:26 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id f4so14205287ybk.11
        for <sparclinux@vger.kernel.org>; Tue, 09 Mar 2021 06:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLFngrQGVB/sdDvHscGkPQd9Jg4SNCPQGeJ/f0+0YDU=;
        b=ZqMiMMYh+32xRD54T/8UEpaPxJ1COSbLzf8RpI2wnqkED3fQqDVxPlDt9rymzKLQIc
         Ner0T45eLv9IFkkGU1z9HRaSGuGNEVvAFwzqPm8dZHO1S+jxAX37sUejwKjQZiEPCspv
         OogZRAq388+Bx/JKyk2738kd6MJdXIBhgBUaRClpeM8Ciu1wY3BXAb+cVCBEYPxdKlDa
         p+J24Unf18kYdTx73CcjuOq89Tu2Je2ohcP7I/hJweoZE1oa3kYpW/Y+PrJ3+oUx6tRX
         nzf4JkT5pAa0XAua8F6J6nFiZN1pcfGRGdiq64l37AVPe1IgUX1eg9DXoOm5eQSngNn1
         4WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLFngrQGVB/sdDvHscGkPQd9Jg4SNCPQGeJ/f0+0YDU=;
        b=gZCymkVUQJXPC/XN5utsz3ygCJ7id6VR/qsXWpHaz9OR3gD84BnFHKfRA8jDOQBvVm
         FU06Zd3GZs/guyX+CPmOpyyvUu8fHs9K6yiWn+R6dB26eHQJqBCr8krppTJ+x3IQgMmg
         tlMGmAfK9l33jcJXyikAwQYnqSIKAXvBWBk1/5MtJfCZY0CZq1kbzRE+C6/b/eEdEx6Z
         o4XaGoGNT/IFAxImai+l4zQ1xh2aDJbVNGF+Qxp+oRV2VwP7I/TX4/eR9aRdZH0OdH6N
         Kzd0Yc1ZFa+Vc7oeiux0uVUd0aJy5ZpdYEK6NfsGpsaIDXUhhB0uDYW4bikBpTla4LaK
         6AQA==
X-Gm-Message-State: AOAM533aDthbP83b5ZoFTXb6cLFvK8YPKLSJMPBCKU9w9iW8/oX7IRN6
        FZXVYBOrw1XqQM1iTniygqMFhvj6E7GKmZf/r4qGLjWjIbdHaA==
X-Google-Smtp-Source: ABdhPJzzBPTNxESxGUPj0kfXZBI5MbfnrOIG5qroZVHzGaWQFlTe3Xyb7GumHurGth1weRkEU6817OSudhHZVsaQxv4=
X-Received: by 2002:a25:c006:: with SMTP id c6mr41805403ybf.353.1615301545852;
 Tue, 09 Mar 2021 06:52:25 -0800 (PST)
MIME-Version: 1.0
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com> <CADxRZqw2yFxEh0ZB-LgJrwBwG0Rxd5ocwDafK1yi5hDEGNC75g@mail.gmail.com>
In-Reply-To: <CADxRZqw2yFxEh0ZB-LgJrwBwG0Rxd5ocwDafK1yi5hDEGNC75g@mail.gmail.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Tue, 9 Mar 2021 17:52:15 +0300
Message-ID: <CADxRZqybON2s+_BWx4LzruuR8dsshiLC=9PcPZ4Svi22Kf3eJg@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault loads
To:     Rob Gardner <rob.gardner@oracle.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Mar 1, 2021 at 7:03 PM Anatoly Pugachev <matorola@gmail.com> wrote:
>
> On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
> >
> > is_no_fault_exception() has two bugs which were discovered via random
> > opcode testing with stress-ng. Both are caused by improper filtering
> > of opcodes.
>
> fixes the issue for me. thanks again
>
> Tested-by: Anatoly Pugachev <matorola@gmail.com>

Rob,

you might want to add:

Fixes: b6fe1089667a7afcc2cf92cdaec590c7b8381715

as well , on a patch submission.
