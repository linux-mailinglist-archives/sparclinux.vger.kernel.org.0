Return-Path: <sparclinux+bounces-164-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F65838D3A
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 12:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6350D284C02
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0E25D72E;
	Tue, 23 Jan 2024 11:17:16 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EB15D8FC;
	Tue, 23 Jan 2024 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706008636; cv=none; b=QFiwinrfQ0C82hfwR+ZkZP+TwRZfgIjoPPDFHdNxB6LA7SDxTTcS28g8IebjcSvsX+e6jMf8Rw98vLNR8J8qywPj6dLDPMojiGG2pfLW0dzbJn/aGAmo4/M3zrP534B98ijiaNP78GcLjgm75S0CHvnKDhdnzpiOPd4dgcpCjEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706008636; c=relaxed/simple;
	bh=PhFtbKKxCyRQcfECiSYZj99oUivuJJBtHAiQ+xcjLek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuStTrBGwdCHwulQTCiZ2Rb3kHQIia8Jio31XijmGfgpyP3KPwnYz0phkyjWBgwBLmrTZ1kdMGZt6zfm8rkn30l7OBSJyV+MYWF/gxPpZS2B51lg0k47acam5a2mzr/2u0geIl59lSMj5gSCD65pQhLE3r9XX59fBtzOUciRj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AAB21FB;
	Tue, 23 Jan 2024 03:17:58 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436DD3F762;
	Tue, 23 Jan 2024 03:17:09 -0800 (PST)
Message-ID: <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
Date: Tue, 23 Jan 2024 11:17:07 +0000
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
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
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2024 11:02, David Hildenbrand wrote:
> On 23.01.24 11:48, David Hildenbrand wrote:
>> On 23.01.24 11:34, Ryan Roberts wrote:
>>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>>>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    arch/arm/include/asm/pgtable.h   | 2 ++
>>>>    arch/arm64/include/asm/pgtable.h | 2 ++
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>>>> index d657b84b6bf70..be91e376df79e 100644
>>>> --- a/arch/arm/include/asm/pgtable.h
>>>> +++ b/arch/arm/include/asm/pgtable.h
>>>> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>>>>    extern void __sync_icache_dcache(pte_t pteval);
>>>>    #endif
>>>>    +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>> +
>>>>    void set_ptes(struct mm_struct *mm, unsigned long addr,
>>>>                  pte_t *ptep, pte_t pteval, unsigned int nr);
>>>>    #define set_ptes set_ptes
>>>> diff --git a/arch/arm64/include/asm/pgtable.h
>>>> b/arch/arm64/include/asm/pgtable.h
>>>> index 79ce70fbb751c..d4b3bd96e3304 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte,
>>>> unsigned int nr_pages)
>>>>            mte_sync_tags(pte, nr_pages);
>>>>    }
>>>>    +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>
>>> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
>>> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
>>> kept contigously, so if you happen to be setting a mapping for which the
>>> physical memory block straddles bit 48, this won't work.
>>
>> Right, as soon as the PTE bits are not contiguous, this stops working,
>> just like set_ptes() would, which I used as orientation.
>>
>>>
>>> Today, only the 64K base page config can support 52 bits, and for this,
>>> OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
>>> coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
>>> Fortunately we already have helpers in arm64 to abstract this.
>>>
>>> So I think arm64 will want to define its own pte_next_pfn():
>>>
>>> #define pte_next_pfn pte_next_pfn
>>> static inline pte_t pte_next_pfn(pte_t pte)
>>> {
>>>     return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
>>> }
>>>
> 
> Digging into the details, on arm64 we have:
> 
> #define pte_pfn(pte)           (__pte_to_phys(pte) >> PAGE_SHIFT)
> 
> and
> 
> #define __pte_to_phys(pte)     (pte_val(pte) & PTE_ADDR_MASK)
> 
> But that implies, that upstream the PFN is always contiguous, no?
> 


But __pte_to_phys() and __phys_to_pte_val() depend on a Kconfig. If PA bits is
52, the bits are not all contiguous:

#ifdef CONFIG_ARM64_PA_BITS_52
static inline phys_addr_t __pte_to_phys(pte_t pte)
{
	return (pte_val(pte) & PTE_ADDR_LOW) |
		((pte_val(pte) & PTE_ADDR_HIGH) << PTE_ADDR_HIGH_SHIFT);
}
static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
{
	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PTE_ADDR_MASK;
}
#else
#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_MASK)
#define __phys_to_pte_val(phys)	(phys)
#endif


