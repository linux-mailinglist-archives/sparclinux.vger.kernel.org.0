Return-Path: <sparclinux+bounces-243-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE44843F85
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 13:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A451F27F94
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 12:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD13679DAE;
	Wed, 31 Jan 2024 12:37:26 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DFD76C7B;
	Wed, 31 Jan 2024 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704646; cv=none; b=OKgPaUaEobdRuixQUoK8OX7Y8W2aFIeWewBG9BSpG/zRMeKBpUQPNO9zomZMsFrcjvcVawjNA9ABq85wlghV8MqSqPiyOSv/qxJV79b2BN8j6o5UPrrNvtqmVuM5TK5numJzYAEUs34ytwEldTeVn1Mj8jNVddCmJRag4SELQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704646; c=relaxed/simple;
	bh=eRaAZjaP9jf6t16QUPO2IcGvixvhkeF9xfBBEu3mTOw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZI73eTXa84wcWYPqL7j+frNKvTPDCeUEs/zAwMm7nV67qs9tq4GyGKzU6GnqXOYVa0rSuuwyhxEvFDlGDqlOY6ghZOP+UzHlnUZoq3VDYEECJXr0JOxh+nCNc/Yvn4wAgACfBxBI7LZ01Bl/hU3MZRB00TiHS+pcbh1C13emTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70DA8DA7;
	Wed, 31 Jan 2024 04:38:07 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA383F738;
	Wed, 31 Jan 2024 04:37:11 -0800 (PST)
Message-ID: <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
Date: Wed, 31 Jan 2024 12:37:10 +0000
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
From: Ryan Roberts <ryan.roberts@arm.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
Content-Language: en-GB
In-Reply-To: <714d0930-2202-48b6-9728-d248f820325e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/01/2024 11:49, Ryan Roberts wrote:
> On 31/01/2024 11:28, David Hildenbrand wrote:
>> On 31.01.24 12:16, Ryan Roberts wrote:
>>> On 31/01/2024 11:06, David Hildenbrand wrote:
>>>> On 31.01.24 11:43, Ryan Roberts wrote:
>>>>> On 29/01/2024 12:46, David Hildenbrand wrote:
>>>>>> Now that the rmap overhaul[1] is upstream that provides a clean interface
>>>>>> for rmap batching, let's implement PTE batching during fork when processing
>>>>>> PTE-mapped THPs.
>>>>>>
>>>>>> This series is partially based on Ryan's previous work[2] to implement
>>>>>> cont-pte support on arm64, but its a complete rewrite based on [1] to
>>>>>> optimize all architectures independent of any such PTE bits, and to
>>>>>> use the new rmap batching functions that simplify the code and prepare
>>>>>> for further rmap accounting changes.
>>>>>>
>>>>>> We collect consecutive PTEs that map consecutive pages of the same large
>>>>>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>>>>>> the refcount only once per batch, (b) call rmap handling functions only
>>>>>> once per batch and (c) perform batch PTE setting/updates.
>>>>>>
>>>>>> While this series should be beneficial for adding cont-pte support on
>>>>>> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
>>>>>> for large folios with minimal added overhead and further changes[4] that
>>>>>> build up on top of the total mapcount.
>>>>>>
>>>>>> Independent of all that, this series results in a speedup during fork with
>>>>>> PTE-mapped THP, which is the default with THPs that are smaller than a PMD
>>>>>> (for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).
>>>>>>
>>>>>> On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
>>>>>> of the same size (stddev < 1%) results in the following runtimes
>>>>>> for fork() (shorter is better):
>>>>>>
>>>>>> Folio Size | v6.8-rc1 |      New | Change
>>>>>> ------------------------------------------
>>>>>>         4KiB | 0.014328 | 0.014035 |   - 2%
>>>>>>        16KiB | 0.014263 | 0.01196  |   -16%
>>>>>>        32KiB | 0.014334 | 0.01094  |   -24%
>>>>>>        64KiB | 0.014046 | 0.010444 |   -26%
>>>>>>       128KiB | 0.014011 | 0.010063 |   -28%
>>>>>>       256KiB | 0.013993 | 0.009938 |   -29%
>>>>>>       512KiB | 0.013983 | 0.00985  |   -30%
>>>>>>      1024KiB | 0.013986 | 0.00982  |   -30%
>>>>>>      2048KiB | 0.014305 | 0.010076 |   -30%
>>>>>
>>>>> Just a heads up that I'm seeing some strange results on Apple M2. Fork for
>>>>> order-0 is seemingly costing ~17% more. I'm using GCC 13.2 and was pretty
>>>>> sure I
>>>>> didn't see this problem with version 1; although that was on a different
>>>>> baseline and I've thrown the numbers away so will rerun and try to debug this.
> 
> Numbers for v1 of the series, both on top of 6.8-rc1 and rebased to the same
> mm-unstable base as v3 of the series (first 2 rows are from what I just posted
> for context):
> 
> | kernel             |   mean_rel |   std_rel |
> |:-------------------|-----------:|----------:|
> | mm-unstabe (base)  |       0.0% |      1.1% |
> | mm-unstable + v3   |      16.7% |      0.8% |
> | mm-unstable + v1   |      -2.5% |      1.7% |
> | v6.8-rc1 + v1      |      -6.6% |      1.1% |
> 
> So all looks good with v1. And seems to suggest mm-unstable has regressed by ~4%
> vs v6.8-rc1. Is this really a useful benchmark? Does the raw performance of
> fork() syscall really matter? Evidence suggests its moving all over the place -
> breath on the code and it changes - not a great place to be when using the test
> for gating purposes!
> 
> Still with the old tests - I'll move to the new ones now.
> 
> 
>>>>>
>>>>
>>>> So far, on my x86 tests (Intel, AMD EPYC), I was not able to observe this.
>>>> fork() for order-0 was consistently effectively unchanged. Do you observe that
>>>> on other ARM systems as well?
>>>
>>> Nope; running the exact same kernel binary and user space on Altra, I see
>>> sensible numbers;
>>>
>>> fork order-0: -1.3%
>>> fork order-9: -7.6%
>>> dontneed order-0: -0.5%
>>> dontneed order-9: 0.1%
>>> munmap order-0: 0.0%
>>> munmap order-9: -67.9%
>>>
>>> So I guess some pipelining issue that causes the M2 to stall more?
>>
>> With one effective added folio_test_large(), it could only be a code layout
>> problem? Or the compiler does something stupid, but you say that you run the
>> exact same kernel binary, so that doesn't make sense.
> 
> Yup, same binary. We know this code is very sensitive - 1 cycle makes a big
> difference. So could easily be code layout, branch prediction, etc...
> 
>>
>> I'm also surprised about the dontneed vs. munmap numbers.
> 
> You mean the ones for Altra that I posted? (I didn't post any for M2). The altra
> numbers look ok to me; dontneed has no change, and munmap has no change for
> order-0 and is massively improved for order-9.
> 
>  Doesn't make any sense
>> (again, there was this VMA merging problem but it would still allow for batching
>> within a single VMA that spans exactly one large folio).
>>
>> What are you using as baseline? Really just mm-unstable vs. mm-unstable+patches?
> 
> yes. except for "v6.8-rc1 + v1" above.
> 
>>
>> Let's see if the new test changes the numbers you measure.

Nope: looks the same. I've taken my test harness out of the picture and done
everything manually from the ground up, with the old tests and the new. Headline
is that I see similar numbers from both.

Some details:
 - I'm running for 10 seconds then averaging the output
 - test is bimodal; first run (of 10 seconds) after boot is a bit faster on
   average (up to 10%) than the rest; I could guess this is due to the memory
   being allocated more contiguously the first few times through, so struct
   pages have better locality, but that's a guess.
 - test is 5-10% slower when output is printed to terminal vs when redirected to
   file. I've always effectively been redirecting. Not sure if this overhead
   could start to dominate the regression and that's why you don't see it?

I'm inclined to run this test for the last N kernel releases and if the number
moves around significantly, conclude that these tests don't really matter.
Otherwise its an exercise in randomly refactoring code until it works well, but
that's just overfitting to the compiler and hw. What do you think?

Thanks,
Ryan


