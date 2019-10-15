Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C13D75A3
	for <lists+sparclinux@lfdr.de>; Tue, 15 Oct 2019 13:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbfJOLyz (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Oct 2019 07:54:55 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:54972 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfJOLyz (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 15 Oct 2019 07:54:55 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Oct 2019 07:54:53 EDT
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>
Cc:     David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
 <20190818070137.GA22731@infradead.org>
 <20190818.123943.1491620523133670968.davem@davemloft.net>
 <20190819051055.GA32118@infradead.org>
 <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <25cbdd65-484e-7e50-ee8c-dc8745ece5fe@linux.ee>
Date:   Tue, 15 Oct 2019 14:47:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

19.08.19 08:58 Linus Torvalds wrote:
> On Sun, Aug 18, 2019 at 10:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Sun, Aug 18, 2019 at 12:39:43PM -0700, David Miller wrote:
>>> From: Christoph Hellwig <hch@infradead.org>
>>> Date: Sun, 18 Aug 2019 00:01:37 -0700
>>>
>>>> I think for now we'll simply have to disable HAVE_FAST_GUP for sparc,
>>>> until someone who really knows low-level sparc page table handling
>>>> finds some time to audit the generic fast gup code and arch hooks.
>>>
>>> It's a regression, we don't disable features in those circumstances
>>> usually right?
>>
>> Well, it isn't exactly a feature we lost, but an optimization that makes
>> operations go faster vs not allowing them.  Them other option would be
>> to revert the whole stack of patches, which is the groundwork for
>> fixing the get_user_pages vs truncate and co races, so I'm not very
>> eager to do that for sparc64.
>>
>> But in the end Linus will have to decide.
> 
> It does sound like we should just disable HAVE_FAST_GUP for sparc. And
> yes, it's "only" an optimization, disabling it shouldn't bvreak
> anything. get_user_pages_fast() will fall back on the regular
> get_user_pages() logic if there is not fast-GUP.

So yes, will we do this to get rid of that regression?

> (In fact, even if there *is* fast-GUP, the whole design of fast-GUP is
> to fail for any "hard" case, so that fallback is fundamental).
> 
> If it was something more generic I'd argue for reverting, but it does
> seem to be very sparc-specific, and there just aren't enough sparc
> users to argue for the optimization being critical.
> 
> I still can't see what might be wrong in the generic code. It's quite
> different from the previous sparc64 code, but just about all the
> differences are about how it supports a lot more cases (devmap,
> 5-level page tables, the crazy powepc "hugepd" thing etc), but all of
> those differences should just compile away on sparc64.
> 
> There are other small differences. For example, the old sparc64
> gup_huge_pud() code did this:
> 
>          if (!(pud_val(pud) & _PAGE_VALID))
>                  return 0;
> 
>          if (write && !pud_write(pud))
>                  return 0;
> 
> and the generic gup_huge_pud() code instead does
> 
>          if (!pud_access_permitted(orig, flags & FOLL_WRITE))
>                  return 0;
> 
> which does the same thing, but expresses it differently (because sparc
> doesn't have its own specific one):
> 
>    #define pud_access_permitted(pud, write) \
>            (pud_present(pud) && (!(write) || pud_write(pud)))
> 
> and "pud_present()" for sparc64 is actually defined as
> 
>    #define pud_present(pud)            (pud_val(pud) != 0U)
> 
> (notice the difference between checking _PAGE_VALID and checking all bits.
> 
> Can there be pud values that are non-zero but also not valid? Maybe.
> If so, you'd get different results here.
> 
> So both versions look sane, but they aren't identical, and there might
> be some sparc64 oddity that just triggers here.
> 
> The code apparently works for David for his compiler and hardware
> configuration. So it's not *entirely* broken even on sparc64. But yes,
> without somebody with the resources to understand why some specific
> sparc64 situations don't work, I think we just need to disable
> FAST_GUP on sparc64.
> 
>                 Linus
> 
