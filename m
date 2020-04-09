Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 414F81A39FE
	for <lists+sparclinux@lfdr.de>; Thu,  9 Apr 2020 20:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgDISui (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 9 Apr 2020 14:50:38 -0400
Received: from mail.sf-mail.de ([116.202.16.50]:40639 "EHLO mail.sf-mail.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgDISui (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 9 Apr 2020 14:50:38 -0400
Received: (qmail 31574 invoked from network); 9 Apr 2020 18:44:06 -0000
Received: from p548d4451.dip0.t-ipconnect.de ([::ffff:84.141.68.81]:34246 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <sparclinux@vger.kernel.org>; Thu, 09 Apr 2020 20:44:06 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     sparclinux@vger.kernel.org
Subject: Re: Suspected bug in wait syscall or similar
Date:   Thu, 09 Apr 2020 20:50:30 +0200
Message-ID: <7975934.7CMqr95tqx@daneel.sf-tec.de>
In-Reply-To: <5121018.IRn6nV2ZPn@daneel.sf-tec.de>
References: <1848982.8N1hjUtedq@eto.sf-tec.de> <5121018.IRn6nV2ZPn@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1827298.CxYgaetDCC"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--nextPart1827298.CxYgaetDCC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 9. April 2020, 10:11:18 CEST schrieb Rolf Eike Beer:
> Am Montag, 30. M=E4rz 2020, 10:41:09 CEST schrieb Rolf Eike Beer:
> > I run a 32 bit Gentoo userspace on my T5120 with a 64 bit kernel (5.5.7=
 at
> > the moment). This is nothing really new, I see this for a while, but it
> > seems to got a bit worse lately.
> >=20
> > My observations are:
> > -the testsuite of the fish shell often hangs. A subprocess goes zombie,
> > but
> > the parent never cleans this up
>=20
> This also happens on sparc64.

Given that is only calls select() here over and over again I think it's an=
=20
application bug, files here:

https://github.com/fish-shell/fish-shell/issues/6878

Eike
--nextPart1827298.CxYgaetDCC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXo9udgAKCRBcpIk+abn8
Tj50AKCg2/dMBAupLTdzkEdaoEHrG4uuEwCffGJEy2IN02XLTilDoW2pNzSPvvg=
=OQu2
-----END PGP SIGNATURE-----

--nextPart1827298.CxYgaetDCC--



