Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003F42953A
	for <lists+sparclinux@lfdr.de>; Fri, 24 May 2019 11:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390436AbfEXJ5Q (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 May 2019 05:57:16 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44082 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389782AbfEXJ5Q (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 24 May 2019 05:57:16 -0400
Received: by mail-io1-f68.google.com with SMTP id f22so7274294iol.11
        for <sparclinux@vger.kernel.org>; Fri, 24 May 2019 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M/EcKSjlMMdWfcfrmWG3Y6oYYZWgbCmZ8EBb04SSgDI=;
        b=EeksouSAZsbhL5PUeN9hhOGBqYxIdgSKG5pQ+CgypqeDVq7bvpYcPXpk4nvjOuW49N
         Cd4uShxLwvxYqjNcKJ1dy0vgFQCi2T8kxvU7ymug9tdoWc48ogQukvWRqj+rDoH/lZdi
         mk5z5JSaGumuXh7MuLtf/caHxjlNoDkGebMRL5Kle1S+UkUeFxrzzUYh15VlBefAAZZh
         CGz2xqNtbDLY3X4iOkDE4cj/9EBRAAN5LtdJXmQiizdA26ixBiIxuDmHOO8snmNVAUCf
         D9hWTi20mwBr6A6qLADbL5T84zefMNStJO0L4UzAz8DoygTZHCKwLfWm5uYPmb4D8osW
         kQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M/EcKSjlMMdWfcfrmWG3Y6oYYZWgbCmZ8EBb04SSgDI=;
        b=KHrgZuu90qFHD0WzTRR67vOEZeeBXseWR1A2ZQItMcBJxvJFBTioxMw4AiXhRxC88x
         qfiCfOZzPReLOnw5GdgmAGFXDGbZ9Pn+PG1Z+EEyNeHTKlSMxsCyMiOy67t3dteKI5Dx
         q3kEP4X8MwRwrnXqTjPxxWJt8nvTSmO6IoUbfnYhGW1UFx64QrqW07kHh3IHwGMfwWxJ
         GmjtoQ1DZj8rjS61phvh+tZV8/OGJgBuZ+MAl+0d1QM5Z26URV3Xamayp46JBPUMNLpr
         rgtvM0f7g0hfwgWmYfJT18rTyxN9xpijA8Qup0i6DzwL5nkAySnxNMJuzm+Lhku2Rkdq
         4n9Q==
X-Gm-Message-State: APjAAAVXLM1yMHTmPp7+3BmEbINCTNQHqvIVU27kaHA98NQ66sNJaYM8
        FzTiOeaojvZ96HkeNVPAxSArLA==
X-Google-Smtp-Source: APXvYqz+et+m459Xc/MMXDSFkPYbu9py1MoPd8KKsOjtuxRk1ZkOpU0M8gCI3dUvadZvqxc3xELSrQ==
X-Received: by 2002:a5e:8207:: with SMTP id l7mr5693770iom.232.1558691835391;
        Fri, 24 May 2019 02:57:15 -0700 (PDT)
Received: from brauner.io ([172.56.12.37])
        by smtp.gmail.com with ESMTPSA id 194sm973879itm.40.2019.05.24.02.57.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 02:57:14 -0700 (PDT)
Date:   Fri, 24 May 2019 11:57:04 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Florian Weimer <fweimer@redhat.com>,
        Jann Horn <jannh@google.com>, Oleg Nesterov <oleg@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Shuah Khan <shuah@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Todd Kjos <tkjos@android.com>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [PATCH v1 1/2] open: add close_range()
Message-ID: <20190524095701.b7ioi5gg573vmajh@brauner.io>
References: <20190522155259.11174-1-christian@brauner.io>
 <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
 <20190523163345.q5ynd2ytk7nxcvqf@brauner.io>
 <CAK8P3a26uvqmExJZsezhB+cp2ADM0Ai9jVUKWOFM6kg848bCKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a26uvqmExJZsezhB+cp2ADM0Ai9jVUKWOFM6kg848bCKg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, May 24, 2019 at 09:43:53AM +0200, Arnd Bergmann wrote:
> On Thu, May 23, 2019 at 6:33 PM Christian Brauner <christian@brauner.io> wrote:
> > On Thu, May 23, 2019 at 07:22:17PM +0300, Konstantin Khlebnikov wrote:
> > > On 22.05.2019 18:52, Christian Brauner wrote:> This adds the close_range() syscall. It allows to efficiently close a range
> > > >   22 files changed, 100 insertions(+), 9 deletions(-)
> > > >
> > >
> > > It would be better to split arch/ wiring into separate patch for better readability.
> >
> > Ok. You mean only do x86 - seems to be the standard - and then move the
> > others into a separate patch? Doesn't seem worth to have a patch
> > per-arch, I'd think.
> 
> I think I would prefer the first patch to just add the call without wiring it up
> anywhere, and a second patch do add it on all architectures including x86.

I've split this into two patches and also bumped arm64
__NR_compat_syscalls that I've missed before as you mentioned!

Thanks!
Christian
