Return-Path: <sparclinux+bounces-4654-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E47ACB3F79C
	for <lists+sparclinux@lfdr.de>; Tue,  2 Sep 2025 10:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83DB170C60
	for <lists+sparclinux@lfdr.de>; Tue,  2 Sep 2025 08:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF212BF016;
	Tue,  2 Sep 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biwp6qHq"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C971684B4
	for <sparclinux@vger.kernel.org>; Tue,  2 Sep 2025 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800368; cv=none; b=JVq4Uath6ph+koQH3BD2wXcr7heiNA1OWrwQiikqw0Jcmp07eT7i/0YpqwBVDvixa7hlnwB5VRqyg9L054jysJ1N2ONVUv4sGczEBtMNI+UpqZAFzTGDKR2+etuFvWjaAg9U6zuV+8tutLbS8109Ghtxzu5uxj2vVRfqEZp6rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800368; c=relaxed/simple;
	bh=gFJVzZA82hsIb0kwii2LFAzy3+a4LDy4hiANVOeMNg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CselmUq+yAaz/Yki+ndMkA6H2q4eFm2MyoZEK+QNJS5tX1KruSbWIF4hSSI1Kh2gndcUR769Gkb0LQf5YBAORMpkY1RpG6zLNSoBRvnN6gwgL0Yf789ObX6j11w2Ch9x9Vfm+trvoRQgohReC58r371Wysbkn2ZvbUQcSFd7mAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biwp6qHq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756800365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ljgQE6xPMjgEsLMyx80S8frJUxwb6xjySanoEF8fZEk=;
	b=biwp6qHqlu7gLEm/3PHbiZAZr1Xwe6JFtGU6d3lbDxkFA2nmU/JB1rAwbps/Ab9du4KcAK
	OwRSjUAz3hTjFASYebrgxPlHNudbXmczTQQFjVoRxhfUWDysfVnXUUnRXNPZwVkGlbgzfC
	B3u32so47eEuygMgJdZRGh5KifAlBQg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-aI0kzsuJOHuOMJKCyfrwAg-1; Tue, 02 Sep 2025 04:06:04 -0400
X-MC-Unique: aI0kzsuJOHuOMJKCyfrwAg-1
X-Mimecast-MFC-AGG-ID: aI0kzsuJOHuOMJKCyfrwAg_1756800362
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3cceb92ea73so2920953f8f.0
        for <sparclinux@vger.kernel.org>; Tue, 02 Sep 2025 01:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800362; x=1757405162;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljgQE6xPMjgEsLMyx80S8frJUxwb6xjySanoEF8fZEk=;
        b=gAaSxPDESWSO51kQFTDVn9gzm6jTvCsNza2gldQ9CkuBvbKWb+1vt49l+0hWFJ5kiZ
         11Be+VhOJzsTP+LpMudJYTnGVaZN23cHBF5GqzWmKbapzy4w0L5zn0BTrbo/EiNPesIT
         buiiKBTx7KfcRO9DJecrVggh4YrMb2tvPhsvLEFbvP7+RxDQXy0w0Fs0AEAIitIU795o
         fsmFckRKMdAteksFBjBcvGT2Cu84SYCr7oTFFCXBqKQrx+Odc0dIIkSMolczbaHR53Bv
         GBdjDJBrQ+o2mRTrtYEd5z0ZyPOeokb+HM7lCJbk4JHOdR8aA1MOm19D7KoyQVVwyZWh
         FZkg==
X-Forwarded-Encrypted: i=1; AJvYcCVilDMzEm093KLc+qD5VIuve0sJ4nnV87Qv1nJr23lSpSjFeqXoVrs3B5zBkDNMgsjpeYXZPQOoj4Xe@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzFc5ibpV002k6LhapLoS2yhbOwrBgCDhemEVzZU6eCk2neCn
	PfQeDtOtidt1W80XDzke97IOfKdcfXlJ9Qxk62ezIpMwHNgOzereIgfjpzN1EyqBityOkUcOckw
	qpC3OOv5IAUHqbEVa3cy7N9w3vkGvGG7T99+rmYIiRkTh5xq/Iae8PkkvXcknDx4=
X-Gm-Gg: ASbGncsmZgqE15wsXCC71igvCz1BfvlfdNMhxV3ltherd/2RuBuiwUhW2orAoN/wjyF
	ihjqQ4Ay/JdGo3mDz9n4WhW5etb57yV5BLIHs+fG5Y1VQl7NxOcyFf3N9b0G0/aUzh0aGg0JhMv
	vejECEgiGplfkdJlWqTBXTrqSoj8qaGqXuHfxTnPxYPAQnlwqfKf5tTUkHeJa37nlJDs8G5SYod
	utKnuXIJjD34gQ5TKa+8wr78rFn3en0QBcxx1OfuHaZoQm0matKqcBShqRnInSAnQ4QeOTSLv2a
	yukx867C4+826pXI73C5mVQSOx3L0Gg5VLn0L+x35T/URoEld0xSLXXxmArNX34q00Pf23Kt+eK
	Tby04SO4e3R3k1ArPcDylBbG7ya/1tTp9nX5Wu3CoIFB5r0zBrYN2HeX1Qv9Ifn4wDmc=
X-Received: by 2002:a05:6000:2301:b0:3ca:ad45:6362 with SMTP id ffacd0b85a97d-3d1dfcfb6e9mr7271306f8f.41.1756800362349;
        Tue, 02 Sep 2025 01:06:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE89e2rQnCWFQJx3mBpIBce4Sf0ynyHLTGKH2yytotONMMUzyt2emLxtRzyXBmVv6z/AWM1KQ==
X-Received: by 2002:a05:6000:2301:b0:3ca:ad45:6362 with SMTP id ffacd0b85a97d-3d1dfcfb6e9mr7271226f8f.41.1756800361810;
        Tue, 02 Sep 2025 01:06:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:3f00:731a:f5e5:774e:d40c? (p200300d82f1f3f00731af5e5774ed40c.dip0.t-ipconnect.de. [2003:d8:2f1f:3f00:731a:f5e5:774e:d40c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm13170209f8f.40.2025.09.02.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 01:06:01 -0700 (PDT)
Message-ID: <ff2875c5-93f7-4fbc-92e6-ce4c607ce240@redhat.com>
Date: Tue, 2 Sep 2025 10:05:58 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] mm: constify various inline functions for
 improved const-correctness
To: Max Kellermann <max.kellermann@ionos.com>, akpm@linux-foundation.org,
 axelrasmussen@google.com, yuanchu@google.com, willy@infradead.org,
 hughd@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, vishal.moola@gmail.com,
 linux@armlinux.org.uk, James.Bottomley@HansenPartnership.com, deller@gmx.de,
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
 linux-fsdevel@vger.kernel.org
References: <20250901205021.3573313-1-max.kellermann@ionos.com>
 <20250901205021.3573313-11-max.kellermann@ionos.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901205021.3573313-11-max.kellermann@ionos.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.25 22:50, Max Kellermann wrote:
> We select certain test functions plus folio_migrate_refs() from
> mm_inline.h which either invoke each other, functions that are already
> const-ified, or no further functions.
> 
> It is therefore relatively trivial to const-ify them, which
> provides a basis for further const-ification further up the call
> stack.
> 
> One exception is the function folio_migrate_refs() which does write to
> the "new" folio pointer; there, only the "old" folio pointer is being
> constified; only its "flags" field is read, but nothing written.
> 
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


