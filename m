Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A6B32B20C
	for <lists+sparclinux@lfdr.de>; Wed,  3 Mar 2021 04:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244287AbhCCCgV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Mar 2021 21:36:21 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:47693 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1574261AbhCBPOt (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Mar 2021 10:14:49 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lH6Ln-003zCW-BW; Tue, 02 Mar 2021 15:50:15 +0100
Received: from dslb-092-078-035-231.092.078.pools.vodafone-ip.de ([92.78.35.231] helo=[192.168.178.45])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lH6Ln-000ecM-0z; Tue, 02 Mar 2021 15:50:15 +0100
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault
 loads
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        David Miller <davem@davemloft.net>
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
 <CADxRZqxScpzebDEh+LjyKmsgoQErqB=Lie=JUX2WWN2NOzqPcQ@mail.gmail.com>
 <4b2456f6-f080-9104-e5a0-22e009164979@oracle.com>
 <cacdc021-75cd-7325-0273-cc007a4767ff@physik.fu-berlin.de>
 <YD5PzDbp5YHxuILm@kroah.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <a1019767-3cde-d0f3-2188-2e7360ca391a@physik.fu-berlin.de>
Date:   Tue, 2 Mar 2021 15:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD5PzDbp5YHxuILm@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 92.78.35.231
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Greg!

On 3/2/21 3:46 PM, Greg Kroah-Hartman wrote:
>> On 3/1/21 4:05 PM, Rob Gardner wrote:
>>> On 3/1/21 5:56 AM, Anatoly Pugachev wrote:
>>>> On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
>>>>> is_no_fault_exception() has two bugs which were discovered via random
>>>>> opcode testing with stress-ng. Both are caused by improper filtering
>>>>> of opcodes.
>>>> Rob, tested on my ldom, works perfectly now...
>>>>
>>>> $ uname -a
>>>> Linux ttip 5.12.0-rc1-dirty #195 SMP Mon Mar 1 15:46:15 MSK 2021
>>>> sparc64 GNU/Linux
>>>>
>>>> $ stress-ng --opcode 1 --timeout 60 --metrics-brief
>>>> stress-ng: info:  [945] dispatching hogs: 1 opcode
>>>> stress-ng: info:  [945] successful run completed in 60.00s (1 min, 0.00 secs)
>>>> stress-ng: info:  [945] stressor       bogo ops real time  usr time
>>>> sys time   bogo ops/s   bogo ops/s
>>>> stress-ng: info:  [945]                           (secs)    (secs)
>>>> (secs)   (real time) (usr+sys time)
>>>> stress-ng: info:  [945] opcode            17847     60.00     27.45
>>>>   34.03       297.45       290.29
>>>>
>>>> Thank you for a quick fix.
>>>
>>>
>>> You're welcome. Please add your "tested-by" if you like.
>>
>> Any chance we could get this patch into 5.12 and the stable kernels? (CC Greg)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> </formletter>

Thanks for the heads-up. I'll leave it to Rob to decide when to send it.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

