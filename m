Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC954EAEB
	for <lists+sparclinux@lfdr.de>; Fri, 21 Jun 2019 16:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfFUOnx (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 21 Jun 2019 10:43:53 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36515 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfFUOnx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 21 Jun 2019 10:43:53 -0400
Received: by mail-qt1-f194.google.com with SMTP id p15so7162366qtl.3
        for <sparclinux@vger.kernel.org>; Fri, 21 Jun 2019 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HyLTo1H3x89cnTVP/KrI5aPMZqdvKCPXXVZOA+DwKL4=;
        b=DWYPEU+O6hqxRZYo+qz30J5H/UJHIhDajRUaRnLPSd6vJcB6+cO10pe7lygHrzVfbj
         ylkZm9xQxBbaknOOEP50RPqZEIKs31Kv5m61QSa+a2j9L/tziw3EvpbXFBlYITisHOrc
         JH/mxK8KzRvGMQq7eEjJ0D1tfo1cCUkuw78siy8VrSJQvLItPReOk3pNZ79bl/uzqGdA
         xZjcp0ZATPU+rLVHRBIhFoOyYspIjuFb0uCU0LU9axGWIFyYR3JZqqXVHth78E5v4p4y
         7AeI6a+ZKHqzF3V2D6NrgjTVx68650ZaAGsz9YLXObQshjM/K+Dt60BoO4AIuRM7+FIQ
         tXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HyLTo1H3x89cnTVP/KrI5aPMZqdvKCPXXVZOA+DwKL4=;
        b=DnXeIsHxhV4UOlMKDuRVBq8foq4WT+45sZz+Uc+rUMvAREn8HRFfzfETxT9r+nZz3X
         mgAbCDyfXIjtyD/S/l9tCYaVSTMpVR4aYUMFk1fxnaEhkG3Ojd1o13Q2i/poyWLnToO5
         czEtcTTpZpjv4e8VHwp7hD28y3D6TKhb3+/ctJ7IlMwLjyDmuKCk7RuDbkiy7Z5nNWBe
         49SlSnthyG+gWivJ+6SdQ/AnsuoJMwC7KFiE4d8iFslk0gCA0bKiloZ3HhkV+K0Y017J
         gdPIitkSEt68BS4kuegp3t+sdbEtZE1CcD41wSbISZ9c0rFLPM0rBpyIMcwaPM3VYXft
         C4vg==
X-Gm-Message-State: APjAAAUF39gvPHZUdsDgG9QNiwnvcKHqzQd5iX6UDJgM0MTq8fBYxXg8
        5EX4Mwoa01sN03mz/+E5cjNGkA==
X-Google-Smtp-Source: APXvYqyhH+glrRwKSiAA7qbVYeB5QwqXO/U6RS0ZU2dwiG6C6t5mG7HajTG9DMxfijl7dMFHJHUwBg==
X-Received: by 2002:ac8:1ba9:: with SMTP id z38mr28772211qtj.176.1561128232588;
        Fri, 21 Jun 2019 07:43:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id a11sm1411650qkn.26.2019.06.21.07.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 07:43:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heKlb-0000wZ-Mn; Fri, 21 Jun 2019 11:43:51 -0300
Date:   Fri, 21 Jun 2019 11:43:51 -0300
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
Subject: Re: switch the remaining architectures to use generic GUP v3
Message-ID: <20190621144351.GR19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:46PM +0200, Christoph Hellwig wrote:
> Hi Linus and maintainers,
> 
> below is a series to switch mips, sh and sparc64 to use the generic
> GUP code so that we only have one codebase to touch for further
> improvements to this code.  I don't have hardware for any of these
> architectures, and generally no clue about their page table
> management, so handle with care.

I like this series, ther are alot of people talking about work for GUP
and this will make any of that so much easier to do.

Jason
