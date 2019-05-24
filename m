Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1EA292CD
	for <lists+sparclinux@lfdr.de>; Fri, 24 May 2019 10:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389136AbfEXIUd (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 May 2019 04:20:33 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:54652 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389046AbfEXIUd (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 24 May 2019 04:20:33 -0400
Subject: Re: More logging (was: vmalloc: Fix issues with flush flag)
To:     Rick Edgecombe <redgecombe.lkml@gmail.com>,
        sparclinux@vger.kernel.org
References: <CAF44hAHU7ZBBOrHZL=w0nBSwQBzCvMz_QXVoZ6LxFOmLRqYOtQ@mail.gmail.com>
 <d12889db-140d-494b-f3f6-911e51c1cb21@linux.ee>
 <CAF44hAFkvDHKB_SkWrvjzK68-TL48q2SuQYRyFb2rcih0ZPr=A@mail.gmail.com>
 <CAF44hAFMSK6Fco=bMmu0qwwCZubyP+UxP9a8e=WSPD8hXesQvw@mail.gmail.com>
 <982f4ce2-5605-0278-4556-65afefb53f41@linux.ee>
 <CAF44hAG9aptt7kdRnG7z3ob178pH5v5jP+ttf-Ja4OpF0Hh82w@mail.gmail.com>
 <CAF44hAGHKmMAyruMDY5v30kL2dDZqatT0tXo6cF8sGYk2UGBHg@mail.gmail.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <23e053dc-47ff-d113-22f0-5497c7fa8227@linux.ee>
Date:   Fri, 24 May 2019 11:20:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF44hAGHKmMAyruMDY5v30kL2dDZqatT0tXo6cF8sGYk2UGBHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

(CC:ing list again)

24.05.19 00:36 Rick Edgecombe kirjutas:
> Hi Meelis,
> 
> I am worried this may be a lot of work to do in case the issue is still somehow with my patch. If you want to rule that out before you do a whole bisect, commit "0a203df5cf0eb709be4f190314e262b72d7e5b76" is the first one one before any of my changes. If that still hangs with:
> CONFIG_DEBUG_PAGEALLOC=y
> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y

Tried that and 0a203df5cf0eb709be4f190314e262b72d7e5b76 with these DEBUG_PAGEALLOC
flags on hangs. It hangs before reaching itnit, during scsi disk detection, and
the exact moment of hangs varies by a line or too in dmesg.:

This is a typical hang, from the middle of line:

[   24.035174] printk: console [ttyS0] enabled
[   24.095507] f0097810: ttyS1 at MMIO 0x7fff3fffff8 (irq = 21, base_baud = 115387) is a ST16650
[   24.218682] Fusion MPT base driver 3.04.20
[   24.277381] Copyright (c) 1999-2008 LSI Corporation
[   24.347381] Fusion MPT SAS Host driver 3.04.20
[   24.411427] mptbase: ioc0: Initiating bringup
[   25.312352] ioc0: LSISAS1068 B0: Capabilities={Initiator}
[   40.090391] scsi host0: ioc0: LSISAS1068 B0, FwRev=01080400h, Ports=1, MaxQ=511, IRQ=16
[   40.219016] mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 0, phy 0, sas_addr 0x5000c5000cbc7cf5
[   40.358062] scsi 0:0:0:0: Direct-Access     SEAGATE  ST914602SSUN146G 0703 PQ: 0 ANSI: 5
[   40.478173] mptsas: ioc0: attaching ssp device: fw_channel 0, fw_id 4, phy 4, sas_addr 0x500000e0118969b2
[   40.617183] scsi 0:0:1:0: Direct-Access     FUJITSU  MAV2073RCSUN72G  0301 PQ: 0 ANSI: 4
[   40.733521] sd 0:0:0:0: [sda] 286739329 512-byte logical blocks: (147 GB/137 GiB)
[   40.736867] Fusion MPT misc device (ioctl) driver 3.04.20
[   40.842180] sd 0:0:0:0: [sda] Write Protect is off
[   40.918551] m

> Then I think it would be conclusive that the the problem is earlier and another bisect would probably be needed. I probably should have asked you to just go ahead and do that last time, but thought it would be easier to communicate properly and since you were already testing the patch that fixed it. Hopefully this is not putting you out too much.

I do not remember trying DEBUG_PAGEALLOC before on any sparcs (though I have had a
problem with thet on some strange old machine that might or might not have been a sparc).

To actually bisect it requires a known good kernel DEBUG_PAGEALLOC it worked.
Will try to find one - hopefully it is not in too distant past.

So the conclusion is that your patch just triggers a bug that is there even before
and DEBUG_PAGEALLOC hits the same bug? Myabe just DEBUG_PAGEALLOC is broken before, so
thet would make two independent bugs - how do we know it's the same bug?

-- 
Meelis Roos <mroos@linux.ee>
