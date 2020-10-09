Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF36288D4D
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 17:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389252AbgJIPuF (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 11:50:05 -0400
Received: from mout.gmx.net ([212.227.15.19]:53717 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388745AbgJIPuF (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 9 Oct 2020 11:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602258602;
        bh=3q0pm2KRlmg8Vmj316H8B1IkLVwOYcAPHa+3U48G1i8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=ZysCZAf7EmmBJ2sw+zOI0Xs7XCvdvun0busGrlV2+oca/5srjwTA8ispHN9n/RsEe
         CnI2q1q03w6byAytoMjsK46mN7Z0JYtgBruXIo/Uc6wmvx2oh9pvOR5CC8w1OdUQrq
         v88C8a26FSkwKfQS7dPcQON8u+ZYcYnaEAAZTJFE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from dpc-001.office.wrs-network.de ([92.116.56.173]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MZkpR-1kxkc90YOV-00WoQ2; Fri, 09 Oct 2020 17:50:02 +0200
Date:   Fri, 9 Oct 2020 17:50:07 +0200
From:   Wolf Ruediger Spielmann <RSpielmann@gmx.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     sparclinux@vger.kernel.org
Subject: Re: SMP is broken on sparc64 with kernel 4.x/5.x
Message-Id: <20201009175007.bb89773b656cf944cf90937f@gmx.de>
In-Reply-To: <d4dc8448-fa89-6da7-e499-c4f18e6800fa@physik.fu-berlin.de>
References: <20201009161924.c8f031c079dd852941307870@gmx.de>
        <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
        <20201009164026.1c811fa50ae5f71551717fef@gmx.de>
        <d4dc8448-fa89-6da7-e499-c4f18e6800fa@physik.fu-berlin.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wpN/jqUwryGEA7Umcoyi29BbQ+VKSCRIGytGmxGEzhIfBponjSv
 dF7rz4GCJ2weejTnnR+Yw+oS/EezgNHWi8Yr6b0HFpO0XERR5PbG44L7mmN/ntJ0tEXEOy8
 ck8CqOmF65aiySJhQGXtNckDeUaFJS6T8Xs64ICQvzxd9elsiMzBzmXzfZl2hjAStMywhoF
 K5mo9ZDiwC6JxQoFxdhFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RMvUY8wxpaM=:qzJVLTXjMc7eC5fRPhdAm1
 7NukoMzqDENaSEuZ7gnfaHc+Is2zJCefCuUUDHjnoFEddxVgJCqTPikEv0kvZnPQbp1eI2F+7
 pSs95zOJzi4VguqfX9fkxPwYg4Amfp3BVDYpKlUEt5e+e49My9X53jZWZZrzkS8PU/XJbSbNA
 06FJ9y3fdQ4vFqMG8ZMFA0RHCJ94S/9rWLyJnhZB48ARg1mdvQO3h4wRVAPu7ueQ+qFxR+05b
 ZxZ80LU7iDhQ8pCBDbHLiqT5uV9Sfe3c1/+dvqTFe/rqF1aV2bLUqrcXCQW80VBgaYPEe7t98
 a9RkT/7EoB6Q+1CZHxox6SjApuLUl3NQlWmOR8ki989kz6UCFJ1Zv9rSoODlHWo6yj8YwVBLZ
 ZGbCJr8HXSi6a7i3Vem9tNdjGsFluOBUJdE5T1kTZ+hnzdJOUcx/YM0qLn7z5BcaILwNtO+fN
 VymGZQ5CZMss36/e6ZXPB2dnCjtu6bZFe6cfOGnlQnWuhDLSzJZRA+qBcX0vs5y4eEhLLURge
 z1bkGsUY+NrFChv6hcwUK9GVBH7iP+X8GOxUyKB2PYeDRIvNIf5zIF9Ia7pDOHNVcZcfrOlxB
 Qg9mMvtPPiQ0aqM8bHwhhFzXDDE8IVNAZTPWOBp9a4ma7BZ6bzgLbSs1teAlBETjuGK0C8aKM
 7G5wzVWSjpxMf5Jp81pDsxNJU7BPymSZXoeTLdEyVOMat1ebi/ftPA+UCkLnESV4nvf/xk6iY
 HPX9L7FPLWMvd/gxoslJVA8fM3muDiMxrmvTMVbJV97EAoNAQN67dDDDDkmFNCd7/Ax8JVVk3
 0Azc/1cekqDYtzEgFgnFyqBSozBwik8IVngZ5/81F/lSHWlkv3hQSuiUmZGiW2OwPtPaHE/Ph
 QvCCmdA4UN3up/T/hgJ9fXbndxAotCvnaKcVdH0s+4uf7KkPlPf4Jw+69trxTTbz+hVGOoy/+
 +4Ita5nwzQ9BIuAd1dgI5HnsmzHv3VLXJBU4HNLXfh1HdVRmSJqHsbrrg96Sj7nHbT9Lhj+FU
 xJxLAfEK7rVXN0ZjYJepoJoaWebdJIOkzE/dYUshYZSu5zfmj1aJPzusObwvT3DmVkTS7VtBX
 rK4oBs2UnREN4HDfZ5infqV9C/rXiFy5DOC6M2yJ90T9Kwa/BEd7WFgXryAiz3JPI+gVozrL/
 QaCL7sGiGN9f3iT75aPMLIEl+5Mdox6unRIEr2t9uxuYo264M8PAtJQquTYasiupPTMvs7g1k
 YjLPOvWltSFdNlm84chTpt6foUWqwg7fRbxhJvg==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Adrian,

On Fri, 9 Oct 2020 16:49:32 +0200
John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> On 10/9/20 4:40 PM, Wolf Ruediger Spielmann wrote:
> > It's (in my opinion) pcpu-alloc:
> > kernel 4.x/5.x: pcpu-alloc: [0] 0 1=20
> > kernel 3.x: pcpu-alloc: [0] 0 2=20
>=20
> Interesting. I have not yet seen this issue on any of our Debian developm=
ent
> machines. What distribution are you running? Is this Gentoo?
>=20
> Our of curiosity, could you give it a go with Debian?

Yes - my distro is gentoo. All of my machines run Gentoo: the SUNs as well =
as x64 (for crosscompiling).
My first shot compiling the kernel native on the SUN took 4 hours and only =
5mins crosscompiling on x86 :-D

I'll give debian a try.

R=FCdiger
