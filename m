Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89D61E7992
	for <lists+sparclinux@lfdr.de>; Fri, 29 May 2020 11:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2Jkh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 29 May 2020 05:40:37 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:48976 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgE2Jkg (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 29 May 2020 05:40:36 -0400
Date:   Fri, 29 May 2020 10:40:19 +0100
From:   Sergei Trofimovich <slyfox@gentoo.org>
To:     sparclinux@vger.kernel.org, libc-alpha@sourceware.org
Cc:     "David S. Miller" <davem@davemloft.net>, sparc@gentoo.org,
        toolchain@gentoo.org,
        =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Subject: sparc vs sparc64: O_NDELAY and O_NONBLOCK mismatch in kernel and in
 glibc
Message-ID: <20200529104019.72983ef9@sf>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On most targets glibc defines O_NDELAY as O_NONBLOCK.

glibc's manual/llio.texi manual says they are supposed to be equal:

"""
@deftypevr Macro int O_NDELAY
@standards{BSD, fcntl.h}
This is an obsolete name for @code{O_NONBLOCK}, provided for
compatibility with BSD.  It is not defined by the POSIX.1 standard.
@end deftypevr
"""

A bunch of packages rely on it and find out that this assumption
breaks on sparc in unusual ways. Recently it popped up as:
    https://github.com/eventlet/eventlet/pull/615
Older workarounds:
    https://github.com/libuv/libuv/issues/1830

What is more confusing for me:

linux kernel's uapi definition of O_NDELAY is ABI-dependent:
  arch/sparc/include/uapi/asm/fcntl.h
"""
#if defined(__sparc__) && defined(__arch64__)
#define O_NDELAY        0x0004
#else
#define O_NDELAY        (0x0004 | O_NONBLOCK)
#endif
"""

while glibc's is not:
  sysdeps/unix/sysv/linux/sparc/bits/fcntl.h
"""
#define O_NONBLOCK      0x4000
#define O_NDELAY        (0x0004 | O_NONBLOCK)
"""

Spot-checking preprocessor's output that seems to corroborate:

"""
$ printf "#include <sys/fcntl.h>'\n int o_ndelay = O_NDELAY; int o_nonblock = O_NONBLOCK;" | sparc-unknown-linux-gnu-gcc -E -x c - | fgrep -A3 o_
int o_ndelay =
               (0x0004 | 0x4000)
                       ; int o_nonblock =
                                          0x4000

$ printf "#include <sys/fcntl.h>'\n int o_ndelay = O_NDELAY; int o_nonblock = O_NONBLOCK;" | sparc64-unknown-linux-gnu-gcc -E -x c - | fgrep -A3 o_

int o_ndelay =
               (0x0004 | 0x4000)
                       ; int o_nonblock =
                                          0x4000
"""

I think this skew causes strange effects when you run sparc32
binary on sparc64 kernel (compared to sparc32 binary on sparc32
kernel) as kernel disagrees with userspace on O_NDELAY definition.

https://github.com/libuv/libuv/issues/1830 has more details.

I tried to trace the O_NDELAY definition and stopped at linux-2.1.29:
  https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/diff/include/asm-sparc/fcntl.h?id=b7b4d2d2c1809575374269e14d86ee1953bd168c
which brought O_NDELAY to O_NONBLOCK but did not make them
match exactly.

Question time:

1. Why is sparc32 special? Does it have something to do with
   compatibility to other OSes of that time? (Solaris? BSD?)

   fs/fcntl.c has kernel handling:
        /* required for strict SunOS emulation */
        if (O_NONBLOCK != O_NDELAY)
               if (arg & O_NDELAY)
                   arg |= O_NONBLOCK;
   but why does it leak to to userspace header definition?

   I think it should not.

2. Should sparc64-glibc change it's definition? Say, from
    #define O_NDELAY        (0x0004 | O_NONBLOCK)
   to
    #define O_NDELAY        O_NONBLOCK

    I think it should.

3. Should sparc32-linux (and glibc) change it's definition? Say, from
   #if defined(__sparc__) && defined(__arch64__)
   #define O_NDELAY        0x0004
   #else
   #define O_NDELAY        (0x0004 | O_NONBLOCK)
   #endif
  to
   #define O_NDELAY        (0x0004 | O_NONBLOCK)
  or even to 
  #define O_NDELAY        O_NONBLOCK
  and make sure kernel maps old O_NDELAY to O_NONBLOCK?

  I think '#define O_NDELAY O_NONBLOCK' would be most
  consistent.

What do you think?

Thanks!

-- 

  Sergei
