Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432772A5BB
	for <lists+sparclinux@lfdr.de>; Sat, 25 May 2019 19:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfEYRH4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 25 May 2019 13:07:56 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:41455 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727195AbfEYRHx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 25 May 2019 13:07:53 -0400
Received: by mail-lj1-f174.google.com with SMTP id q16so2902067ljj.8
        for <sparclinux@vger.kernel.org>; Sat, 25 May 2019 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5ktK9kr4E0UpbbeaHLRBxZcSjVJhVPG4g8QF69sVmY=;
        b=blWPgG96+VVQqIzaWJtzwSPl1QZ1S0Z04iNWgu72UYrrEMJjAjb0uL1VklvosGRad1
         QjwqdkB2pvLto1OJmIjJxoAO0TOZpQ+qmzwwgKrs9zICCkP//YwaeBtPKJ0BOb1W3+mo
         iEJkOggeA90YvBtGTsZFgAObtE+OMxPecZ/Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5ktK9kr4E0UpbbeaHLRBxZcSjVJhVPG4g8QF69sVmY=;
        b=ieYwd13fSarWGBzFvUdrKqbJD8kq92LJmpd+CvLNBUnup1QqmRc6tzYwYLNTw+aSEc
         wiW0WDK2o495FXFf8Ay426oGHlSGQ9WFLHXTl3LW8VvSyjP55IpqoU7Q1OpyJe9xauHa
         PpChHHdM+lCeVkPhtsL+d7g/Ddu0wBkMCKU84U0XlUyZqYA53YAGbUG0jqNCDP/Xumm6
         +J0IRQi33qrcRET63GuUaYqHZRahVU2UZpj6QSI6CFztnIYGV7rSKf0uxD3YeNVHJXbB
         y4WEu+iMJMykR0oku042yd/wxklwksqSCpe+8ywVacqeQMCoi1kPLPhxVwcC2weNZR3t
         Mw7g==
X-Gm-Message-State: APjAAAWARv9+0gSgvWzEoyv9dlC294EBGtyzqz7bE4TtjeQ7Uv9nNElK
        8z/GBrV0GADk9aNRwcACJEYllgyaoLE=
X-Google-Smtp-Source: APXvYqwW0ZbtSZo6OZwMd6aRWbO3hSeGlcEtw2QD7x45VM2xS9jAnyaiaHsRK+I4Gztge11+jJo4iw==
X-Received: by 2002:a2e:818b:: with SMTP id e11mr56134543ljg.82.1558804071232;
        Sat, 25 May 2019 10:07:51 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id c22sm1169125lja.64.2019.05.25.10.07.48
        for <sparclinux@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 10:07:49 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id d8so9269843lfb.8
        for <sparclinux@vger.kernel.org>; Sat, 25 May 2019 10:07:48 -0700 (PDT)
X-Received: by 2002:a19:be17:: with SMTP id o23mr28987773lff.170.1558804068519;
 Sat, 25 May 2019 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190525133203.25853-1-hch@lst.de>
In-Reply-To: <20190525133203.25853-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 25 May 2019 10:07:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7=yxWUwao10GfUvE1aecidtHm8TGTPAUnvg0kbH8fpA@mail.gmail.com>
Message-ID: <CAHk-=wi7=yxWUwao10GfUvE1aecidtHm8TGTPAUnvg0kbH8fpA@mail.gmail.com>
Subject: Re: RFC: switch the remaining architectures to use generic GUP
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Looks good to me apart from the question about sparc64 (that you also
raised) and requesting that interface to be re-named if it is really
needed.

Let's just do it (but presumably for 5.3), and any architecture that
doesn't react to this and gets broken because it wasn't tested can get
fixed up later when/if they notice.

              Linus
