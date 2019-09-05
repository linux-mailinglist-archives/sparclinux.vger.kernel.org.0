Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAF3AA73D
	for <lists+sparclinux@lfdr.de>; Thu,  5 Sep 2019 17:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732639AbfIEPZb (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 5 Sep 2019 11:25:31 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37136 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbfIEPZb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 5 Sep 2019 11:25:31 -0400
Received: by mail-qk1-f196.google.com with SMTP id s14so2506861qkm.4
        for <sparclinux@vger.kernel.org>; Thu, 05 Sep 2019 08:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NmTVKf6IX64hR5mZWnGqeM0j3TkyXpGJV6p702GOzsM=;
        b=ijs1ZXlQZgLmWpK9cpMYj9RAAo4Ko4XxNHevP2gtiE7F9ujpb/ZY/qQ5TxSMiRjnuO
         7mDRZVFIyehTelvxTHKv0e96Hvyjw91OzJWwH4ACn1rodd1XS7HWoTESqySvZb8bdhGZ
         9a5kCjq75xVFlM8R1fQvC1e6edRngt66M3mlzQWEQdlPXgW3i+QtvVllIeVpexM3sgtI
         T1NZB2r01UuPssZnRc6Z4qwAv5osxdSL3TLKYviehGxOH0838X8o8Ci7ZbbVVxMy1L3f
         uQxYA6uvlHSo1O1ZbeWFnOPK7FDbCNQ2zIcW5GjXD/lGVX2hWKfcrPTBozLPLYsldsRy
         yj3g==
X-Gm-Message-State: APjAAAUJrZbkcMQQSK0aRnEF2XP1BeIFf507wRWR5IAChIcfdsQY4USK
        V1n5Kye1wNpdh0oAw+IYeXkrm5bL1DsWsDmpO9A=
X-Google-Smtp-Source: APXvYqy4NwLRfdp8RAZdez96qmygl6xoumi44KYUWeKdcjWoOY2nnxlF+gsgD0mIEswzaGcp15jwSp7jKVmI9OBq9OA=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr3358152qka.3.1567697129946;
 Thu, 05 Sep 2019 08:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEdQ38E695mQzoi=cJ2KbqzqHpXjkyBGGj=kLrovZLyM8FybbA@mail.gmail.com>
In-Reply-To: <CAEdQ38E695mQzoi=cJ2KbqzqHpXjkyBGGj=kLrovZLyM8FybbA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Sep 2019 17:25:13 +0200
Message-ID: <CAK8P3a1yEnDSPy1P1op2NVpebTkio660NrOQTky6p2fYZOMLuw@mail.gmail.com>
Subject: Re: [bisected] semctl/shmctl/msgctl broken on sparc64
To:     Matt Turner <mattst88@gmail.com>
Cc:     arndb@arndb.de, sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Sep 3, 2019 at 7:02 AM Matt Turner <mattst88@gmail.com> wrote:
>
>
> arch/sparc/include/uapi/asm/unistd.h
>     Defines __32bit_syscall_numbers__ if __arch64__
>
> arch/sparc/include/asm/unistd.h
>     Includes arch/sparc/include/uapi/asm/unistd.h
>     Defines __ARCH_WANT_SYS_IPC if __32bit_syscall_numbers__
>
> ipc/syscall.c
>     Looks like it defines different paths for __ARCH_WANT_SYS_IPC vs not
>
> I get lost at this point, but I'm guessing that's where the difference
> between 32-bit and 64-bit comes from.
>
> Any ideas? I'm happy to test patches.

I found the issue and sent a patch now, see
https://lore.kernel.org/lkml/20190905152155.1392871-2-arnd@arndb.de/

     Arnd
