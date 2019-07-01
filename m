Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6450244A0E
	for <lists+sparclinux@lfdr.de>; Thu, 13 Jun 2019 19:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfFMR6O (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 13 Jun 2019 13:58:14 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:56120 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728274AbfFMR6N (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Thu, 13 Jun 2019 13:58:13 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0CD24C219B;
        Thu, 13 Jun 2019 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560448693; bh=LJavSY8Csb6IKvT6GApPq2LFdmFwqvpDZcp/Rfd3GmE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To:From;
        b=ASMcB1iCalm/RZa3MaAXMR3twsH8ZyJX6rfqatmxk3+7QCBhu85f5UBmILxUHCbfl
         uaE0sw7etwQiMKS9V7YJZrEhAHXz66TINoKz78+fISnDKduWEBYv7lRoaFn8scBZQN
         VnR5njjFVu134X4pAirp28InXohyxznUpt6PClsf/ZGUBvR85M/NdUObLRHuVPx/s6
         AsnMMHJCWD6SKCrUlSF4srkQSWO2mCgHlmvDKP56rZWx5kEJf6CChlJU1Ik4gWIkvk
         ihOI5ATSCNUHXOusPC1leckbpnXMxaNDbZMYmb4MGji+oLb6Crx+Zh17SLDN+aiIJM
         Mp08sJpYv2sig==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AC3A5A009A;
        Thu, 13 Jun 2019 17:58:00 +0000 (UTC)
Received: from IN01WEHTCA.internal.synopsys.com (10.144.199.104) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 13 Jun 2019 10:58:00 -0700
Received: from IN01WEHTCB.internal.synopsys.com (10.144.199.105) by
 IN01WEHTCA.internal.synopsys.com (10.144.199.103) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 13 Jun 2019 23:28:11 +0530
Received: from [10.10.161.35] (10.10.161.35) by
 IN01WEHTCB.internal.synopsys.com (10.144.199.243) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 13 Jun 2019 23:28:10 +0530
Subject: Re: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Michal Hocko <mhocko@suse.com>, <linux-ia64@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Dave Hansen" <dave.hansen@linux.intel.com>,
        Will Deacon <will.deacon@arm.com>,
        Paul Mackerras <paulus@samba.org>,
        <sparclinux@vger.kernel.org>,
        "Stephen Rothwell" <sfr@canb.auug.org.au>,
        <linux-s390@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Ellerman <mpe@ellerman.id.au>, <x86@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        <linux-snps-arc@lists.infradead.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        "Andy Lutomirski" <luto@kernel.org>,
        Thomas Gleixner <tglx@synopsys.com>,
        "Masami Hiramatsu" <masami.hiramatsu.pt@hitachi.com>
Newsgroups: gmane.linux.ports.arm.kernel,gmane.linux.kernel.mm,gmane.linux.kernel,gmane.linux.ports.ia64,gmane.linux.ports.sh.devel,gmane.linux.ports.sparc,gmane.linux.kernel.arc,gmane.linux.ports.mips,gmane.linux.ports.ppc64.devel
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
From:   Vineet Gupta <Vineet.Gupta1@synopsys.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vgupta@synopsys.com; keydata=
 mQINBFEffBMBEADIXSn0fEQcM8GPYFZyvBrY8456hGplRnLLFimPi/BBGFA24IR+B/Vh/EFk
 B5LAyKuPEEbR3WSVB1x7TovwEErPWKmhHFbyugdCKDv7qWVj7pOB+vqycTG3i16eixB69row
 lDkZ2RQyy1i/wOtHt8Kr69V9aMOIVIlBNjx5vNOjxfOLux3C0SRl1veA8sdkoSACY3McOqJ8
 zR8q1mZDRHCfz+aNxgmVIVFN2JY29zBNOeCzNL1b6ndjU73whH/1hd9YMx2Sp149T8MBpkuQ
 cFYUPYm8Mn0dQ5PHAide+D3iKCHMupX0ux1Y6g7Ym9jhVtxq3OdUI5I5vsED7NgV9c8++baM
 7j7ext5v0l8UeulHfj4LglTaJIvwbUrCGgtyS9haKlUHbmey/af1j0sTrGxZs1ky1cTX7yeF
 nSYs12GRiVZkh/Pf3nRLkjV+kH++ZtR1GZLqwamiYZhAHjo1Vzyl50JT9EuX07/XTyq/Bx6E
 dcJWr79ZphJ+mR2HrMdvZo3VSpXEgjROpYlD4GKUApFxW6RrZkvMzuR2bqi48FThXKhFXJBd
 JiTfiO8tpXaHg/yh/V9vNQqdu7KmZIuZ0EdeZHoXe+8lxoNyQPcPSj7LcmE6gONJR8ZqAzyk
 F5voeRIy005ZmJJ3VOH3Gw6Gz49LVy7Kz72yo1IPHZJNpSV5xwARAQABtCpWaW5lZXQgR3Vw
 dGEgKGFsaWFzKSA8dmd1cHRhQHN5bm9wc3lzLmNvbT6JAj4EEwECACgCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheABQJbBYpwBQkLx0HcAAoJEGnX8d3iisJeChAQAMR2UVbJyydOv3aV
 jmqP47gVFq4Qml1weP5z6czl1I8n37bIhdW0/lV2Zll+yU1YGpMgdDTHiDqnGWi4pJeu4+c5
 xsI/VqkH6WWXpfruhDsbJ3IJQ46//jb79ogjm6VVeGlOOYxx/G/RUUXZ12+CMPQo7Bv+Jb+t
 NJnYXYMND2Dlr2TiRahFeeQo8uFbeEdJGDsSIbkOV0jzrYUAPeBwdN8N0eOB19KUgPqPAC4W
 HCg2LJ/o6/BImN7bhEFDFu7gTT0nqFVZNXlOw4UcGGpM3dq/qu8ZgRE0turY9SsjKsJYKvg4
 djAaOh7H9NJK72JOjUhXY/sMBwW5vnNwFyXCB5t4ZcNxStoxrMtyf35synJVinFy6wCzH3eJ
 XYNfFsv4gjF3l9VYmGEJeI8JG/ljYQVjsQxcrU1lf8lfARuNkleUL8Y3rtxn6eZVtAlJE8q2
 hBgu/RUj79BKnWEPFmxfKsaj8of+5wubTkP0I5tXh0akKZlVwQ3lbDdHxznejcVCwyjXBSny
 d0+qKIXX1eMh0/5sDYM06/B34rQyq9HZVVPRHdvsfwCU0s3G+5Fai02mK68okr8TECOzqZtG
 cuQmkAeegdY70Bpzfbwxo45WWQq8dSRURA7KDeY5LutMphQPIP2syqgIaiEatHgwetyVCOt6
 tf3ClCidHNaGky9KcNSQ
Message-ID: <e5f45089-c3aa-4d78-2c8d-ed22f863d9ee@synopsys.com>
Date:   Thu, 13 Jun 2019 10:57:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.161.35]
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

+CC Masami San

On 6/13/19 3:07 AM, Anshuman Khandual wrote:
> Questions:
> 
> AFAICT there is no equivalent of erstwhile notify_page_fault() during page
> fault handling in arc and mips archs which can call this generic function.
> Please let me know if that is not the case.

For ARC do_page_fault() is entered for MMU exceptions (TLB Miss, access violations
r/w/x etc). kprobes uses a combination of UNIMP_S and TRAP_S instructions which
don't funnel into do_page_fault().

UINMP_S leads to

instr_service
   do_insterror_or_kprobe
      notify_die(DIE_IERR)
         kprobe_exceptions_notify
            arc_kprobe_handler


TRAP_S 2 leads to

EV_Trap
   do_non_swi_trap
      trap_is_kprobe
         notify_die(DIE_TRAP)
            kprobe_exceptions_notify
               arc_post_kprobe_handler

But indeed we are *not* calling into kprobe_fault_handler() - from eithet of those
paths and not sure if the existing arc*_kprobe_handler() combination does the
equivalent in tandem.

-Vineet
