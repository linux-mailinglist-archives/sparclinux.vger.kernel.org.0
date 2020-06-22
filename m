Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03D6203FDD
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jun 2020 21:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730081AbgFVTIg (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Jun 2020 15:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgFVTIf (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Jun 2020 15:08:35 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BB6C061573
        for <sparclinux@vger.kernel.org>; Mon, 22 Jun 2020 12:08:33 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v19so11070792qtq.10
        for <sparclinux@vger.kernel.org>; Mon, 22 Jun 2020 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fmbF5ReMV6gTcCmunzV6Xnm7afrjV7Q5Drv0M/zdzdA=;
        b=LlNBHhLkVhfIRKK9itOwSh41YwLAApeTEOH0r7cSaKwZbyLKWjbgZRzLe8gCqQMSxV
         ZOuKSnNr9I3CwHJnhPgtCTdyG/l7Uy+sXhOu2tvt+JMWWpb5YEWWVF/yn2GSTFmuxUQ8
         KhBd5qbVSFJtjVEhj5jgM2oKkp9bFNrd2uguBtH5+qohYZMw/3n+33iSB+vx7qnNwRlz
         iZvLTfMuWaNud4F1QfwTboo6ZlKsfevrnCmXmDJutQtU0iULXqjgssCwQDCmvZgAl6IJ
         t+J+UcD/JoXa4l4e6VJRUNzzxuNM2hxI0bl/goeAyhO1dZIPY9ciI56PMff+bhfYBe2i
         eBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fmbF5ReMV6gTcCmunzV6Xnm7afrjV7Q5Drv0M/zdzdA=;
        b=AK9uj9W5Q9krpLzxXygUrZ8e0wWpM9n4lypvGKx2rRe98RvgqQjbq6+pt89+GrgRSR
         uqCnExE95UIvAie2Lr7Spse4DZ6zHAeB+KespKGakj2YSQ9q/72/iDBgOIPHxONqfKqQ
         kg+S3VxQnGl7vZG4HTfrvFF3L1S+mLbHY53e0HifwNaNtetTNDLn2hW8eyQauVXBpan5
         wrW6Ac6lKJhtP0MESMIwqC9TeM7Ft4C5dkqG/4BNM9UmvxjIK/6xo2p5feZhfRrNHI18
         mHPYqJQern8Nd3D56QvOBYg/OaJIC3teLcjW2OnmrJ5lGuP05Dre4+/StpaUFJVd91bn
         3zIg==
X-Gm-Message-State: AOAM533fMpxwlJs+P71AUT12lv5TIzutWDIdsaKAJ66kM1qvnH2f5+tP
        AS17R0ZKBExHxz9MoQgW9lNf4g==
X-Google-Smtp-Source: ABdhPJyaOjmiDOYNCt8AIEni1E1x5fsrFJNR7T2vIqUZyQqrU0KeW8+zmDPjw2aBVH1Hi7jwI2Lt1A==
X-Received: by 2002:ac8:32e3:: with SMTP id a32mr18228164qtb.118.1592852912603;
        Mon, 22 Jun 2020 12:08:32 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
        by smtp.googlemail.com with ESMTPSA id v6sm2916516qkh.83.2020.06.22.12.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 12:08:31 -0700 (PDT)
To:     Sergei Trofimovich <slyfox@gentoo.org>, sparclinux@vger.kernel.org,
        libc-alpha@sourceware.org
Cc:     sparc@gentoo.org, "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
        toolchain@gentoo.org
References: <20200529104019.72983ef9@sf>
From:   Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: sparc vs sparc64: O_NDELAY and O_NONBLOCK mismatch in kernel and
 in glibc
Message-ID: <a213fcf7-73e3-7727-dea2-f73e1032a307@linaro.org>
Date:   Mon, 22 Jun 2020 16:08:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529104019.72983ef9@sf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



On 29/05/2020 06:40, Sergei Trofimovich via Libc-alpha wrote:
> On most targets glibc defines O_NDELAY as O_NONBLOCK.
> 
> glibc's manual/llio.texi manual says they are supposed to be equal:
> 
> """
> @deftypevr Macro int O_NDELAY
> @standards{BSD, fcntl.h}
> This is an obsolete name for @code{O_NONBLOCK}, provided for
> compatibility with BSD.  It is not defined by the POSIX.1 standard.
> @end deftypevr
> """
> 
> A bunch of packages rely on it and find out that this assumption
> breaks on sparc in unusual ways. Recently it popped up as:
>     https://github.com/eventlet/eventlet/pull/615
> Older workarounds:
>     https://github.com/libuv/libuv/issues/1830
> 
> What is more confusing for me:
> 
> linux kernel's uapi definition of O_NDELAY is ABI-dependent:
>   arch/sparc/include/uapi/asm/fcntl.h
> """
> #if defined(__sparc__) && defined(__arch64__)
> #define O_NDELAY        0x0004
> #else
> #define O_NDELAY        (0x0004 | O_NONBLOCK)
> #endif
> """
> 
> while glibc's is not:
>   sysdeps/unix/sysv/linux/sparc/bits/fcntl.h
> """
> #define O_NONBLOCK      0x4000
> #define O_NDELAY        (0x0004 | O_NONBLOCK)
> """

Doing some archeology it seems that sparc32 originally defined
O_NDELAY as 0x0004, but it has changed it to 0x0004 | O_NONBLOCK
on 2.1.29.

> 
> Spot-checking preprocessor's output that seems to corroborate:
> 
> """
> $ printf "#include <sys/fcntl.h>'\n int o_ndelay = O_NDELAY; int o_nonblock = O_NONBLOCK;" | sparc-unknown-linux-gnu-gcc -E -x c - | fgrep -A3 o_
> int o_ndelay =
>                (0x0004 | 0x4000)
>                        ; int o_nonblock =
>                                           0x4000
> 
> $ printf "#include <sys/fcntl.h>'\n int o_ndelay = O_NDELAY; int o_nonblock = O_NONBLOCK;" | sparc64-unknown-linux-gnu-gcc -E -x c - | fgrep -A3 o_
> 
> int o_ndelay =
>                (0x0004 | 0x4000)
>                        ; int o_nonblock =
>                                           0x4000
> """
> 
> I think this skew causes strange effects when you run sparc32
> binary on sparc64 kernel (compared to sparc32 binary on sparc32
> kernel) as kernel disagrees with userspace on O_NDELAY definition.
> 
> https://github.com/libuv/libuv/issues/1830 has more details.
> 
> I tried to trace the O_NDELAY definition and stopped at linux-2.1.29:
>   https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/diff/include/asm-sparc/fcntl.h?id=b7b4d2d2c1809575374269e14d86ee1953bd168c
> which brought O_NDELAY to O_NONBLOCK but did not make them
> match exactly.
> 
> Question time:
> 
> 1. Why is sparc32 special? Does it have something to do with
>    compatibility to other OSes of that time? (Solaris? BSD?)
> 
>    fs/fcntl.c has kernel handling:
>         /* required for strict SunOS emulation */
>         if (O_NONBLOCK != O_NDELAY)
>                if (arg & O_NDELAY)
>                    arg |= O_NONBLOCK;
>    but why does it leak to to userspace header definition?
> 
>    I think it should not.

It seems to provide some compatibility with SunOS since on Solaris11
O_NDELAY is 0x4 on both 32 and 64 bits. 

> 
> 2. Should sparc64-glibc change it's definition? Say, from
>     #define O_NDELAY        (0x0004 | O_NONBLOCK)
>    to
>     #define O_NDELAY        O_NONBLOCK
> 
>     I think it should.

This will make:

  fcntl(fd, F_SETFL, flags | O_NONBLOCK);
  flags = fcntl(fd, F_GETFL);
  fcntl(fd, F_SETFL, flags & ~O_NDELAY);

Not clearing the flag.

> 
> 3. Should sparc32-linux (and glibc) change it's definition? Say, from
>    #if defined(__sparc__) && defined(__arch64__)
>    #define O_NDELAY        0x0004
>    #else
>    #define O_NDELAY        (0x0004 | O_NONBLOCK)
>    #endif
>   to
>    #define O_NDELAY        (0x0004 | O_NONBLOCK)
>   or even to 
>   #define O_NDELAY        O_NONBLOCK
>   and make sure kernel maps old O_NDELAY to O_NONBLOCK?
> 
>   I think '#define O_NDELAY O_NONBLOCK' would be most
>   consistent.
> 
> What do you think?

I think the main issue here is in fact FIONBIO historical inconsistency
over different system that Linux originally tried to accommodate it:

fs/ioctl.c:

545 static int ioctl_fionbio(struct file *filp, int __user *argp)
546 {
547         unsigned int flag;
548         int on, error;
549 
550         error = get_user(on, argp);
551         if (error)
552                 return error;
553         flag = O_NONBLOCK;
554 #ifdef __sparc__
555         /* SunOS compatibility item. */
556         if (O_NONBLOCK != O_NDELAY)
557                 flag |= O_NDELAY;
558 #endif
559         spin_lock(&filp->f_lock);
560         if (on)
561                 filp->f_flags |= flag;
562         else
563                 filp->f_flags &= ~flag;
564         spin_unlock(&filp->f_lock);
565         return error;
566 }

The issue on sparc is FIONBIO will always try to set/reset *both*
flags at the same time. I think what would be better would be to
either define O_NDELAY and O_NONBLOCK to be the same value of
0x4004 on both sparc32 and sparc64 (since the kernel does treat
them semantically as the same) or try to avoid use FIONBIO set the
socket as non-blocking in favor or fcntl(fd, F_SETFL, ... O_NONBLOCK).
