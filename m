Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7088B29A9C3
	for <lists+sparclinux@lfdr.de>; Tue, 27 Oct 2020 11:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898420AbgJ0Kft (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 27 Oct 2020 06:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436742AbgJ0KfK (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Tue, 27 Oct 2020 06:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603794908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mItxCBan+TvaBtPLdVv1EhvNXUYWm/o0gLWrN7AxXiw=;
        b=KRhW0OlS0Fw2T2XXJJZVQ//F4zP6agsct13D8CqGPMYhIZRkVRGVYnwjGCPmxUxDvcmHDJ
        i0W3eF2DkT4vl9m29pKa3Dwmko1IHM39D4dXcYQxwEpUiAjdljJVXqU7CdFy6h1cUcrSHF
        4SF0SjawxSucNJuDO0FAIm/z6i0Y7eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-_KBJoZ_2O0m-D6GuxbEDNA-1; Tue, 27 Oct 2020 06:35:04 -0400
X-MC-Unique: _KBJoZ_2O0m-D6GuxbEDNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C24CF64093;
        Tue, 27 Oct 2020 10:34:58 +0000 (UTC)
Received: from [10.36.113.185] (ovpn-113-185.ams2.redhat.com [10.36.113.185])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BBB1A5C1BD;
        Tue, 27 Oct 2020 10:34:50 +0000 (UTC)
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
To:     Mike Rapoport <rppt@kernel.org>
Cc:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
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
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <e5fc62b6-f644-4ed5-de5b-ffd8337861e4@redhat.com>
 <20201027094714.GI1154158@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <14aee5c8-09d5-7dc2-7d61-d2d44521c5e3@redhat.com>
Date:   Tue, 27 Oct 2020 11:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201027094714.GI1154158@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 27.10.20 10:47, Mike Rapoport wrote:
> On Tue, Oct 27, 2020 at 09:46:35AM +0100, David Hildenbrand wrote:
>> On 27.10.20 09:38, Mike Rapoport wrote:
>>> On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
>>>> On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
>>>>> On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
>>>>>> On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
>>>>>>> Indeed, for architectures that define
>>>>>>> CONFIG_ARCH_HAS_SET_DIRECT_MAP
>>>>>>> it is
>>>>>>> possible that __kernel_map_pages() would fail, but since this
>>>>>>> function is
>>>>>>> void, the failure will go unnoticed.
>>>>>>
>>>>>> Could you elaborate on how this could happen? Do you mean during
>>>>>> runtime today or if something new was introduced?
>>>>>
>>>>> A failure in__kernel_map_pages() may happen today. For instance, on
>>>>> x86
>>>>> if the kernel is built with DEBUG_PAGEALLOC.
>>>>>
>>>>>           __kernel_map_pages(page, 1, 0);
>>>>>
>>>>> will need to split, say, 2M page and during the split an allocation
>>>>> of
>>>>> page table could fail.
>>>>
>>>> On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
>>>> on the direct map and even disables locking in cpa because it assumes
>>>> this. If this is happening somehow anyway then we should probably fix
>>>> that. Even if it's a debug feature, it will not be as useful if it is
>>>> causing its own crashes.
>>>>
>>>> I'm still wondering if there is something I'm missing here. It seems
>>>> like you are saying there is a bug in some arch's, so let's add a WARN
>>>> in cross-arch code to log it as it crashes. A warn and making things
>>>> clearer seem like good ideas, but if there is a bug we should fix it.
>>>> The code around the callers still functionally assume re-mapping can't
>>>> fail.
>>>
>>> Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed the call
>>> that unmaps pages back in safe_copy_page will just reset a 4K page to
>>> NP because whatever made it NP at the first place already did the split.
>>>
>>> Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of a race
>>> between map/unmap dance in __vunmap() and safe_copy_page() that may
>>> cause access to unmapped memory:
>>>
>>> __vunmap()
>>>       vm_remove_mappings()
>>>           set_direct_map_invalid()
>>> 					safe_copy_page()	
>>> 					    __kernel_map_pages()
>>> 					    	return
>>> 					    do_copy_page() -> fault
>>> 					   	
>>> This is a theoretical bug, but it is still not nice :) 							
>>>
>>>>> Currently, the only user of __kernel_map_pages() outside
>>>>> DEBUG_PAGEALLOC
>>>>> is hibernation, but I think it would be safer to entirely prevent
>>>>> usage
>>>>> of __kernel_map_pages() when DEBUG_PAGEALLOC=n.
>>>>
>>>> I totally agree it's error prone FWIW. On x86, my mental model of how
>>>> it is supposed to work is: If a page is 4k and NP it cannot fail to be
>>>> remapped. set_direct_map_invalid_noflush() should result in 4k NP
>>>> pages, and DEBUG_PAGEALLOC should result in all 4k pages on the direct
>>>> map. Are you seeing this violated or do I have wrong assumptions?
>>>
>>> You are right, there is a set of assumptions about the remapping of the
>>> direct map pages that make it all work, at least on x86.
>>> But this is very subtle and it's not easy to wrap one's head around
>>> this.
>>>
>>> That's why putting __kernel_map_pages() out of "common" use and
>>> keep it only for DEBUG_PAGEALLOC would make things clearer.
>>>
>>>> Beyond whatever you are seeing, for the latter case of new things
>>>> getting introduced to an interface with hidden dependencies... Another
>>>> edge case could be a new caller to set_memory_np() could result in
>>>> large NP pages. None of the callers today should cause this AFAICT, but
>>>> it's not great to rely on the callers to know these details.
>>> A caller of set_memory_*() or set_direct_map_*() should expect a failure
>>> and be ready for that. So adding a WARN to safe_copy_page() is the first
>>> step in that direction :)
>>>
>>
>> I am probably missing something important, but why are we saving/restoring
>> the content of pages that were explicitly removed from the identity mapping
>> such that nobody will access them?
>>
>> Pages that are not allocated should contain garbage or be zero
>> (init_on_free). That should be easy to handle without ever reading the page
>> content.
> 
> I'm not familiar with hibernation to say anything smart here, but the
> help text of DEBUG_PAGEALLOC in Kconfig says:
> 
> 	... this option cannot be enabled in combination with
> 	hibernation as that would result in incorrect warnings of memory
> 	corruption after a resume because free pages are not saved to
> 	the suspend image.
> 
> Probably you are right and free pages need to be handled differently,
> but it does not seem the case now.
> 
>> The other user seems to be vm_remove_mappings(), where we only *temporarily*
>> remove the mapping - while hibernating, that code shouldn't be active
>> anymore I guess - or we could protect it from happening.
> 
> Hmm, I _think_ vm_remove_mappings() shouldn't be active while
> hibernating, but I'm not 100% sure.
> 
>> As I expressed in another mail, secretmem pages should rather not be saved
>> when hibernating - hibernation should be rather be disabled.
> 
> Agree.
> 
>> What am I missing?
> 
> I think I miscommunicated the purpose of this set, which was to hide
> __kernel_map_pages() under DEBUG_PAGEALLOC and make hibernation use
> set_direct_map_*() explictly without major rework of free pages handling
> during hibernation.
> 
> Does it help?
> 

Heh, as always, once you touch questionable code, people will beg for 
proper cleanups instead :)


-- 
Thanks,

David / dhildenb

