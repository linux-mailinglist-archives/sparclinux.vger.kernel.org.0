Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC829A6B8
	for <lists+sparclinux@lfdr.de>; Tue, 27 Oct 2020 09:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895035AbgJ0Iid (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 27 Oct 2020 04:38:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895032AbgJ0Iid (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 27 Oct 2020 04:38:33 -0400
Received: from kernel.org (unknown [87.70.96.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C11822202;
        Tue, 27 Oct 2020 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603787912;
        bh=+dg6y245gJ/L/iVvDw0zsMRT1YcHeax7uEbyu/BJ1vU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vvKAPuYKxTdVNDwya4r3iDVjxe8A/dfT1KkHWZ2jber7PIqFofblUr/spVu5jBkBm
         MQdFvQl0xxFyWw19nhjLmQKrxETaTmSPzdpKryLQfRCY42kv1ouILXBiwwp7JDzj+f
         1m13PYW49F1mKn6btDBt0MyRnWGW82tINBD33+oE=
Date:   Tue, 27 Oct 2020 10:38:16 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "david@redhat.com" <david@redhat.com>,
        "cl@linux.com" <cl@linux.com>,
        "gor@linux.ibm.com" <gor@linux.ibm.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
        "penberg@kernel.org" <penberg@kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
        "will@kernel.org" <will@kernel.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "kirill@shutemov.name" <kirill@shutemov.name>,
        "rientjes@google.com" <rientjes@google.com>,
        "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
        "paulus@samba.org" <paulus@samba.org>,
        "hca@linux.ibm.com" <hca@linux.ibm.com>,
        "bp@alien8.de" <bp@alien8.de>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "luto@kernel.org" <luto@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Brown, Len" <len.brown@intel.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201027083816.GG1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > Indeed, for architectures that define
> > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > > it is
> > > > possible that __kernel_map_pages() would fail, but since this
> > > > function is
> > > > void, the failure will go unnoticed.
> > > 
> > > Could you elaborate on how this could happen? Do you mean during
> > > runtime today or if something new was introduced?
> > 
> > A failure in__kernel_map_pages() may happen today. For instance, on
> > x86
> > if the kernel is built with DEBUG_PAGEALLOC.
> > 
> >         __kernel_map_pages(page, 1, 0);
> > 
> > will need to split, say, 2M page and during the split an allocation
> > of
> > page table could fail.
> 
> On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
> on the direct map and even disables locking in cpa because it assumes
> this. If this is happening somehow anyway then we should probably fix
> that. Even if it's a debug feature, it will not be as useful if it is
> causing its own crashes.
> 
> I'm still wondering if there is something I'm missing here. It seems
> like you are saying there is a bug in some arch's, so let's add a WARN
> in cross-arch code to log it as it crashes. A warn and making things
> clearer seem like good ideas, but if there is a bug we should fix it.
> The code around the callers still functionally assume re-mapping can't
> fail.

Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed the call
that unmaps pages back in safe_copy_page will just reset a 4K page to
NP because whatever made it NP at the first place already did the split.

Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of a race
between map/unmap dance in __vunmap() and safe_copy_page() that may
cause access to unmapped memory:

__vunmap()
    vm_remove_mappings()
        set_direct_map_invalid()
					safe_copy_page()	
					    __kernel_map_pages()
					    	return
					    do_copy_page() -> fault
					   	
This is a theoretical bug, but it is still not nice :) 							

> > Currently, the only user of __kernel_map_pages() outside
> > DEBUG_PAGEALLOC
> > is hibernation, but I think it would be safer to entirely prevent
> > usage
> > of __kernel_map_pages() when DEBUG_PAGEALLOC=n.
> 
> I totally agree it's error prone FWIW. On x86, my mental model of how
> it is supposed to work is: If a page is 4k and NP it cannot fail to be
> remapped. set_direct_map_invalid_noflush() should result in 4k NP
> pages, and DEBUG_PAGEALLOC should result in all 4k pages on the direct
> map. Are you seeing this violated or do I have wrong assumptions?

You are right, there is a set of assumptions about the remapping of the
direct map pages that make it all work, at least on x86.
But this is very subtle and it's not easy to wrap one's head around
this.

That's why putting __kernel_map_pages() out of "common" use and
keep it only for DEBUG_PAGEALLOC would make things clearer.

> Beyond whatever you are seeing, for the latter case of new things
> getting introduced to an interface with hidden dependencies... Another
> edge case could be a new caller to set_memory_np() could result in
> large NP pages. None of the callers today should cause this AFAICT, but
> it's not great to rely on the callers to know these details.
 
A caller of set_memory_*() or set_direct_map_*() should expect a failure
and be ready for that. So adding a WARN to safe_copy_page() is the first
step in that direction :)

-- 
Sincerely yours,
Mike.
