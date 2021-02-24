Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB73F323F86
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 16:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBXOHT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 09:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbhBXNCS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 24 Feb 2021 08:02:18 -0500
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D46C061574
        for <sparclinux@vger.kernel.org>; Wed, 24 Feb 2021 05:01:37 -0800 (PST)
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98] helo=[192.168.1.110])
        by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <mark.cave-ayland@ilande.co.uk>)
        id 1lEtnK-0001hm-Pg; Wed, 24 Feb 2021 13:01:35 +0000
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
From:   Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
Date:   Wed, 24 Feb 2021 13:01:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: Newer kernels fail to boot on a U450?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 24/02/2021 12:29, Frank Scheiner wrote:

> Hi Mark,
> 
> On 24.02.21 12:14, Mark Cave-Ayland wrote:
>> [...]
>> I then asked them to work backwards through a collection of historical
>> debian-ports ISOs that I own until we found one that would boot. The
>> results were as follows:
>>
>>
>> debian-10.0.0-sparc64-NETINST-1.iso (kernel 5.9.0-1-sparc64, grub) - FAILS
>> debian-9.0-sparc64-NETINST-1.iso (kernel 4.14.0-3-sparc64, SILO) - FAILS
>> debian-7.7.0-sparc-netinst.iso (kernel 3.2.0-4-sparc64, SILO) - FAILS
>> debian-6.0.4-sparc-netinst.iso (kernel 2.6.32-5-sparc64, SILO) - WORKS
>>
>>
>> Having eliminated the change of bootloader from SILO to grub as the
>> problem, it really seems as if something in the kernel broke booting on
>> a U450 between versions 2.6.32 and 3.2.0. I should add that these ISOs
>> all boot fine under qemu-system-sparc64 which is a U5 machine, so the
>> newer kernels are not completely broken.
> 
> I have checked my logs and (probably) the last time I used my Ultra
> Enterprise 450 - 2018-04-21 - it was running a kernel v4.15.4:
> 
> ```
> root@e450:~# uname -a
> Linux e450 4.15.0-1-sparc64-smp #1 SMP Debian 4.15.4-1 (2018-02-18)
> sparc64 GNU/Linux
> ```
> 
> ...successfully (incl. `openssl`, `7za` and STREAM benchmarks for half
> an hour or so). And according to my netboot configuration it was booted
> with GRUB - from the "[...]2.02+dfsg1-3" package. Looks like I didn't
> test with any later GRUB version/package.
> 
>  From my experience, US II (and derived versions like IIi and IIe)
> is/was still working well at that time, though US III and IIIi sometimes
> had problems, though not sure if that is due to the processor or the
> other components on the respective system boards.

Hi Frank,

Thanks for the information! Do you have a display on your U450 at all? The U450 we 
were trying to rescue was headless (i.e. connect via serial only) so the only 
differences I can see might either be the display or the fact that the boot was 
occurring from the CDROM rather than a local disk installation.

Next time you have the U450 fired up, I'd be interested to find out if it is possible 
to boot directly from the latest debian ports CDROM for comparison.


ATB,

Mark.
