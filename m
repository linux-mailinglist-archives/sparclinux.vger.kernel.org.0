Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425071D54B8
	for <lists+sparclinux@lfdr.de>; Fri, 15 May 2020 17:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgEOPbA (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 15 May 2020 11:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726557AbgEOPa7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Fri, 15 May 2020 11:30:59 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20A5C05BD0A
        for <sparclinux@vger.kernel.org>; Fri, 15 May 2020 08:30:59 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id f5so1328058ybo.4
        for <sparclinux@vger.kernel.org>; Fri, 15 May 2020 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8M59T4cDEOJLPfWM3NacG+hlwu0HRvMBD7PQYBjxWz0=;
        b=cVfP1EZHgz8zdenOeWvamnc44GBqLYOdr2WmAyykkyFcAcIDQ0SV5/TAmshikDIQvo
         yulpVfC68Xv6ngiE6t/ar4WCoTC7n8dOzgdF0s4AwSjprKEmd6/x8y0xNTO1ts6dbKRu
         HygxDJEWJDMfefS2YpJfD9lUwOJQzZwpxGZrCeOX2xIR2XmDWnRHejKeeLEPSsIfEycx
         NcMYydsGE/GFGoRpzpQnm92PyE7h0lsWZp/wQ6nxOlUzgqAo5JPE9937EGZ3EQvzvUO2
         5sebEPqx/YzaSzx7L8Z3nGUFkvkov/gwZzpiOLfHeDqul8vNOpDG74jjK2mZQjtJoQhR
         iVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8M59T4cDEOJLPfWM3NacG+hlwu0HRvMBD7PQYBjxWz0=;
        b=PhVZDD25TJQUAzN5U6y6N+MUOfWb9r/fbuE01sX/nchy3I6m5144oauJDf3fQP5XOA
         jqRVPmqcMNgPnw+jrLiRV6buRsozXVX1SvgPe1RLRlamRbwyncFsWg12ZRAXhRvxduQF
         dqqh7DDbNDjQuKl42aPLaaswrHKg6tjI7VynnjMFzNs3sqcOdLSTEik1C3rm8TJEWXEq
         MJVtQ6CpB2UlUVtxJ2Sh4Hp9FFxo+iWMHSWUO6UjG3WNUiPToG5Sal4Ao4skVkcU7ydd
         /9fz/JvlD8sHEQ6BfcGKOVLBIvIVmj2tc04Z+C6VYr5c9QwMLulfuSKFmSTLnrDOzjxP
         jfgg==
X-Gm-Message-State: AOAM532piMAg8N6cJ+sUQu7nSlIoYA7whW1i2QR8LXpD9gMunxd+jpB3
        8OD9ZUJDqM26hiPeiznESvLpMnFiHm7bB2YuHiJEBQ==
X-Google-Smtp-Source: ABdhPJyg03gRNMcKKRrxVXRbR4cVi3Fqy+ZyhRAq39W/it2u5muxghok2hQKiZQw0d7oCO0JyzBdjBNN7sHeSqgFZ/E=
X-Received: by 2002:a25:8182:: with SMTP id p2mr6384609ybk.408.1589556658495;
 Fri, 15 May 2020 08:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200515152321.9280-1-nate.karstens@garmin.com>
In-Reply-To: <20200515152321.9280-1-nate.karstens@garmin.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 15 May 2020 08:30:47 -0700
Message-ID: <CANn89iKr_9MyRpdB4pcHm08ccH_M42etDnrOzpVKUYfhSKvxQw@mail.gmail.com>
Subject: Re: [PATCH v2] Implement close-on-fork
To:     Nate Karstens <nate.karstens@garmin.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Changli Gao <xiaosuo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, May 15, 2020 at 8:23 AM Nate Karstens <nate.karstens@garmin.com> wrote:
>
>
> Series of 4 patches to implement close-on-fork. Tests have been
> published to https://github.com/nkarstens/ltp/tree/close-on-fork
> and cover close-on-fork functionality in the following syscalls:
>
>  * accept(4)
>  * dup3(2)
>  * fcntl(2)
>  * open(2)
>  * socket(2)
>  * socketpair(2)
>  * unshare(2)
>
> Addresses underlying issue in that there is no way to prevent
> a fork() from duplicating a file descriptor. The existing
> close-on-exec flag partially-addresses this by allowing the
> parent process to mark a file descriptor as exclusive to itself,
> but there is still a period of time the failure can occur
> because the auto-close only occurs during the exec().
>
> One manifestation of this is a race conditions in system(), which
> (depending on the implementation) is non-atomic in that it first
> calls a fork() and then an exec().
>
> This functionality was approved by the Austin Common Standards
> Revision Group for inclusion in the next revision of the POSIX
> standard (see issue 1318 in the Austin Group Defect Tracker).
>
> ---
>
> This is v2 of the change. See https://lkml.org/lkml/2020/4/20/113
> for the original work.
>
> Thanks to everyone who provided comments on the first series of
> patches. Here are replies to specific comments:
>
> > I suggest we group the two bits of a file (close_on_exec, close_on_fork)
> > together, so that we do not have to dirty two separate cache lines.
>
> I could be mistaken, but I don't think this would improve efficiency.
> The close-on-fork and close-on-exec flags are read at different
> times. If you assume separate syscalls for fork and exec then
> there are several switches between when the two flags are read.
> In addition, the close-on-fork flags in the new process must be
> cleared, which will be much harder if the flags are interleaved.

:/

Fast path in big and performance sensitive applications is not fork()
and/or exec().

This is open()/close() and others (socket(), accept(), ...)

We do not want them to access extra cache lines for this new feature.

Sorry, I will say no to these patches in their current form.
