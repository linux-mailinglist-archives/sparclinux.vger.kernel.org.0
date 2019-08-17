Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8E791321
	for <lists+sparclinux@lfdr.de>; Sat, 17 Aug 2019 23:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfHQVWR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 17 Aug 2019 17:22:17 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:32845 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfHQVWQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 17 Aug 2019 17:22:16 -0400
Received: by mail-io1-f67.google.com with SMTP id z3so13243056iog.0
        for <sparclinux@vger.kernel.org>; Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=CJVuNDGu30vfZIQhNtyqH+dgEouyhowB/pqTopdU55GkSITlHL0uKSvYQI8xfwB4KF
         b/uCqqA3AXKBIdWSBL/bm8atFw/BTbw6zCCCzTTokg/rSqwXa1cCfQMW6iusHpscU8Il
         0ZqX+tec6msmO1pwyfGqBVymy0nWOHfws7CGDoh79Fg0fctZqQK8Mql9QboplE1l26jI
         c7lYq5mvTGfbdlGkY9/A+2cUa+UcDH5vprCBHPJps3g09zIR/90rJ1p5sEuvA/RhvAOH
         Ua8oYgLyyo0AHKEUE5W/NGenZReiOCrCvLJt/QdP2CD/U0d1u2yrDe5h1Bhkwwdzihi3
         +qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=Mnn0xqR4j2jAK8u/9uHbjlEanbNEgb8/rms9AtqZZND6uWSYzKiQ2XnEMyHk6/nB0X
         tAxWaBriinDSSBb6GB1EcW2P/nRIMfW/8QWiruihPrQtFOUfrj15IZub/miBsyQ4/1cJ
         KUlICwfXBfRrl2xwqa/1Aq/KMuNSHxs+0MxMQ028QOMvIfEomm/snAagNXtpzlNEokMx
         HeNJ9qqF1RYhTzr1w7eF2ISWXBAB5XTWkF84/6VtoPSP1JTGDijlZlvGgVrG27qqvWB2
         aZgJrJTOxF6hq12kfbAAP6UfqBZuvHedyWSzTORMu7wwzrfwOBeyFh0ypxmQq2U/4PVr
         mW7w==
X-Gm-Message-State: APjAAAVijx17W4irFX0Bxs96hnmV3cYGoXQpbeZODihOeNUZm0MsKBhh
        Kv2RHyv1/u/+Yqn7YlGfZVkhNA==
X-Google-Smtp-Source: APXvYqyWkWAJ5sPsUpqbWAy71qmGXtDWPCrfasxRd8m0NdlFhlF6iU5nZ24EPromxMFk1aH65Eky+w==
X-Received: by 2002:a5d:8e16:: with SMTP id e22mr18276290iod.171.1566076936091;
        Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id j25sm13091311ioj.67.2019.08.17.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Christoph Hellwig <hch@lst.de>
cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 24/26] riscv: use the generic ioremap code
In-Reply-To: <20190817073253.27819-25-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-25-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Use the generic ioremap code instead of providing a local version.
> Note that this relies on the asm-generic no-op definition of
> pgprot_noncached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/io.h      |  3 --
>  arch/riscv/include/asm/pgtable.h |  6 +++
>  arch/riscv/mm/Makefile           |  1 -
>  arch/riscv/mm/ioremap.c          | 84 --------------------------------
>  5 files changed, 7 insertions(+), 88 deletions(-)
>  delete mode 100644 arch/riscv/mm/ioremap.c

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul
