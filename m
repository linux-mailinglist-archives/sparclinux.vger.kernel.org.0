Return-Path: <sparclinux+bounces-253-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F25248442B8
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 16:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B24291974
	for <lists+sparclinux@lfdr.de>; Wed, 31 Jan 2024 15:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9084A45;
	Wed, 31 Jan 2024 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfICWSI3"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842984A37
	for <sparclinux@vger.kernel.org>; Wed, 31 Jan 2024 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706713889; cv=none; b=mndHyRZquegd/kIYAXxT4dysjJgxgJK9CACiD4fwUZBRSyTkPc8DxjkOUTypHjkve6DsEIZo8CMaa/Rq/8YGdfhYKKoZVfr4Dq/sHCgOWhHCj6yYWACg8aivdpjFhwS1rndhORty3VljGuL+0qrwuS69ryyndfYYAlw9DFNrq1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706713889; c=relaxed/simple;
	bh=ITr6yS+wuxcc1Zv43PZFDYlGCv0HidPaeIbRXZR4ydU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POcICYMxU4eA8eHZh2rFI8LsWYCPyE5qzUeoSbU/qewPVPrSrkfw9IGo0wARC20C5MoeGeYVXsNE1auEPbli1Yh8HazUBOPKH6OQBjgLoVx0180w2piTlF2cV1lWuzDYkUFT+EeJERw+0BqIW64buRmLXCEkpJUCsOSxjv8liG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfICWSI3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706713887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9xOHkRVtSgR/iDXlGrVJLHFSYNASgW2jVPGvmQDJUc4=;
	b=RfICWSI3w7HDltA00rme9tm3oVaC9svI50Qgds8SYeK/ZfFueD0SHoXM5g/s3eSp0W9+Wr
	En3GAoLoZOaPmfnHUMR63uIMvCibmL8MzuQeXH+tRG6bGWANfGKvFdPbhCtfBnnidmLy2K
	yGrqK1lXZYjLtbdc8Izl5nrelx0HGbU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-GcTVw88fPjeGwq07I_rQyw-1; Wed, 31 Jan 2024 10:11:24 -0500
X-MC-Unique: GcTVw88fPjeGwq07I_rQyw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33b0c264abbso128783f8f.2
        for <sparclinux@vger.kernel.org>; Wed, 31 Jan 2024 07:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706713883; x=1707318683;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xOHkRVtSgR/iDXlGrVJLHFSYNASgW2jVPGvmQDJUc4=;
        b=EoTkwZJbgqoVOQD04/bO4HRx/1ncIrbG0FQWQdmBS37YkRYlGGbZGtCLcXe7inhK7c
         Gt3cx5EUSZp3e13bPGfkHwu/OiMcvsSZPp6CrSdgAN8K4VWqh4kKstG/rNRVnyvliLyx
         PCWvvSemo/u7hy/M61/EgQ3VUSvpKPmik7dVn+GEipUCvcgvKGSYI14UwdqKT2si8Omd
         vb5B9P7DjGuaR0Z4ZeiPStSVHJ3W1texbEbaPj6U8b2WzAJAjzhu4FbMcmd1xp1tQOBS
         IyBxvBPiqRiGy4u1PKEs7mjhN1RJ9adX1tcYp+RL7mW3Sp6DiS33wJ8MFTo+7YU7RfGu
         R7OA==
X-Gm-Message-State: AOJu0Yx6WM++qSmEKYlbmlfbIWN1Um4LPmlzLn67c5epc8Mh2AODZ1+b
	pzeJNxbCbbsfaFYS6vHZGM6Hl36N96rudMNc5cnamsHm3AazWQbxNNn6zyJO/tis3gZc+sQ6VIr
	wjjutavkQfioXGclg713qrEe9HYWHzRHOnUAypZqhOknsI5VdPFXkX6UyNjI=
X-Received: by 2002:a5d:640d:0:b0:337:bfe8:5bfd with SMTP id z13-20020a5d640d000000b00337bfe85bfdmr1598300wru.50.1706713883283;
        Wed, 31 Jan 2024 07:11:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh9FoHEUvX/GITF7/TmRpiB7abJ1YmipKQ9dKbjIrioBb2rOdjJk4rdhNHLEncstG1HcHApQ==
X-Received: by 2002:a5d:640d:0:b0:337:bfe8:5bfd with SMTP id z13-20020a5d640d000000b00337bfe85bfdmr1598273wru.50.1706713882838;
        Wed, 31 Jan 2024 07:11:22 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ce6-20020a5d5e06000000b0033af3a43e91sm7109194wrb.46.2024.01.31.07.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 07:11:22 -0800 (PST)
Message-ID: <13e2fac7-5f65-4257-a478-4359cec31939@redhat.com>
Date: Wed, 31 Jan 2024 16:11:21 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
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
 <a34eee7e-3970-4cdd-8c09-bca51132db50@arm.com>
 <cee2c0ed-661d-4948-8bc9-77c87c486c86@redhat.com>
 <eeafba09-058f-47da-bbb9-19ded5ad05da@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <eeafba09-058f-47da-bbb9-19ded5ad05da@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> dontneed should hopefully/likely see a speedup.
> 
> Yes, but that's almost exactly the same path as munmap, so I'm sure it really
> adds much for this particular series. 

Right, that's why I'm not including these measurements. dontneed vs. 
munmap is more about measuring the overhead of VMA modifications + page 
table reclaim.

> Anyway, on Altra at least, I'm seeing no
> regressions, so:
> 
> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
> 

Thanks!

-- 
Cheers,

David / dhildenb


