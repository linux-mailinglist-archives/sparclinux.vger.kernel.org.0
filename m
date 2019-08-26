Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6069CAA6
	for <lists+sparclinux@lfdr.de>; Mon, 26 Aug 2019 09:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfHZHeT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Aug 2019 03:34:19 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42827 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbfHZHeT (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 26 Aug 2019 03:34:19 -0400
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr [81.250.144.103])
        (Authenticated sender: alex@ghiti.fr)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 49BD560003;
        Mon, 26 Aug 2019 07:34:12 +0000 (UTC)
Subject: Re: [PATCH RESEND 0/8] Fix mmap base in bottom-up mmap
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20190620050328.8942-1-alex@ghiti.fr>
From:   Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <abc7ed75-0f51-7f21-5a74-d389f968ee55@ghiti.fr>
Date:   Mon, 26 Aug 2019 09:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190620050328.8942-1-alex@ghiti.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 6/20/19 7:03 AM, Alexandre Ghiti wrote:
> This series fixes the fallback of the top-down mmap: in case of
> failure, a bottom-up scheme can be tried as a last resort between
> the top-down mmap base and the stack, hoping for a large unused stack
> limit.
>
> Lots of architectures and even mm code start this fallback
> at TASK_UNMAPPED_BASE, which is useless since the top-down scheme
> already failed on the whole address space: instead, simply use
> mmap_base.
>
> Along the way, it allows to get rid of of mmap_legacy_base and
> mmap_compat_legacy_base from mm_struct.
>
> Note that arm and mips already implement this behaviour.
>
> Alexandre Ghiti (8):
>    s390: Start fallback of top-down mmap at mm->mmap_base
>    sh: Start fallback of top-down mmap at mm->mmap_base
>    sparc: Start fallback of top-down mmap at mm->mmap_base
>    x86, hugetlbpage: Start fallback of top-down mmap at mm->mmap_base
>    mm: Start fallback top-down mmap at mm->mmap_base
>    parisc: Use mmap_base, not mmap_legacy_base, as low_limit for
>      bottom-up mmap
>    x86: Use mmap_*base, not mmap_*legacy_base, as low_limit for bottom-up
>      mmap
>    mm: Remove mmap_legacy_base and mmap_compat_legacy_code fields from
>      mm_struct
>
>   arch/parisc/kernel/sys_parisc.c  |  8 +++-----
>   arch/s390/mm/mmap.c              |  2 +-
>   arch/sh/mm/mmap.c                |  2 +-
>   arch/sparc/kernel/sys_sparc_64.c |  2 +-
>   arch/sparc/mm/hugetlbpage.c      |  2 +-
>   arch/x86/include/asm/elf.h       |  2 +-
>   arch/x86/kernel/sys_x86_64.c     |  4 ++--
>   arch/x86/mm/hugetlbpage.c        |  7 ++++---
>   arch/x86/mm/mmap.c               | 20 +++++++++-----------
>   include/linux/mm_types.h         |  2 --
>   mm/debug.c                       |  4 ++--
>   mm/mmap.c                        |  2 +-
>   12 files changed, 26 insertions(+), 31 deletions(-)
>

Hi everyone,

Any thoughts about that series ? As said before, this is just a 
preparatory patchset in order to
merge x86 mmap top down code with the generic version.

Thanks for taking a look,

Alex

