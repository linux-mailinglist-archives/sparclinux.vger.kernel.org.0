Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CCF165A1D
	for <lists+sparclinux@lfdr.de>; Thu, 20 Feb 2020 10:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgBTJ0T (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Feb 2020 04:26:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41648 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgBTJ0T (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Feb 2020 04:26:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so2496614lfp.8;
        Thu, 20 Feb 2020 01:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jWL4OlWg/ImsZ63WRta4BWWVgqBXfj6sTueyX2l3ehw=;
        b=FRjY7eWoShhLInLVqivCbDZmz3Tzaed2/S4StccntngX7sjwsp+gpyCqhLFxFaOSOO
         ujSEGd9NgGayusZyXzghE2ftdkD7kZQPajX4sB6sxR0ajJxcJW9AEjSEtBg/7Z8J+y+U
         Q7cRJRA1L7NdgmBMdEXVSJtfRJzdjNu5o7NBFaOzUuEActSwDZHIlikxvHOmN2PlnWhe
         ADvc9wsv1SIHgb3pfcSx9Cr8Q3de6uKcYR5H8hDTCx3mfYdEGU6Obf9NIKJ990Ucw3zC
         wcU+sCbS73CcMQx8hAkJ5U0bNWT7lqIX6Gm6vjDS2XtFk07wa2ZmDzhQNUSNMjZlnMjV
         92YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jWL4OlWg/ImsZ63WRta4BWWVgqBXfj6sTueyX2l3ehw=;
        b=s6SHG9KShoeA60Y/HkS7NIQ5bM8w0pGNN/AZdya2zaUSya3NmnXHoJAsSsa1AqiZfe
         6hpElPRlNuup5ptFQUJC/DNpcxRb1wItMLjlA0JeHR1KHUxgaYajRbRQn+Myz0U/YCkB
         68J0RHMJtTwcffIb8CkawWOVEAtE/ExauZ6W/NBZxkCG/xiXOU+8l2omy1CVr9phhz+V
         xM3M83/LSOmg50wa8RjBXazgvaiIXCt6UAb9xRQ+6aJAHoagKfJT8Xq7BBXWGD9r0HKj
         /PCroNAU3ZOQgIKLUwtqWsMbSH2KOHuY41ogJavmoZMtWsa7t78IX+QK6Mgpbf6lhr4C
         jKSg==
X-Gm-Message-State: APjAAAXGyZbO0MvCUQ/0U17rTurZcEPAt1cF4LKMVsS8ULIhUTop5Plp
        wsI7c/J/wXnGZGuXIWV93S9NYBzAaoQfC05Ps83LKQ==
X-Google-Smtp-Source: APXvYqy0eAlphZlkrP7jg0My9wepzrhcr9QemESkO8toScsiMUqiVlVjsI/0k8VPy9q2ShDz5AEXeGmqrYrpWAGcG6k=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr16242179lfh.26.1582190775281;
 Thu, 20 Feb 2020 01:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20200220071140.14080-1-masahiroy@kernel.org> <20200220071140.14080-2-masahiroy@kernel.org>
In-Reply-To: <20200220071140.14080-2-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 20 Feb 2020 10:26:04 +0100
Message-ID: <CANiq72nWs3c2MWGTsG=zvDQ21B_=_Yaw3AhRhHDBAr2xFJwF_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] compiler: Remove CONFIG_OPTIMIZE_INLINING entirely
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        sparclinux@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Feb 20, 2020 at 8:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
> forcibly") made this always-on option. We released v5.4 and v5.5
> including that commit.
>
> Remove the CONFIG option and clean up the code now.

Yes, please!

Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
