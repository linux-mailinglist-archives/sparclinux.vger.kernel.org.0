Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFFB32741D
	for <lists+sparclinux@lfdr.de>; Sun, 28 Feb 2021 20:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhB1T3k (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 28 Feb 2021 14:29:40 -0500
Received: from mout.web.de ([212.227.17.12]:37539 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231491AbhB1T3i (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sun, 28 Feb 2021 14:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1614540463;
        bh=iwLSokE7Z8UAVP0/iFHw0k3G77ZoLKeSmJGJoBy31CY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=E3eG4qwfRFX5X2UTnLeTe2OXkYplQ8JsMh4iqVQKe9WZ9akwd0fEG+fp2fztWju/Y
         Ar4byRp08mIopW1txGSg1+uMMj5VYlMWdk6sZHKptR79mwsM/knk4dGrxPskQsS0vF
         l5PfzNrJMNddTupcI1pY9iP//aFg8n+n7wXDuxSI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.36] ([84.152.241.243]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LgYOH-1ld6xW15qH-00nxyN; Sun, 28
 Feb 2021 20:27:43 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
 <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <6703292d-6cc3-0de3-8300-0f6a0242cac7@web.de>
Date:   Sun, 28 Feb 2021 20:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4htSqWGBXEI8j6ls7itSWLG2ZyOOEfWcDpsYZS633YweRAgkjVo
 A7BM2bOeiCBBCpLh0VtMNC42eT6phEQb2czkBEd51/pGHhU5laIA3PXSrOo8p2uJHk1mBFs
 +66LkZTo3BFap9OS+qRnuAl5Mtssi+jseCr9Jsrt9yhaRGiFK1We1wM3LU+JVx+owtkMCe1
 n3MtjmVc7R29kqSNrmJGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RAVn9vrgNkg=:kaqO+5GERDOnGDMXOBTIrp
 30Q+UyGAja0+mJx9X/txnSzw+N2fsqoMeHqWlp9agj8e6w7uEVGg3qthAWNccq+kje/oJO5cR
 QIZYCXexhj0lMDBepTrjT6dAY7iw/AE6BI1S74d3GPwkK8lY7XMtQvHyI8RKd13DQygrEnpll
 6R10a1esdWBvCY8gIzi8qD+gf8tya8stzsTsoBBzgfp+Fx4sSzR3q6/NmPQENZ7c8Y8rTuKbT
 /ekfpDXMOKfUSckZtZD2ScBDtU+Ck+OpKwWJ57DqIdql91oPScPzgtXpsHVf55skn8oO3yz+L
 Wq8JRRRxsilWkdAnWL2n9iwt2+yzNc4JC6ToG3/klya6usLLXuIR+xc+gAVD/rAEFofFK3o6I
 ljf+5/Jr4ZqsEPHZvEc8RcTP/edQ++7XUnEuybWVhyg5ccFQN4Q83FgegxoOHJTp2LOQQ/wd0
 nzkc5fAkPVe8afNtdCqOfawjhyWP7jfW1Aw/0U+0nnbpr0df6J4AEpXCFQiyyYc3Q7IO4q9+D
 I8z4X+hCGe52lnLoPUFkNu9KabAI7Xf50ijvcO1He1w24bk4GS53yHin64WIkknPGbz0mLU/U
 GSHGbrIxMhXLm2QHUFIuLUe87pFjHIBWYIIvY84q2gz5FBy3kV72zO9NFL+6ewR3nWE80adve
 Hqt7Vl5x4PX17s4ElnHAuXaR+LK5I81m2ghhY1pGBNDbOQY/4jHXJ7OP0aTc0xolNITOgz6Ys
 jMz/svnB+EWykjWS9unOrpuGvjuAPNqYPrXRBtajckT72a+0qTSDfNZI5ue5MYURVHOC/+v/T
 X1U5D1VNSQfBNKCPFMqN7i8mef+7/gwkhLaLQtZBJtWVQbEaKEw/JY+O2xojSuWzhINbsNRB0
 ak388Hl9jxgnvIIHeE3A==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Mark,

On 24.02.21 14:01, Mark Cave-Ayland wrote:
> On 24/02/2021 12:29, Frank Scheiner wrote:
>> On 24.02.21 12:14, Mark Cave-Ayland wrote:
> Next time you have the U450 fired up, I'd be interested to find out if
> it is possible to boot directly from the latest debian ports CDROM for
> comparison.

So I fetched her from (cold) storage this morning and let her warm up in
the morning sun. When ready I booted with the latest image I did find
yesterday evening ([1]) and...

[1]:
https://cdimage.debian.org/cdimage/ports/snapshots/2021-02-02/debian-10.0.=
0-sparc64-NETINST-1.iso

...it worked through until the first screen of the rescue mode is shown.
No crashes, no nothing.

Here is the start of the syslog - I didn't have any storage at hand so
copied it from screen directly:

```
Feb 28 10:21:24 syslogd started: BusyBox v1.30.1
Feb 28 10:21:24 kernel: klogd started: BusyBox v1.30.1 (Debian 1:1.30.1-4)
Feb 28 10:21:24 kernel: [    0.000145] PROMLIB: Sun IEEE Boot Prom 'OBP
3.30.0 2003/11/11 10:41'
Feb 28 10:21:24 kernel: [    0.000232] PROMLIB: Root node compatible: sun4=
u
Feb 28 10:21:24 kernel: [    0.000527] Linux version 5.10.0-3-sparc64
(debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1
20210110, GNU ld (GNU Binutils for Debian) 2.35.1) #1 Debian 5.10.12-1
(2021-01-30)
Feb 28 10:21:24 kernel: [    0.000721] Unknown boot switch (--)
Feb 28 10:21:24 kernel: [    0.000730] Unknown boot switch (--)
Feb 28 10:21:24 kernel: [    0.000905] printk: bootconsole [earlyprom0]
enabled
Feb 28 10:21:24 kernel: [    0.000914] ARCH: SUN4U
Feb 28 10:21:24 kernel: [    0.001033] Ethernet address: 08:00:20:a7:5e:0a
Feb 28 10:21:24 kernel: [    0.001073] MM: PAGE_OFFSET is
0xfffff80000000000 (max_phys_bits =3D=3D 40)
Feb 28 10:21:24 kernel: [    0.001084] MM: VMALLOC [0x0000000100000000
=2D-> 0x0000060000000000]
Feb 28 10:21:24 kernel: [    0.001095] MM: VMEMMAP [0x0000060000000000
=2D-> 0x00000c0000000000]
Feb 28 10:21:24 kernel: [    0.005132] Kernel: Using 4 locked TLB
entries for main kernel image.
Feb 28 10:21:24 kernel: [    0.005189] Remapping the kernel...
Feb 28 10:21:24 kernel: [    0.052850] done.
Feb 28 10:21:24 kernel: [    1.098314] OF stdout device is:
/pci@1f,4000/ebus@1/



        /se@14,400000:a
Feb 28 10:21:24 kernel: [    1.098327] PROM: Built device tree with
139414 bytes of memory.
Feb 28 10:21:24 kernel: [    1.098734] Top of RAM: 0xffea2000, Total
RAM: 0xffe96000
Feb 28 10:21:24 kernel: [    1.098744] Memory hole size: 0MB
Feb 28 10:21:24 kernel: [    1.124511] Allocated 16384 bytes for kernel
page tables.
Feb 28 10:21:24 kernel: [    1.124575] Zone ranges:
Feb 28 10:21:24 kernel: [    1.124586]   Normal   [mem
0x0000000000000000-0x00000000ffea1fff]
Feb 28 10:21:24 kernel: [    1.124608] Movable zone start for each node
Feb 28 10:21:24 kernel: [    1.124616] Early memory node ranges
Feb 28 10:21:24 kernel: [    1.124628]   node   0: [mem
0x0000000000000000-0x00000000ffdfdfff]
Feb 28 10:21:24 kernel: [    1.124644]   node   0: [mem
0x00000000ffe00000-0x00000000ffe81fff]
Feb 28 10:21:24 kernel: [    1.124656]   node   0: [mem
0x00000000ffe8c000-0x00000000ffea1fff]
Feb 28 10:21:24 kernel: [    1.124746] Zeroed struct page in unavailable
ranges: 181 pages
Feb 28 10:21:24 kernel: [    1.124760] Initmem setup node 0 [mem
0x0000000000000000-0x00000000ffea1fff]
Feb 28 10:21:24 kernel: [    1.124777] On node 0 totalpages: 524107
Feb 28 10:21:24 kernel: [    1.124790]   Normal zone: 4607 pages used
for memmap
Feb 28 10:21:24 kernel: [    1.124801]   Normal zone: 0 pages reserved
Feb 28 10:21:24 kernel: [    1.124814]   Normal zone: 524107 pages, LIFO
batch:31

         Feb 28 10:21:24 kernel: [    1.289565] Booting
  Linux...
Feb 28 10:21:24 kernel: [    1.289591] CPU CAPS:
[flush,stbar,swap,muldiv,v9,mul32,div32,v8plus]
Feb 28 10:21:24 kernel: [    1.289674] CPU CAPS: [vis]
Feb 28 10:21:24 kernel: [    1.302223] pcpu-alloc: s0 r0 d32768 u32768
alloc=3D1*32768
Feb 28 10:21:24 kernel: [    1.302239] pcpu-alloc: [0] 0
Feb 28 10:21:24 kernel: [    1.308282] Built 1 zonelists, mobility
grouping on.  Total pages: 519500
Feb 28 10:21:24 kernel: [    1.308299] Kernel command line:
BOOT_IMAGE=3D/install/vmlinux rescue/enable=3Dtrue --- quiet
Feb 28 10:21:24 kernel: [    1.333950] Dentry cache hash table entries:
524288 (order: 9, 4194304 bytes, linear)
Feb 28 10:21:24 kernel: [    1.343863] Inode-cache hash table entries:
262144 (order: 8, 2097152 bytes, linear)
Feb 28 10:21:24 kernel: [    1.343878] Sorting __ex_table...
Feb 28 10:21:24 kernel: [    1.346444] mem auto-init: stack:off, heap
alloc:on, heap free:off
Feb 28 10:21:24 kernel: [    1.531560] Memory: 4114688K/4192856K
available (8081K kernel code, 1417K rwdata, 2152K rodata, 496K init,
405K bss, 78168K reserved,                                             ,
0K cma-reserved)
[...]
```

For referenced my machine has four US II running at 400 MHz and 16 x 256
MiB memory modules installed:

```
~ # cat /proc/cpuinfo
cpu             : TI UltraSparc II  (BlackBird)
fpu             : UltraSparc II integrated FPU
pmu             : ultra12
prom            : OBP 3.30.0 2003/11/11 10:41
type            : sun4u
ncpus probed    : 4
ncpus active    : 1
D$ parity tl1   : 0
I$ parity tl1   : 0
Cpu0ClkTck      : 0000000017d78400
cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
MMU Type        : Spitfire
MMU PGSZs       : 8K,64K,512K,4MB
```

...and there also was a graphics card installed, but I used the machine
via serial console.

I can't say where our two machines differ (maybe OBP version?), but it
could be interesting to see, if your client's machine can boot
successfully from a Solaris 10 CDROM. Maybe even before trying that, I
would run the whole hardware with the diag key position enabled and log
and follow that output via the serial console. Maybe some memory modules
need re-seating or are defective or something is wrong with the
processors - though I never saw something like the latter within all the
various US II powered machines I own. In addition I remember that not
all processor modules were recommended or maybe compatible with all
machines they could be fitted in. So it could be an idea to also check
that (i.e. the `501-[...]` number and what's recommended in a Sun System
Handbook).

Cheers,
Frank
