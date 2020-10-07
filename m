Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD65285582
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 02:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgJGAqI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 6 Oct 2020 20:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgJGAqI (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 6 Oct 2020 20:46:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50728C061755
        for <sparclinux@vger.kernel.org>; Tue,  6 Oct 2020 17:46:07 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id l16so371310eds.3
        for <sparclinux@vger.kernel.org>; Tue, 06 Oct 2020 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GiHfqX5YBUl0yySo1pL2gGGbrA6tqlyBkCWwTPB5NN8=;
        b=ofS3M+BgpBlCmdVu4ulyprSoSciUUGb1Uf38zSGa+0ILdvizmFWWzsTQAB9ztvK/7E
         YVzD43CP0Fiq2tbj1+zAgUQozJZhOCmkUTYQlJObiymbX86JuMePRskDSHTnXPLOQ8F9
         3SbYx306F2TUg/7fAXSL/ZgAfvnJdz+2hE0N95rM8OKtJ0HtrnDTZ6fnr7x5kUmHxQPd
         T7KLcORg/n5aQK7+9/SvtoieJHtgKqjo29sgvBOwG+nzKCuA6PafVOJrP6VFRmYl5yx/
         APyxPH9Pajz+uAJiUhACa5PojVG5H4tHHL3kOWQN7tniv1pNUBkuPK2G+405SozTbYTp
         xIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GiHfqX5YBUl0yySo1pL2gGGbrA6tqlyBkCWwTPB5NN8=;
        b=J4/M6R4lN9anwqCJbNuugqXLUoIBrq+UkrcfCQhb93rwhrA1JHOddiHwbhy8571Z7b
         QxNKVGDCscbLOz5+ETh17xtr3363iHDbqtqh4dCg6dG1/h4iLyS76k2khevJ318iJejH
         iRGcZTwT28HbpwEqQtidEbnKRJUVVVDTtjl5hfVi7fd73FdWI0DagTaSXwLIbiun//wL
         cfAUsRltB4GYRYB0EMvwate2dMK2pAfSEpVjQ9G9XsE/VoPaj+oF70hQFoUrtSdkEP5D
         Nc66/99OM97vqDscIS1clAqlOKUlk35AJEnniislpoFcync6nubdYfVsOexw2N2ZV766
         1rqg==
X-Gm-Message-State: AOAM533FUrwu8rW8kKO//jEwH4oFry1uYotlUqpWtEuWi2Cq3uK7v36k
        L/8C5+iCqPAM8SQ1+XZ1wHo55jbHFEGhM82USbtlzg==
X-Google-Smtp-Source: ABdhPJw3Ia9wju01JmgISNWBKagZYXjISvhNQOdV/iIymh+EUW2r++j7k5Cc0Cwtmcva+LirzNcPmHpvt/PM0Hj0Jnw=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr828322edb.259.1602031565578;
 Tue, 06 Oct 2020 17:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAG48ez3YsfTfOFKa-Po58e4PNp7FK54MFbkK3aUPSRt3LWtxQA@mail.gmail.com>
 <0fb905cc-77a2-4beb-dc9c-0c2849a6f0ae@oracle.com>
In-Reply-To: <0fb905cc-77a2-4beb-dc9c-0c2849a6f0ae@oracle.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 7 Oct 2020 02:45:39 +0200
Message-ID: <CAG48ez3istGAOA=G8fvrQkbMs4MroT8bj=Z=Wmnj0k73K0AFRA@mail.gmail.com>
Subject: Re: SPARC version of arch_validate_prot() looks broken (UAF read)
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Sep 29, 2020 at 7:30 PM Khalid Aziz <khalid.aziz@oracle.com> wrote:
> On 9/28/20 6:14 AM, Jann Horn wrote:
> > From what I can tell from looking at the code:
> >
> > SPARC's arch_validate_prot() looks up the VMA and peeks at it; that's
> > not permitted though. do_mprotect_pkey() calls arch_validate_prot()
> > before taking the mmap lock, so we can hit use-after-free reads if
> > someone concurrently deletes a VMA we're looking at.
>
> That makes sense. It will be a good idea to encapsulate vma access
> inside sparc_validate_prot() between mmap_read_lock() and
> mmap_read_unlock().
>
> >
> > Additionally, arch_validate_prot() currently only accepts the start
> > address as a parameter, but the SPARC code probably should be checking
> > the entire given range, which might consist of multiple VMAs?
> >
> > I'm not sure what the best fix is here; it kinda seems like what SPARC
> > really wants is a separate hook that is called from inside the loop in
> > do_mprotect_pkey() that iterates over the VMAs? So maybe commit
> > 9035cf9a97e4 ("mm: Add address parameter to arch_validate_prot()")
> > should be reverted, and a separate hook should be created?
> >
> > (Luckily the ordering of the vmacache operations works out suIch that
> > AFAICS, despite calling find_vma() without holding the mmap_sem, we
> > can never end up establishing a vmacache entry with a dangling pointer
> > that might be considered valid on a subsequent call. So this should be
> > limited to a rather boring UAF data read, and not be exploitable for a
> > UAF write or UAF function pointer read.)
> >
>
> I think arch_validate_prot() is still the right hook to validate the
> protection bits. sparc_validate_prot() can iterate over VMAs with read
> lock. This will, of course, require range as well to be passed to
> arch_validate_prot().

In that case, do you want to implement this?
When I try to figure out how to implement this based on your
suggestion, it ends up a bit ugly because either mprotect has to do
some extra checks before calling the hook or the hook has to deal with
potentially (partly) unmapped userspace ranges in the supplied range
and then figure out what to do about those. (And for extra fun, it
also has to be safe against concurrent find_extend_vma() but should
probably also not change what happens when the first half of the given
address range is mapped and the second half is not mapped? Or does the
latter not matter?)
It'd also be annoying for me to test since I don't have any setup for
testing SPARC stuff (let alone SPARC ADI).
