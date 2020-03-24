Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F122B191866
	for <lists+sparclinux@lfdr.de>; Tue, 24 Mar 2020 19:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgCXSEh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 24 Mar 2020 14:04:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41320 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgCXSEh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 24 Mar 2020 14:04:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id t16so7716036plr.8
        for <sparclinux@vger.kernel.org>; Tue, 24 Mar 2020 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6D1qQMRRPZ5xDrX5sp8lcIjV/Vfj8BIv8e4N9X0r+E=;
        b=CtW9lS6Y4fS4UkKTuPejMOdSIuUWtVumC0y+idku0teJFY0Ons5GmbVuvn/1ynq1VL
         bujXj6rBx1VLLR/5v+d50dIhSkezniXi1jI0xkKoxZY5o839joVw4zaP+kFSPm4B7VNN
         KEX9lBIrCOMHzomGYlOZTgb/stIwB5+Y8Q7WVq+Tb2FTgTckL7/9mhKeufeE/kYiofUZ
         CGC65HSefnN4HVLP91NomsmYmFMHWw+KHG6S3Cn1GqNo3mALkQaVjf5wxHCfnVmLyzMC
         yCAJHzcSeWFSkHfqF3nHehV2uoA46i6WZMXe/KrecQd5hhY36HOk9WMj2Yk/iKAHA9x2
         DKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6D1qQMRRPZ5xDrX5sp8lcIjV/Vfj8BIv8e4N9X0r+E=;
        b=KZgJaljOHlFjNbp8wn7sHUmLjgdw/7D/LXqCSXak/WVy16sEH+A73yxhwPGrSva3uT
         oVG91LvS50krbdAdhyEG0UWd/UB8gHCE75ySI/OFKHG9QvmuOEscDJaj9wI8jqBQiI6E
         uL/8R7qjnBcEvE0+LUd75O9/lP+EAprkt2ZxsZHzE5HvfJTz4Dr2siluW+fof7T7IJPm
         KsLKxOx/41CPoCm/GK1IvVQ0ylxJDwgEEERIwiKbqqk7CKAIbO73KE9w67aJ4cmlg6+M
         DS4MdsgBmSJmPMKUmC2MidVoy8XSUlSR4MblhX2Et0g2+b3KKZ7B4OtW9u684/RyaBX0
         5Egw==
X-Gm-Message-State: ANhLgQ0BzH/M5R8mu9PTZshBGzpzr5uWaMqWZkAO/fsro+5UfrkBZYO6
        6H/8c8D1U4IQW0ShHkzS7iDhErMXw9kxkc1ngPR7AA==
X-Google-Smtp-Source: ADFU+vszYgPhPSWp9GTbcfQOr/YTNugd2UHb1LSPkkmg+AKX4oRyirK+NJxXo2eP+nGfaRn2NqRfie1Evh/HYQbt2bM=
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr6206355pjb.186.1585073074176;
 Tue, 24 Mar 2020 11:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200324104005.11279-1-will@kernel.org> <20200324104005.11279-2-will@kernel.org>
 <CAKwvOd=_v__=b6ijFYkxgDsmxakmkxwDWFG48601Gh9cyhj3PA@mail.gmail.com> <20200324175113.GA16742@willie-the-truck>
In-Reply-To: <20200324175113.GA16742@willie-the-truck>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 11:04:23 -0700
Message-ID: <CAKwvOdm9q0wPun0zLcFB0Z5NPec08OpHWp3tJV3-ddFiuU2jQA@mail.gmail.com>
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

On Tue, Mar 24, 2020 at 10:51 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Mar 24, 2020 at 10:41:52AM -0700, Nick Desaulniers wrote:
> > On Tue, Mar 24, 2020 at 3:52 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > The 'size' argument to __srmmu_get_nocache() is a number of bytes not
> > > a shift value, so fix up the sanity checking to treat it properly.
> > >
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/sparc/mm/srmmu.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> > > index f56c3c9a9793..a19863cac0c4 100644
> > > --- a/arch/sparc/mm/srmmu.c
> > > +++ b/arch/sparc/mm/srmmu.c
> > > @@ -175,18 +175,18 @@ pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
> > >   */
> > >  static void *__srmmu_get_nocache(int size, int align)
> > >  {
> > > -       int offset;
> > > +       int offset, minsz = 1 << SRMMU_NOCACHE_BITMAP_SHIFT;
> > >         unsigned long addr;
> > >
> > > -       if (size < SRMMU_NOCACHE_BITMAP_SHIFT) {
> > > +       if (size < minsz) {
> > >                 printk(KERN_ERR "Size 0x%x too small for nocache request\n",
> > >                        size);
> > > -               size = SRMMU_NOCACHE_BITMAP_SHIFT;
> > > +               size = minsz;
> > >         }
> > > -       if (size & (SRMMU_NOCACHE_BITMAP_SHIFT - 1)) {
> > > -               printk(KERN_ERR "Size 0x%x unaligned int nocache request\n",
> > > +       if (size & (minsz - 1)) {
> > > +               printk(KERN_ERR "Size 0x%x unaligned in nocache request\n",
> >
> > Was modifying the printk intentional? int vs in ?
>
> Yes, I think "int" is a typo so I just fixed it up while I was here. Do you
> prefer the old way? I couldn't parse it at first, but now you mention it
> I suppose the type of 'size' is int, so *maybe* it makes sense after all!

No preference; the code is validating/updating the `size` which as you
noted is an `int`.

-- 
Thanks,
~Nick Desaulniers
