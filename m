Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9634F333D72
	for <lists+sparclinux@lfdr.de>; Wed, 10 Mar 2021 14:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhCJNO4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 Mar 2021 08:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCJNO0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 Mar 2021 08:14:26 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809F7C061760
        for <sparclinux@vger.kernel.org>; Wed, 10 Mar 2021 05:14:26 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id z6so7789581qts.2
        for <sparclinux@vger.kernel.org>; Wed, 10 Mar 2021 05:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i4dG9xJvqkGEbFc0fgT2XqvVM8WvMQXvNfE5Ut+I4aU=;
        b=QjmxrtYQShfM383UBrWDnagIy2pQtaF84M0RDuSG3Rkh/BYXDTbMgpt793nDm9D1IW
         OSBMYMnTVuMsy7lPfCsu48YdVbCiTbeQ2J4aT8a2EuUG/RJwDIx1vNcFxAHNAvD64f4C
         wdJasuSqMZACPwgPu8gferAumyxlVeoJMAtOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i4dG9xJvqkGEbFc0fgT2XqvVM8WvMQXvNfE5Ut+I4aU=;
        b=K3tXH2Q2DyyAXX4lrsMN1oEWaa22iFX8EVGtGzkCT+2JgAZbMnyFBgdhnQs8E2D/Hx
         U/Oq6YX7A/lWcKxLzznS3TGjJNW6fjfp/zHY3Zl8ACfUNp/xbJctIA3CH5DN8pIiNKdx
         wBN4dM2QfcD6+2paYWWCrXm+8UppPkBx64sg4M8jb6qiuMqc8JiWip9MbgKZP/HSdlwN
         oCHgbAMGdwPhBdY8mwhSIDxIMRn5rMkq/18BFJARuvqUIxGwQ5b9ywSosiGrYZDQZfSa
         ijvvtgGjux7WhbW6pwtj8vPUeZfbGxJkl7WhrY/YLvT/UJDOB0keEufvURiV79w4oUTp
         tAzw==
X-Gm-Message-State: AOAM532oM+uPl3Vv9z95sCUFaTxb9GWt8rxfXksaWQPVl8jeZDogum6d
        XlBuc6Xzo3U5K09adKsPKBj6SA==
X-Google-Smtp-Source: ABdhPJx1l4qv/EINvdCFYBKvMwrXdjRVZx557V+OkAPwdgFU2G5SUz0F1aTfuOlNb0Ej4/XXw7iQiQ==
X-Received: by 2002:ac8:5987:: with SMTP id e7mr2566554qte.168.1615382065509;
        Wed, 10 Mar 2021 05:14:25 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id p1sm12762184qkj.73.2021.03.10.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:14:24 -0800 (PST)
Date:   Wed, 10 Mar 2021 08:14:22 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     David Miller <davem@davemloft.net>,
        "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT] SPARC
Message-ID: <20210310131422.mk7sjmj3swrcz4g4@chatter.i7.local>
References: <37859f29-dc59-d6c2-6f92-abaae32ee4ab@physik.fu-berlin.de>
 <20210309.110812.234617387417457658.davem@davemloft.net>
 <CAHk-=whgiPiFy9Ye_t=fV9J8VdqgZW5XQcb-1z8PgpQbVBWqCQ@mail.gmail.com>
 <20210309.162454.822491855062735992.davem@davemloft.net>
 <CAMuHMdXAZzURKDWuLdUM=YZ8_OoYQAPuho8Qg3ckv3nkOujk4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXAZzURKDWuLdUM=YZ8_OoYQAPuho8Qg3ckv3nkOujk4A@mail.gmail.com>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Mar 10, 2021 at 11:40:47AM +0100, Geert Uytterhoeven wrote:
> > > (And yes, I prefer lore.kernel.org over marc, although for single
> > > patches it doesn't make much of a difference. For patch series, I find
> > > 'b4' so convenient that I definitely want the patch to show up on
> > > lore.kernel.org).
> >
> > Sadly, lore does not archive sparclinux@vger.kernel.org, so there
> > isn't much choice in this case.
> 
> Which is only an "ask Konstantin" (CCed) away, isn't it?

I'm in the process of creating the remainder of vger archives on lore, so it
would have happened anyway, but I'll bump sparclinux up in the queue.

Best,
-K
