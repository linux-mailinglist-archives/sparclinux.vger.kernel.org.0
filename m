Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDA1369BA
	for <lists+sparclinux@lfdr.de>; Thu,  6 Jun 2019 04:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfFFCDr (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 Jun 2019 22:03:47 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:39658 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfFFCDr (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 5 Jun 2019 22:03:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A9D80D;
        Wed,  5 Jun 2019 19:03:45 -0700 (PDT)
Received: from [10.162.43.122] (p8cg001049571a15.blr.arm.com [10.162.43.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519F83F246;
        Wed,  5 Jun 2019 19:03:37 -0700 (PDT)
Subject: Re: [RFC V2] mm: Generalize notify_page_fault()
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrey Konovalov <andreyknvl@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
References: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
 <20190604215325.GA2025@bombadil.infradead.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <016a4808-527d-7164-b8a0-3173a4ecfa25@arm.com>
Date:   Thu, 6 Jun 2019 07:33:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190604215325.GA2025@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



On 06/05/2019 03:23 AM, Matthew Wilcox wrote:
> On Tue, Jun 04, 2019 at 12:04:06PM +0530, Anshuman Khandual wrote:
>> +++ b/arch/x86/mm/fault.c
>> @@ -46,23 +46,6 @@ kmmio_fault(struct pt_regs *regs, unsigned long addr)
>>  	return 0;
>>  }
>>  
>> -static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
>> -{
> ...
>> -}
> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 0e8834a..c5a8dcf 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1778,6 +1778,7 @@ static inline int pte_devmap(pte_t pte)
>>  }
>>  #endif
>>  
>> +int notify_page_fault(struct pt_regs *regs, unsigned int trap);
> 
> Why is it now out-of-line?  

Did not get it. AFAICS it is the same from last version and does not cross
80 characters limit on that line.

> 
>> +++ b/mm/memory.c
>> +int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
>> +{
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * To be potentially processing a kprobe fault and to be allowed
>> +	 * to call kprobe_running(), we have to be non-preemptible.
>> +	 */
>> +	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
>> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
>> +			ret = 1;
>> +	}
>> +	return ret;
>> +}
>> +
> 
> I would argue this should be in kprobes.h as a static nokprobe_inline.

We can do that. Though it will be a stand alone (not inside #ifdef) as it
already takes care of CONFIG_KPROBES via kprobes_built_in(). Will change
it and in which case the above declaration in mm.h would not be required.
