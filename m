Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE89E28EF0A
	for <lists+sparclinux@lfdr.de>; Thu, 15 Oct 2020 11:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgJOJFS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 15 Oct 2020 05:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgJOJFS (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 15 Oct 2020 05:05:18 -0400
Received: from gaia (unknown [95.149.105.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F9102145D;
        Thu, 15 Oct 2020 09:05:14 +0000 (UTC)
Date:   Thu, 15 Oct 2020 10:05:12 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Jann Horn <jannh@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201015084936.GC20197@gaia>
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia>
 <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
 <20201012172218.GE6493@gaia>
 <20c85633-b559-c299-3e57-ae136b201526@oracle.com>
 <20201013091638.GA10778@gaia>
 <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 14, 2020 at 03:21:16PM -0600, Khalid Aziz wrote:
> On 10/13/20 3:16 AM, Catalin Marinas wrote:
> > On Mon, Oct 12, 2020 at 01:14:50PM -0600, Khalid Aziz wrote:
> >> On 10/12/20 11:22 AM, Catalin Marinas wrote:
> >>> On Mon, Oct 12, 2020 at 11:03:33AM -0600, Khalid Aziz wrote:
> >>>> On 10/10/20 5:09 AM, Catalin Marinas wrote:
> >>>>> I still think sparc should avoid walking the vmas in
> >>>>> arch_validate_prot(). The core code already has the vmas, though not
> >>>>> when calling arch_validate_prot(). That's one of the reasons I added
> >>>>> arch_validate_flags() with the MTE patches. For sparc, this could be
> >>>>> (untested, just copied the arch_validate_prot() code):
> >>>>
> >>>> I am little uncomfortable with the idea of validating protection bits
> >>>> inside the VMA walk loop in do_mprotect_pkey(). When ADI is being
> >>>> enabled across multiple VMAs and arch_validate_flags() fails on a VMA
> >>>> later, do_mprotect_pkey() will bail out with error leaving ADI enabled
> >>>> on earlier VMAs. This will apply to protection bits other than ADI as
> >>>> well of course. This becomes a partial failure of mprotect() call. I
> >>>> think it should be all or nothing with mprotect() - when one calls
> >>>> mprotect() from userspace, either the entire address range passed in
> >>>> gets its protection bits updated or none of it does. That requires
> >>>> validating protection bits upfront or undoing what earlier iterations of
> >>>> VMA walk loop might have done.
> >>>
> >>> I thought the same initially but mprotect() already does this with the
> >>> VM_MAY* flag checking. If you ask it for an mprotect() that crosses
> >>> multiple vmas and one of them fails, it doesn't roll back the changes to
> >>> the prior ones. I considered that a similar approach is fine for MTE
> >>> (it's most likely a user error).
> >>
> >> You are right about the current behavior with VM_MAY* flags, but that is
> >> not the right behavior. Adding more cases to this just perpetuates
> >> incorrect behavior. It is not easy to roll back changes after VMAs have
> >> potentially been split/merged which is probably why the current code
> >> simply throws in the towel and returns with partially modified address
> >> space. It is lot easier to do all the checks upfront and then proceed or
> >> not proceed with modifying VMAs. One approach might be to call
> >> arch_validate_flags() in a loop before modifying VMAs and walk all VMAs
> >> with a read lock held. Current code also bails out with ENOMEM if it
> >> finds a hole in the address range and leaves any modifications already
> >> made in place. This is another case where a hole could have been
> >> detected earlier.
> > 
> > This should be ideal indeed though with the risk of breaking the current
> > ABI (FWIW, FreeBSD seems to do a first pass to check for violations:
> > https://github.com/freebsd/freebsd/blob/master/sys/vm/vm_map.c#L2630).
> 
> I am not sure I understand where the ABI breakage would be. Are we aware
> of apps that intentionally modify address space partially using the
> current code?

I hope there aren't any but you never know until you make the change and
someone complains. Arguably, such user code is already broken since
mprotect() doesn't even tell where the failure occurred.

> What FreeBSD does seems like a reasonable thing to do. Any way first
> thing to do is to update sparc to use arch_validate_flags() and update
> sparc_validate_prot() to not peek into vma without lock.

If you go for arch_validate_flags(), I think sparc_validate_prot()
doesn't need the vma at all.

BTW, on the ADI topic, I think you have a race in do_swap_page() since
set_pte_at() is called before arch_do_swap_page(). So a thread in the
same process would see the new mapping but the tags have not been
updated yet. Unless sparc relies on the new user pte to be set, I think
you can just swap the two calls.

-- 
Catalin
