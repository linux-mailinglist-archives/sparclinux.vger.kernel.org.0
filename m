Return-Path: <sparclinux+bounces-187-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23D839990
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 20:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6FC028B3D6
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jan 2024 19:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8694823AF;
	Tue, 23 Jan 2024 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5tsQB4m"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954681215
	for <sparclinux@vger.kernel.org>; Tue, 23 Jan 2024 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706038397; cv=none; b=j1fIglBmFCiSle8OGO3LYklCV1VGaIwEkysB2ZPOYqDxqX0ALjsbnJjDSJ963d0PQeVvwcHuqxTKpQZQN+ANP/YMqQs+5utGgYAcw6VZJCPGK+ndnwzp/B+ZhL2geQWz2Y4eNAlzoigMqLgx52/aNM8BusRRVbxU37RIWxyZ9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706038397; c=relaxed/simple;
	bh=mgHe76G/dSClyQVZgErffAzrxsTIiYh/PFQtRWpftsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1MFTWntPwNL3Evcm52Eapau08d6TFEmdbr/b2xZJ17EBm6faivDGPgI8UShGX83TJBd+BZMIIl/qNWTCkaomRnWNdFAVXbGpNKuF6sQtWyxTXIkWppSJjVbi9APy0TjjOpS9PBgUMbc3XsEillZ+BEuyMywfEfcBcZdVeuLeOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5tsQB4m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706038394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itYhj3A7U4JKSUVX1BM5+D5uWXBZ/cx6KAiSvHjO3Z4=;
	b=M5tsQB4myEXy1QSDjWW27l47ZgThzWFZPefuyYc5RxKEE/4FkXXLm7QAF0qZPiH9PSBLpL
	0VrCYnU5lllpu5F+o0F4TFfL0tyHfQ469vcQ9iIhckmCvxD5fvin7KW4a42RV+2LAc9HVl
	yAJ4zmycqR0a75kqGWJdYzZIsi66LZM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-v7KiA_-2OoiEUn1k8uYDAQ-1; Tue, 23 Jan 2024 14:33:13 -0500
X-MC-Unique: v7KiA_-2OoiEUn1k8uYDAQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40eaed9b181so21062045e9.0
        for <sparclinux@vger.kernel.org>; Tue, 23 Jan 2024 11:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706038391; x=1706643191;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itYhj3A7U4JKSUVX1BM5+D5uWXBZ/cx6KAiSvHjO3Z4=;
        b=Y9jObfkNxOdAoph8sAI8jpAcQ1Z/inDdOW8+DPMiqm+R+e8LL/74aNoNzgtF0gdq9q
         ibCu+UKPq94hTQZynURbwWvZYwmU/MmegI8gsYPGKdRvvehRNB0vy0jCunYckFPIcXXW
         8fgE8iqjgmLF3J92j+tBR4BDPLI9LTHkYXyhr5HP/YiTQCIfFhcala2O3Q5bYj8NaAZ9
         UQSj0F2l1wgHRA0abVItsvvFP+hXWbK1kltIoE/DK28k0LbmgdFs8M9533bG7U9XInPm
         kr4rcDTPG6Qh836cCX0BUjm6BW2ePZXLRi5qwVxNlaNdsU5isjo9h8jx6azLvnvIwLOj
         zFvA==
X-Gm-Message-State: AOJu0YzVn+RvkxoXDmHifwv1JgGXbNXimZNfeoLsbWxXyTa0VJXxuXEy
	p7nmBziXnJdiW6daw5D8fnlFj5WmpdjvPKFJhZzGhbROSAxH+pFJ/gRBuH3LVv8x6K49FXZP6jA
	ifqsGaYDYrP0umi/9Z3c5S8nca69eaA/eVEYh1zrffmrSVyQ+LkXCPtj/Hc0=
X-Received: by 2002:a05:600c:6a93:b0:40e:b95b:d076 with SMTP id jl19-20020a05600c6a9300b0040eb95bd076mr487988wmb.330.1706038391571;
        Tue, 23 Jan 2024 11:33:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSoUQW9eSU5KRKucbehRTRFWuogFSdzMHtpayE9Ps/dIeIEUdDVdNTw9NHgbZWG2SGW4YMsA==
X-Received: by 2002:a05:600c:6a93:b0:40e:b95b:d076 with SMTP id jl19-20020a05600c6a9300b0040eb95bd076mr487958wmb.330.1706038391187;
        Tue, 23 Jan 2024 11:33:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040d6e07a147sm41857469wmp.23.2024.01.23.11.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 11:33:10 -0800 (PST)
Message-ID: <fa9425e8-f489-48d0-9bf5-98d1b46b6d1a@redhat.com>
Date: Tue, 23 Jan 2024 20:33:09 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-US
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
 <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.24 20:15, Ryan Roberts wrote:
> On 22/01/2024 19:41, David Hildenbrand wrote:
>> Now that the rmap overhaul[1] is upstream that provides a clean interface
>> for rmap batching, let's implement PTE batching during fork when processing
>> PTE-mapped THPs.
>>
>> This series is partially based on Ryan's previous work[2] to implement
>> cont-pte support on arm64, but its a complete rewrite based on [1] to
>> optimize all architectures independent of any such PTE bits, and to
>> use the new rmap batching functions that simplify the code and prepare
>> for further rmap accounting changes.
>>
>> We collect consecutive PTEs that map consecutive pages of the same large
>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>> the refcount only once per batch, (b) call rmap handling functions only
>> once per batch and (c) perform batch PTE setting/updates.
>>
>> While this series should be beneficial for adding cont-pte support on
>> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
>> for large folios with minimal added overhead and further changes[4] that
>> build up on top of the total mapcount.
> 
> I'm currently rebasing my contpte work onto this series, and have hit a problem.
> I need to expose the "size" of a pte (pte_size()) and skip forward to the start
> of the next (cont)pte every time through the folio_pte_batch() loop. But
> pte_next_pfn() only allows advancing by 1 pfn; I need to advance by nr pfns:
> 
> 
> static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> 		pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
> {
> 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
> 	const pte_t *end_ptep = start_ptep + max_nr;
> 	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
> -	pte_t *ptep = start_ptep + 1;
> +	pte_t *ptep = start_ptep;
> +	int vfn, nr, i;
> 	bool writable;
> 
> 	if (any_writable)
> 		*any_writable = false;
> 
> 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
> 
> +	vfn = addr >> PAGE_SIZE;
> +	nr = pte_size(pte);
> +	nr = ALIGN_DOWN(vfn + nr, nr) - vfn;
> +	ptep += nr;
> +
> 	while (ptep != end_ptep) {
> +		pte = ptep_get(ptep);
> 		nr = pte_size(pte);
> 		if (any_writable)
> 			writable = !!pte_write(pte);
> 		pte = __pte_batch_clear_ignored(pte);
> 
> 		if (!pte_same(pte, expected_pte))
> 			break;
> 
> 		/*
> 		 * Stop immediately once we reached the end of the folio. In
> 		 * corner cases the next PFN might fall into a different
> 		 * folio.
> 		 */
> -		if (pte_pfn(pte) == folio_end_pfn)
> +		if (pte_pfn(pte) >= folio_end_pfn)
> 			break;
> 
> 		if (any_writable)
> 			*any_writable |= writable;
> 
> -		expected_pte = pte_next_pfn(expected_pte);
> -		ptep++;
> +		for (i = 0; i < nr; i++)
> +			expected_pte = pte_next_pfn(expected_pte);
> +		ptep += nr;
> 	}
> 
> 	return ptep - start_ptep;
> }
> 
> 
> So I'm wondering if instead of enabling pte_next_pfn() for all the arches,
> perhaps its actually better to expose pte_pgprot() for all the arches. Then we
> can be much more flexible about generating ptes with pfn_pte(pfn, pgprot).
> 
> What do you think?

The pte_pgprot() stuff is just nasty IMHO.

Likely it's best to simply convert pte_next_pfn() to something like 
pte_advance_pfns(). The we could just have

#define pte_next_pfn(pte) pte_advance_pfns(pte, 1)

That should be fairly easy to do on top (based on PFN_PTE_SHIFT). And 
only 3 archs (x86-64, arm64, and powerpc) need slight care to replace a 
hardcoded "1" by an integer we pass in.

-- 
Cheers,

David / dhildenb


