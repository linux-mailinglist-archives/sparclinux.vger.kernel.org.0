Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78FD1DFC14
	for <lists+sparclinux@lfdr.de>; Sun, 24 May 2020 02:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388205AbgEXAQR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 20:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388094AbgEXAQR (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 20:16:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF18DC061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 17:16:15 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so17026614ljo.0
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 17:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3m68u6fbHtBqjSQv0cWxoIcDmwtDvgdO4LpfILQ1PZ0=;
        b=PLeeVDbFE5lth9LtkCyvzFdT69i55fBsQGp6IC8S/ui3poDdGe7l/L1/kH8ez/ROCp
         q6aHohnDM09vUJy9c47/QVG+JyQMj+okxn9lIFq+5JVZhrOvZRs9P2BRPCMImiJCyTdz
         sD3DkwyRgbpKlMHvcWxq5Z3QPIVX/jmzjBSuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3m68u6fbHtBqjSQv0cWxoIcDmwtDvgdO4LpfILQ1PZ0=;
        b=LJP3nSgPeZ/s/MhylzAOkR1IAhTchNC4BTlj9oWF5cCU4TvQTpOl9vLmL61PTE97TO
         Nc2YIla5+nzB87qbIU4vJ9eo3Y9wuCXLX76nB4DKalh/TipP6uZL1hpQPx/RppICFvkU
         KUAiKxMM4eEuUJLabaCA4H1yXtluqA7on3GDr4eMbkJxU68s5cYy1wepe8TvdJOFMNlU
         LXZObOvvQv1p5thY7nLj/O4iNW2OWMrXNQa2ur4gqdsXj9nHr9g/rFSN5mKdcC1xy5wx
         L3IICYxlsmYybXMYzN3J8i6ir04pvvZtB0wN5nCJ0a6Wrg32jKEvMqtEG4OstdQGNwVX
         a5fw==
X-Gm-Message-State: AOAM532zDPFoY8YyBE4QxmUPRE0aUx8zzUezhJEYeFa7OVAyCrFIu5/d
        Gd4pm6fxCMxH8cLb7A0Wxuk92s/cVZY=
X-Google-Smtp-Source: ABdhPJz1DS+vRDciKRPLT+wcocTQYnSH3i5dR7YaK6uNzxbn7o+sz2UF6qdYwSKIDs0q4gbbe5UC0g==
X-Received: by 2002:a05:651c:1187:: with SMTP id w7mr8720216ljo.438.1590279373285;
        Sat, 23 May 2020 17:16:13 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id r19sm3290255ljp.68.2020.05.23.17.16.11
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2020 17:16:12 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id a25so5322547ljp.3
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 17:16:11 -0700 (PDT)
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr8459409ljc.314.1590279371483;
 Sat, 23 May 2020 17:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200523224732.GA243603@roeck-us.net>
In-Reply-To: <20200523224732.GA243603@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 23 May 2020 17:15:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjnwsRfE_RJLAV8SX465uEmpOOJxyqjsLRwoX-UPH0kQg@mail.gmail.com>
Message-ID: <CAHk-=wjnwsRfE_RJLAV8SX465uEmpOOJxyqjsLRwoX-UPH0kQg@mail.gmail.com>
Subject: Re: [PATCH] sparc32: use PUD rather than PGD to get PMD in srmmu_nocache_init()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anatoly Pugachev <matorola@gmail.com>,
        sparclinux@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sat, May 23, 2020 at 3:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This quite innocent looking patch crashes all my sparc32 boot tests.
> Crash log and bisect results below. Reverting it fixes the problem.

It should also fixed by 0cfc8a8d70dc ("sparc32: fix page table
traversal in srmmu_nocache_init()"). No?

                 Linus
