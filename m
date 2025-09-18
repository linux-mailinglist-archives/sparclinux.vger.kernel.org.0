Return-Path: <sparclinux+bounces-4857-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C0B4ABF6
	for <lists+sparclinux@lfdr.de>; Tue,  9 Sep 2025 13:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9EDD1B218D2
	for <lists+sparclinux@lfdr.de>; Tue,  9 Sep 2025 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA8131E101;
	Tue,  9 Sep 2025 11:29:03 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81315321F3A;
	Tue,  9 Sep 2025 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417343; cv=none; b=baAnxGQDe9WeNX32REXcr2Olg38xRhRj7IUgRCl4hEMruAxgNrPN9EElm+MTRQNM5qxbWaIpirNAGbAKSmBPRKZ5GdGVcDuI9jabmvR4f+rugKIgSbNn9o4M1osi0y7DuTNQc3DOrSOmEHmbbnpa0aJgBvv5BHVEnweNYUYj9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417343; c=relaxed/simple;
	bh=axp0FTGXefGro3RhqluT9iJwb+PyenJkwISYzkbLArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWvcrNBJ2nC92DlQSnCx0R1qB8krxohA2a6CPEkK7WN33e60bIYPAn8dlsyuy/Eq2eqIrDAz2v35tqOMOKV6qgtIkKMzFV3Hx5tz8riq1YlwOBHMecZmxPTZ8yR3W+nkwUmr7uXJHdC4z0ShRpSp8adVp9M2fVkha9lL5ue9iIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB201424;
	Tue,  9 Sep 2025 04:28:52 -0700 (PDT)
Received: from [10.57.79.24] (unknown [10.57.79.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF8BD3F694;
	Tue,  9 Sep 2025 04:28:49 -0700 (PDT)
Message-ID: <0fd00f60-d3f1-4c86-925c-6947decb5159@arm.com>
Date: Tue, 9 Sep 2025 13:28:46 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
To: David Hildenbrand <david@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
 <aa28c1a7-82fc-42af-9904-a4d4db078a19@redhat.com>
 <360712fa-f7a0-4674-acc4-76f79141fe4f@suse.com>
 <57f49b72-2126-48f0-a4ef-4b138bd0bead@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <57f49b72-2126-48f0-a4ef-4b138bd0bead@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2025 11:56, David Hildenbrand wrote:
> On 09.09.25 11:37, Jürgen Groß wrote:
>> On 09.09.25 11:13, David Hildenbrand wrote:
>>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>>> Commit 49147beb0ccb ("x86/xen: allow nesting of same lazy mode")
>>>> originally introduced support for nested lazy sections (LAZY_MMU and
>>>> LAZY_CPU). It later got reverted by commit c36549ff8d84 as its
>>>> implementation turned out to be intolerant to preemption.
>>>>
>>>> Now that the lazy_mmu API allows enter() to pass through a state to
>>>> the matching leave() call, we can support nesting again for the
>>>> LAZY_MMU mode in a preemption-safe manner. If xen_enter_lazy_mmu() is
>>>> called inside an active lazy_mmu section, xen_lazy_mode will already
>>>> be set to XEN_LAZY_MMU and we can then return LAZY_MMU_NESTED to
>>>> instruct the matching xen_leave_lazy_mmu() call to leave
>>>> xen_lazy_mode unchanged.
>>>>
>>>> The only effect of this patch is to ensure that xen_lazy_mode
>>>> remains set to XEN_LAZY_MMU until the outermost lazy_mmu section
>>>> ends. xen_leave_lazy_mmu() still calls xen_mc_flush()
>>>> unconditionally.
>>>>
>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>> ---
>>>>    arch/x86/include/asm/paravirt.h       |  6 ++----
>>>>    arch/x86/include/asm/paravirt_types.h |  4 ++--
>>>>    arch/x86/xen/mmu_pv.c                 | 11 ++++++++---
>>>>    3 files changed, 12 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/x86/include/asm/paravirt.h
>>>> b/arch/x86/include/asm/paravirt.h
>>>> index 65a0d394fba1..4ecd3a6b1dea 100644
>>>> --- a/arch/x86/include/asm/paravirt.h
>>>> +++ b/arch/x86/include/asm/paravirt.h
>>>> @@ -529,14 +529,12 @@ static inline void
>>>> arch_end_context_switch(struct
>>>> task_struct *next)
>>>>    #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>>>>    static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>>>    {
>>>> -    PVOP_VCALL0(mmu.lazy_mode.enter);
>>>> -
>>>> -    return LAZY_MMU_DEFAULT;
>>>> +    return PVOP_CALL0(lazy_mmu_state_t, mmu.lazy_mode.enter);
>>>>    }
>>>>    static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>>>>    {
>>>> -    PVOP_VCALL0(mmu.lazy_mode.leave);
>>>> +    PVOP_VCALL1(mmu.lazy_mode.leave, state);
>>>>    }
>>>>    static inline void arch_flush_lazy_mmu_mode(void)
>>>> diff --git a/arch/x86/include/asm/paravirt_types.h
>>>> b/arch/x86/include/asm/
>>>> paravirt_types.h
>>>> index bc1af86868a3..b7c567ccbf32 100644
>>>> --- a/arch/x86/include/asm/paravirt_types.h
>>>> +++ b/arch/x86/include/asm/paravirt_types.h
>>>> @@ -45,8 +45,8 @@ typedef int lazy_mmu_state_t;
>>>>    struct pv_lazy_ops {
>>>>        /* Set deferred update mode, used for batching operations. */
>>>> -    void (*enter)(void);
>>>> -    void (*leave)(void);
>>>> +    lazy_mmu_state_t (*enter)(void);
>>>> +    void (*leave)(lazy_mmu_state_t);
>>>>        void (*flush)(void);
>>>>    } __no_randomize_layout;
>>>>    #endif
>>>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>>>> index 2039d5132ca3..6e5390ff06a5 100644
>>>> --- a/arch/x86/xen/mmu_pv.c
>>>> +++ b/arch/x86/xen/mmu_pv.c
>>>> @@ -2130,9 +2130,13 @@ static void xen_set_fixmap(unsigned idx,
>>>> phys_addr_t
>>>> phys, pgprot_t prot)
>>>>    #endif
>>>>    }
>>>> -static void xen_enter_lazy_mmu(void)
>>>> +static lazy_mmu_state_t xen_enter_lazy_mmu(void)
>>>>    {
>>>> +    if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
>>>> +        return LAZY_MMU_NESTED;
>>>> +
>>>
>>> You mention above "preemption-safe manner" above, so I am wondering,
>>> what if we get preempted immediately after doing the this_cpu_read()
>>> and get
>>> scheduled on another CPU?
>>>
>>
>> This should still be correct: preemption needs a context switch to
>> happen,
>> so xen_start_context_switch() and xen_end_context_switch() are involved.
>> Those are dealing with this problem by doing the right thing in the old
>> and the new context.
>
> Thanks, that makes sense. Would be valuable to add that detail to the
> patch description. 

That's a fair point, Alexander was also wondering in v1 (and so was I
when I worked on this patch). Will clarify in v3.

- Kevin

