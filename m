Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848F81E0114
	for <lists+sparclinux@lfdr.de>; Sun, 24 May 2020 19:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbgEXR2o (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 24 May 2020 13:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387453AbgEXR2n (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 24 May 2020 13:28:43 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11D7C061A0E
        for <sparclinux@vger.kernel.org>; Sun, 24 May 2020 10:28:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q2so18327125ljm.10
        for <sparclinux@vger.kernel.org>; Sun, 24 May 2020 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zih7ZsMrjYQCqYbEWLRH+G7lEmyVJyvd9Lwb6ZvIrvU=;
        b=SW2MLdRMFXNNvKoP39IhZYrM/Jwz/2mK6IWqwxhVsbS6jINM029QoPrAJgLqQHzbG2
         xlcgITMNNPoP7p26/U1idl/c5YuBk5iyn9zlqKZupxeDu+i0OC2cwqITf0enHiXfVb4M
         Izmh+jmEuOjfvPSu/aXJRvxqJOM7E71BAq0CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zih7ZsMrjYQCqYbEWLRH+G7lEmyVJyvd9Lwb6ZvIrvU=;
        b=jUC8VPbYDHfdNkkUHfOyaYPCYk69Z5DhtrSyWRf3x+2CNQB12hYFaCStldQo9bwPYu
         IUtquOvKRm2CwjQg57Z1DaWdACJBC89N9lUYp0Cnj0p0WDIuFNC/nBnBBNFHGUKxrnIJ
         Kr5ViVmDj+9CWi7dMM6XU4PaoFiQSUbZKk37LeXldewZQepuWmuLMSyphOxCDPjtXKJa
         uWHtdCgsGYV1og3SXvt2Gn0WD6YqGRlRE9drAAfJVp3s2FS8/kQcrOkhYAOpMYWqZkrU
         3Jjw+iMigtWFg9TY9+8VgWIgvr3s6vCqYPRk1vtwy6xyQS+tQRmWZdaxXCjUNrnLdSiD
         g+kg==
X-Gm-Message-State: AOAM530+DI0R1p7EWRxeVwoesEnY3qKu6anR1fAdBTdZIEfBoOIHKIBF
        P/IyvVtxWimkn3d6i3EMyuR3D9iW7DM=
X-Google-Smtp-Source: ABdhPJwJ0cm3fsXc4jnHxldfXjeXxZEPM9iOdppA0/brNQhlKNvP1z/dJDsqLUaM10N/5Q37ziZ0Zw==
X-Received: by 2002:a2e:8115:: with SMTP id d21mr6004859ljg.167.1590341319473;
        Sun, 24 May 2020 10:28:39 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id y28sm3832189ljn.4.2020.05.24.10.28.38
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 10:28:38 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q2so18327053ljm.10
        for <sparclinux@vger.kernel.org>; Sun, 24 May 2020 10:28:38 -0700 (PDT)
X-Received: by 2002:a05:651c:2c6:: with SMTP id f6mr9700653ljo.371.1590341318199;
 Sun, 24 May 2020 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200524162151.3493-1-rppt@kernel.org> <20200524162151.3493-3-rppt@kernel.org>
In-Reply-To: <20200524162151.3493-3-rppt@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 24 May 2020 10:28:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHEt=c2A+xhjKbW_N7DrxH=EV70B1diY8nYHGio0Bf2w@mail.gmail.com>
Message-ID: <CAHk-=wiHEt=c2A+xhjKbW_N7DrxH=EV70B1diY8nYHGio0Bf2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] sparc32: srmmu: improve type safety of __nocache_fix()
To:     Mike Rapoport <rppt@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        sparclinux@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, May 24, 2020 at 9:22 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The addition of the casting to __nocache_fix() also allows to remove
> explicit casts at its call sites.

Ahh, bonus cleanup.

Looks obviously fine to me, but it's not like I build- or boot-test
sparc32, so this had probably better go through somebody who does.

               Linus
