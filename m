Return-Path: <sparclinux+bounces-160-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81542838CDD
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 12:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304BF28C277
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78525FDD1;
	Tue, 23 Jan 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ePlJqPGY"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CF5FDD2
	for <sparclinux@vger.kernel.org>; Tue, 23 Jan 2024 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706007748; cv=none; b=Jy42+7WADQ6YwGB2QufMeUMvFMuQZPeVTKadl3QybFXsCN8xTbbqcFqLCXNyNhUfQWBkHB7OXxOZgS2B/oEX3zyNtsIg5w/6YfrtU3p5D3o42nI2ly/omqRTu+5wk7NWYErVxx/Bt3PgMWVQWOUlXPQOyD49g6Mc/NauN4O7VDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706007748; c=relaxed/simple;
	bh=xHRjbHljsfKs8v3osVXO5LAvQqCgJMdWACPEiozXZhY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=F2zXU54hRXcq2lfILTW8ittQ8V03h+xfBMH2eyxCNhnzeildfcEUytK33aBsCdeaTZp+pkBvdf8ty4JDyDV/pP4T3JWuQpBDYB/WgUfju6TMAA/FIp7yAxJoGWq+JkiqcxmK87O77Flu2M+WCuUF6Th0Kuj9SiXjwnxH3/gOSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ePlJqPGY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706007746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ADeVdxuyk9aWMHIaHDhLLOZKsBVve1swb6NJsYgtkms=;
	b=ePlJqPGYz/m7vS8MDxjtAlatpqc0hNiJtB+SeZTgkLQL4lH6AmFGey2gA4tQ/Ji9s2dwL5
	lF/gfKqJbE1FXFqBU6kBx57lmcgfas6KxPSahYGsCkHfZSu0W2m1lSMcosl7nlTjUJAczk
	uugZiVPDoB0BnJyxSoDUsl0qhqzGE2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ScX319NONNm75PgurYTvLQ-1; Tue, 23 Jan 2024 06:02:24 -0500
X-MC-Unique: ScX319NONNm75PgurYTvLQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e4f70af99so38394415e9.2
        for <sparclinux@vger.kernel.org>; Tue, 23 Jan 2024 03:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706007743; x=1706612543;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ADeVdxuyk9aWMHIaHDhLLOZKsBVve1swb6NJsYgtkms=;
        b=lJbPWuu09KEJEp7vD3eYchTUux3xcyhvWppyf4ZMKhByHzAjQgKKit9f6JviNQhXBF
         UsNMemUVMftpVnr6c+BOLGDxwi+2OBWOIhodOX02gc7+GgGJihHgRo4VEeetox68c6qr
         7imPetPi0nRm8XHcz1tiiUqQK+7BrIyZwH6KYud2gaYF9YVq+ZvPNKRaD2RmbZWIaVPB
         Uj9u7TLy4FfdvcPce92NUNL1w9oC98cHwLoeER0u0Dt8mMvag5uzO70F/tuAEXE6tOr4
         /AXoFe87LsbXBXoRymZj1v5sRA+xtUvL5l5RzF+3+B+fu8Yx7m8JpBUWBSmu1ZpcY0ot
         cAUA==
X-Gm-Message-State: AOJu0YxOv7pwiJE4IlgZ1LtW3+FYfLTlrT2vtFbAGGbouh32SUPIklSY
	JoSbQ84aD8uqYemZTnGymzkfYtT639vN93uuV3RKLXw4hm8CeIbw21+ZA4dkEHrH8cUX0j3u7G0
	buH5jrKKp6LCt0beWKHdh6X8nvVneYDfJJapFUMLknOLRMgaSGDUvuPH8Ly0=
X-Received: by 2002:a7b:cb87:0:b0:40e:b2b2:d2 with SMTP id m7-20020a7bcb87000000b0040eb2b200d2mr6574wmi.134.1706007743554;
        Tue, 23 Jan 2024 03:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+tCfxmJ/19soGtVmtlIvjQMKvo21RHU0ZgsqtMZFvba5PNIEO7LEFpu0n7sRR1TY7GNTQEA==
X-Received: by 2002:a7b:cb87:0:b0:40e:b2b2:d2 with SMTP id m7-20020a7bcb87000000b0040eb2b200d2mr6550wmi.134.1706007743076;
        Tue, 23 Jan 2024 03:02:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b0040e9d507424sm15840531wmb.5.2024.01.23.03.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:02:22 -0800 (PST)
Message-ID: <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
Date: Tue, 23 Jan 2024 12:02:20 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
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
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.24 11:48, David Hildenbrand wrote:
> On 23.01.24 11:34, Ryan Roberts wrote:
>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    arch/arm/include/asm/pgtable.h   | 2 ++
>>>    arch/arm64/include/asm/pgtable.h | 2 ++
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>>> index d657b84b6bf70..be91e376df79e 100644
>>> --- a/arch/arm/include/asm/pgtable.h
>>> +++ b/arch/arm/include/asm/pgtable.h
>>> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>>>    extern void __sync_icache_dcache(pte_t pteval);
>>>    #endif
>>>    
>>> +#define PFN_PTE_SHIFT		PAGE_SHIFT
>>> +
>>>    void set_ptes(struct mm_struct *mm, unsigned long addr,
>>>    		      pte_t *ptep, pte_t pteval, unsigned int nr);
>>>    #define set_ptes set_ptes
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index 79ce70fbb751c..d4b3bd96e3304 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>>>    		mte_sync_tags(pte, nr_pages);
>>>    }
>>>    
>>> +#define PFN_PTE_SHIFT		PAGE_SHIFT
>>
>> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
>> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
>> kept contigously, so if you happen to be setting a mapping for which the
>> physical memory block straddles bit 48, this won't work.
> 
> Right, as soon as the PTE bits are not contiguous, this stops working,
> just like set_ptes() would, which I used as orientation.
> 
>>
>> Today, only the 64K base page config can support 52 bits, and for this,
>> OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
>> coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
>> Fortunately we already have helpers in arm64 to abstract this.
>>
>> So I think arm64 will want to define its own pte_next_pfn():
>>
>> #define pte_next_pfn pte_next_pfn
>> static inline pte_t pte_next_pfn(pte_t pte)
>> {
>> 	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
>> }
>>

Digging into the details, on arm64 we have:

#define pte_pfn(pte)           (__pte_to_phys(pte) >> PAGE_SHIFT)

and

#define __pte_to_phys(pte)     (pte_val(pte) & PTE_ADDR_MASK)

But that implies, that upstream the PFN is always contiguous, no?

-- 
Cheers,

David / dhildenb


