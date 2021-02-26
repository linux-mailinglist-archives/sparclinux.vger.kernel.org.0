Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D903266AA
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 19:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBZSEU (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Feb 2021 13:04:20 -0500
Received: from mx2.cyber.ee ([45.144.6.23]:39451 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhBZSET (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 26 Feb 2021 13:04:19 -0500
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
Message-ID: <ede51bdb-6746-93d8-7f4b-8620c2105d81@linux.ee>
Date:   Fri, 26 Feb 2021 20:03:41 +0200
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


>> This resulted in a crash (this is different, irq5 during mm code):
>>
>> [  304.847868] Unable to handle kernel paging request at virtual address ffffffffffffe000
> 
> 
> But what was the last "fixing up no fault insn" message you got before this panic? I need that to be sure that this is just another instance of the other panics and not a different cause.


Rechecked with the same kernel image of last patch only, this time the fault address is different, but still no previous debug messages (probably expected since no previous patches are there),
just starts with
Unable to handle kernel paging request at virtual address 256c780a00000000
And the rest of addresses and backtrace is also different.

> Also, did you apply this code patch along with others or was it alone? If alone, please try running with all 3 patches applied. My logic leads me to believe that you should not see any panics/hangs with all the code changes applied.

I hope to have the SSH console connection in better shape now (no mikrotik jumphost on the way), will start retesting with incremental patches.

-- 
Meelis Roos <mroos@linux.ee>
