Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4039F19C931
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 20:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388658AbgDBSxo (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 14:53:44 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:42428 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732214AbgDBSxo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Apr 2020 14:53:44 -0400
Received: by mail-qv1-f65.google.com with SMTP id ca9so2265193qvb.9
        for <sparclinux@vger.kernel.org>; Thu, 02 Apr 2020 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=l1H17v9PVoQVBUFXtkCah+Fp2Wu0OcH6NtEh6zzDh0E=;
        b=jMD7Kkfw019aa7NCHG5/2jxLiVeLP7JEVpcrixu1G7Wu19WRsISnkqFQjdPY4CBV4H
         ZNPoChcDPLcWJKRLbQqPxFcznzERE1E3PBYLV8vlY1GC8gY2fmAdXhKRUamFR7I0echa
         GqFrhomIoZhrsWWgdmnieGbXda2pmrva3p1fygEqE6zEgngNH7o0CvDUdIsUcGI12MPH
         WI8/RUhux0ovwz0WoVdfSjWf3QeGLNYpIKi+jnqcGZXu6O8OHtsdw6yWCQg/QR5Gu4uu
         hb+FNzt+zK44GRhqHqurKJTV/f+Xr8168hseOPsh/VHCzYFbx7z+HZwwyMOhpfy3gieY
         0mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=l1H17v9PVoQVBUFXtkCah+Fp2Wu0OcH6NtEh6zzDh0E=;
        b=XvzrpMcIgO5re1LrTwVJb8t7kCzxLrqnDBafr6Rov36H7LnOq1V0B2JwJihTseyeFs
         65qfzqCVtxow+OmcF5cO0IZDISYpGBwdA/axnIo9q0LCRo+hcDOWq9qPh29f2SrsOdLv
         nS75gzs/To/7XclXFk7lrDX3sY8WwfDXey1nzDtEFmCPFXRcgxdCpGsLKYawcIpU7SY6
         wrAGvzpYWSAuQ71E2AhEfhRsNCmRWvXVXxegteOYIiH9NnXqv6JMZhJoKvnkQz1gX0/a
         lIV5cXh9y4h0AUS0XLlNXdXlIv4FxRQTy3S7A58lf7AavrusYt0012odJWRps1W4THJV
         r2pw==
X-Gm-Message-State: AGi0PuY+h/IYX8bcCM+F/Cqm02qA/FsCyNmTspHyevgZ2x6SVW2rome8
        RW0HQJ24ZT9r7HlEb0vR6fcrEm7cXxA=
X-Google-Smtp-Source: APiQypLbTYreVEQO+yOWbLUJ5NgTSCiHZzR0TSdcxesEoaT3dA+KTWb0qBM9vtow1WDe40mE38Th2Q==
X-Received: by 2002:a0c:aa5e:: with SMTP id e30mr4785728qvb.236.1585853621111;
        Thu, 02 Apr 2020 11:53:41 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
        by smtp.googlemail.com with ESMTPSA id j20sm4115075qke.44.2020.04.02.11.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 11:53:40 -0700 (PDT)
Subject: Re: Suspected bug in wait syscall or similar
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        sparclinux@vger.kernel.org
References: <1848982.8N1hjUtedq@eto.sf-tec.de>
 <1ce66ac3-17cf-0b74-8111-ae0b917e65b3@physik.fu-berlin.de>
 <31e71908-3508-5f71-01c8-49f861257835@linaro.org>
 <2790388.WAhmubx6ku@daneel.sf-tec.de>
From:   Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7729f1c1-4976-c523-76ef-7ca618948db3@linaro.org>
Date:   Thu, 2 Apr 2020 15:53:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2790388.WAhmubx6ku@daneel.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9JDqiozpONwf8mh0mKeivkpGuUwdJdQeK"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9JDqiozpONwf8mh0mKeivkpGuUwdJdQeK
Content-Type: multipart/mixed; boundary="oulfAWPUgYvDlunAb7RpSLxWZJ0Qy6p13";
 protected-headers="v1"
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 sparclinux@vger.kernel.org
Message-ID: <7729f1c1-4976-c523-76ef-7ca618948db3@linaro.org>
Subject: Re: Suspected bug in wait syscall or similar
References: <1848982.8N1hjUtedq@eto.sf-tec.de>
 <1ce66ac3-17cf-0b74-8111-ae0b917e65b3@physik.fu-berlin.de>
 <31e71908-3508-5f71-01c8-49f861257835@linaro.org>
 <2790388.WAhmubx6ku@daneel.sf-tec.de>
In-Reply-To: <2790388.WAhmubx6ku@daneel.sf-tec.de>

--oulfAWPUgYvDlunAb7RpSLxWZJ0Qy6p13
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable



On 02/04/2020 11:57, Rolf Eike Beer wrote:
>> The only recent change prior the move to assembly was on 2.25 where we=
 had
>> to disable the stack protector.  For 2.31 release, for instance, I use=
d the
>> gcc 7.5.0 since it didn't trigger this issue.
>=20
> I recently tried rebuilding 2.29 on Gentoo with 9.2 and things started =

> breaking, may that still be an issue?

Unfortunately it is, I don't why recent version of gcc stated to generate=
d
a stack frame for the sa_restore function on sparc.=20

>=20
>>> I know that there have been some stability issues with the Linux kern=
el on
>>> SPARC with older hardware like the UltraSPARC IIIi. The T5120 we have=
 and
>>> newer machines seem to run relatively fine with a 64-bit userland.
>>
>> Not only stability issues, but I noticed that kernel developers had
>> fixed a SysV IPC kernel issue on 32-bits kernels that has been
>> lingering for years.  So I am not sure how well maintained is
>> 32-bit sparc is in general.
>=20
> This seems generally be an option, but noone has a clue of LDOM at the =
moment.=20
> You way come to #gentoo-sparc on Freenode if you want to give a helping=
 hand.
>=20
>> [1] https://sourceware.org/glibc/wiki/Release/2.31
>=20
> That only lists known test failures regarding sparc?
>=20
> Eike
>=20


--oulfAWPUgYvDlunAb7RpSLxWZJ0Qy6p13--

--9JDqiozpONwf8mh0mKeivkpGuUwdJdQeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUMEGt8/rO2QSpplaqrHsFKeUiO8FAl6GNLEACgkQqrHsFKeU
iO/+jBAAubHG45KxlGu6/8azKnttVq0dkY0Wpr8q2IpF+AoVdlvq6nqbH1dAtgb6
EvWO1rneMkZ0pdTWeMdzF95z8UiJlnOiqMz14SAUB3whUcABpo2WDhS0kXbje6ao
R6QlPr9UupfVBqp2Y23ftKge3Fd/mZYseYU5Exy2/+mnVUbXmccKoDl7v7jCEccN
Rnb2uGFkYD8ICk/b5GF3h6yyJTR9k/73/+gUxP3pfoi7yxY/ePsXldSeg7A/pdZC
OiI/9owXpqTKOHvk3Wg3/zGesk6Qrb7muqrzydv9j1ZdG3GFYMHSMQ7wMGbark08
MJJWEvlPHp8czTGZZl17zr4HN4Q81+zf+SbU6Q2eQv3Cw7NLmubtz8IdmN+ETQLS
8CThRt4qpF5wd1Xq1q6GnV6Usr1JDG3eB495o7QH7lDhBbYWEBvFs6PfQmiol439
5B2hyVIa+usY3QGLfQuRAIYWwZl237E/g/pjfllhkTbgvIHEwS7sybwGZ6jFVYu0
P8tH8vODYeNIXYZm/O+RDopROsF5LmP4cCBLPvd634kiqnnUkAhrxuJ/la5Mrmh8
wLnbYBqrMw9jvKEp6A0PuXckKTKLKaFRIusdyfNnvSBV70pLib8KUZKYZZUPIuLK
q4knKATzljh9DP5S1uysJDFnHrCND5emgrWSzkrphjYy6r2KQSE=
=2CSk
-----END PGP SIGNATURE-----

--9JDqiozpONwf8mh0mKeivkpGuUwdJdQeK--
