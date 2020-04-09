Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6770B1A30AC
	for <lists+sparclinux@lfdr.de>; Thu,  9 Apr 2020 10:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgDIIL1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 9 Apr 2020 04:11:27 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:49821 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgDIIL1 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 9 Apr 2020 04:11:27 -0400
Received: (qmail 8600 invoked from network); 9 Apr 2020 08:04:53 -0000
Received: from p548d4451.dip0.t-ipconnect.de ([::ffff:84.141.68.81]:56238 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <sparclinux@vger.kernel.org>; Thu, 09 Apr 2020 10:04:53 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     sparclinux@vger.kernel.org
Subject: Re: Suspected bug in wait syscall or similar
Date:   Thu, 09 Apr 2020 10:11:18 +0200
Message-ID: <5121018.IRn6nV2ZPn@daneel.sf-tec.de>
In-Reply-To: <1848982.8N1hjUtedq@eto.sf-tec.de>
References: <1848982.8N1hjUtedq@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3940060.4HlUvDv14c"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--nextPart3940060.4HlUvDv14c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 30. M=E4rz 2020, 10:41:09 CEST schrieb Rolf Eike Beer:
> I run a 32 bit Gentoo userspace on my T5120 with a 64 bit kernel (5.5.7 at
> the moment). This is nothing really new, I see this for a while, but it
> seems to got a bit worse lately.
>=20
> My observations are:
> -the testsuite of the fish shell often hangs. A subprocess goes zombie, b=
ut
> the parent never cleans this up

This also happens on sparc64.

Eike
--nextPart3940060.4HlUvDv14c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXo7YpgAKCRBcpIk+abn8
TgpGAJ90O55i68WPNuWj3pjQ71sxwBYoRwCgibeZmu0fjCXphc3Lj5PsqNTLV00=
=pdaS
-----END PGP SIGNATURE-----

--nextPart3940060.4HlUvDv14c--



