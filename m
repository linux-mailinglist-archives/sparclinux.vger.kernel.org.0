Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE1B190263
	for <lists+sparclinux@lfdr.de>; Tue, 24 Mar 2020 01:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgCXABS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 23 Mar 2020 20:01:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46418 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgCXABS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 23 Mar 2020 20:01:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id 111so15351429oth.13
        for <sparclinux@vger.kernel.org>; Mon, 23 Mar 2020 17:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqPZ2z3T4bVbn5CSqvppVC02naKBuOD8eHFIwC2ddWU=;
        b=i0cOm9TQV68sXJ0DQ91NNAhtq+pDWjUK5zu+KcEwsG8ia8K1UXo8MdBSfHtqTw0eOF
         wLVy3GaItEUxo/w9TyALg2fc8pQNsqWg8rTlPP7biFm4TGqoOFc+94Xdf0Azy0VdDvrJ
         GsgcU+AIPXOgt78/mgUI4iZ5JUBrgCwT8lKs1LSl+Hc3oX79rS3J/hztsQPGg6QBftyt
         m/lhbG0pevXe5m5ZOfJxqdDKWRK6C9q74yQw8fUE7thCyCR9VF6D8IG/patZlaNsDZxt
         T4aE9OJPLAu52PYwkcyjgvOf3JOoNGfpEo60ovVpid0K+yT74FTxhSCdeN5kqxVhdPit
         UwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqPZ2z3T4bVbn5CSqvppVC02naKBuOD8eHFIwC2ddWU=;
        b=eQqa5dy1xxIKA0/NdDXjZaI6/ZhjCGbiAFA0uYL70hYgDpVBmdwjnfetyaWViUJo4T
         MFoToAJ0FuCz4CB90Sq7h5XyE4alDGy64+CCK6snBXXXfRU+lNLrzJuRF00nE0XQ2dhD
         IvH1p0HplHwmIneFDfi9ZoIiJKKqjAjxOy7Jjo+U+g+fAC+W3Vzxk7GZKjTHPkg/QTyA
         Amx6IM2IHsw+ZuBkJyry4OtXUiCROfmnxmEYQ0MGFmN75CkFV8BLuj2vStuEeniEnVFB
         /TEBj9aDQT6UBIGf2S28ZYJTM28gs4ks3QLLbeC2mvIwt1cNoM8uEAvIuq5wwYJFYZlJ
         yemQ==
X-Gm-Message-State: ANhLgQ0t0I7lrFP2dzvnrLl18d/8mVYdRI5+/nmW0X/ZhgBbeQsXf47p
        Y4r+r5Ueyza4Ih0KXrHLwrFS4dEcn1PxA+1+7GdO7Q==
X-Google-Smtp-Source: ADFU+vvwTD4yTP5DiMILCp8Sgf2fqVaqD38Rdy0wy/vLgfgLVLyTqOkHl6AXz6v+TkaX5d9PyMdj9yDyyZHt2WedcIQ=
X-Received: by 2002:a05:6830:1e10:: with SMTP id s16mr4035137otr.33.1585008076067;
 Mon, 23 Mar 2020 17:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200318220634.32100-1-mike.kravetz@oracle.com> <20200318220634.32100-4-mike.kravetz@oracle.com>
In-Reply-To: <20200318220634.32100-4-mike.kravetz@oracle.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Mon, 23 Mar 2020 17:01:03 -0700
Message-ID: <CAHS8izN1Q+yiZq8zcU8hoojafcQ19W7XQx-HyFm3Ud8hSvN1Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Linux-MM <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Longpeng <longpeng2@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Mar 18, 2020 at 3:07 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> The routine hugetlb_add_hstate prints a warning if the hstate already
> exists.  This was originally done as part of kernel command line
> parsing.  If 'hugepagesz=' was specified more than once, the warning
>         pr_warn("hugepagesz= specified twice, ignoring\n");
> would be printed.
>
> Some architectures want to enable all huge page sizes.  They would
> call hugetlb_add_hstate for all supported sizes.  However, this was
> done after command line processing and as a result hstates could have
> already been created for some sizes.  To make sure no warning were
> printed, there would often be code like:
>         if (!size_to_hstate(size)
>                 hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)
>
> The only time we want to print the warning is as the result of command
> line processing.  So, remove the warning from hugetlb_add_hstate and
> add it to the single arch independent routine processing "hugepagesz=".
> After this, calls to size_to_hstate() in arch specific code can be
> removed and hugetlb_add_hstate can be called without worrying about
> warning messages.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
>  arch/powerpc/mm/hugetlbpage.c |  3 +--
>  arch/riscv/mm/hugetlbpage.c   |  2 +-
>  arch/sparc/mm/init_64.c       | 19 ++++---------------
>  arch/x86/mm/hugetlbpage.c     |  2 +-
>  mm/hugetlb.c                  | 10 +++++++---
>  6 files changed, 18 insertions(+), 34 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 4aa9534a45d7..050809e6f0a9 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
>         clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
>  }
>
> -static void __init add_huge_page_size(unsigned long size)
> -{
> -       if (size_to_hstate(size))
> -               return;
> -
> -       hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> -}
> -
>  static int __init hugetlbpage_init(void)
>  {
>  #ifdef CONFIG_ARM64_4K_PAGES
> -       add_huge_page_size(PUD_SIZE);
> +       hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE_SHIFT);
>  #endif
> -       add_huge_page_size(CONT_PMD_SIZE);
> -       add_huge_page_size(PMD_SIZE);
> -       add_huge_page_size(CONT_PTE_SIZE);
> +       hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_SHIFT);
> +       hugetlb_add_hstate(ilog2(PMD_SIZE) - PAGE_SHIFT);
> +       hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_SHIFT);
>
>         return 0;
>  }
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 166960ba1236..f46464ba6fb4 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
>         if (!arch_hugetlb_valid_size(size))
>                 return -EINVAL;
>
> -       if (!size_to_hstate(size))
> -               hugetlb_add_hstate(shift - PAGE_SHIFT);
> +       hugetlb_add_hstate(shift - PAGE_SHIFT);
>         return 0;
>  }
>
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index bdf89d7eb714..beaa91941db8 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
>  static __init int gigantic_pages_init(void)
>  {
>         /* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
> -       if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
> +       if (IS_ENABLED(CONFIG_64BIT))
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>         return 0;
>  }
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 5c29203fd460..8f619edc8f8c 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
>  }
>
>  #ifdef CONFIG_HUGETLB_PAGE
> -static void __init add_huge_page_size(unsigned long size)
> -{
> -       unsigned int order;
> -
> -       if (size_to_hstate(size))
> -               return;
> -
> -       order = ilog2(size) - PAGE_SHIFT;
> -       hugetlb_add_hstate(order);
> -}
> -
>  static int __init hugetlbpage_init(void)
>  {
> -       add_huge_page_size(1UL << HPAGE_64K_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
> -       add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
> +       hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
>
>         return 0;
>  }
> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
> index dd3ed09f6c23..8a3f586e1217 100644
> --- a/arch/x86/mm/hugetlbpage.c
> +++ b/arch/x86/mm/hugetlbpage.c
> @@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
>  static __init int gigantic_pages_init(void)
>  {
>         /* With compaction or CMA we can allocate gigantic pages at runtime */
> -       if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
> +       if (boot_cpu_has(X86_FEATURE_GBPAGES))
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>         return 0;
>  }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cd4ec07080fb..cc85b4f156ca 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3116,8 +3116,7 @@ static int __init hugetlb_init(void)
>                 }
>
>                 default_hstate_size = HPAGE_SIZE;
> -               if (!size_to_hstate(default_hstate_size))
> -                       hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
> +               hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>         }
>         default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
>         if (default_hstate_max_huge_pages) {
> @@ -3155,7 +3154,6 @@ void __init hugetlb_add_hstate(unsigned int order)
>         unsigned long i;
>
>         if (size_to_hstate(PAGE_SIZE << order)) {
> -               pr_warn("hugepagesz= specified twice, ignoring\n");
>                 return;
>         }
>         BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
> @@ -3231,6 +3229,12 @@ static int __init hugepagesz_setup(char *s)
>                 return 0;
>         }
>
> +       if (size_to_hstate(size)) {
> +               pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n",
> +                       saved_s);
> +               return 0;
> +       }
> +

Not too familiar with the code but I'm a bit confused by this print.
AFAICT this prints the warning when hugepagesz= refers to a hugepage
that is already added via hugetlb_add_hstate, but there is a default
hstate added here without the user specifying hugepagesz, no? Does
that mean the warning prints if you specify this size? Maybe then
clarify the message like:

'HugeTLB: hugepage size already supported: xxxxx' or
'HugeTLB: hugepage size xxxx specified twice or is default size, ignoring.'

Or don't print anything if it's the default size.

>         hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
>         return 1;
>  }
> --
> 2.24.1
>
>
