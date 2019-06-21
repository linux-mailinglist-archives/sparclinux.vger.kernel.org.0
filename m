Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDA74E8B8
	for <lists+sparclinux@lfdr.de>; Fri, 21 Jun 2019 15:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfFUNQN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 21 Jun 2019 09:16:13 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40278 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfFUNQM (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 21 Jun 2019 09:16:12 -0400
Received: by mail-qk1-f196.google.com with SMTP id c70so4346491qkg.7
        for <sparclinux@vger.kernel.org>; Fri, 21 Jun 2019 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IQElyJy7GWkNBjpDGeWXQk4uiZdHF4DIvT5Nq6LmxE8=;
        b=dAlun1HgnUe7022YkQS6GWMYxR1o5c8vpg7JqEcJa5EPCdLDLVoVyNKQvqmZhtNBLF
         WpB9JM8/T8dBcxbgb0A781lKzoM1O/pMV5gbPgxu5rSpwSDOdrQZP84Rnb3SOamIN0Wr
         zqwvpJy81nkQ5T+CDcckayqmm3eCo60vgpfs1x9K8ufP7D9ZXElAHaqtpaYy7p5iJE/y
         l4SUnUVsNsnn39sHqAifpgiGxKut8u7nW0gFTVC/+FCOE5qrTg5md8qyqRNjEUqfK8fM
         2IShZOwM3jYukwEVdkuYU+31+Rw+P2EKrT1nUVgmbwp7XxSFSraMeiH+ei/K/LHG/DXJ
         LUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IQElyJy7GWkNBjpDGeWXQk4uiZdHF4DIvT5Nq6LmxE8=;
        b=PF6hD2iqKOH9VIBYp6yye7w4FRbuKiAMPqoTDYR0Am9IIbnuSTTH2XghO2umqSdAJ2
         UGcsSTREgMHRvY5yze/czvwT+9ptThmKPr+DMXm+WkvIn2ixQqPuCYn1fSnfLxYUJhzp
         ZTw7qXN/HoyBPjF8wAMdwAmHUWHsHvz81AxEO0mk+LzGI0TZN/pvFeEdXzOnJlsni7L4
         cTYcGMPN9wHjYeVvs9I5so3TyJEfxTYsWREtHr/WiVdunJtT9hG2OveAG25Fg5AFzIVW
         HU9sMdF4IHcXs4brV1s3hvQXmogihtA3SazL3JWZIOa2QViPXaDf13gOHTU+MBJ/VlEU
         uKJw==
X-Gm-Message-State: APjAAAWJStfCs3mJj2d9IlJMs4VO4+K0fw7LRZjLX5ODGqKqXk2K/X5f
        PM69TjHWJthVSsGFLArrCTJzUg==
X-Google-Smtp-Source: APXvYqzJ0dyt2+hyzdXxi/NcBy96mwSHUO+pPyyWhj5oMJpKDFijtNxh/f3duoRgranP7T7lVqZ1hA==
X-Received: by 2002:a37:a093:: with SMTP id j141mr90247251qke.244.1561122971647;
        Fri, 21 Jun 2019 06:16:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id s23sm1691094qtk.31.2019.06.21.06.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 06:16:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heJOk-0008Dq-Dw; Fri, 21 Jun 2019 10:16:10 -0300
Date:   Fri, 21 Jun 2019 10:16:10 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190621131610.GK19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
