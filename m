Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7372219C51B
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 16:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389021AbgDBO5r (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 10:57:47 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:35381 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388836AbgDBO5r (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 2 Apr 2020 10:57:47 -0400
Received: (qmail 20847 invoked from network); 2 Apr 2020 14:51:12 -0000
Received: from p548d4b90.dip0.t-ipconnect.de ([::ffff:84.141.75.144]:43632 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <adhemerval.zanella@linaro.org>; Thu, 02 Apr 2020 16:51:12 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     Adhemerval Zanella <adhemerval.zanella@linaro.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        sparclinux@vger.kernel.org
Subject: Re: Suspected bug in wait syscall or similar
Date:   Thu, 02 Apr 2020 16:57:38 +0200
Message-ID: <2790388.WAhmubx6ku@daneel.sf-tec.de>
In-Reply-To: <31e71908-3508-5f71-01c8-49f861257835@linaro.org>
References: <1848982.8N1hjUtedq@eto.sf-tec.de> <1ce66ac3-17cf-0b74-8111-ae0b917e65b3@physik.fu-berlin.de> <31e71908-3508-5f71-01c8-49f861257835@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1641587.pqXMvmSoLt"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--nextPart1641587.pqXMvmSoLt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> The only recent change prior the move to assembly was on 2.25 where we had
> to disable the stack protector.  For 2.31 release, for instance, I used the
> gcc 7.5.0 since it didn't trigger this issue.

I recently tried rebuilding 2.29 on Gentoo with 9.2 and things started 
breaking, may that still be an issue?

> > I know that there have been some stability issues with the Linux kernel on
> > SPARC with older hardware like the UltraSPARC IIIi. The T5120 we have and
> > newer machines seem to run relatively fine with a 64-bit userland.
> 
> Not only stability issues, but I noticed that kernel developers had
> fixed a SysV IPC kernel issue on 32-bits kernels that has been
> lingering for years.  So I am not sure how well maintained is
> 32-bit sparc is in general.

This seems generally be an option, but noone has a clue of LDOM at the moment. 
You way come to #gentoo-sparc on Freenode if you want to give a helping hand.

> [1] https://sourceware.org/glibc/wiki/Release/2.31

That only lists known test failures regarding sparc?

Eike
--nextPart1641587.pqXMvmSoLt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXoX9YgAKCRBcpIk+abn8
Tqs4AJwLtCrbsc59c7zeb17QbEVOn+KgFwCfQb4YtqiDvu+cMMJFT9fymZfIyRk=
=BXwS
-----END PGP SIGNATURE-----

--nextPart1641587.pqXMvmSoLt--



