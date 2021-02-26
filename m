Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5AC32650F
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 16:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZP6R (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Feb 2021 10:58:17 -0500
Received: from mx2.cyber.ee ([45.144.6.23]:39391 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhBZP6Q (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 26 Feb 2021 10:58:16 -0500
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
 <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
 <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
 <3d42713e-bff6-63d9-2c0e-781e829d78f8@linux.ee>
 <584994e3-09b6-de8c-f08a-9962075711f9@oracle.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <b7316a52-482f-3710-4111-d5f36703e4e7@linux.ee>
Date:   Fri, 26 Feb 2021 17:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <584994e3-09b6-de8c-f08a-9962075711f9@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

>> From two boots, the insn varies among
>> c798d0c9
>> c8c6d0de
>> cf95d1ef
>> d49cd066
>> dad750ec
>> e09810de
>> e3e790c4
>> e5a051cb
>> e7f21165
>> ea8fd1cb
>> ebb611fc
>> f4c551de
>> fe8690fd
>> fff21079
> 
> 
> Are you saying that in this list of instructions, each one of them causes a crash or hang?

No, these just appear in dmesg, most of them do not seem to cause a crash because I did not have so many boots.My dmesg capture is unfortunately flaky with MikroTik SSH jumphost or Sun ALOM dropping the SSH console connection often.


>>> which should assemble to 0xc1a01040. You could just try this instruction.

All tests after that start with this instruction and continue with random ones - I just overwite the start of opcode buffer with this.
>>> 4. If this does result in a crash, this patch might be the fix:
>>
>> Yes, with this patch only, it works for multiple minutes and is stable. Nothing in dmesg either.
>>
>>> 5. Here is another patch to try after the others:
>>
>>
>> This resulted in a crash (this is different, irq5 during mm code):
>>
>> [  304.847868] Unable to handle kernel paging request at virtual address ffffffffffffe000
> 
> 
> But what was the last "fixing up no fault insn" message you got before this panic? I need that to be sure that this is just another instance of the other panics and not a different cause.

Did not manage to capture this. Since this was the later kernel, I have it still around and retested - there was no "fixing up ..." message befor the crash (probably).

> 
> Also, did you apply this code patch along with others or was it alone? If alone, please try running with all 3 patches applied. My logic leads me to believe that you should not see any panics/hangs with all the code changes applied.

OK, will try them together - I did try one by one so far and applied some (at least one) by hand but I think successfully - might have failed because I applied it to the wrong state of code.

  
> I think the important test cases are c1a01040 (which should be fixed by the first code patch) and cf95d1ef, (which should be fixed by the second code patch.)


Will try the patches incrementally and with both constants for overwriting the start of the opcode block.

-- 
Meelis Roos <mroos@linux.ee>
