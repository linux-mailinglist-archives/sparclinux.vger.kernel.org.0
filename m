Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DFD323BAE
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 12:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbhBXL4N (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 06:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235222AbhBXLza (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 24 Feb 2021 06:55:30 -0500
X-Greylist: delayed 2409 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 24 Feb 2021 03:54:50 PST
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E436C061574
        for <sparclinux@vger.kernel.org>; Wed, 24 Feb 2021 03:54:50 -0800 (PST)
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98] helo=[192.168.1.110])
        by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <mark.cave-ayland@ilande.co.uk>)
        id 1lEs7q-00014L-F2; Wed, 24 Feb 2021 11:14:38 +0000
To:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
From:   Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
Date:   Wed, 24 Feb 2021 11:14:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Subject: Newer kernels fail to boot on a U450?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi all,

I've recently had to help a client rescue a U450 and so I asked them to burn the 
latest debian ports ISO (thank you Adrian!) to boot into a rescue shell.

Unfortunately the kernel is unable to boot: grub loads the kernel and initrd into 
memory but then immediately displays a "Divide by zero" error and hangs. This is 
before any kernel dmesg output is displayed on the console and from the style of the 
message I'm fairly sure that the error message is coming from the PROM.

I then asked them to work backwards through a collection of historical debian-ports 
ISOs that I own until we found one that would boot. The results were as follows:


debian-10.0.0-sparc64-NETINST-1.iso (kernel 5.9.0-1-sparc64, grub) - FAILS
debian-9.0-sparc64-NETINST-1.iso (kernel 4.14.0-3-sparc64, SILO) - FAILS
debian-7.7.0-sparc-netinst.iso (kernel 3.2.0-4-sparc64, SILO) - FAILS
debian-6.0.4-sparc-netinst.iso (kernel 2.6.32-5-sparc64, SILO) - WORKS


Having eliminated the change of bootloader from SILO to grub as the problem, it 
really seems as if something in the kernel broke booting on a U450 between versions 
2.6.32 and 3.2.0. I should add that these ISOs all boot fine under 
qemu-system-sparc64 which is a U5 machine, so the newer kernels are not completely 
broken.

Do people still run newer kernels on older hardware? If there is interest, I may be 
able to get some more diagnostic information. In particular I'd be curious to know if 
Oracle do any routine testing of newer kernels on machines such as the U450 and 
whether anyone there can reproduce the problem.


ATB,

Mark.
