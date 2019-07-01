Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F294A5752D
	for <lists+sparclinux@lfdr.de>; Thu, 27 Jun 2019 02:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfF0ABT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 26 Jun 2019 20:01:19 -0400
Received: from ozlabs.org ([203.11.71.1]:60479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbfF0ABS (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 26 Jun 2019 20:01:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z0Rb1Hfbz9s3l;
        Thu, 27 Jun 2019 10:01:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1561593675;
        bh=1lE9AUF6MyOky71wFSDxHTgjZyRnH5kKDXEGsh2PNMY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W7K9i2prjefws8sFIpZesIkplSmvPM27jioPoWN4t2FpUQH5MCEXwq/Ycue9xyNWI
         TanvuBp9XouwFzA2vbteP29Lf9Nccr4aZPXiV842jDugOEtSOvTTibb6nz9zqqo5ru
         sDZd/twnKNDFaNEgFgiGDBfaIrL0VNadNktcCyTqJiInJbRhg0F5gVcbA8S3nb32Ux
         Q2c6VsmYZDiUkXqAo9f2vXK1/6TvXjHeqqOGqkGyG7o7HIzK95yANM91TojqjZzr4+
         i78FbsozZ8smC3RdcuIPmDFUDTFi7/VMGs8LB4hq9sXhlGyCPo7lTjgktEAHB1QDAn
         S0LETTsgkwqKA==
Date:   Thu, 27 Jun 2019 10:01:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20190627100114.3eda815f@canb.auug.org.au>
In-Reply-To: <20190626131318.GA5101@lst.de>
References: <20190626225807.205f1382@canb.auug.org.au>
        <20190626131318.GA5101@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TmVpELSjnXhVlpZ+rR=WhJA"; protocol="application/pgp-signature"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--Sig_/TmVpELSjnXhVlpZ+rR=WhJA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, 26 Jun 2019 15:13:18 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> As that function is in code only there to provide compile coverage
> something like this should fix the problem:
>=20
>=20
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm=
/pgtable_64.h
> index 547ff96fb228..1599de730532 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -861,10 +861,12 @@ static inline unsigned long pud_page_vaddr(pud_t pu=
d)
>  #define pud_clear(pudp)			(pud_val(*(pudp)) =3D 0UL)
>  #define pgd_page_vaddr(pgd)		\
>  	((unsigned long) __va(pgd_val(pgd)))
> -#define pgd_page(pgd)			pfn_to_page(pgd_pfn(pgd))
>  #define pgd_present(pgd)		(pgd_val(pgd) !=3D 0U)
>  #define pgd_clear(pgdp)			(pgd_val(*(pgdp)) =3D 0UL)
> =20
> +/* only used by the stubbed out hugetlb gup code, should never be called=
 */
> +#define pgd_page(pgd)			NULL
> +
>  static inline unsigned long pud_large(pud_t pud)
>  {
>  	pte_t pte =3D __pte(pud_val(pud));

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/TmVpELSjnXhVlpZ+rR=WhJA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0UB0oACgkQAVBC80lX
0GxIZwgAhEu9RAp1zw7pbbiYTJSgyEfJ+NiUbwBPJBdW898jCXDYggkQdOge4hID
9ycFIIX9NcWqFPEp4aZIs7WoAh+d6IhOR4AEd61u0x2l9r4JsydkQ95K0EruOQtQ
VexF4aPCCNbFwOxRADrkHZ/ZOQIUZ/9MQCCLg1Zm3kJXITjsnm7TqSFfGJXsR1+V
w+ekwkxnB0EYzJPhk/1mZRoXvijX+9cOdLX+G4orCEqPCLFl4/y1Z2Cse8CmAnzS
ArQsJI3xn7BUUHdXMeE3o5kJWeAa53pgC0rwTxbnysGtXq5uJmyGb6mRnkKOf+tk
3MM/gznYCyCM66+sWmjLLu4xb8cN2g==
=ERSj
-----END PGP SIGNATURE-----

--Sig_/TmVpELSjnXhVlpZ+rR=WhJA--
