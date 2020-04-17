Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38ADA1AE5F0
	for <lists+sparclinux@lfdr.de>; Fri, 17 Apr 2020 21:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgDQTji (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 17 Apr 2020 15:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730336AbgDQTji (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 17 Apr 2020 15:39:38 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55CFC061A0C
        for <sparclinux@vger.kernel.org>; Fri, 17 Apr 2020 12:39:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id j20so2352624edj.0
        for <sparclinux@vger.kernel.org>; Fri, 17 Apr 2020 12:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WzKVQimu3ESlVB170GYSJOENaF18bfU7cLNDNIZSteI=;
        b=mHtHAVYNT5JZZnVGIHZi5X824i3yZT5uE+YlBSIOx93Q+LX4BltKkSrbipjUYHsTIH
         EBaywnHhLgeEmDtUCAPF0vX+LPY5Z58gZj+nPR6P10WzGlNjIBEbrIPYuuYmMNfAt1AV
         bpxnopY9fhR4EcBFOHV/j7skqPab5xA2axjghxGApjVm46iA59dblf3CkUVHe4PM/oGu
         PXynEb0hLa4//NzkM7RCTf+v3eNDyRtKUfA1FOuC0vaUE/g8+BrmCkGTlhlZLC+32LtF
         iv18YS6Qmz9G3IJyhu1VuKN5T77v8HUq2qRVDq/YO2nwS7dR0SB4Hs1iaf+Hf6D58/8c
         3Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WzKVQimu3ESlVB170GYSJOENaF18bfU7cLNDNIZSteI=;
        b=lbR57jXvA9lGqXIEcN9azM8lAnsiM1B0rfkjLiNUJc8eFkp3Tni3aagjCI/HeRxmwX
         HojPFrsuOImvVJ6rT/AeFJrmCDNTGfdynM0pJMncoF69Q+3mVpNlLkbQDEpDjr2EquMi
         KsJp7FkiEGWDJx9EEceGuQzVeogu/jj98yzR8B3ditq+R8tWHUabw3lj/BkAkzhHH1QF
         fYihw5q7imjgs4zLb98ZQUNdF4VbX175/VgqsmFNkjptBgc3UaQttKMRC2akWhr2zCUe
         FIH7FiTzbrXTIOZo0h3K7xk0gjqF+YG9OvB1bEjERZftdHKi3q/f3YyRPS4FpKSyGBpO
         kPYg==
X-Gm-Message-State: AGi0PuYGQnsVnlyGA9Gghtx7NU774il9Od2E6FDtQL2UczTlCOOT34yE
        Hp6bazeSBt6Sxn+dw3hqSco7RtxjLOqDgiyndGOFAA==
X-Google-Smtp-Source: APiQypI1253QAZCLA/QySP2h0NzUkLibbcuvgBgB8KWReodYKs9/0ZFxq/1MY3zXi6y4Jwgbz72Dpsy9bzBTTSJo4c4=
X-Received: by 2002:a50:ba83:: with SMTP id x3mr4386922ede.193.1587152376260;
 Fri, 17 Apr 2020 12:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200406202716.4008090-1-mattst88@gmail.com>
In-Reply-To: <20200406202716.4008090-1-mattst88@gmail.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Fri, 17 Apr 2020 12:39:24 -0700
Message-ID: <CAEdQ38F174h2WkdNj1DUuto8N1wr58=7AqpS98YFBMwYCZ4RaQ@mail.gmail.com>
Subject: Re: [PATCH] silo: Allow building tilo only
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Ping (and for the other 5 patches I sent as well)
