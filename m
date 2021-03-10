Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B1A3332B0
	for <lists+sparclinux@lfdr.de>; Wed, 10 Mar 2021 02:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhCJBRp (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Mar 2021 20:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbhCJBRn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 9 Mar 2021 20:17:43 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3C0C061760
        for <sparclinux@vger.kernel.org>; Tue,  9 Mar 2021 17:17:43 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e20so4254418ljn.6
        for <sparclinux@vger.kernel.org>; Tue, 09 Mar 2021 17:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a13kYin//Z1Uu0mBwEjZfHHvzWPjQ9yqWl+iSWde6Xw=;
        b=CAL9qlfmA4i7sZIwO00pPz1JRzgj2hwsui/qlV72baToSOmv6zFT6FPa15cuKcOe9Z
         enEm3ob5EDI4NU0Ipb0OpUMgYUU+J75AtbgiItNaNKJnfXzEBJIBscxnH89AXxoHt3Uf
         ZA/Jj3HcAaL++BrkMIo284txFsXhlPb2wnFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a13kYin//Z1Uu0mBwEjZfHHvzWPjQ9yqWl+iSWde6Xw=;
        b=VIPth6cVZ2vTuZCNbgBKB++E1PHjTB2aXZil5Hvox55NbaqKTM+9QJhYCA9M8w16gR
         LscaBeBIVINvvHonoM4OC5t/MfRbaLmGuGeBVfKMZ5zDHkxykyIS5F4/ZF3VpYBHpw6Y
         zY1namw6iMIqgFtXuf/owulQauCWh0U9NzMmLfcYKPqtw1ZAY08TwjR5tmdtvIvwe4zk
         Y5F4kcKJ1L5VNpbi5oAdC6WIlOdJaCyfnv7uj6WQilI1lfbxhiAm9wdDRW+gJpnluxU1
         nKp+OhQDUhj2nZkn1an9A5e8jTCOGILUwM80aIBfp8uyXLdwtQDtvnEsTYIVK6UGit3v
         ZfTg==
X-Gm-Message-State: AOAM5309Ibgh4Ew7WeT4Cqvwg1703E1OH7DhaLeXhr5xnubsoEFbYFZX
        kbQESQI8hUuWDYdge+EIsI8vpu1A5/AKcw==
X-Google-Smtp-Source: ABdhPJziBjb5osHOoAznMalBvXKJCdAEXfSfUkMEzaBoDLLxbxCM5otgpm9vI/k5vQwcvFyYue+xkg==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr266331lja.21.1615339061472;
        Tue, 09 Mar 2021 17:17:41 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id t17sm2329081lft.224.2021.03.09.17.17.40
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 17:17:40 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id e2so23317884ljo.7
        for <sparclinux@vger.kernel.org>; Tue, 09 Mar 2021 17:17:40 -0800 (PST)
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr248823ljj.465.1615339060263;
 Tue, 09 Mar 2021 17:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20210309.110812.234617387417457658.davem@davemloft.net>
 <CAHk-=whgiPiFy9Ye_t=fV9J8VdqgZW5XQcb-1z8PgpQbVBWqCQ@mail.gmail.com>
 <20210309.162454.822491855062735992.davem@davemloft.net> <20210309.171540.1612415953102779664.davem@davemloft.net>
In-Reply-To: <20210309.171540.1612415953102779664.davem@davemloft.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 9 Mar 2021 17:17:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgvDZRBoWfynXPDOzTTyD7Ms3UzqVw_K1zzd5S2asn25g@mail.gmail.com>
Message-ID: <CAHk-=wgvDZRBoWfynXPDOzTTyD7Ms3UzqVw_K1zzd5S2asn25g@mail.gmail.com>
Subject: Re: [GIT] SPARC
To:     David Miller <davem@davemloft.net>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Mar 9, 2021 at 5:15 PM David Miller <davem@davemloft.net> wrote:
>
> Somehow you pull didn't get commits:

Look closer at the pull date. That was before you had updated your branch.

I did a second pull just moments ago, I'll push it out (along with the
networking one), after all my tests have passed.

            Linus
