Return-Path: <sparclinux+bounces-4548-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD310B3E0D3
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 13:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E583A5B92
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF313C26;
	Mon,  1 Sep 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yh6KChN2"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB6217F55
	for <sparclinux@vger.kernel.org>; Mon,  1 Sep 2025 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724576; cv=none; b=l2xEEu1nqjBsK9ftPpTWjXK5z+dK2kMbBWoxdtVhG03sUP0ziNrUo0UdcVPeIv/+3aENsfII9Z02A7Wv2wfoJHIeqlqj+XJn774UW0xCQRK95ieHGYU5upol4SiqsqSAHhDxScFlKzVxg3fswq2Va7eflelgEAYhvpBIGIRn4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724576; c=relaxed/simple;
	bh=K5JNJcZ1sKhYtHtX25IaHS+Y5MJfXFqdBBhnB5pe2NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpiXjuLzM30i1HwXQgj+uu0modRhnZrqLyBQ0GvQ6s3fiAmhAQatmvl9SpC3XX0xJEVXcIfKWoHIxEPbeX5hAk0/oF2o+OQSl3oTGkhifwY3uiKXX71kUCzrfhrqBkODNPXcfeI8gJ3aymRbfG43eZo2RUt0KTga/FiLpvyWPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yh6KChN2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756724573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2pwINCj5IC9gGmlFKv2NCzdMq2RgfRkeGypury1Wan0=;
	b=Yh6KChN27Y7S8/WXsvYN+tCfj1b9Nt0adXTkCTqSvD4vlfOy0BU7zoaGU/uWx4QX2Oxg/V
	OeNQ6o+6zh2MC/KTcDy89hr7bhiyhMR9eWNFXKWZVFZSfCmDQ+9vaQVGd0R6I2XrWwXMmf
	6hWcPOvef2xkzdg0AI7+/fDqPqYhbrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-7yLQjT0hN6imxxscYzFDWw-1; Mon, 01 Sep 2025 07:02:52 -0400
X-MC-Unique: 7yLQjT0hN6imxxscYzFDWw-1
X-Mimecast-MFC-AGG-ID: 7yLQjT0hN6imxxscYzFDWw_1756724571
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3cf48eca078so2454713f8f.0
        for <sparclinux@vger.kernel.org>; Mon, 01 Sep 2025 04:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724571; x=1757329371;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pwINCj5IC9gGmlFKv2NCzdMq2RgfRkeGypury1Wan0=;
        b=l5mGrvJ2bZmUQsBfC+slf06ZYhui0Nw62iA/oNMlQGkAd+XTrkh2teojhmGHVivK4Y
         S93JC79r91M5oyWK1N2x1BxDtcw/LgEFA5qwTxA7FpY1hhSkbvQKnPRpUMBAcnQpWQ/u
         Y6SwRisEEiv7C4VgPu4tRBygn5GUCRqS/SUjVyrkFGtHetNy8qjAamznqbh4n44kTLEL
         /2Fx2/hhIRU7Vgh/y4+c93204KamLVOgZmf0cU4L8EtoDK0Z4dKkKxhB1YS1UIdLl8dh
         NXu1VysFSYV5VKgIBFmkC+jJYBPu36GG2T8aXMwlxZ5zed4v3dO2QO1z42mgpeVgSjPj
         ZhJA==
X-Forwarded-Encrypted: i=1; AJvYcCWR4KSUMnbvlgMBoaReBdcoP3R+EmgWOBW+XCUhdD34spzHpugiRytipnVF94NdxPod0U5UxuJB35O0@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+GDeJ4CiaC80aREq9EQspL9pa4o3rAFB9gJmJg5dbRp0HD4b
	3lDkULUn/H6yPC49IneiG2tZBfl4jCr9+P904jaXh0EA0dCm6g3j5HyW2nv6EiLDkdF0gzptxup
	BdoLbId5i6bdJRs61TmbOdusWdUeUZwvnVVWczViGYV4B1X4K04sCXDAxCoftkuM=
X-Gm-Gg: ASbGncs7Zei7qYHuCG5/XwHDFpe9dV3aA+0MF8KrgCaxBg+2/rSTPKmSfFV8oi8BT8+
	XR0x3CRdajIzu/o3GXkFLVgUF32NPiIlyFgOMkqkPhuuFDYl9E/GfxiFQH+Fcn356c8wEAGW8wU
	/iX60j++OYEXlrrfoBms9lLmeO4zl+KCckjYUXaKaz/ORlYjPePD8y14gqHzzLi5fjw3fV1jBLT
	Q8nL4bZxb6H87ho5pc1E7akWcyiXIw0BE8hn8Zo4r/NoFx3/kk5GY9rSG8a48gUz5aKExX0WgpX
	TnnJOtU969Qp3P8H0dk1SY7VDnoDNYg1Twhtv0SZp2RrZsXwuE8rRkJ4B8jIbt+7FosJ6Frb/Ta
	Z9rAztxxCJXnPOvGohSR3bmlBIbjGDr3A2VWkJAYFExQUjRECSxnfcdci3nDErguMK6s=
X-Received: by 2002:a5d:64cd:0:b0:3ce:16d3:7bd1 with SMTP id ffacd0b85a97d-3d1d9ac1cdamr5525217f8f.0.1756724570726;
        Mon, 01 Sep 2025 04:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj8ufgKZlVGX8CMmIcbweVvShoidDXf+HM4vFZF7g4psnQ9bVARH+arPZnVNgJxxWj4BMlvA==
X-Received: by 2002:a5d:64cd:0:b0:3ce:16d3:7bd1 with SMTP id ffacd0b85a97d-3d1d9ac1cdamr5525149f8f.0.1756724570152;
        Mon, 01 Sep 2025 04:02:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d729a96912sm3045340f8f.8.2025.09.01.04.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 04:02:49 -0700 (PDT)
Message-ID: <d99496bf-6e67-4e64-97d5-6cfe563b8cbe@redhat.com>
Date: Mon, 1 Sep 2025 13:02:46 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] mm: establish const-correctness for pointer
 parameters
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org,
 axelrasmussen@google.com, yuanchu@google.com, willy@infradead.org,
 hughd@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com,
 linux@armlinux.org.uk, James.Bottomley@hansenpartnership.com, deller@gmx.de,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 davem@davemloft.net, andreas@gaisler.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, chris@zankel.net,
 jcmvbkbc@gmail.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, weixugc@google.com, baolin.wang@linux.alibaba.com,
 rientjes@google.com, shakeel.butt@linux.dev, thuth@redhat.com,
 broonie@kernel.org, osalvador@suse.de, jfalempe@redhat.com,
 mpe@ellerman.id.au, nysal@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, conduct@kernel.org
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
 <f065d6ae-c7a7-4b43-9a7d-47b35adf944e@lucifer.local>
 <CAKPOu+9smVnEyiRo=gibtpq7opF80s5XiX=B8+fxEBV7v3-Gyw@mail.gmail.com>
 <76348dd5-3edf-46fc-a531-b577aad1c850@lucifer.local>
 <CAKPOu+-cWED5_KF0BecqxVGKJFWZciJFENxxBSOA+-Ki_4i9zQ@mail.gmail.com>
 <bfe1ae86-981a-4bd5-a96d-2879ef1b3af2@redhat.com>
 <CAKPOu+_jpCE3MuRwKQ7bOhvtNW8XBgV-ZZVd3Qv6J+ULg4GJkw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <CAKPOu+_jpCE3MuRwKQ7bOhvtNW8XBgV-ZZVd3Qv6J+ULg4GJkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.09.25 12:54, Max Kellermann wrote:
> On Mon, Sep 1, 2025 at 12:43 PM David Hildenbrand <david@redhat.com> wrote:
>> Max, I think this series here is valuable, and you can see that from the
>> engagement from reviewers (this is a *good* thing, I sometimes wish I
>> would get feedback that would help me improve my submissions).
>>
>> So if you don't want to follow-up on this series to polish the patch
>> descriptions etc,, let me now and I (or someone else around here) can
>> drag it over the finishing line.
> 
> Thanks David - I do want to finish this, if there is a constructive
> path ahead. I know what you want, but I'm not so sure about the
> others.

I think we primarily want to briefly explain the what, the why, and why it is okay.

For getter/test functions the "why it is okay" it's trivial -- test function.
Personally, I would not spell out the individual functions in that case, as
long as they logically belong together (like "shmem test functions"
describe what you did in that patch).

For anything beyond that people likely expect a different reasoning.

For example the following change:

-static inline void folio_migrate_refs(struct folio *new, struct folio *old)
+static inline void folio_migrate_refs(struct folio *const new,
+				      const struct folio *const old)

Adds two "const" ways of doing things. As a reviewer, seeing something like that
buried in a patch raises questionmarks.

-- 
Cheers

David / dhildenb


