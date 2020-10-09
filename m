Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A2F2899F7
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 22:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388554AbgJIUqa (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 16:46:30 -0400
Received: from mout.gmx.net ([212.227.17.20]:36921 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733041AbgJIUqa (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 9 Oct 2020 16:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602276387;
        bh=x0L+GKK6wjSw5mQH+nZUTJ7Y5VlDUwzyePyY/Dp3OGo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=kUPN7fqWXxdszXxL6AEmtMYiq1PDaeQ3j2I50R7w5qxCpCx4Dfk1ih7EntgyswlKY
         KLOnbjAcqbtxpj1PKk/4CJiT+2CadjsWIgnxbtiPWpnl7m9gJlyo7avgsKoRvFZ1VD
         1o/VlU/9dz2dIhBa+sWdoZWhsEKh5Yhj3VIsKd0U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Asus-X75A1.office.wrs-network.de ([92.116.56.173]) by
 mail.gmx.com (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N3se8-1kI16R28Js-00zmEj; Fri, 09 Oct 2020 22:46:27 +0200
Date:   Fri, 9 Oct 2020 22:46:29 +0200
From:   Wolf Ruediger Spielmann <RSpielmann@gmx.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     sparclinux@vger.kernel.org
Subject: Re: SMP is broken on sparc64 with kernel 4.x/5.x
Message-Id: <20201009224629.c4eb482d0d8f51e5e8097d4b@gmx.de>
In-Reply-To: <d4dc8448-fa89-6da7-e499-c4f18e6800fa@physik.fu-berlin.de>
References: <20201009161924.c8f031c079dd852941307870@gmx.de>
        <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
        <20201009164026.1c811fa50ae5f71551717fef@gmx.de>
        <d4dc8448-fa89-6da7-e499-c4f18e6800fa@physik.fu-berlin.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:St82j5BQoABc7iWu92Mkix9/HO6kD5sange8fpmlOM4OV4vQI4f
 IxcXjxDdR0QUtw/fUFhuELLIArdIrtr7RnRfUXPHFx+TFFyqwqcaxUBRGjClknmApGoDzZS
 C03s/fNlI5egddhK/+/NFAVJbMgjbjSE4zsCkl+I6wAYBSJki84+oUrlIsy5TmX+3amIz/u
 WvC8sKcCfRMB+ws86hIGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qSc02MhRIMg=:krBY6ohbd14SSEB5RriuhQ
 8CpNgFPV+VQtkv76iG6U/1tLGHyPBu9viINZiIXSIGpeGAOMowzgs3YexKj0XXstCzlzFj7Hv
 isr60O+OSErHpNyFbhEFxo/0gyqW8jLzNRTkimguvzVRwJu8sZueni1uvoXIqiJACtrP1GAT9
 SFRgMQ14usJZ3YOwclgbUYxxDVEyvvMZ+slDY9KTKsICIew/0kA9TI3f/LFnLxtRb7MqdxWiE
 ZH9r7u3C1NrMjnVHSutcVJ9e6227lCFEfKCa1/GA0iQY7PPUMjOBaSE8z+VH4PNzWFXVQpwk3
 KwDPbJWI+EXFzcrRUbQvivIsxpCjgiy6qsbcZ4hlAeMvnoIDppwyImfpsigFTlNfXA0QJ7vrT
 gVpu64g+qzPjskuVqx3YS1stOVM2HSz265TakAdgCmwcgl0XdAZfpjtjJJnaqTo23XW4kCQWE
 GOlVcfxyjHrmPmK+eSJ8+jOXP4/uT7Qv/g59r/6hDvZN694nOTm882lWbUOhEDUfi/RpgNxyY
 48Rk7jQ2jgBD+7Ju0qz+Iqjv0+0QoVrBnDLfWEVUUDzZAZp/kL1+a4ZiJU3Z8XfnR3Rwkbg17
 6Wa40gtxuMMPYnNvIckvWu7Lk5M9peMtIoVsJpgiMzh98tVPI07zVQkQRhaMyfPDN7ky4bHuU
 a/JeGWB0kccD7B0uLoaCNju1GbdSYnHUI1LeCFULY8BNV6ilel8rdGcFPgNRJSap+yG/UoNr1
 kwfTZYfgJVd/9Q72j/it3nPqDKTNQGx9ucDOSSrdL+Gu2Dul7CndfcmIZHeAYiE2Em9UsaPVy
 9bRTX9XZ94JsrFYNi9gQmvq4364oxd02dQlqJnJ/b8txr4aXnyEN02CwJLYSn9cDUQDSGfGFd
 cypvlrle4zfXWyS0KLFwnp5pkt+xgrBlGa40O0+buxqmJf8hsS5O91zIogGUxQjZSloqmr3XM
 H4H73qrFrimjtaZs0HbdxyNfvZE8WU29GD3CWa25a2vmMwTRkyV/bCkw+NbPPOX1095L5TpIM
 X8ogFF39LJ6sKz24ueiUn8e9zry4Nim5eexj0wYO6awEdM8s8cqNYZiOuZwDhFq7qQ+7Lo0IT
 193FXKYz1xCwnvxuJEI9bmbd3nixc/nn1PI2onmQnmxgGSZ/uAubEWK+Q6EGnM/MQc9xlebAx
 ED5g9RhAV8KQ3OodGTjWw2IjBGyuA3zhrL16p4PnbfWnjImpPc/ng818q0742z+Y8FSGyw8BQ
 X9sk/Y3bZ0eOHrXGJ
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Adrian,

On Fri, 9 Oct 2020 16:49:32 +0200
John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> > It's (in my opinion) pcpu-alloc:
> > kernel 4.x/5.x: pcpu-alloc: [0] 0 1=20
> > kernel 3.x: pcpu-alloc: [0] 0 2=20
>=20
> Interesting. I have not yet seen this issue on any of our Debian developm=
ent
> machines. What distribution are you running? Is this Gentoo?
>=20
> Our of curiosity, could you give it a go with Debian?
>=20
> > https://cdimage.debian.org/cdimage/ports/2020-08-19/debian-10.0.0-sparc=
64-NETINST-1.iso

OK - tested this ISO-image:
- boots to bootloader GRUB
- I chose two options ("expert install" and "rescue shell")
- SUN loads and boots kernel, but I never reach installer nor rescue shell
Boot-process stalls middle in nowhere and shows me a blinking cursor foreve=
r.

R=FCdiger
