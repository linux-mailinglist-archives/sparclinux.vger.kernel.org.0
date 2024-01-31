Return-Path: <sparclinux+bounces-250-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58538844290
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 16:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F822940E8
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 15:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026567BAFF;
	Wed, 31 Jan 2024 15:03:05 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19B28288F;
	Wed, 31 Jan 2024 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706713384; cv=none; b=eV11bIKGnAEHHcZdLAlPa23QaDMf0akECOgEkLG1idquX8BQmWDVrkT+u2cG9sgquvINyl6rGXmZq5r73mcYgj8KR45D7ztcayyxW5ZWsKeSg8zzfCP61B6+8v1wrWWcgQbvZscC1t6B3ylXne61Qu/ULHIXwCS9/gjnm1v4cQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706713384; c=relaxed/simple;
	bh=kv8zjaYoSk9dJcDJ0wHeUe8lSIZbo2bgiPkiGFxD39g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcUejHPwvuyag7NoR8nwcZ1HrLRrS4FVbt5RX/HYxkwhUta61gC9iQnK3tSKZTWHYxGVkYPJVPoWmDXDcetyZMWeDD4JaQA/QpNtRKSqSBDC8OhG8v+497J2MuG19o+IYDPymttEcOtMxDGVszlmJYDRUx+3kY7Brp7uhifNY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D6ADA7;
	Wed, 31 Jan 2024 07:03:45 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E47B3F762;
	Wed, 31 Jan 2024 07:02:57 -0800 (PST)
Message-ID: <a34eee7e-3970-4cdd-8c09-bca51132db50@arm.com>
Date: Wed, 31 Jan 2024 15:02:56 +0000
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
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
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
 <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
 <a0cdeb7c-dec8-4971-8b54-e6f65ea48ade@arm.com>
 <74333154-a99b-4bad-81f4-bee02ba05e91@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <74333154-a99b-4bad-81f4-bee02ba05e91@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 14:29, David Hildenbrand wrote:
>>> Note that regarding NUMA effects, I mean when some memory access within the same
>>> socket is faster/slower even with only a single node. On AMD EPYC that's
>>> possible, depending on which core you are running and on which memory controller
>>> the memory you want to access is located. If both are in different quadrants
>>> IIUC, the access latency will be different.
>>
>> I've configured the NUMA to only bring the RAM and CPUs for a single socket
>> online, so I shouldn't be seeing any of these effects. Anyway, I've been using
>> the Altra as a secondary because its so much slower than the M2. Let me move
>> over to it and see if everything looks more straightforward there.
> 
> Better use a system where people will actually run Linux production workloads
> on, even if it is slower :)
> 
> [...]
> 
>>>>
>>>> I'll continue to mess around with it until the end of the day. But I'm not
>>>> making any headway, then I'll change tack; I'll just measure the performance of
>>>> my contpte changes using your fork/zap stuff as the baseline and post based on
>>>> that.
>>>
>>> You should likely not focus on M2 results. Just pick a representative bare metal
>>> machine where you get consistent, explainable results.
>>>
>>> Nothing in the code is fine-tuned for a particular architecture so far, only
>>> order-0 handling is kept separate.
>>>
>>> BTW: I see the exact same speedups for dontneed that I see for munmap. For
>>> example, for order-9, it goes from 0.023412s -> 0.009785, so -58%. So I'm
>>> curious why you see a speedup for munmap but not for dontneed.
>>
>> Ugh... ok, coming up.
> 
> Hopefully you were just staring at the wrong numbers (e.g., only with fork
> patches). Because both (munmap/pte-dontneed) are using the exact same code path.
> 

Ahh... I'm doing pte-dontneed, which is the only option in your original
benchmark - it does MADV_DONTNEED one page at a time. It looks like your new
benchmark has an additional "dontneed" option that does it in one shot. Which
option are you running? Assuming the latter, I think that explains it.

