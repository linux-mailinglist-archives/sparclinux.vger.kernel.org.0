Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472CC32B1B0
	for <lists+sparclinux@lfdr.de>; Wed,  3 Mar 2021 04:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhCCC26 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Mar 2021 21:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376676AbhCBHsz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Mar 2021 02:48:55 -0500
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBF9C06178C
        for <sparclinux@vger.kernel.org>; Mon,  1 Mar 2021 23:48:12 -0800 (PST)
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47] helo=[192.168.1.65])
        by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <mark.cave-ayland@ilande.co.uk>)
        id 1lGzlK-0005L0-2f; Tue, 02 Mar 2021 07:48:10 +0000
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
 <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
 <6703292d-6cc3-0de3-8300-0f6a0242cac7@web.de>
From:   Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ff3bfc6e-1af3-e825-fd6d-fa3fe610613a@ilande.co.uk>
Date:   Tue, 2 Mar 2021 07:48:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6703292d-6cc3-0de3-8300-0f6a0242cac7@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
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

On 28/02/2021 19:27, Frank Scheiner wrote:

> Hi Mark,
> 
> On 24.02.21 14:01, Mark Cave-Ayland wrote:
>> On 24/02/2021 12:29, Frank Scheiner wrote:
>>> On 24.02.21 12:14, Mark Cave-Ayland wrote:
>> Next time you have the U450 fired up, I'd be interested to find out if
>> it is possible to boot directly from the latest debian ports CDROM for
>> comparison.
> 
> So I fetched her from (cold) storage this morning and let her warm up in
> the morning sun. When ready I booted with the latest image I did find
> yesterday evening ([1]) and...
> 
> [1]:
> https://cdimage.debian.org/cdimage/ports/snapshots/2021-02-02/debian-10.0.0-sparc64-NETINST-1.iso 
> 
> 
> ...it worked through until the first screen of the rescue mode is shown.
> No crashes, no nothing.
> 
> Here is the start of the syslog - I didn't have any storage at hand so
> copied it from screen directly:
> 
> ```
> Feb 28 10:21:24 syslogd started: BusyBox v1.30.1
> Feb 28 10:21:24 kernel: klogd started: BusyBox v1.30.1 (Debian 1:1.30.1-4)
> Feb 28 10:21:24 kernel: [    0.000145] PROMLIB: Sun IEEE Boot Prom 'OBP
> 3.30.0 2003/11/11 10:41'
> Feb 28 10:21:24 kernel: [    0.000232] PROMLIB: Root node compatible: sun4u
> Feb 28 10:21:24 kernel: [    0.000527] Linux version 5.10.0-3-sparc64
> (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1
> 20210110, GNU ld (GNU Binutils for Debian) 2.35.1) #1 Debian 5.10.12-1
> (2021-01-30)
> Feb 28 10:21:24 kernel: [    0.000721] Unknown boot switch (--)
> Feb 28 10:21:24 kernel: [    0.000730] Unknown boot switch (--)
> Feb 28 10:21:24 kernel: [    0.000905] printk: bootconsole [earlyprom0]
> enabled
> Feb 28 10:21:24 kernel: [    0.000914] ARCH: SUN4U
> Feb 28 10:21:24 kernel: [    0.001033] Ethernet address: 08:00:20:a7:5e:0a
> Feb 28 10:21:24 kernel: [    0.001073] MM: PAGE_OFFSET is
> 0xfffff80000000000 (max_phys_bits == 40)
> Feb 28 10:21:24 kernel: [    0.001084] MM: VMALLOC [0x0000000100000000
> --> 0x0000060000000000]
> Feb 28 10:21:24 kernel: [    0.001095] MM: VMEMMAP [0x0000060000000000
> --> 0x00000c0000000000]
> Feb 28 10:21:24 kernel: [    0.005132] Kernel: Using 4 locked TLB
> entries for main kernel image.
> Feb 28 10:21:24 kernel: [    0.005189] Remapping the kernel...
> Feb 28 10:21:24 kernel: [    0.052850] done.
> Feb 28 10:21:24 kernel: [    1.098314] OF stdout device is:
> /pci@1f,4000/ebus@1/
> 
> 
> 
>         /se@14,400000:a
> Feb 28 10:21:24 kernel: [    1.098327] PROM: Built device tree with
> 139414 bytes of memory.
> Feb 28 10:21:24 kernel: [    1.098734] Top of RAM: 0xffea2000, Total
> RAM: 0xffe96000
> Feb 28 10:21:24 kernel: [    1.098744] Memory hole size: 0MB
> Feb 28 10:21:24 kernel: [    1.124511] Allocated 16384 bytes for kernel
> page tables.
> Feb 28 10:21:24 kernel: [    1.124575] Zone ranges:
> Feb 28 10:21:24 kernel: [    1.124586]   Normal   [mem
> 0x0000000000000000-0x00000000ffea1fff]
> Feb 28 10:21:24 kernel: [    1.124608] Movable zone start for each node
> Feb 28 10:21:24 kernel: [    1.124616] Early memory node ranges
> Feb 28 10:21:24 kernel: [    1.124628]   node   0: [mem
> 0x0000000000000000-0x00000000ffdfdfff]
> Feb 28 10:21:24 kernel: [    1.124644]   node   0: [mem
> 0x00000000ffe00000-0x00000000ffe81fff]
> Feb 28 10:21:24 kernel: [    1.124656]   node   0: [mem
> 0x00000000ffe8c000-0x00000000ffea1fff]
> Feb 28 10:21:24 kernel: [    1.124746] Zeroed struct page in unavailable
> ranges: 181 pages
> Feb 28 10:21:24 kernel: [    1.124760] Initmem setup node 0 [mem
> 0x0000000000000000-0x00000000ffea1fff]
> Feb 28 10:21:24 kernel: [    1.124777] On node 0 totalpages: 524107
> Feb 28 10:21:24 kernel: [    1.124790]   Normal zone: 4607 pages used
> for memmap
> Feb 28 10:21:24 kernel: [    1.124801]   Normal zone: 0 pages reserved
> Feb 28 10:21:24 kernel: [    1.124814]   Normal zone: 524107 pages, LIFO
> batch:31
> 
>          Feb 28 10:21:24 kernel: [    1.289565] Booting
>   Linux...
> Feb 28 10:21:24 kernel: [    1.289591] CPU CAPS:
> [flush,stbar,swap,muldiv,v9,mul32,div32,v8plus]
> Feb 28 10:21:24 kernel: [    1.289674] CPU CAPS: [vis]
> Feb 28 10:21:24 kernel: [    1.302223] pcpu-alloc: s0 r0 d32768 u32768
> alloc=1*32768
> Feb 28 10:21:24 kernel: [    1.302239] pcpu-alloc: [0] 0
> Feb 28 10:21:24 kernel: [    1.308282] Built 1 zonelists, mobility
> grouping on.  Total pages: 519500
> Feb 28 10:21:24 kernel: [    1.308299] Kernel command line:
> BOOT_IMAGE=/install/vmlinux rescue/enable=true --- quiet
> Feb 28 10:21:24 kernel: [    1.333950] Dentry cache hash table entries:
> 524288 (order: 9, 4194304 bytes, linear)
> Feb 28 10:21:24 kernel: [    1.343863] Inode-cache hash table entries:
> 262144 (order: 8, 2097152 bytes, linear)
> Feb 28 10:21:24 kernel: [    1.343878] Sorting __ex_table...
> Feb 28 10:21:24 kernel: [    1.346444] mem auto-init: stack:off, heap
> alloc:on, heap free:off
> Feb 28 10:21:24 kernel: [    1.531560] Memory: 4114688K/4192856K
> available (8081K kernel code, 1417K rwdata, 2152K rodata, 496K init,
> 405K bss, 78168K reserved,                                             ,
> 0K cma-reserved)
> [...]
> ```
> 
> For referenced my machine has four US II running at 400 MHz and 16 x 256
> MiB memory modules installed:
> 
> ```
> ~ # cat /proc/cpuinfo
> cpu             : TI UltraSparc II  (BlackBird)
> fpu             : UltraSparc II integrated FPU
> pmu             : ultra12
> prom            : OBP 3.30.0 2003/11/11 10:41
> type            : sun4u
> ncpus probed    : 4
> ncpus active    : 1
> D$ parity tl1   : 0
> I$ parity tl1   : 0
> Cpu0ClkTck      : 0000000017d78400
> cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
> MMU Type        : Spitfire
> MMU PGSZs       : 8K,64K,512K,4MB
> ```
> 
> ...and there also was a graphics card installed, but I used the machine
> via serial console.
> 
> I can't say where our two machines differ (maybe OBP version?), but it
> could be interesting to see, if your client's machine can boot
> successfully from a Solaris 10 CDROM. Maybe even before trying that, I
> would run the whole hardware with the diag key position enabled and log
> and follow that output via the serial console. Maybe some memory modules
> need re-seating or are defective or something is wrong with the
> processors - though I never saw something like the latter within all the
> various US II powered machines I own. In addition I remember that not
> all processor modules were recommended or maybe compatible with all
> machines they could be fitted in. So it could be an idea to also check
> that (i.e. the `501-[...]` number and what's recommended in a Sun System
> Handbook).

Hi Frank,

Thanks so much for testing this and your comments above re: the U450. I passed on 
your queries and have had some more information back about the hardware:

- The CDROM is known to be working fine (the machine is used to test product installers)

- The U450 spends most of its time running Solaris 7 (there is no recent memory test, 
but it is stable in day-to-day use)

- The U450 has 2 UII CPUs and 256Mb RAM

I also confirmed that the ISO used for the first rescue attempt was a slightly 
different one than the one you linked to above: it used the "current" ISO at 
https://cdimage.debian.org/cdimage/ports/current/debian-10.0.0-sparc64-NETINST-1.iso 
rather than the "snapshot" ISO, but I can't see this would make a difference here.

So I must admit I'm scratching my head a little bit here. I remember a while back 
that the minimum amount of RAM required to boot the debian ISOs in 
qemu-system-sparc64 jumped from 128Mb to 256Mb so I'm wondering if something similar 
has happened here i.e. due to alignment changes the minimum RAM requirement for the 
debian ISOs on real U450 hardware has increased from 256Mb to 512Mb?

I did ask if there was an extra 256Mb SIMM available to test this theory, but 
unfortunately there isn't :(


ATB,

Mark.
