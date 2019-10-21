Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 526BDDE6F4
	for <lists+sparclinux@lfdr.de>; Mon, 21 Oct 2019 10:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfJUIri (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 21 Oct 2019 04:47:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43510 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfJUIri (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 21 Oct 2019 04:47:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id 21so426097lft.10
        for <sparclinux@vger.kernel.org>; Mon, 21 Oct 2019 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
        b=1m2lTqA9g8pR+gNDKI38Hf1YD7AHOVMKSH+qSD61rfazdteezEy9qc5uu2ptisQ9la
         2LtDIJrwJ7X1O01IGsFjD9Q/tJKUKXCVjQmfmnHyU1gdA5IsuEbNn8xmSiwXeHIxvmk/
         6pVLd5kq52suDJKdMlVESukd4NeWOaLnxEtoHQCsXi6XdP7Fg9uthetLEeVehsgGmwkk
         ja7ACVppObMYfmKfim6MGSHkS3TgOluieW1CYSonwzhW9/htLzCwwZtSsHf1htBxQR70
         GPCtExDc04v5gmZKf1XkxxBDsYhoYYnWBWz0PP+O7PTGn50JCdZZF3jn0h256hnPJzT7
         KjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
        b=G5v63Hs4ys7jk1uDIY3CMo9p4yBV0N14o+aZePpBzPs9B9Fi9MXsgHoySFmJmzPzPJ
         2RPmKJPzP5UcL76WP+ouTULi+loGMxyr6MAiCYUGhTTjv2BwWqMQxJU2YnxKwKpRwaI6
         pzgFXgMTyzTGHkag8AQljJofQj0QXaEVP0q8Ba+Kl5ObPT+Fxv80Z9YMXw024VntimxP
         xUN7NimW3q1n0S3SR36Bs2pjzcCfrR63MovVY0oONSHShiz0UQIZGe+uHARen27FZsJB
         3ano0yNZcGXt5RHVUPLEfhfr4IfbzFegHMjq7tY54I11+0TVUT0xqQSt75Q2RcJglqXu
         nWGg==
X-Gm-Message-State: APjAAAVWL868T5U0gKVZ+GU40ktvil9b7anA7IUhW8s/pZNtB23Mnf3y
        /o0e9Uz6V4IXe+GSbV3AEfwc0A==
X-Google-Smtp-Source: APXvYqylsk8yws60VuLL0ozqdrRuKOuNEAm0brGxK1g45riofpGFYvmXbrn9qDfFdvJfYm2OEK4gUA==
X-Received: by 2002:ac2:4283:: with SMTP id m3mr14587900lfh.41.1571647656443;
        Mon, 21 Oct 2019 01:47:36 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f? ([2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f])
        by smtp.gmail.com with ESMTPSA id x76sm12649907ljb.81.2019.10.21.01.47.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 01:47:35 -0700 (PDT)
Subject: Re: [PATCH 03/21] ia64: rename ioremap_nocache to ioremap_uc
To:     Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
        Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
Cc:     linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-mtd@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-4-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <915c9aaa-ea20-7c29-7ee8-5c5f68f7d123@cogentembedded.com>
Date:   Mon, 21 Oct 2019 11:47:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017174554.29840-4-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello!

On 17.10.2019 20:45, Christoph Hellwig wrote:

> On ia64 ioremap_nocache fails if attributs don't match.  Not other

   Attributes?

> architectures does this, and we plan to get rid of ioremap_nocache.
> So get rid of the special semantics and define ioremap_nocache in
> terms of ioremap as no portable driver could rely on the behavior
> anyway.
> 
> However x86 implements ioremap_uc with a in a similar way as the ia64

    With a what?

> version of ioremap_nocache, so implement that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/ia64/include/asm/io.h | 6 +++---
>   arch/ia64/mm/ioremap.c     | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/ia64/include/asm/io.h b/arch/ia64/include/asm/io.h
> index 54e70c21352a..fec9df9609ed 100644
> --- a/arch/ia64/include/asm/io.h
> +++ b/arch/ia64/include/asm/io.h
[...]

MBR, Sergei
