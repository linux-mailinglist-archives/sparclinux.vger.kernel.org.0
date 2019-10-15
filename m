Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09735D7C12
	for <lists+sparclinux@lfdr.de>; Tue, 15 Oct 2019 18:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbfJOQk3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Oct 2019 12:40:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34342 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbfJOQk3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 15 Oct 2019 12:40:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id j19so20989020lja.1
        for <sparclinux@vger.kernel.org>; Tue, 15 Oct 2019 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLigqAqHeoSDYolD4nrgPm51a/3cpiBEJKjCG5nPgCk=;
        b=TRPFxdwFF1MomAtgrnoY/l4GnOLyZWFzwO6LqsuLvv/zuwCSIw6D2pfsPyXfO2PxgU
         t0NHZ0KYv60/XW4VyiCs5/xtRKMrD8G4rJqFWqnNCfStFkIhF56h3ZeEqmP5XYTX14Ud
         A4X3ic2c+SGohyC1uy0Vf00hv1mdFKOHHf6wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLigqAqHeoSDYolD4nrgPm51a/3cpiBEJKjCG5nPgCk=;
        b=GDsYCbMWLTy9HEuIOGvSOdU47y2mb31Aj/bvxQp6Tj2bn2F+2HTXA77uYpeTX4LY/f
         GbSksmY0nem2p9/cVD5Y6oglfOGbot0+uvGoM+sjcqxuNOty1RLRw68Ue5rXucDTAkZ4
         Wy/bNlKUftUeDkca0r/m+8Gi++OoPQC3HXHraTTVg2wFzRSjOumnkv661bXXAIhOoei2
         oJcCXz/mG1bFG7BixN9zU7ehKYvCbLVRQR7Na7YduLHSkvc0fywIlzHwomI5YVmy0DKE
         BKXjCc3w4zsleAIv7Az1yZS0FgYofZQepXg5GqwaqFQTJw3t720SPvAwfKdXRuCLhWm4
         FCXg==
X-Gm-Message-State: APjAAAVxPiVoNdi/vvF1x72LCYqzc3YztV8D0am5adQ5gFQIQcx+lLub
        zkKKouJD37UC7cTKkAlLZrA/H43nH8w=
X-Google-Smtp-Source: APXvYqxq8qVG7ufQKDXDGwEdXVo6UDuQeGyD89NveqPe08Cqct26e0cG+hyRFK6nqK+40XVcdwGqsA==
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr23414088ljp.26.1571157626031;
        Tue, 15 Oct 2019 09:40:26 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id c4sm4970817lfm.4.2019.10.15.09.40.24
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:40:25 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id m13so20914662ljj.11
        for <sparclinux@vger.kernel.org>; Tue, 15 Oct 2019 09:40:24 -0700 (PDT)
X-Received: by 2002:a2e:9848:: with SMTP id e8mr16594809ljj.148.1571157623886;
 Tue, 15 Oct 2019 09:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
 <20190818070137.GA22731@infradead.org> <20190818.123943.1491620523133670968.davem@davemloft.net>
 <20190819051055.GA32118@infradead.org> <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
 <25cbdd65-484e-7e50-ee8c-dc8745ece5fe@linux.ee>
In-Reply-To: <25cbdd65-484e-7e50-ee8c-dc8745ece5fe@linux.ee>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 09:40:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiW0xwg4ETaMovbmDug7Cf-gUrxH7FX7EnucktJF_Sj=g@mail.gmail.com>
Message-ID: <CAHk-=wiW0xwg4ETaMovbmDug7Cf-gUrxH7FX7EnucktJF_Sj=g@mail.gmail.com>
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
To:     Meelis Roos <mroos@linux.ee>
Cc:     Christoph Hellwig <hch@infradead.org>,
        David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Oct 15, 2019 at 4:48 AM Meelis Roos <mroos@linux.ee> wrote:
> 19.08.19 08:58 Linus Torvalds wrote:
> >
> > It does sound like we should just disable HAVE_FAST_GUP for sparc. And
> > yes, it's "only" an optimization, disabling it shouldn't bvreak
> > anything. get_user_pages_fast() will fall back on the regular
> > get_user_pages() logic if there is not fast-GUP.
>
> So yes, will we do this to get rid of that regression?

Ok, I'll just remove that HAVE_FAST_GUP - I was expecting it to come
through David, but I was also really hoping we'd have a guess as to
why it happens on some hardware and configurations but not others.

Weird.

             Linus
