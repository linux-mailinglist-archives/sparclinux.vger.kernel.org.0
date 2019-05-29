Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2492E778
	for <lists+sparclinux@lfdr.de>; Wed, 29 May 2019 23:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfE2Vcj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 29 May 2019 17:32:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51113 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfE2Vcj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 29 May 2019 17:32:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id f204so2606451wme.0
        for <sparclinux@vger.kernel.org>; Wed, 29 May 2019 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=google;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=YmhtUqxFw98LcCkh0vyYAxyidle4vHngpAc62LAR1Qg=;
        b=HLyS8wbtoUELd3V/vvNHmXpfBnSs5Z/YuqsQu6cigqp/N0jjnPdzXQ7XOdv0JWBCmU
         mqv85p0qP/wik2G5DlxY7X09s886eyr8p/xkHZRVSATB/+qt+EEDu0hmKSSFfoS5Im+l
         avI8Yg2W3CjdTOJ0QrBR2G8moPZM21Pyhgc8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=YmhtUqxFw98LcCkh0vyYAxyidle4vHngpAc62LAR1Qg=;
        b=HJx0kBXknIG8XRXJZt8gx7Tt3NeCKiESv4rjdGhkre+Ml8+OTh5/+yn0/M8TcAzNRS
         SpqIzYYuWggMGU2XXnqQj6sFwydhf4eB5O335Zm/wzx3GVYnLNQxQDl05Y6hNk9m7EgN
         qO2JXRPgpbp1tTNf4ZDin6/4XxY4m+MKGfj/cr9iBRTEmfrahRrmAa55U9oPJv4bGUws
         8wBTDm6Gpbp7lRthdVErXuJYVkStr3MCVxHFj41KokXEzQs9ETE1YVEzSCCGiKFUVHN7
         jTK1ZMU2dhiOKBWTfMRL9q+PgUeaLjXhE9aU//WAnuHuHrVMHuQP51Y650QNBYImkRY7
         6Faw==
X-Gm-Message-State: APjAAAXrTX89BBXgWG2bs022TVvAP+ZQvCdoyDv6adtODGox1aBfxAmR
        CGXQWhMCjKOKHRwBj7R+Qv66ag==
X-Google-Smtp-Source: APXvYqz2zW655qh8FcCVxdocnuWGdFpXJjeMP20ZFoUrCb7PmsPqyOrFDU0D9RzJD6pGqPcRfBMVxw==
X-Received: by 2002:a1c:c00b:: with SMTP id q11mr113908wmf.4.1559165557163;
        Wed, 29 May 2019 14:32:37 -0700 (PDT)
Received: from jrtc4a.trin.private.cam.ac.uk (global-184-8.nat-1.net.cam.ac.uk. [131.111.184.8])
        by smtp.gmail.com with ESMTPSA id g2sm702256wru.37.2019.05.29.14.32.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 14:32:36 -0700 (PDT)
From:   James Clarke <jrtc27@jrtc27.com>
Message-Id: <57385AAB-C9A1-46AD-B743-445D4ECCA902@jrtc27.com>
Content-Type: multipart/mixed;
        boundary="Apple-Mail=_946101B8-1742-4F83-8EF7-FDF051CC3C53"
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [bisected] DEBUG_PAGEALLOC hangs on sparc64
Date:   Wed, 29 May 2019 22:32:35 +0100
In-Reply-To: <896BE8F9-F2AF-4138-B44D-512C615B9910@jrtc27.com>
Cc:     rick.p.edgecombe@intel.com,
        Sparc kernel list <sparclinux@vger.kernel.org>
To:     David Miller <davem@davemloft.net>, mroos@linux.ee
References: <86e9d84e-cffa-0bae-f575-7cf6789f5fb8@linux.ee>
 <20190529.132340.1951054150778994386.davem@davemloft.net>
 <896BE8F9-F2AF-4138-B44D-512C615B9910@jrtc27.com>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


--Apple-Mail=_946101B8-1742-4F83-8EF7-FDF051CC3C53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 29 May 2019, at 22:00, James Clarke <jrtc27@jrtc27.com> wrote:
> On 29 May 2019, at 21:23, David Miller <davem@davemloft.net> wrote:
>>=20
>> From: Meelis Roos <mroos@linux.ee>
>> Date: Wed, 29 May 2019 22:08:26 +0300
>>=20
>>> Bisecting led me to 4.9 merge window and this patch that broke it:
>>>=20
>>> a74ad5e660a9ee1d071665e7e8ad822784a2dc7f is the first bad commit
>>> commit a74ad5e660a9ee1d071665e7e8ad822784a2dc7f
>>> Author: David S. Miller <davem@davemloft.net>
>>> Date:   Thu Oct 27 09:04:54 2016 -0700
>>>=20
>>>   sparc64: Handle extremely large kernel TLB range flushes more
>>>   gracefully.
>>=20
>> Thank you, I will take a close look at this ASAP.
>=20
> Perhaps I'm being stupid, but the first hunk in =
xcall_flush_tlb_kernel_range
> looks wrong to me. %g2 previously contained PAGE_SIZE-1, but is now =
clobbered
> by the new srlx, setting %g2 to (aligned_end-aligned_start)>>18. If =
the
> brnz %g2 is taken, %g2 gets overwritten, so it's not a problem, but if =
the
> branch *isn't* taken, then %g2 is zero, so the add %g2, 1, %g2 in the =
delay
> slot of the branch sets %g2 to 1. However, prior to this commit, %g2 =
would then
> have had the value PAGE_SIZE, and the following code to do a =
page-by-page flush
> assumes this, using it as the amount to step through. Rather than =
stepping
> through page-by-page (with offset 0x20 to indicate nucleus), we will =
step
> through the loop byte-by-byte, so some iterations will have low bit
> combinations for things other than a nucleus page demap operation. =
This same
> bug is replicated in the new __cheetah_xcall_flush_tlb_kernel_range.

Meelis, could you please try the attached patch to see if it fixes the =
issue?

David, I don't actually see why we need this alignment code in the first =
place.
The only call to the xcall is in smp_flush_tlb_kernel_range which =
already
rounds the start and end to multiples of the page size, so I believe we =
should
be able to delete the first four instructions of the 3 different
implementations? The non-xcall variants already skip doing this.

Regards,
James

--Apple-Mail=_946101B8-1742-4F83-8EF7-FDF051CC3C53
Content-Disposition: attachment;
	filename=0001-sparc64-Fix-regression-in-non-hypervisor-TLB-flush-x.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-sparc64-Fix-regression-in-non-hypervisor-TLB-flush-x.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=20c30831c5498105b986a563e3cde35b4015ae97e5=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20James=20Clarke=20<jrtc27@jrtc27.com>=0ADate:=20=
Wed,=2029=20May=202019=2022:31:31=20+0100=0ASubject:=20[PATCH]=20=
sparc64:=20Fix=20regression=20in=20non-hypervisor=20TLB=20flush=20xcall=0A=
=0APreviously,=20%g2=20would=20end=20up=20with=20the=20value=20=
PAGE_SIZE,=20but=20after=20the=0Acommit=20mentioned=20below=20it=20ends=20=
up=20with=20the=20value=201=20due=20to=20being=20reused=0Afor=20a=20=
different=20purpose.=20We=20need=20it=20to=20be=20PAGE_SIZE=20as=20we=20=
use=20it=20to=20step=0Athrough=20pages=20in=20our=20demap=20loop,=20=
otherwise=20we=20set=20different=20flags=20in=20the=0Alow=2012=20bits=20=
of=20the=20address=20written=20to,=20thereby=20doing=20things=20other=20=
than=20a=0Anucleus=20page=20flush.=0A=0AFixes:=20a74ad5e660a9=20=
("sparc64:=20Handle=20extremely=20large=20kernel=20TLB=20range=20flushes=20=
more=20gracefully.")=0AReported-by:=20Meelis=20Roos=20<mroos@linux.ee>=0A=
Signed-off-by:=20James=20Clarke=20<jrtc27@jrtc27.com>=0A---=0A=20=
arch/sparc/mm/ultra.S=20|=204=20++--=0A=201=20file=20changed,=202=20=
insertions(+),=202=20deletions(-)=0A=0Adiff=20--git=20=
a/arch/sparc/mm/ultra.S=20b/arch/sparc/mm/ultra.S=0Aindex=20=
d245f89d1395..d220b6848746=20100644=0A---=20a/arch/sparc/mm/ultra.S=0A=
+++=20b/arch/sparc/mm/ultra.S=0A@@=20-587,7=20+587,7=20@@=20=
xcall_flush_tlb_kernel_range:=09/*=2044=20insns=20*/=0A=20=09sub=09=09=
%g7,=20%g1,=20%g3=0A=20=09srlx=09=09%g3,=2018,=20%g2=0A=20=09brnz,pn=09=09=
%g2,=202f=0A-=09=20add=09=09%g2,=201,=20%g2=0A+=09=20sethi=09=09=
%hi(PAGE_SIZE),=20%g2=0A=20=09sub=09=09%g3,=20%g2,=20%g3=0A=20=09or=09=09=
%g1,=200x20,=20%g1=09=09!=20Nucleus=0A=201:=09stxa=09=09%g0,=20[%g1=20+=20=
%g3]=20ASI_DMMU_DEMAP=0A@@=20-751,7=20+751,7=20@@=20=
__cheetah_xcall_flush_tlb_kernel_range:=09/*=2044=20insns=20*/=0A=20=09=
sub=09=09%g7,=20%g1,=20%g3=0A=20=09srlx=09=09%g3,=2018,=20%g2=0A=20=09=
brnz,pn=09=09%g2,=202f=0A-=09=20add=09=09%g2,=201,=20%g2=0A+=09=20sethi=09=
=09%hi(PAGE_SIZE),=20%g2=0A=20=09sub=09=09%g3,=20%g2,=20%g3=0A=20=09or=09=
=09%g1,=200x20,=20%g1=09=09!=20Nucleus=0A=201:=09stxa=09=09%g0,=20[%g1=20=
+=20%g3]=20ASI_DMMU_DEMAP=0A--=20=0A2.20.1=0A=0A=

--Apple-Mail=_946101B8-1742-4F83-8EF7-FDF051CC3C53--
