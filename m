Return-Path: <sparclinux+bounces-4855-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23FB4A9AA
	for <lists+sparclinux@lfdr.de>; Tue,  9 Sep 2025 12:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE70188BF66
	for <lists+sparclinux@lfdr.de>; Tue,  9 Sep 2025 10:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F3E309EEA;
	Tue,  9 Sep 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EIH2P8zI"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409812D6621
	for <sparclinux@vger.kernel.org>; Tue,  9 Sep 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412597; cv=none; b=fUn18FXhf2LWv+GlWCRn5fZC4KxhTNyU7xyl9kKPqRzuyoijFrMqg9Ik3nqfpcWYNVzVJ3JGGZ+4TaZUnvAz/5gn+5EYaEZSahBtPqcNLX8E1bzyGTyLeii9vYlK9xZ6TDgZP3xV4xGNgZNzYk0s/saLcJ4tf4n3dgslmHi9tmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412597; c=relaxed/simple;
	bh=A/DNmPamxtdjaA8E0kvZI/oJGheRH/RzPWVdeP04pLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwhSxFrA75kFRUBMhXcYgZSb4zluMQIC3ipwVZoVoe6QeTJ01AeTGgMsqD50F7xRFlU+8gSucJ9YooBhDWDD1OX61RTncMH0VmVIjsUrwWt72WTXI/7QlfUsDmW1UXor/zN05ze9VUnECiWmpB4XzbRoCu2E20h4y3Xpt2izqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EIH2P8zI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757412594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
	b=EIH2P8zIcZYkDaCMrxLDGWHfPHP777hlvuk4rjzrd3EWHy82xAVFawnQA0eQ11KfPTUQIw
	mfMilZyTB/IPyohu6Inx1nvoomsXwhxl1TwV8jO+qcFWtUu16n9q54WBAzd+YUCW37T5WO
	MDo4/NDu6ELr7/8Lah8RGtOioePKBS0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-vaDEiAZ0Mlaw0__mcizdRA-1; Tue, 09 Sep 2025 06:09:53 -0400
X-MC-Unique: vaDEiAZ0Mlaw0__mcizdRA-1
X-Mimecast-MFC-AGG-ID: vaDEiAZ0Mlaw0__mcizdRA_1757412592
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3d3d2472b92so3078897f8f.1
        for <sparclinux@vger.kernel.org>; Tue, 09 Sep 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412592; x=1758017392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
        b=E2OcQV5iMkEYiQjDfnTxpUMSdwcBabhIQ3QyYiNEa8FZfbel/PC1WZnO4fiz6e1WfW
         Hh4YEJ4HwsNKu9HPSrA5wxlMkKag6echRa6aNgt2FJtbqhD2zRQdTQJfyRNU575NUUq3
         t8aTbCFBni47t7+tbyoAPbpzqL4BofH34IOxKU0BiIrYu5a21PJkDrPkKc2bHXpib81b
         yBsSAGHBCdnl1FiIvomGJswp1BslaF+alW7KL6OxzGRLeo+pevcNxEtIq1wsw95JOHjs
         GzpYSri47ArQGqbgd1FbmF8D4wnDyGQZ+GOPHOxn/mu5h0wABajvvcFh+zgRqdvUWvgZ
         hmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3N/EjFBDXk/Qa6QoQM8eutIX0d0OZk8mUnvAgMnsli/EK9nVvY0WERDqLmlos1bqKid+H2jJ/DAId@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMYNGSFzv+R6fAjxhNe8s/AvceVxWf8rfXMOWjk01c5yYVI35
	HJLutgbuQXGJO4Vz9EEg0MkeghCIqlRS4Vnd1pcEd6oy9+3na3jhLMvZCrLXNFF6M6xuidZDt/H
	ahypFZIg07wxFWfeBNjPZ9z08GKu12/ahG1U4b5x61w4NFdwaM8TsfjGxzd7NPao=
X-Gm-Gg: ASbGncs/thLoI0rgj2QGk8iUYoG3DTaDNN3DZbNExjnXSZzN5AKN8qRTyZDa1ofyNHu
	4eprjj5BQtZUF6miSxwm6xp6q4T0LvyhdabQ/NxYSGZo7Tjei8OMA1+2jWHWIIvTh1O2ctm597M
	R3I7LA1qB9zZU9FXIvCMpxJZhDPo+cmvirHcBrCivz1z/ZNb9C0VO5Azz5VYl3zZBw8qx/Sqhlf
	ZfvcAInZ+DnmNv1BcN3qqYwDQQSK41G6PK/2OfyHJKDa4xN8zfpOhix90go79C7wCmWgMhzRZqO
	kk0g9uVJe3cl00L+aNLnMtE+Rw1yP9aUE9q+cBCrcAWl+ubObYgvjbI2anY67iJcxYAGYSAMvFC
	Lv9mLrkKwRhUqQYudYFgwspBu4bJ/5yHWAX4rdgI62XTtBjCpiFs5SO9tTA6hQ1bJECk=
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424822f8f.10.1757412591677;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6kYqxQMhMlrUNgHhh5IEpwCukAjnB2iBRVYizcIa9qqydeyLJ0L3jlngBNKljI3RpH7CHw==
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424776f8f.10.1757412591141;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7522562d1sm1945921f8f.63.2025.09.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:09:50 -0700 (PDT)
Message-ID: <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
Date: Tue, 9 Sep 2025 12:09:48 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.09.25 11:40, Alexander Gordeev wrote:
> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>> (taking and returning no value). This is proving problematic in
>>> situations where leave() needs to restore some context back to its
>>> original state (before enter() was called). In particular, this
>>> makes it difficult to support the nesting of lazy_mmu sections -
>>> leave() does not know whether the matching enter() call occurred
>>> while lazy_mmu was already enabled, and whether to disable it or
>>> not.
>>>
>>> This patch gives all architectures the chance to store local state
>>> while inside a lazy_mmu section by making enter() return some value,
>>> storing it in a local variable, and having leave() take that value.
>>> That value is typed lazy_mmu_state_t - each architecture defining
>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>> For now we define it as int everywhere, which is sufficient to
>>> support nesting.
> ...
>>> {
>>> + lazy_mmu_state_t lazy_mmu_state;
>>> ...
>>> - arch_enter_lazy_mmu_mode();
>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>> ...
>>> - arch_leave_lazy_mmu_mode();
>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>> ...
>>> }
>>>
>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>     lazy_mmu is already enabled, and it temporarily disables it by
>>>     calling leave() and then enter() again. Here we want to ensure
>>>     that any operation between the leave() and enter() calls is
>>>     completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>>>     leave() to fully disable lazy_mmu. enter() will then re-enable it
>>>     - this achieves the expected behaviour, whether nesting occurred
>>>     before that function was called or not.
>>>
>>> Note: it is difficult to provide a default definition of
>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>> that definition would need to be available in
>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>    #include there is very tricky due to the existing header soup.
>>
>> Yeah, I was wondering about exactly that.
>>
>> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
>> different.
>>
>> Which raises the question: is using a new type really of any benefit here?
>>
>> Can't we just use an "enum lazy_mmu_state" and call it a day?
> 
> I could envision something completely different for this type on s390,
> e.g. a pointer to a per-cpu structure. So I would really ask to stick
> with the current approach.

Would that integrate well with LAZY_MMU_DEFAULT etc?

-- 
Cheers

David / dhildenb


