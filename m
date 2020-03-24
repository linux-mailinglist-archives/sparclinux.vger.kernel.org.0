Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD66C1917E6
	for <lists+sparclinux@lfdr.de>; Tue, 24 Mar 2020 18:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbgCXRmG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 24 Mar 2020 13:42:06 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35510 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgCXRmG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 24 Mar 2020 13:42:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id u68so9659253pfb.2
        for <sparclinux@vger.kernel.org>; Tue, 24 Mar 2020 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQvsNwxzxnaojuxdbx2mdkelhql3N9f429mWyfD3kfk=;
        b=GJksm+dIOqXM5eXFzqz3cV/vl2mEZfHIiK/PqwWIEYgsP9oFl7+BKZd3q69fGEco8i
         KXzcnsZOnj53hwEZ4CVDkeKeNdr11Bvyrf2ruZ3ghfxb1lkbF34Te8+uoYF/iKARVSZk
         53Hyb16KVJqpQFrkXOEmNl80TA3u8+eKT/tnYstthmmVSDMxlu8iWnztXCzcFXLpynvo
         Y1vZba79yaPrukpv6R7eC4pQPz/ukm/MwXxrawIKgZ8F28Rd/jhSsj+eSm76goQVtSGR
         xWABVQfCyvYHfZgJB//dA19rdshcf89CEu5cSJzREj810H6B8VToJZXNBUmjpvRCJhpx
         0PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQvsNwxzxnaojuxdbx2mdkelhql3N9f429mWyfD3kfk=;
        b=nStA+Bb7or8JLRUmsj1rIs1Lnq3OckxjbYIRK0dMy3IGNY4QpKT0DVIneRImASZTvf
         QezQOD1xZdibcJDeaUw/zXZOACRYU0JmdGy958HgmUrMrCW4Ng6tN0y/uzdvxU9mX6fi
         ZmbcIJ6HKtndQr9KQ7j7tXUvlHnBuSZTKzfa1uWeWDghmiqvABZPQtJ/ucUpHRZYFF3u
         2VitQ5jYiNR0zpfnD5YyrjEf2mKhJy4IU0M0ZfA4zV/JLqSRNgCwGggezAFqCSEZZuPw
         y2fkn0Q1R69D2EcQBq1MxEai9FWuPjHppfZUy7nuTxh2tfooohUXiLOTDn2Iszq5eKP1
         REOQ==
X-Gm-Message-State: ANhLgQ27d4d8InZ4vzS+P0ck4M+kkbK1tmSueH9lantFysOOrVrpY4ne
        AZdwtFJsAlHVwNj2E9nYgv+q4UPKo+tfc2bI/zt4lw==
X-Google-Smtp-Source: ADFU+vuI9Q2NMgKPwV+54NfG9A4c5DDLK/vxfhGRUrBZNWUwML032OwOdrGfJUtd7SxTuglgUf50kwg7PJF4bCs3HaI=
X-Received: by 2002:a63:a34d:: with SMTP id v13mr7252015pgn.10.1585071724656;
 Tue, 24 Mar 2020 10:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200324104005.11279-1-will@kernel.org> <20200324104005.11279-2-will@kernel.org>
In-Reply-To: <20200324104005.11279-2-will@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 10:41:52 -0700
Message-ID: <CAKwvOd=_v__=b6ijFYkxgDsmxakmkxwDWFG48601Gh9cyhj3PA@mail.gmail.com>
Subject: Re: [PATCH 1/4] sparc32: mm: Fix argument checking in __srmmu_get_nocache()
To:     Will Deacon <will@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Matt Fleming <matt@codeblueprint.co.uk>,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Mar 24, 2020 at 3:52 AM Will Deacon <will@kernel.org> wrote:
>
> The 'size' argument to __srmmu_get_nocache() is a number of bytes not
> a shift value, so fix up the sanity checking to treat it properly.
>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/sparc/mm/srmmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index f56c3c9a9793..a19863cac0c4 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -175,18 +175,18 @@ pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
>   */
>  static void *__srmmu_get_nocache(int size, int align)
>  {
> -       int offset;
> +       int offset, minsz = 1 << SRMMU_NOCACHE_BITMAP_SHIFT;
>         unsigned long addr;
>
> -       if (size < SRMMU_NOCACHE_BITMAP_SHIFT) {
> +       if (size < minsz) {
>                 printk(KERN_ERR "Size 0x%x too small for nocache request\n",
>                        size);
> -               size = SRMMU_NOCACHE_BITMAP_SHIFT;
> +               size = minsz;
>         }
> -       if (size & (SRMMU_NOCACHE_BITMAP_SHIFT - 1)) {
> -               printk(KERN_ERR "Size 0x%x unaligned int nocache request\n",
> +       if (size & (minsz - 1)) {
> +               printk(KERN_ERR "Size 0x%x unaligned in nocache request\n",

Was modifying the printk intentional? int vs in ?

>                        size);
> -               size += SRMMU_NOCACHE_BITMAP_SHIFT - 1;
> +               size += minsz - 1;
>         }
>         BUG_ON(align > SRMMU_NOCACHE_ALIGN_MAX);
>
> --
> 2.20.1
>


-- 
Thanks,
~Nick Desaulniers
