Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEA1323BF9
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 13:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhBXMjY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 07:39:24 -0500
Received: from mout.web.de ([212.227.15.4]:49633 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232918AbhBXMjV (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 24 Feb 2021 07:39:21 -0500
X-Greylist: delayed 477 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Feb 2021 07:39:20 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1614170249;
        bh=qIwMOfJ93kdO+dJOeHVb1o8wU0lcnEd/KlGEPxeDEgs=;
        h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
        b=lnJ+jsWhYG6IcuAe+pBnwnmTPeaaK96UYwHc9SNNeYBSNxT1b0Qj3M5HFVtJ4usYR
         CWMx7tR8qzrUDxtLX5AyZPkGyyUNTr5DPK/VtXwUyU2SbMfV/zxbXO7EpFz1bBd5Vk
         tvzhiDWFFQ4C7fADe5oxbe8GdWblHeoS28GLTzb0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.36] ([217.247.33.56]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MVJRb-1lMH9l2EcB-00SLFE; Wed, 24
 Feb 2021 13:29:26 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
Date:   Wed, 24 Feb 2021 13:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gbpZ2h0XhoPQanFY/wG/8GnsqiYu8YdM/fmV7lU07RuXDpSWSPD
 yeq4YoOd/4vxEtbbEUESeycgITfzIt8KC9MWvlQOQ9FQSvKiOqPYvM7gMaHZRKFJfTFHKAY
 PlEUuI2piPGeoqMezAaoEqPZjDNDtuXtZYlmAW4o5+d2PYRo/x6d3wEqLHjslFDU2e6JxUa
 jgX1foqXrwaJ6SmsriOsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P+ijE1q8PxY=:8BPkFr28b5gemhiDPwVfiY
 geYDDgNBLvnqqXVOdk8HJITG/Te9P+azqm8D+TFc92EP3BR/me9aTJuswn3QUdZgh0P44fKG4
 qu3Uebvax9FoPLrRw/cfSqH2f9jCqZ57jUP3jlRqhFBO2BCiBO7BmMgtf5FeRhY/nQWtI6+/0
 HvKi0ZCp/fnDCo/Ma5XidkVNUOsCnq8LmqbM78J0QPeNop12K2d8C/DTYYtv5wm/ypTN0PBrB
 U+A2Od6PyKDklrz36NVoSQo+itmkT6eJmlBZwK0zYnm3oU6p6zW9uf5DTnEDrz8hZMd1ShuLL
 yYx7iROSk1l1UyKBBQuYp+0I4h831xdMbZPKip1HL6GWku5Dt6Jbdvjv9oeI96y4Mu9eD7FG2
 BNGhXtKWiVCEQeu3WhLmmQBu3oNNFYOevcSF9L1VoyGqrmYfH5bFP9jPtLCfZtFodWVuPgeEK
 /pTcxWKrHcVUHiV2z23p8eyxi1HOU79p1bm0bte8DQ6a2FIZQcGDyeJxZXYcYLvqe7hcg45gQ
 jVNmXvFTGUPLti4HspBJbdYExhSI66ptZhrH2TuV1RqqGEHMAReXZYqvFErSw2yAATXWxkw4s
 9lcSiUtIW8+dTMrE1sruf0eZha9/UbwZCKTwrcLKqblcCQLufs5B39d4K2OIBwbPwczDlg5fg
 hGBH70Hku+119+60u2dyZAvc+lLqraqSNdD3uQGDmLfdO6wqBQ1ue1nz8zKXXAoW78bA7EcQo
 BK39bKJErh6+wJb5vk0ZdTAT/e4+NQ/CyaB1o25xaUkrSTxWiuNHgJIH0YWQZCjzUnCEiCG3q
 gIukc252EPlAXoPWQgtw0TOBaf6IbEStuos+nMbFXzjEV2ObmlleK1oUCfdZs2tJGNCRh/+HT
 PahJ4oaKnrPn1jGOlLHrtxDj5+hbUv87TNl8z5pGhEZtcqc8h+K9eBE/yDsbVyn5Sie1tw2q8
 jx4dPJiqD7obm/QCMfXMLxOgPpKT6+N2Iu1MxUYoPO3ARSLXlavR1
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Mark,

On 24.02.21 12:14, Mark Cave-Ayland wrote:
> [...]
> I then asked them to work backwards through a collection of historical
> debian-ports ISOs that I own until we found one that would boot. The
> results were as follows:
>
>
> debian-10.0.0-sparc64-NETINST-1.iso (kernel 5.9.0-1-sparc64, grub) - FAI=
LS
> debian-9.0-sparc64-NETINST-1.iso (kernel 4.14.0-3-sparc64, SILO) - FAILS
> debian-7.7.0-sparc-netinst.iso (kernel 3.2.0-4-sparc64, SILO) - FAILS
> debian-6.0.4-sparc-netinst.iso (kernel 2.6.32-5-sparc64, SILO) - WORKS
>
>
> Having eliminated the change of bootloader from SILO to grub as the
> problem, it really seems as if something in the kernel broke booting on
> a U450 between versions 2.6.32 and 3.2.0. I should add that these ISOs
> all boot fine under qemu-system-sparc64 which is a U5 machine, so the
> newer kernels are not completely broken.

I have checked my logs and (probably) the last time I used my Ultra
Enterprise 450 - 2018-04-21 - it was running a kernel v4.15.4:

```
root@e450:~# uname -a
Linux e450 4.15.0-1-sparc64-smp #1 SMP Debian 4.15.4-1 (2018-02-18)
sparc64 GNU/Linux
```

...successfully (incl. `openssl`, `7za` and STREAM benchmarks for half
an hour or so). And according to my netboot configuration it was booted
with GRUB - from the "[...]2.02+dfsg1-3" package. Looks like I didn't
test with any later GRUB version/package.

 From my experience, US II (and derived versions like IIi and IIe)
is/was still working well at that time, though US III and IIIi sometimes
had problems, though not sure if that is due to the processor or the
other components on the respective system boards.

> Do people still run newer kernels on older hardware? If there is
> interest, I may be able to get some more diagnostic information. In
> particular I'd be curious to know if Oracle do any routine testing of
> newer kernels on machines such as the U450 and whether anyone there can
> reproduce the problem.

I did run "newer" (to that time) kernels on older hardware, with the one
from the 4.19.0-5 versioned limux-image package being the latest one
used according to my configuration. But I don't have a log of this one
with US II or IIIi. I have logged crashes with that on v480 and v490 thoug=
h.

I have a successful log of a 280R with two US IIIs running a kernel v4.16.=
5:

```
root@280r:~# uname -a
Linux 280r 4.16.0-1-sparc64-smp #1 SMP Debian 4.16.5-1 (2018-04-29)
sparc64 GNU/Linux
```

...together with the benchmarks I mentioned earlier. This one was also
netbooted with GRUB, but at that time from the "[...]2.02+dfsg1-4" package=
.

Cheers,
Frank
