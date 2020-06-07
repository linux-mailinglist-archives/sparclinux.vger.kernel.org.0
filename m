Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC861F0A68
	for <lists+sparclinux@lfdr.de>; Sun,  7 Jun 2020 09:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgFGHk4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 7 Jun 2020 03:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgFGHk4 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 7 Jun 2020 03:40:56 -0400
X-Greylist: delayed 398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 Jun 2020 00:40:55 PDT
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE18C08C5C2
        for <sparclinux@vger.kernel.org>; Sun,  7 Jun 2020 00:40:55 -0700 (PDT)
Received: (qmail 18583 invoked from network); 7 Jun 2020 07:33:45 -0000
Received: from p548c7327.dip0.t-ipconnect.de ([::ffff:84.140.115.39]:34038 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPSA
        for <sparclinux@vger.kernel.org>; Sun, 07 Jun 2020 09:33:45 +0200
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     sparclinux@vger.kernel.org
Subject: Re: Suspected bug in wait syscall or similar
Date:   Sun, 07 Jun 2020 09:34:05 +0200
Message-ID: <4725976.BPSWWyVmpD@daneel.sf-tec.de>
In-Reply-To: <1848982.8N1hjUtedq@eto.sf-tec.de>
References: <1848982.8N1hjUtedq@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4158771.nXM9zAifOn"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--nextPart4158771.nXM9zAifOn
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

Thanks to the work of the fish maintainer this now looks like it is a bug i=
n=20
either gcc or posix_spawn() or something like that:

https://github.com/fish-shell/fish-shell/issues/6878#issuecomment-640128661

A minimal testcase is here:

https://gist.github.com/ridiculousfish/1b28af43ae2a3a871a5f4aa43a3811f2

This is not limited to sparc32 userspace, but also affects sparc64.

Eike
--nextPart4158771.nXM9zAifOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXtyYbQAKCRBcpIk+abn8
TnWKAJ4ywJXAx+2BksEARNWYGRjUX4MQEQCcDEvBKq3GTdNVfIB0wHwEFzeRlsc=
=E+m/
-----END PGP SIGNATURE-----

--nextPart4158771.nXM9zAifOn--



