Return-Path: <sparclinux+bounces-381-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744A8620AE
	for <lists+sparclinux@lfdr.de>; Sat, 24 Feb 2024 00:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EBD28554B
	for <lists+sparclinux@lfdr.de>; Fri, 23 Feb 2024 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A4D14DFC6;
	Fri, 23 Feb 2024 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VexPIpQy"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C0F1419B3
	for <sparclinux@vger.kernel.org>; Fri, 23 Feb 2024 23:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708731161; cv=none; b=OzkBLLkVBJLW3Q6IuhC+NZckeo1Z5M3xFOmM5nxZ7yJ2KuyoaD+9J9q7Brj9eOUsmLmCky8Ed/Z6JEVyPCm2UTQpowrYfGTFJxF6tA9JNyN7Uhsgb1EzjljNDxG8bWGiwAVNCkRs5SElrnMLSq3GFJZo1pHC7IWX8wEUE4HiAMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708731161; c=relaxed/simple;
	bh=qAlzQZJ5HuSuEuorKunTFjf+EG4KPnsGK6iZyg24Wgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CObufBj7qiiu5eBgHH0WX+Qsh3UND9Kcub7hHVw7SPEzh8FXBNMqrlHrVFIV7SHmyYoGq7Y8iKjymriuwlFtzivHe0nOJSsyk/OE6xWRCIsHuPjXBm4o3HtvM7pjjD/mR6CVoOutj6w3uK7bdkljP8qLLv+1c8IS1UOdWdJg+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VexPIpQy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e47c503fb5so1036643b3a.2
        for <sparclinux@vger.kernel.org>; Fri, 23 Feb 2024 15:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708731159; x=1709335959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MiC/Y9ij7qyWusfGRR5nYD1rSzZT16R0qiyjbvTN78=;
        b=VexPIpQynMJpr5w1yrIXPjAHDjOcx/VUBRL5eWcotfubjmLqsciY4Wsxxis3HmKkFo
         WtpoxrUMOkMj7sQERAk15cnPPl3VC3cyxgslb8DQ+qpJxlWkkWhAkY7mX8O/1C4g27KA
         dPTuGwDDEGOABbeO/q5ElywMCB9JAMbYJ88vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708731159; x=1709335959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MiC/Y9ij7qyWusfGRR5nYD1rSzZT16R0qiyjbvTN78=;
        b=l/0uKBjD66Z0BsWFWLQvEoUsEoH4iosnZtb9u1qCzLwEE8qXL1DI8JV2NIS+jXVgPH
         1SW3yy5EISF2C1op4rcbvtzjq2CZscStnTkr5iQB83/cH9YlgV+q2n+suV8p5g/ILaZp
         2PAUTkWl7IBydfTPbR85tSdaAbzQzen9oaYEWmOzVoTB9KjvLYPjIFn9nKSYWg6dT3BW
         xXxhEsujXGUunZphclXEYDmNQZ9ZmFjVyrk1My6TFHzjW8worqJ2eQBUkP1BQ3foE/+l
         lxTy3npI6wojyRzxUFiAi05eq/8kDnhWff3dE110aNTuZdkP1PYVZGhpblsL1USDtr4J
         Xtyg==
X-Forwarded-Encrypted: i=1; AJvYcCURU+WOoPKaoR5lblPjlAei77v5g9jF88JiLWsDVNDjXp9E+tvkDMPqJ4RN3HvOyxEWVax4FQ3MfN931lXkkKQNud0VgJXxQF/jSw==
X-Gm-Message-State: AOJu0YxFvuNVaoM5+8NRS/VHIw/CoEZyIMYKXo42/Lq9EzfqRijhqDy6
	sDI3g+czT3IANIqYgmQkas1kGM0yGMY1cqJV5KZS9xK4Lu+r2x+cB9m79BVQNg==
X-Google-Smtp-Source: AGHT+IHHbtlWvqXEAzKyFPhXFwCSzfqpoXYQuYUCa/E3PcHbBOBfwUkS3YRGeulfKSQAuy98RxjMlw==
X-Received: by 2002:a05:6a20:d386:b0:1a0:e463:fcad with SMTP id iq6-20020a056a20d38600b001a0e463fcadmr1483733pzb.2.1708731159688;
        Fri, 23 Feb 2024 15:32:39 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a28-20020a631a1c000000b005dcbb855530sm32149pga.76.2024.02.23.15.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 15:32:38 -0800 (PST)
Date: Fri, 23 Feb 2024 15:32:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Helge Deller <deller@gmx.de>, Guo Ren <guoren@kernel.org>,
	sparclinux@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] sparc: vdso: Disable UBSAN instrumentation
Message-ID: <202402231523.F9E3740EB@keescook>
References: <20240223165942.work.950-kees@kernel.org>
 <20240223182646.GA2825372@ravnborg.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223182646.GA2825372@ravnborg.org>

On Fri, Feb 23, 2024 at 07:26:46PM +0100, Sam Ravnborg wrote:
> Hi Kees,
> 
> On Fri, Feb 23, 2024 at 08:59:45AM -0800, Kees Cook wrote:
> > The UBSAN instrumentation cannot work in the vDSO since it is executing
> > in userspace, so disable it in the Makefile. Fixes the build failures
> > such as:
> > 
> > arch/sparc/vdso/vclock_gettime.c:217: undefined reference to `__ubsan_handle_shift_out_of_bounds'
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Andreas Larsson <andreas@gaisler.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: Guo Ren <guoren@kernel.org>
> > Cc: sparclinux@vger.kernel.org
> > ---
> >  arch/sparc/vdso/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> > index 7f5eedf1f5e0..e8aef2c8ae99 100644
> > --- a/arch/sparc/vdso/Makefile
> > +++ b/arch/sparc/vdso/Makefile
> > @@ -2,6 +2,7 @@
> >  #
> >  # Building vDSO images for sparc.
> >  #
> > +UBSAN_SANITIZE := n
> 
> When I read:
> 
> config UBSAN_SANITIZE_ALL
>         bool "Enable instrumentation for the entire kernel"
>         depends on ARCH_HAS_UBSAN_SANITIZE_ALL
>         default y
>         help
>           This option activates instrumentation for the entire kernel.
>           If you don't enable this option, you have to explicitly specify
>           UBSAN_SANITIZE := y for the files/directories you want to check for UB.
>           Enabling this option will get kernel image size increased
>           significantly.
> 
> 
> I am left with the understanding that only arch's that
> selects ARCH_HAS_UBSAN_SANITIZE_ALL would need to turn off
> UBSAN_SANITIZE.

Ah, right. So, I removed[1] UBSAN_SANITIZE_ALL in -next (it was the only
sanitizer using this logic) and this appears to be one of the impacts. :)
I sent similar fixes for sh[2] and LoongArch[3].

> Are this fix papering over some other bug where we enable
> UBSAN_SANITIZE_ALL for arch's that should not have it,
> or something else that enable it?

It's possible we should implement HAVE_ARCH_UBSAN, but in my testing
everything built fine with it, so I didn't opt to do that (it looked
like just additional configs for no real benefit). What do you think?

-Kees

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/kspp&id=918327e9b7ffb45321cbb4b9b86b58ec555fe6b3
[2] https://lore.kernel.org/lkml/20240130232717.work.088-kees@kernel.org/
[3] https://lore.kernel.org/lkml/20240130233140.work.887-kees@kernel.org/

-- 
Kees Cook

