Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3442614F7AF
	for <lists+sparclinux@lfdr.de>; Sat,  1 Feb 2020 12:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgBAL5y (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 1 Feb 2020 06:57:54 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44882 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgBAL5y (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 1 Feb 2020 06:57:54 -0500
Received: by mail-ed1-f65.google.com with SMTP id g19so10758911eds.11;
        Sat, 01 Feb 2020 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WbacjhfsD5YFjIEKkCcLFgmkGeANXDT3zXT/nYNyCn0=;
        b=tUDiVCN+DVkc2IT547sSeddAj7ldL/49uq3vXnRO7UuhHhh8iHH2VdUtHBfHj7j6XQ
         uV6qwLZSVwLUYz5TQ5biKPLrI6LlygfqE3QB4qVlWYqL2c/8TFsd8bdwAXzNAs8tJZgE
         taPv270bnjEamkXZUWw0dkhvJjGylmWVrvFd7JMoh4nqQJG6cfvHEkz9T2iofXnog7++
         k5ijCKkwec9G86ZA8XbQPmIZ+7MCS6fOlm8xnMv7ADOOijzoOluYZETEssli1Lh1BZIZ
         BY0TGVfdHm6r7zm4eG4DvMtBq77SBuaYybW1GsJzoJcLgURs4xhkYQjaIEb/+CPYP7oS
         Df3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WbacjhfsD5YFjIEKkCcLFgmkGeANXDT3zXT/nYNyCn0=;
        b=RuI1HQvPKTHdE3tSN77sh+AwE+jaYL6NdDGAycUTlC2BniWwe2P3UnjJj69nshZZcj
         JOk9VJMnHuKfWtfh1rb7FBU1tQpL9OwXoSAons24OIW8Q0dNwYiMC5szUF2WQ96Co/We
         /NtFzkouk8bJx6uAoOOLFbLr5bCUn24g6+6Tgxq4rvG1buNDEexoxPk8LJu8MYp/I26V
         rffrkej2bAzN/xx8ep8Q+rK2yf2NBhPntN0LHmbeLmd6ar1tKSKwwd0VwM6c3DGYV8dW
         1hgZL+zBZj3JrahirE2E5ZzqoGjcJ5oSd5/mg/CqvJUUt3YBbjGrHx461C4GmP/i2y0f
         i9qQ==
X-Gm-Message-State: APjAAAV25nJIKNSZOkSKHj9+ZiAAbMcuWLsj3GISIdFILLYdGlwBP9tJ
        DUtJwECnISs4ipYx6dBCNdwkCkLjz81HLX2300Dyxw==
X-Google-Smtp-Source: APXvYqyUlyW7gRONIC3ZuZEd8f0vMdZtHy1xZsofDI679YT3x/8Gh1T+VXqHs+uN6aeQyOpxDDkyqe/+QSH5hySJ4wI=
X-Received: by 2002:a50:8326:: with SMTP id 35mr4461006edh.235.1580558270847;
 Sat, 01 Feb 2020 03:57:50 -0800 (PST)
MIME-Version: 1.0
References: <CADxRZqy3LNu=DW2Mn8G6E-Ewrg2Q4gDXbxFqJXyfcDom4YW_oQ@mail.gmail.com>
 <CAK8P3a0eqbczcNJhNf9hXPBhUoscZD51d9PSs=vwH564u=7XSQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0eqbczcNJhNf9hXPBhUoscZD51d9PSs=vwH564u=7XSQ@mail.gmail.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Sat, 1 Feb 2020 14:57:41 +0300
Message-ID: <CADxRZqwBPJVa9EBeP2++bojgiJ-K1s+3LCm_Y2_KT4wDcUGZeg@mail.gmail.com>
Subject: Re: [sparc64] stall on CPU with current git master
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Jan 31, 2020 at 7:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jan 31, 2020 at 4:07 PM Anatoly Pugachev <matorola@gmail.com> wrote:
> >
> > $ git desc 251ec1c159e4874fbede0c3c586e317e177c0c9b
> > v5.5-rc1-19-g251ec1c159e4
> >
> > kernel 5.5.0-rc1-00018-g4f9fbd893fe8 - works perfectly (i.e. does not
> > hang or produce "stall on CPU" )
> >
> > current master with the patch reverted -
> > 5.5.0-07763-gccaaaf6fe5a5-dirty - works perfectly
> >
> > current master 5.5.0-07763-gccaaaf6fe5a5 - stalls, hangs
> >
> >
> > Can someone look what is wrong with it and/or probably revert it ?!
> > Thanks.
>
> Thanks for the report, I think I found the problem! Can you try this patch?

Arnd,

this patch fixed issue for me. Thanks.
