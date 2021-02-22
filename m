Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866D8322040
	for <lists+sparclinux@lfdr.de>; Mon, 22 Feb 2021 20:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhBVTf4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Feb 2021 14:35:56 -0500
Received: from mx2.cyber.ee ([193.40.6.72]:58854 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233223AbhBVTfu (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 22 Feb 2021 14:35:50 -0500
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
Date:   Mon, 22 Feb 2021 21:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello!

>> 1. https://www.spinics.net/lists/sparclinux/msg25915.html
>> 2. https://www.spinics.net/lists/sparclinux/msg25917.html
> 
> I've looked at those and they don't contain the information I am interested in. I believe that stress-ng issues random opcodes in order to test how the system reacts. The actual random opcodes are what I need to see printed out directly from stress-ng before it actually executes the opcode. The kernel crash traces do not show those, just the aftermath. For instance, in the second trace I can see that the faulting instruction is c2070005 (lduw [ %i4 + %g5 ], %g1) and with i4: 00000000010e11c0 and g5: 794b00a7d5ede977, we can see how that instruction generated an unaligned access. But that is not the instruction executed by stress-ng, it's an instruction in the kernel, operating on faulty data, and I can't tell from the trace where that strange g5 value came from. The actual user instruction that was executed may provide a good hint.


I instrumented stress-ng with simple opcode block logging patch https://pastebin.com/1dZiCzCg and the results are hard to find usable, so far :(

1. The amount of code generated at each try is huge - last time it was more than the scrollback buffer of my "screen".

2. Adding these logging statements makes the bug harder to trigger - tried on 5.10 and it ran fine multiple times and then  failed but that took many minutes of running before the crash. I was observing the data over SSH, that might also change scheduling/CPU usage.

Any ideas for better logging that would not be in the way?

-- 
Meelis Roos <mroos@linux.ee>
