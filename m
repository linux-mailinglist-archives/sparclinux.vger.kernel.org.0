Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20F328616E
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 16:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgJGOnY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 10:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728681AbgJGOnX (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 10:43:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C70C0613D2
        for <sparclinux@vger.kernel.org>; Wed,  7 Oct 2020 07:43:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id ly6so3321668ejb.8
        for <sparclinux@vger.kernel.org>; Wed, 07 Oct 2020 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yaN1rjyLrPsyFHJUcCMRII0CnG4UdUmiNrPeZE3+a2o=;
        b=nkOVjFaap1/yZl4CUDg4K4Ox8KSB9wy9sJrCPdFITMcuwfROhxDXnBr9RlyK9JOwM1
         VEAi9SVibNPsv71oy6nhtbqsusqW+/QiwUIyumUUh6zDmPusa/d38voD+N5QCxtT+5f/
         nCjBDNyPjCzVz7ySiHW+pDlThvHFopXt0tucDzNe3e51j5RFzbT8e7VerZ/62jYKjCVh
         y0cBmyibSPFBSvmMxoM2VWww8R5ehMlVAvmJbE7YH+sLVtXF2ZcP8ulxgyDu8nOH9oZW
         KiircQAwFxmSIXUj/e/0IYDv/uPIpHIPSX+blkBd56Qpag2B3btDwunrD7oqikY7az1J
         /dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yaN1rjyLrPsyFHJUcCMRII0CnG4UdUmiNrPeZE3+a2o=;
        b=PojmbPFmzrqychol07m3GHRqMg4ZY2CPR+NPVqeWSfnO6T5U3LzVYX7Um24L4e06Sw
         iQWgHDUABZsJIPZ83MRc9Gs2nx7xcBQS4vWnhTeYcy6UOB8LpVDb2RDjlaabtYVKRQVy
         1jabwU3Xes2I/t9CmkNkQ/+wO3kj/b9qrprlFPuOL3Rb+gIxfS0nOnA6W8HtdYi5+gQZ
         zNpLblz7tr6KUtiVk9cOxVvnk/UxO2i0ngNqvExwRt04xpW9qm9nW8ahxiUY1vsJHoBP
         /7hapCju/J+KKUKE4wd/QQPzL1zogHnk1tWh1D5GETNmh+1K/VN1jJN4NwXdKeTzMb1G
         v5FA==
X-Gm-Message-State: AOAM5303p7uNIC7BFHNfcofXYU7BoaenurnIQh3nWY6GKmqoSso832ul
        xxtv0se9c0mMPfxZRoinyjhauhsl2F/M/YuVPB8t0w==
X-Google-Smtp-Source: ABdhPJzcK0C/z7p/R/rO2dkoBnGMVzKrffZV6M0+dNfgCx+3Vi4jT221WFvbiB0KTziaharLk7wRJUaJVTHbRe80EQQ=
X-Received: by 2002:a17:906:33c8:: with SMTP id w8mr3659464eja.233.1602081801820;
 Wed, 07 Oct 2020 07:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201007073932.865218-1-jannh@google.com> <20201007123544.GA11433@infradead.org>
In-Reply-To: <20201007123544.GA11433@infradead.org>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 7 Oct 2020 16:42:55 +0200
Message-ID: <CAG48ez3kjTeVtQcjQerYYRs7sX5qq3O7SU-FEaYLNXisFmAeOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To:     Christoph Hellwig <hch@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 2:35 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Oct 07, 2020 at 09:39:31AM +0200, Jann Horn wrote:
> > diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
> > index 078608ec2e92..b1fabb97d138 100644
> > --- a/arch/powerpc/kernel/syscalls.c
> > +++ b/arch/powerpc/kernel/syscalls.c
> > @@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_t len,
> >  {
> >       long ret = -EINVAL;
> >
> > -     if (!arch_validate_prot(prot, addr))
> > +     if (!arch_validate_prot(prot, addr, len))
>
> This call isn't under mmap lock.  I also find it rather weird as the
> generic code only calls arch_validate_prot from mprotect, only powerpc
> also calls it from mmap.
>
> This seems to go back to commit ef3d3246a0d0
> ("powerpc/mm: Add Strong Access Ordering support")

I'm _guessing_ the idea in the generic case might be that mmap()
doesn't check unknown bits in the protection flags, and therefore
maybe people wanted to avoid adding new error cases that could be
caused by random high bits being set? So while the mprotect() case
checks the flags and refuses unknown values, the mmap() code just lets
the architecture figure out which bits are actually valid to set (via
arch_calc_vm_prot_bits()) and silently ignores the rest?

And powerpc apparently decided that they do want to error out on bogus
prot values passed to their version of mmap(), and in exchange, assume
in arch_calc_vm_prot_bits() that the protection bits are valid?

powerpc's arch_validate_prot() doesn't actually need the mmap lock, so
I think this is fine-ish for now (as in, while the code is a bit
unclean, I don't think I'm making it worse, and I don't think it's
actually buggy). In theory, we could move the arch_validate_prot()
call over into the mmap guts, where we're holding the lock, and gate
it on the architecture or on some feature CONFIG that powerpc can
activate in its Kconfig. But I'm not sure whether that'd be helping or
making things worse, so when I sent this patch, I deliberately left
the powerpc stuff as-is.
