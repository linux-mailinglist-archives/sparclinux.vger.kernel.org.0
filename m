Return-Path: <sparclinux+bounces-4817-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E26B49441
	for <lists+sparclinux@lfdr.de>; Mon,  8 Sep 2025 17:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59A007ABCB6
	for <lists+sparclinux@lfdr.de>; Mon,  8 Sep 2025 15:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59470235BE8;
	Mon,  8 Sep 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JJ9Ikt4h"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A89217F27
	for <sparclinux@vger.kernel.org>; Mon,  8 Sep 2025 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346627; cv=none; b=eru9SXnk5IioOPwE3L2GnnoSRXI+zyqMLYa0qwnBRdAFDp7xkZTS+WB6vvCrTV4kBuMS57Do+tMZCmzKSPfS1zD0xkp1qj3K/edRq3RAn1cyOJfkLc1T0jXYtYdcWAS5v4Bd9drKLxVWc7hBaGczqq7l6mAiqf+4AB4Vihs9Fgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346627; c=relaxed/simple;
	bh=YOA9yiHHYWbHEuhKtxjwT6CMonYyVoporirKZbVud14=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fHdfFmiZyK1p3thMNDDffXx94PZ5lzr1ccbjYb6Kiw8kEHd5d4EkwvDPXRZxDTaKgEChVZVdndtuAETzW0QsPUUEjjlUiQwJnFMeBxxUeUJPym698+j+gp/m9iYT/V9MqDvJWFLheN9VGgsqN6cBWimTqn9K66adLH8IRRSf5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JJ9Ikt4h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757346624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yRW3ZVdYmN/Kdh0wLmiEq7GLlrJxKlfpeCG0COnVkik=;
	b=JJ9Ikt4hcQjosRnMCi/em3loNXCCoWr7kPV8y1aTnvueUHXG6SQZWZISPAFEjRaI8qaSbc
	vm4vTEuZVpBn1ZjN6Dd2f8bB7YHXRON5I+CJZ7ysqKxAzxErhZVpv3VhbsMx4KU2/jCNVs
	H1avd1/9c4PgaZp05euZoC4uHulLico=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-0ArO1mJnOce6-fDXAjK3YQ-1; Mon, 08 Sep 2025 11:50:23 -0400
X-MC-Unique: 0ArO1mJnOce6-fDXAjK3YQ-1
X-Mimecast-MFC-AGG-ID: 0ArO1mJnOce6-fDXAjK3YQ_1757346622
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45de5fdda1aso5460755e9.1
        for <sparclinux@vger.kernel.org>; Mon, 08 Sep 2025 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346622; x=1757951422;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRW3ZVdYmN/Kdh0wLmiEq7GLlrJxKlfpeCG0COnVkik=;
        b=YdbPCa1bsVf8Ecz5TMcZ+0v8FNdACX4zzYlWqJhJRit+D9vZbB0iZbW3S1xsuc5kom
         Qw7uZsAvitfxUzmfs3GFyjXOn9FUmqI+Y1hzTXaz5Iuxw0h1P/fuGRrRqLf38TmIcQOd
         xDQlxZ1BHs3qo/Q/T0KICryBy7My2sm421GbO+ugALLjXXswsfDUXfdewA1+vDGWaHxq
         vGZsrWf7P73wHbqEN4dft/7mI2Xoo4Us67clrjFfY0obuKKTmTXt0ixhsSlg/hDFJMA4
         O5ErgfLSKr6xKoh3t9HpvAB1iNH8D2P234czlim4Ffc3xNtxQuGx1d2SCya6fSmcw9Tp
         gWmg==
X-Forwarded-Encrypted: i=1; AJvYcCXLTpVc+XA74LCnoI/o3EHnQZe6E5uyeDlUIcVAoAYIXP0XJQm0ZS1c5H6sxSy2N7RN0MSkufoMA5L3@vger.kernel.org
X-Gm-Message-State: AOJu0YyMK04DTbX4ynSyWq+unww5MEXVyVCRpvXrWN25cuIPFKG3rTXZ
	jUiU/xagsq6UYDXE9Z3ydwmF7VOxwWNtegI+5/C/V1F5ui349EMe23TNZ1e0xfBNIA1D/LcgRD+
	pX6Dwp/nnLafX6Nss8CAoLVYraGaJxLEu9MgjTRPuquw9SvuUi1XcEBAxD1ngeZQ=
X-Gm-Gg: ASbGncv7xDvdLXgLj4wiStjNKy9cH+QiP8/bTahiknJm3wTJJuyh05KyzNw7t0R0kc6
	JVhgQ/HiHyymHYDBtw7jcOqPLlebHO5l5KjRriDPIZZUcHGCeosQM2fMznfMvEKYha5xBLyccLh
	Ffnf1cz7Z88/ConxJQLvSn7rDV7JYNuHlY+S1r8X62nMt12Snhhg2E5ECOT9Goxphu8ATeXMQka
	EReZCJTOhMLPn+bxX7of9Uoh2Y0It6bA3CcQU2OJ/CEugK7iNHCQsUiXWyIWT9o0oB9avfga1EU
	p9WILTWxhQhsiq/tD8//huIfWKhXpf5ZUfnAAh78DUuW/kh2RlGmndhDSlwBfO9ljw6haAUyYiq
	Iu2Bbr7qOOiVQlo5tWOZftQbjRaaf1bGbF1Y1vQVmqs5og78sD0q1/Gc1ebUN9ag4
X-Received: by 2002:a05:600c:4e14:b0:45b:86ee:415f with SMTP id 5b1f17b1804b1-45ddde8a741mr84355965e9.6.1757346622243;
        Mon, 08 Sep 2025 08:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIS2Yy99pUw9GXFN0rA/K14GohJu1BEy0lmIZFIqwZ3w6bOX7inAYbi8cC2UvYQeQPJx4Tjw==
X-Received: by 2002:a05:600c:4e14:b0:45b:86ee:415f with SMTP id 5b1f17b1804b1-45ddde8a741mr84355495e9.6.1757346621708;
        Mon, 08 Sep 2025 08:50:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:700:d846:15f3:6ca0:8029? (p200300d82f250700d84615f36ca08029.dip0.t-ipconnect.de. [2003:d8:2f25:700:d846:15f3:6ca0:8029])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0595af9sm100737155e9.2.2025.09.08.08.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:50:20 -0700 (PDT)
Message-ID: <3229ac90-943f-4574-a9b8-bd4f5fa6cf03@redhat.com>
Date: Mon, 8 Sep 2025 17:50:18 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] mm: add vma_desc_size(), vma_desc_pages() helpers
From: David Hildenbrand <david@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Wilcox <willy@infradead.org>, Guo Ren <guoren@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Nicolas Pitre <nico@fluxnic.net>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Uladzislau Rezki <urezki@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev,
 kexec@lists.infradead.org, kasan-dev@googlegroups.com
References: <cover.1757329751.git.lorenzo.stoakes@oracle.com>
 <d8767cda1afd04133e841a819bcedf1e8dda4436.1757329751.git.lorenzo.stoakes@oracle.com>
 <20250908125101.GX616306@nvidia.com>
 <e71b7763-4a62-4709-9969-8579bdcff595@lucifer.local>
 <20250908133224.GE616306@nvidia.com>
 <090675bd-cb18-4148-967b-52cca452e07b@lucifer.local>
 <20250908142011.GK616306@nvidia.com>
 <764d413a-43a3-4be2-99c4-616cd8cd3998@lucifer.local>
 <20250908151637.GM616306@nvidia.com>
 <8edb13fc-e58d-4480-8c94-c321da0f4d8e@redhat.com>
 <20250908153342.GA789684@nvidia.com>
 <365c1ec2-cda6-4d94-895c-b2a795101857@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <365c1ec2-cda6-4d94-895c-b2a795101857@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.09.25 17:46, David Hildenbrand wrote:
> On 08.09.25 17:33, Jason Gunthorpe wrote:
>> On Mon, Sep 08, 2025 at 05:24:23PM +0200, David Hildenbrand wrote:
>>>>
>>>>> I think we need to be cautious of scope here :) I don't want to
>>>>> accidentally break things this way.
>>>>
>>>> IMHO it is worth doing when you get into more driver places it is far
>>>> more obvious why the VM_SHARED is being checked.
>>>>
>>>>> OK I think a sensible way forward - How about I add desc_is_cowable() or
>>>>> vma_desc_cowable() and only set this if I'm confident it's correct?
>>>>
>>>> I'm thinking to call it vma_desc_never_cowable() as that is much much
>>>> clear what the purpose is.
>>>
>>> Secretmem wants no private mappings. So we should check exactly that, not
>>> whether we might have a cow mapping.
>>
>> secretmem is checking shared for a different reason than many other places..
> 
> I think many cases just don't want any private mappings.
> 
> After all, you need a R/O file (VM_MAYWRITE cleared) mapped MAP_PRIVATE
> to make is_cow_mapping() == false.

Sorry, was confused there. R/O file does not matter with MAP_PRIVATE. I 
think we default to VM_MAYWRITE with MAP_PRIVATE unless someone 
explicitly clears it.

So in practice there is indeed not a big difference between a private 
and cow mapping.

-- 
Cheers

David / dhildenb


