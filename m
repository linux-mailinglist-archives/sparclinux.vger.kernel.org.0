Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A1FD7B57
	for <lists+sparclinux@lfdr.de>; Tue, 15 Oct 2019 18:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfJOQZm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Oct 2019 12:25:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbfJOQZl (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 15 Oct 2019 12:25:41 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E203E2086A;
        Tue, 15 Oct 2019 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571156741;
        bh=9JG55cwvKySt54+bjBUW5hdtYN86mrw1dcSP1VGesMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pxn30roB0HoZF4bdmmOtOx+jCJsmf6mLH+Gk/jvQU71OtO9uII3GS6w0tgi2Oh5QR
         Y15ac4YQo6HjJDy8aT1vjUAc4neG3AyvDWZfIvI8kOyfb1kb4oxxTBJD7s3aMVyL3d
         CkFaaybuvECb/3mKLcHnM+cyEg6ewAOWTu4ol3Yk=
Date:   Tue, 15 Oct 2019 09:25:39 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>
Subject: Re: [RFT PATCH 0/3] crypto: sparc - convert to skcipher API
Message-ID: <20191015162539.GA852@sol.localdomain>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>
References: <20191012043850.340957-1-ebiggers@kernel.org>
 <20191015081138.GA23837@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015081138.GA23837@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Oct 15, 2019 at 01:11:38AM -0700, Christoph Hellwig wrote:
> On Fri, Oct 11, 2019 at 09:38:47PM -0700, Eric Biggers wrote:
> > This series converts the glue code for the SPARC64 crypto opcodes
> > implementations of AES, Camellia, DES, and 3DES modes from the
> > deprecated "blkcipher" API to the "skcipher" API.  This is needed in
> > order for the blkcipher API to be removed.
> 
> Not knowing much about the API: do you have an explanation of what the
> difference is and why it matters?
> 

They're all APIs for length-preserving encryption algorithms, but the skcipher
API has some improvements, such as:

    - a much less confusing name
    - better type safety (skcipher_alg, crypto_skcipher, etc. instead of
      crypto_alg, crypto_tfm, etc.)
    - optional support for asynchronous operation (like "ablkcipher")
    - optional support per request-contexts (like "ablkcipher")
    - simpler scatterlist walks for some algorithms

The skcipher API was introduced in 2015 to replace blkcipher and ablkcipher, and
most implementations and almost all API users were converted.  But some
implementations weren't converted, so the crypto subsystem still has to carry
all the blkcipher and ablkcipher compatibility code, as well as all
documentation for blkcipher and ablkcipher.  This is really confusing for people
working with the crypto API, and bad for testing as there's no easy way to test
{,a}blkcipher on x86, arm, or arm64 anymore.  So, Ard and I are finishing the
conversions so that blkcipher and ablkcipher can finally be removed.

- Eric
