Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C292500D
	for <lists+sparclinux@lfdr.de>; Tue, 21 May 2019 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfEUNX3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 21 May 2019 09:23:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38087 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfEUNX1 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 21 May 2019 09:23:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so18622591wrs.5
        for <sparclinux@vger.kernel.org>; Tue, 21 May 2019 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zPeZPlO76ltnQqvYGINFToUvBJmXqM645QmEt4Hw6Rc=;
        b=BUu5zjdtN4tz3uDq/7UpOx4K4hUQVJBWS+eEuFLdpi6Rmwdp0HavCUwLV8syhoRhBs
         uutuEJthT54zEPxESFMYXggKMqpF+e9kjCS2KXB6a8V8DjwFSU/ukGJ+bjlCRLwN7Itn
         NioFIdnrRyEyEXF9J8PaDiZ1BKte4njCTV4UqMcQIxHCp36wZKBXLuGaTuzR077IIyGB
         sh/VNZyNC9dytmpNSG0A/cuTGl76M/BtkEN2Bj2PP9spj3uzju6GRwQbZsYefL3l1zFQ
         DUpnJfPzQ1HZROA8RvSmOKB1jZ+QySIxvLrPIvBwJ5t1t+aSsSSgiGJe52BZXhX2b2t5
         /pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zPeZPlO76ltnQqvYGINFToUvBJmXqM645QmEt4Hw6Rc=;
        b=kr3kHF77l+98Z3TaT8BNnqG8bMIVvC9iOAvYB0s1T6HcDl0KqfY5F1kuAwgmOiC7jM
         TkqzRF9H/+6A/KVX5x6Lh8uHzvdoDv8VjlNH/4FvJCHvnXl5QHUhHpXuglP5kmAb9WnX
         PnixVVeYBEFoZC359GI2tqIe1Y9iL3O9zMf5z/SC0iweM7hpQ3mhRscoU9ddmAzJhDop
         c8XdsV6m9tnK8IVUlqI1hPlFFRqfUWR+HlI4IZ6Qr/ikDTJE31ScRuw2HayNGcVA+nfi
         rCSgnU5sPNeFmgZ6be/VQT8A4rj7dgBZHxU4yJeZThDwGzsefT7Azz+JkoEr6UpOENlR
         crhQ==
X-Gm-Message-State: APjAAAVc7AOlhaReHwnrp8QYQxW+R5c8wFUhq2OqVrw2kHLPHFGAl/rV
        FaYDJPbZ+/W5C0GVEJ2NG6sHig==
X-Google-Smtp-Source: APXvYqx9Vd+T8JFd9e9hzlyFLebVljF2D14aArNe6wO+D4nzJaWpMCXvLevCthzGrMSyj5JSdNW7NA==
X-Received: by 2002:adf:e344:: with SMTP id n4mr26865746wrj.192.1558445005993;
        Tue, 21 May 2019 06:23:25 -0700 (PDT)
Received: from brauner.io (p548C9938.dip0.t-ipconnect.de. [84.140.153.56])
        by smtp.gmail.com with ESMTPSA id a15sm5483898wrw.49.2019.05.21.06.23.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 06:23:24 -0700 (PDT)
Date:   Tue, 21 May 2019 15:23:23 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        jannh@google.com, oleg@redhat.com, tglx@linutronix.de,
        torvalds@linux-foundation.org, arnd@arndb.de, shuah@kernel.org,
        dhowells@redhat.com, tkjos@android.com, ldv@altlinux.org,
        miklos@szeredi.hu, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521132252.y5wt7d7o4bdjns4e@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
 <20190521130438.q3u4wvve7p6md6cm@brauner.io>
 <87h89o9cng.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h89o9cng.fsf@oldenburg2.str.redhat.com>
User-Agent: NeoMutt/20180716
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, May 21, 2019 at 03:10:11PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> >> Solaris has an fdwalk function:
> >> 
> >>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> >> 
> >> So a different way to implement this would expose a nextfd system call
> >
> > Meh. If nextfd() then I would like it to be able to:
> > - get the nextfd(fd) >= fd
> > - get highest open fd e.g. nextfd(-1)
> 
> The highest open descriptor isn't istering for fdwalk because nextfd
> would just fail.

Sure. I was thinking about other usecases. For example, sometimes in
userspace you want to do the following:
save_fd = dup(fd, <well-known-number-at-the-end-of-the-range);
close_range(3, (save_fd - 1));

Which brings me to another point. So even if we don't do close_range() I
would like libc to maybe give us something like close_range() for such
scenarios.

> 
> > But then I wonder if nextfd() needs to be a syscall and isn't just
> > either:
> > fcntl(fd, F_GET_NEXT)?
> > or
> > prctl(PR_GET_NEXT)?
> 
> I think the fcntl route is a bit iffy because you might need it to get
> the *first* valid descriptor.
> 
> >> to userspace, so that we can use that to implement both fdwalk and
> >> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> >> /proc.
> >
> > Yeah we probably don't need fdwalk.
> 
> Agreed.  Just wanted to bring it up for completeness.  I certainly don't
> want to derail the implementation of close_range.
> 
> Thanks,
> Florian
