Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5154EA368
	for <lists+sparclinux@lfdr.de>; Wed, 30 Oct 2019 19:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfJ3Sej (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 30 Oct 2019 14:34:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41962 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbfJ3Sei (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 30 Oct 2019 14:34:38 -0400
Received: by mail-pg1-f195.google.com with SMTP id l3so2030587pgr.8
        for <sparclinux@vger.kernel.org>; Wed, 30 Oct 2019 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tHSogeK+yt1DUUuBmWj42bpihi2dqShY6piKNSwCQ7U=;
        b=d6DG2M9AyXAJdRSBRLgIL5V4A8Wbx0+3jLgPCZOAtM0Pal7I8rxrnLh3+awvr3eEnh
         3z3FEIquUN013mfYDZ0LduMjWZtHsVSB4PXNa3GDkcfg+mfxdbiNp+9IyE2tLSc6Ts18
         gv/4MPhoR5u1chMbs78GSK0kQcySnwJ3M4/nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tHSogeK+yt1DUUuBmWj42bpihi2dqShY6piKNSwCQ7U=;
        b=eevXK7n4aP+G5KH5QseyCB1kBU/kKCErciunlajqtrMsnuejYaKipvrAq+7i/Rj2VT
         w8CEIwqZfrtqepKnuKu9Vbh5fpjeyCOijdAFJyeP7qtjY5SqbK4D++PuSjLwM3Ttd7WM
         YtP8iaLInkO2RAwuJK6k+nInDcwhNcRGkyO8B0EYWY4Y3zYQ1kKNXUiENqR6WpIkrZJ5
         Bh95pazNOKoAPQCLB5CHv2YOAjtcHofXHX+VI3R0GSadK3RIbyKocC1klhJNxCodXQnZ
         OwY7n3kPle9/7x5wbN0UC76wfA3GrtbOSD+36sxOCzGhjMm9EI8AYKSifzXCqqH5CTdB
         KVvw==
X-Gm-Message-State: APjAAAXegSDpnNvhq2bI1UxPZy/pDe0SKZ7bznX2VQsG0V/Kymjyg1Vh
        rKJhJznL/jv+3rTcCCMYcESnWA==
X-Google-Smtp-Source: APXvYqwwHQfDOO4WMI4IprHNAu2U0ReqxJq4F1aFs9FpyfyqJcZt57TVhar9aYartJPQpCKq/TI5yQ==
X-Received: by 2002:a63:fe16:: with SMTP id p22mr952562pgh.318.1572460477658;
        Wed, 30 Oct 2019 11:34:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r22sm846151pfg.54.2019.10.30.11.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 11:34:36 -0700 (PDT)
Date:   Wed, 30 Oct 2019 11:34:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] tty: n_hdlc: fix build on SPARC
Message-ID: <201910301131.2739AA83@keescook>
References: <675e7bd9-955b-3ff3-1101-a973b58b5b75@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675e7bd9-955b-3ff3-1101-a973b58b5b75@infradead.org>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Sep 30, 2019 at 07:15:12PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix tty driver build on SPARC by not using __exitdata.
> It appears that SPARC does not support section .exit.data.
> 
> Fixes these build errors:
> 
> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 063246641d4a ("format-security: move static strings to const")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Wow. That commit is from 2.5 years ago. Is the SPARC port still alive?

> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  drivers/tty/n_hdlc.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- mmotm-2019-0925-1810.orig/drivers/tty/n_hdlc.c
> +++ mmotm-2019-0925-1810/drivers/tty/n_hdlc.c
> @@ -968,6 +968,11 @@ static int __init n_hdlc_init(void)
>  	
>  }	/* end of init_module() */
>  
> +#ifdef CONFIG_SPARC
> +#undef __exitdata
> +#define __exitdata
> +#endif

Shouldn't this be somewhere else? Any other driver wanting to use
__exitdata would need a similar patch. This feels like it should be
handled where __exitdata is normally defined?

-Kees

> +
>  static const char hdlc_unregister_ok[] __exitdata =
>  	KERN_INFO "N_HDLC: line discipline unregistered\n";
>  static const char hdlc_unregister_fail[] __exitdata =
> 
> 

-- 
Kees Cook
