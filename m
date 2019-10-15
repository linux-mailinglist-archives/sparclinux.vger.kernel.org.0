Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E8CD70CB
	for <lists+sparclinux@lfdr.de>; Tue, 15 Oct 2019 10:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfJOILl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Oct 2019 04:11:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38396 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbfJOILk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 15 Oct 2019 04:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3rRhB9LianE59sZMXxwJ+CZaNt1uJ0khhvR7AJv1yC4=; b=k9kVJENWARiwianyQRVKnYwL+
        7Tfsd8z/Yb5qMCFHJ7Q/0QI+sgxzfdj+C/95iLx7Bp5+zmCkFcZPKRVu5kcUrPS3yzCZQO7YAngeO
        SdPWiFt0YFEKUvvWVzFhz1QnE2qGxo4NCneF33nr05VX8Yu29hUchIzJAi+j3YOtIskqSUXoHoOIB
        smKgo6QCb8m1E/Ul59Qy7YR5JAD5Hl67QkhGbGOGoy4MEb1TJL10/Zfz6XDo2y6KP63Gyq8NLJnWB
        BQk5F7gbxYIRNLlXe/4OiRSR1cFoAgPnjTiyOKqlwqLCu92dd7cUHZxqo8+pLfxyueeryq4BspkAV
        dHSYeKrIA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKHve-0006GA-3o; Tue, 15 Oct 2019 08:11:38 +0000
Date:   Tue, 15 Oct 2019 01:11:38 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>
Subject: Re: [RFT PATCH 0/3] crypto: sparc - convert to skcipher API
Message-ID: <20191015081138.GA23837@infradead.org>
References: <20191012043850.340957-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012043850.340957-1-ebiggers@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Oct 11, 2019 at 09:38:47PM -0700, Eric Biggers wrote:
> This series converts the glue code for the SPARC64 crypto opcodes
> implementations of AES, Camellia, DES, and 3DES modes from the
> deprecated "blkcipher" API to the "skcipher" API.  This is needed in
> order for the blkcipher API to be removed.

Not knowing much about the API: do you have an explanation of what the
difference is and why it matters?

>  arch/sparc/crypto/aes_glue.c      | 310 +++++++++----------
>  arch/sparc/crypto/camellia_glue.c | 217 ++++++-------
>  arch/sparc/crypto/des_glue.c      | 499 ++++++++++++++----------------
>  crypto/Kconfig                    |   5 +-
>  4 files changed, 468 insertions(+), 563 deletions(-)

At least it removes more code than it adds, which always is a good
thing.
