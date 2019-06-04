Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85626346AD
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 14:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfFDM2o (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 08:28:44 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46908 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfFDM2n (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 08:28:43 -0400
Received: by mail-qt1-f194.google.com with SMTP id z19so13385657qtz.13
        for <sparclinux@vger.kernel.org>; Tue, 04 Jun 2019 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=piwrTztXhC39aA20VdmSLRCidVge2JjKgB3c0ijpNGA=;
        b=a6FgIBxgNByE1AswojUTFyEmYC72QqH/LQqqHz7ixlPVsXOPCgYd6mlw3XQTwnM2uh
         oSGphZh6q0/2oLSC/6UR/PVOiDLxeNrPqz3Xwh66LKb+PMN/RXj9Mb0rZNkmDNbLDRnv
         CDWrRylaRnKOork+/GTVzWguM6veviFxYDrHZyjqWmhP2Vq2sYJ9UIswPK1qUkGaukdi
         k6ldM/RmNazR5Btl5NCkOzRIKY7xN77rgF9vRVvC1DB/O3CaVrJjdtoBXxCeg/JcPdxV
         dPdKuKgQLxyqTRqoGtEBLBY4RwLUOzQy0WyfZWfqmqxAPStw46U6hbvqjfP22IPycU4j
         75jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=piwrTztXhC39aA20VdmSLRCidVge2JjKgB3c0ijpNGA=;
        b=n59zotBYuVL1h8sPM8oEkp2FsqeBG/d88NaHnFDbJ/w7Hqg7OJX6iUreEfNRNAo4+t
         NpipT9XYW1SaJyxG19Pp3+wXp/CNOfNu9e0R4d4gWH/Giqlw5ZACtEvUDKfMl8x0vav+
         fNOVoKpFRwOW5DVf8+FobYHXSwq5XgImJE7H8zQjiT1mzmNXJyk2q+9ok5TngBGslDv0
         PF+Wy8hSpnEiWTdfV6s/8Ay07wIm0MBZWsIDMZhTCE0rAeWEBWtTD0hjgGX4RFZ2+DBc
         QT4qtv/ZmJ6h7zVjj3/HaZZCHvbc9+kAECdT78heVuty4y81spvLegEv3amp7/HuqI4D
         HQ+w==
X-Gm-Message-State: APjAAAVIPz7YC5G4R9wC7UKcjg10DZacGQpTAIPzh+Rl3SPGUe+qh1ne
        /oGxg49tRpkSjxt93N5t1C6+JQ==
X-Google-Smtp-Source: APXvYqz1oMF9jOCQzUyuq8/gZIjlw5l60lDqJs2tR/Yg0Za5sOTQcYevs45DA2dZqbA4i3Qtsa1ReA==
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr28082215qta.243.1559651322669;
        Tue, 04 Jun 2019 05:28:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id e133sm13448610qkb.76.2019.06.04.05.28.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 05:28:42 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1hY8YT-00042G-HE; Tue, 04 Jun 2019 09:28:41 -0300
Date:   Tue, 4 Jun 2019 09:28:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH v2] uaccess: add noop untagged_addr definition
Message-ID: <20190604122841.GB15385@ziepe.ca>
References: <c8311f9b759e254308a8e57d9f6eb17728a686a7.1559649879.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8311f9b759e254308a8e57d9f6eb17728a686a7.1559649879.git.andreyknvl@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 04, 2019 at 02:04:47PM +0200, Andrey Konovalov wrote:
> Architectures that support memory tagging have a need to perform untagging
> (stripping the tag) in various parts of the kernel. This patch adds an
> untagged_addr() macro, which is defined as noop for architectures that do
> not support memory tagging. The oncoming patch series will define it at
> least for sparc64 and arm64.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>  include/linux/mm.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0e8834ac32b7..dd0b5f4e1e45 100644
> +++ b/include/linux/mm.h
> @@ -99,6 +99,17 @@ extern int mmap_rnd_compat_bits __read_mostly;
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
>  
> +/*
> + * Architectures that support memory tagging (assigning tags to memory regions,
> + * embedding these tags into addresses that point to these memory regions, and
> + * checking that the memory and the pointer tags match on memory accesses)
> + * redefine this macro to strip tags from pointers.
> + * It's defined as noop for arcitectures that don't support memory tagging.
> + */
> +#ifndef untagged_addr
> +#define untagged_addr(addr) (addr)

Can you please make this a static inline instead of this macro? Then
we can actually know what the input/output types are supposed to be.

Is it

static inline unsigned long untagged_addr(void __user *ptr) {return ptr;}

?

Which would sort of make sense to me.

Jason
