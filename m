Return-Path: <sparclinux+bounces-5495-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC0C0E21E
	for <lists+sparclinux@lfdr.de>; Mon, 27 Oct 2025 14:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8CC19C532B
	for <lists+sparclinux@lfdr.de>; Mon, 27 Oct 2025 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9B63043D9;
	Mon, 27 Oct 2025 13:38:18 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7B2FC01A;
	Mon, 27 Oct 2025 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572296; cv=none; b=G9SL6bu6QLWOz0TxGcXPKalqLNsaKtwhPgjmzEa8rSdIy1/IhjtaiEHvmuW2lqmdUhbHlFumeDmWPcxS3scLQifBWlDraOHIORC6JxerODTX9COIQ3SB6bp+B+I1puo6Cn49TOWSTwoK+BiWwZjDgP83eWKdJyEzi6jyMY6IEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572296; c=relaxed/simple;
	bh=Yg4tHkrWB8iD6I0E177EhXaJTLbrmVH+67p7EVU8ik0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEJtbprONvRvGYGXGGVZcRBNm/zToYCHQXxBVo/q17HEKsUHtbYVdFo2u4u9HERD+ypA2+2lhcJOrtUUYcD4POgHBTH4POgCqURi4/pxQuw/nBG3BQNyEUfd4IUemkEUZ+Ydav0wGYBMP9il+gr2vQnwXz0VHJqM7N6KwebceeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593A4175D;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD233F673;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Message-ID: <1db69026-199c-4cee-bb3b-1217f8a3afad@arm.com>
Date: Mon, 27 Oct 2025 14:38:00 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
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
 <6ed9f404-9939-4e9f-b5aa-4253bef46df1@arm.com>
 <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2025 17:17, David Woodhouse wrote:
> On Fri, 2025-10-24 at 17:05 +0200, Kevin Brodsky wrote:
>> On 24/10/2025 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>> I considered boot-testing a Xen guest (considering the Xen-specific
>> changes in this series), but having no idea how to go about it I quickly
>> gave up... Happy to follow instructions :)
> https://qemu-project.gitlab.io/qemu/system/i386/xen.html covers booting
> Xen HVM guests, and near the bottom PV guests too (for which you do
> need a copy of Xen to run in QEMU with '--kernel xen', and your
> distro's build should suffice for that).
>
> Let me know if you have any trouble. Here's a sample command line which
> works here...
>
> qemu-system-x86_64 -display none --accel kvm,xen-version=0x40011,kernel-irqchip=split -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=xen -kernel ~/git/linux-2.6/arch/x86/boot/bzImage -append "root=/dev/xvda1 console=ttyS0" -serial mon:stdio

Thanks this is helpful! Unfortunately lazy_mmu is only used in the PV
case, so I'd need to run a PV guest. And the distro I'm using (Arch
Linux) does not have a Xen package :/ It can be built from source from
the AUR but that looks rather involved. Are there some prebuilt binaries
I could grab and just point QEMU to?

- Kevin

