Return-Path: <sparclinux+bounces-5472-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D5C0710A
	for <lists+sparclinux@lfdr.de>; Fri, 24 Oct 2025 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677263AED5E
	for <lists+sparclinux@lfdr.de>; Fri, 24 Oct 2025 15:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C813328B45;
	Fri, 24 Oct 2025 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PdOL74X4"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9E326D4F
	for <sparclinux@vger.kernel.org>; Fri, 24 Oct 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320841; cv=none; b=XYVY5Dgbu8+jbKNnVYfHNHZbAvPeXynFdURG0ohakL9YNu6+ZYq/Adljt+b1wS8DsCOskjszHoQNd4SHRgOnrO3APArYd7TuqRZEVhSpNFK+CBvTiId+Z6zHhR10PID5YaWa1Zwx7dDefdw9frN1CqAZEAKE7i9jHl4CRyec3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320841; c=relaxed/simple;
	bh=mDlbnHPs3jQlPU8PdpQXhDxeQY+AxLDjI0PR2M1TVmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tofxxBzyGrv/TUEXJNyikwkogg/rArURt3eZ0ZS1CQ+hggz1lDPYhY7qHwg4ZizSaYTT649t1T4hvGKxkXo5LYxeoOpG6qaNzDkrnjF++pL/gAJkByC4kd35FhjbVPjIk0VqD4E9NAN6EzGkGvItD5dULOpFx8N9Z3bUT5TU/rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PdOL74X4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761320838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zh1ZhwP32aAGY6v6KALNNGN/uKhaB99XR778w+H01CM=;
	b=PdOL74X4IiWhsuA/QbO2n6nEqyiKBYRH9LZT14JYdVveQTcix9G0pEgiOHbjXBhKa/bAtK
	Ep6SrdOBsIudHC5HLspnNDPVsjeOgHpm0SQn7Gc13/TPoGSlHN/nBZVC27MsE+D3ck/UA+
	aSoQxuGAooyzOATZHCg4tWRH8CrOyE4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-dXw36xcXPzSXOOqciKqzqw-1; Fri, 24 Oct 2025 11:47:17 -0400
X-MC-Unique: dXw36xcXPzSXOOqciKqzqw-1
X-Mimecast-MFC-AGG-ID: dXw36xcXPzSXOOqciKqzqw_1761320836
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426feed0016so721252f8f.3
        for <sparclinux@vger.kernel.org>; Fri, 24 Oct 2025 08:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761320836; x=1761925636;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh1ZhwP32aAGY6v6KALNNGN/uKhaB99XR778w+H01CM=;
        b=HCgSPDTSoZCeYB/x6jh82VZUFGTdgILRBohfNS6MquKDSbEk3Vu3odrkiHkpIKxu7a
         j837J+LOLdv2b7Ez91cgADhcBgRGbQLH3+CML4IN6kBrECWzsboJ2qU0JeR3s6HIyjl0
         5lpZf4GISim92TJZi0QF0kkyZoqRZllPks5UpEZjWplF94IsZXIFL7ZKTAWBP1PGsLD+
         /CxyyS+Tclc087NpGLfDOLb1s0Qe+tGUdviQKERT2uFjfMIuDb18QiUH5km7fV9Dq9f1
         +kcm5xjbhxd8whGhPbTC2NWqVFdplkkOWtOdZORtLN2sMQEQU69b5MfhG3CiDGGIuUGJ
         dIxA==
X-Forwarded-Encrypted: i=1; AJvYcCUQksn7LH9o9UEx9Gm2xRYOug8DMlkGF7qvD1AgzFr8QCaMlLOchZ0dmmjrlbqScKpMzSwa6Wo7rHqI@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOFqkMJDpFga8Lw0JpvtC/WU/cEkK3NwK6EVN9n/6QOxnptYF
	LrxFS24Dsdarja7me5VGLVrB0PLlDEwfV/E0J9MDnKSvVx1XAZbDTzufO+hH52ERQx7lW+x6cfs
	F/u3Q7JmYI9ymfsdpJNX4uMCAX48+RWzb0rsDKcvBXPQBiBadNGqI+sFbY1ZGpwY=
X-Gm-Gg: ASbGnctyfih1T5O6ma+CYQAGLHu3VGCkvJnxmkYfOhKYLDh1ovW3DeSJoAHU+O1S2r2
	SCwdlTKCntFc3SbJgAFB94Ql407I9lla3Zlcr7GAaAVo3Gv6+iO2OBppWewIuvHutE1XBoiLrMx
	L2Ud4Q4XrhK8dvBVLE0bVQGB0/TC5Tc0VhgTE5MJvDgxWQuvm4rF3GcYrLxAezcUjNA4wwAd2V0
	yg5AVE8WBnnZiqizejrKNDrUkCT7WEdC6uKUmUvtxcDAsEyMY2jM66DE2U2NR6gG1FoAEmxW2fr
	7htl3pdR3uaR687tHYjObXeNFKQ5Td8NO1i4K6R27givDQLLOdr/cPMJDFlKZ5JW2pX+KdzS0Oe
	zqCL/uNxjKvsDWr+37NF4/3jtYU3JsBRkcGuKyynjOU+4bR/3isxsTO1YXGzAH41b6KTcrte3h4
	M6N7XlRTqRdO31B3Qnp6Sd4c9giYI=
X-Received: by 2002:a05:6000:2888:b0:3ec:dd12:54d3 with SMTP id ffacd0b85a97d-42704d9396fmr20967205f8f.35.1761320835776;
        Fri, 24 Oct 2025 08:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1IyVkNrFwdw3X0IHbQxiNfclxHzAPN9pR/bJWmUeOYxNVyIqqL3bIXH42bdfIqDr4yy7kTg==
X-Received: by 2002:a05:6000:2888:b0:3ec:dd12:54d3 with SMTP id ffacd0b85a97d-42704d9396fmr20967156f8f.35.1761320835282;
        Fri, 24 Oct 2025 08:47:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e76b8sm10302003f8f.1.2025.10.24.08.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 08:47:14 -0700 (PDT)
Message-ID: <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
Date: Fri, 24 Oct 2025 17:47:12 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Woodhouse <dwmw2@infradead.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
 <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.10.25 17:38, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-10-24 at 16:13 +0100, David Woodhouse wrote:
>> On Fri, 2025-10-24 at 16:51 +0200, David Hildenbrand wrote:
>>> On 24.10.25 16:47, David Woodhouse wrote:
>>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>>> again.
>>>>>>
>>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>>> state when switching to the new task, instead of using a separate
>>>>>> TIF flag.
>>>>>>
>>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>>> folks.
>>>>
>>>>
>>>> I know tglx has shouted at me in the past for precisely this reminder,
>>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>>> to actually run Xen? Has this been boot tested?
>>>
>>> And after that, boot-testing sparc as well? :D
>>
>> Also not that hard in QEMU, I believe. Although I do have some SPARC
>> boxes in the shed...
> 
> Please have people test kernel changes on SPARC on real hardware. QEMU does not
> emulate sun4v, for example, and therefore testing in QEMU does not cover all
> of SPARC hardware.
> 
> There are plenty of people on the debian-sparc, gentoo-sparc and sparclinux
> LKML mailing lists that can test kernel patches for SPARC. If SPARC-relevant
> changes need to be tested, please ask there and don't bury such things in a
> deeply nested thread in a discussion which doesn't even have SPARC in the
> mail subject.

Hi Adrian,

out of curiosity, do people monitor sparclinux@ for changes to actively 
offer testing when required -- like would it be sufficient to CC 
relevant maintainers+list (like done here) and raise in the cover letter 
that some testing help would be appreciated?

-- 
Cheers

David / dhildenb


