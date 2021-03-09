Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1A4332EFF
	for <lists+sparclinux@lfdr.de>; Tue,  9 Mar 2021 20:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhCIT2b (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Mar 2021 14:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhCIT2B (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 9 Mar 2021 14:28:01 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E3FC06174A
        for <sparclinux@vger.kernel.org>; Tue,  9 Mar 2021 11:28:00 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u4so29140257lfs.0
        for <sparclinux@vger.kernel.org>; Tue, 09 Mar 2021 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YSV6ncCEG+y5BT6rnDei0hUzTGyRtar1eyCHbKmYIA=;
        b=BpWbaJ9DlLjy2lfPpHHbAiFzYeSNCksb4Sv0yGoyTicKvDXTpdNBSZ7heRe8GWAlkK
         7jxNeEasX8wDIReyMSzEJ3IT0qEmKc+QxIc+KBE4tiKufvfrah/5FjjvwYe/10dRerGz
         feWcjIGoH/8abiiwJ84KXJOLDap3HzPPhea9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YSV6ncCEG+y5BT6rnDei0hUzTGyRtar1eyCHbKmYIA=;
        b=FiO4pnjZKRSuvStUUK9GXJsSVPvJ9Ti9FtrKU1CsAv2jogjH+uqqI0wFT6fYWuppTN
         COzbIynjM7AeH7XUjrOJRHzpIQaKIv8SHv+LFYen0bgm8IX8Vk6KbrY4R6YvAIAV8Cw0
         50uNKMLKZBsMJrWPf5+AZ3cp67StoEUZXld2Pm8BuBX74iJ633+L68RCCHc3y4S6/7Bi
         EY0SubokuDVSqUm6pF8o6UEQ4d3pzBFh3gysNwJYoBfw5V4t3PnhxRXWhKsy19GNfkvB
         scj1k1lexR+tnkEZLteW7l5q1rBn5wdsWOLuXbJcXt19f3qSDJpclBKrzJrK3pgLUFnW
         Kslg==
X-Gm-Message-State: AOAM533Lw4GfsTg5FVlaGZcNeSif/B4rreOALNDJagON9c0dWAJRMfq0
        Bbo6J3nxSnYu9x4PbiiAzNuzlZjM2RcWVQ==
X-Google-Smtp-Source: ABdhPJxoJgv+ZmBE53SOZQhHCmksmHD/JZAwr6GRxHwakjZnf/gzNKhHvTmlP7uYun9FY3uYGHMQWQ==
X-Received: by 2002:a19:7f95:: with SMTP id a143mr17893369lfd.419.1615318078507;
        Tue, 09 Mar 2021 11:27:58 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id u4sm2053322lfs.61.2021.03.09.11.27.57
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 11:27:57 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id v2so16085012lft.9
        for <sparclinux@vger.kernel.org>; Tue, 09 Mar 2021 11:27:57 -0800 (PST)
X-Received: by 2002:ac2:58fc:: with SMTP id v28mr17816354lfo.201.1615318077386;
 Tue, 09 Mar 2021 11:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20210308.154619.729170517586257571.davem@davemloft.net>
 <37859f29-dc59-d6c2-6f92-abaae32ee4ab@physik.fu-berlin.de> <20210309.110812.234617387417457658.davem@davemloft.net>
In-Reply-To: <20210309.110812.234617387417457658.davem@davemloft.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 9 Mar 2021 11:27:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=whgiPiFy9Ye_t=fV9J8VdqgZW5XQcb-1z8PgpQbVBWqCQ@mail.gmail.com>
Message-ID: <CAHk-=whgiPiFy9Ye_t=fV9J8VdqgZW5XQcb-1z8PgpQbVBWqCQ@mail.gmail.com>
Subject: Re: [GIT] SPARC
To:     David Miller <davem@davemloft.net>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Mar 9, 2021 at 11:08 AM David Miller <davem@davemloft.net> wrote:
>
> I'll make sure that gets into my next pull req, thanks.

Note that it's obviously always easiest for me to just ignore
something like sparc entirely, but on the other hand, particularly for
low-volume trees it's also ok to just say "I don't have anything
pending, here's the link to lore.kernel.org, can you apply that one
patch directly".

(And yes, I prefer lore.kernel.org over marc, although for single
patches it doesn't make much of a difference. For patch series, I find
'b4' so convenient that I definitely want the patch to show up on
lore.kernel.org).

I'll await your pull request or 'I have nothing else, take it from
xyz', this thread is otherwise archived for me as "done".

              Linus
