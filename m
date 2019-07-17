Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2606C2E9
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2019 00:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbfGQV77 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 17 Jul 2019 17:59:59 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:47530 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbfGQV77 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 17 Jul 2019 17:59:59 -0400
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id E34AB72CC64;
        Thu, 18 Jul 2019 00:59:56 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id C53317CCE5C; Thu, 18 Jul 2019 00:59:56 +0300 (MSK)
Date:   Thu, 18 Jul 2019 00:59:56 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Christoph Hellwig <hch@lst.de>,
        Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anatoly Pugachev <matorola@gmail.com>,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] sparc64: use the generic get_user_pages_fast code
Message-ID: <20190717215956.GA30369@altlinux.org>
References: <20190625143715.1689-1-hch@lst.de>
 <20190625143715.1689-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20190625143715.1689-10-hch@lst.de>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 25, 2019 at 04:37:08PM +0200, Christoph Hellwig wrote:
> The sparc64 code is mostly equivalent to the generic one, minus various
> bugfixes and two arch overrides that this patch adds to pgtable.h.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
> ---
>  arch/sparc/Kconfig                  |   1 +
>  arch/sparc/include/asm/pgtable_64.h |  18 ++
>  arch/sparc/mm/Makefile              |   2 +-
>  arch/sparc/mm/gup.c                 | 340 ----------------------------
>  4 files changed, 20 insertions(+), 341 deletions(-)
>  delete mode 100644 arch/sparc/mm/gup.c

So this ended up as commit 7b9afb86b6328f10dc2cad9223d7def12d60e505
(thanks to Anatoly for bisecting) and introduced a regression:=20
futex.test from the strace test suite now causes an Oops on sparc64
in futex syscall.

Here is a heavily stripped down reproducer:

// SPDX-License-Identifier: GPL-2.0-or-later
#include <err.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <asm/unistd.h>
int main(void)
{
	size_t page_size =3D sysconf(_SC_PAGESIZE);
	size_t alloc_size =3D 3 * page_size;
	void *p =3D mmap(NULL, alloc_size, PROT_READ | PROT_WRITE,
		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (MAP_FAILED =3D=3D p)
		err(EXIT_FAILURE, "mmap(%zu)", alloc_size);
	void *hole =3D p + page_size;
	if (munmap(hole, page_size))
		err(EXIT_FAILURE, "munmap(%p, %zu)", hole, page_size);
	syscall(__NR_futex, (unsigned long) hole, 0L, 0L, 0L, 0L, 0L);
	return 0;
}

--=20
ldv

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJdL5pcAAoJEAVFT+BVnCUIQ+4QAJbAg/fjGdrZiUuhFCsAumUr
1a+Sj62OxFSUDyqbMKHGYQndj9PAPc6CqjbaT02kKPqqCVKQsww+kLGHLOIBMq3G
4tK92yghsLeH7PiOgLNjBuLtZm3qySmxG1e5Wvt7/1AZeEZLvQit4Js1t0yUYgz2
copTaWXHLHUHQ9ePrzd4CyVo2Ha8ChhVATHAI9NSby1kqvBDG5Yt5pS6A14ocRH8
drd71GTLFu0pXWBh3dRSZ1irXnyL/SKYYGD6/kem1l8Bq8hVwfiLfwhhAl02Gmap
7wj/kYIG/aDFlK43ulBeXVwG/xFDdTVL5cOc8aS9x+160+jfzGRcSHdfUwnV3evI
0Qi66H4im83apvoaVOznNIk88x3omiN2XoYcWZjVazN6whSdmA4Oz3RMQxm9Epx3
heEwsaAX/5dGPwWG6JdZIktHIw+Z64egFm+5AXPRkGo2LUP6dgVew2dECP2+dl8H
E6o86lU2ctAaaeDCymH0w5cOVp9WPeEEEGxwuIai7LZN3GuFP+/hwEsPMrRtIhsD
NVmq/JPWACqixvfHL7t1UpZkwvJxraR/V4v4cjC7jW1kE73AlF3xNxjJtOPQlesR
xQBuQ5ezVXipMyeC1a29NgKGCvMtxUvkszGmejsYUiplI2bI8g7uwhySqssqW+e9
7SxH0zcMsECH0iugLK5w
=+CIC
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
