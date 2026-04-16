Return-Path: <sparclinux+bounces-6716-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG1LMkvI4GnjlwAAu9opvQ
	(envelope-from <sparclinux+bounces-6716-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 16 Apr 2026 13:30:19 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AD40D6ED
	for <lists+sparclinux@lfdr.de>; Thu, 16 Apr 2026 13:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06696302F7F1
	for <lists+sparclinux@lfdr.de>; Thu, 16 Apr 2026 11:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CF03A8FE6;
	Thu, 16 Apr 2026 11:30:17 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE33A875A
	for <sparclinux@vger.kernel.org>; Thu, 16 Apr 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339017; cv=none; b=UxD+fmLxNkmU9LbBQC0RLZoGOx+jnlHaw8YFoO9y9HeTZ742RRB4kPF/nZW1V6SJcigDs3RmNPgG3QowsM5VLUezKvNP9tk4HGHeDNOlANsCX6Zfyt9lxUmFby2647lgjaDYI+pqgjlldBk1VmQFZu3bipBTIXQOnIt9O9slqTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339017; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXCd5hk0azNf9YbhnAj16W1TnoPztbQPFRFmo5LZcGCcLQI6trKZO/xbzfdISMogdKKmVc9Z9jWSBHFaqLLx23Cu4ActsTfr4qWS4nzIqQlGdx9hrSpruH0W7UUOWr33t6r9O25o5pQobNh3mWIw5IzKAQRcLR10GLCAjbqrMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-40ede943bf0so4770184fac.2
        for <sparclinux@vger.kernel.org>; Thu, 16 Apr 2026 04:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776339015; x=1776943815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=pJHukSNOa2wozyoz+7zh6GyC5GvVZgZjJ79QGN64ZP7MK1V2EHBoNUB9auQct3I82d
         OT3gNHdB/PCOUtNZV6WAdCCvrzyWwXtOxRdlR4/cYwAfOYszrhHhWAsfo0LJOzOPRS1z
         u1FzZL9pmp6BY/feKmWNFqMpt/sjcNRodrM8XsCfELH4fCWgXR+s4Atv41BQwSFvmWq/
         oow82qvI2qZtj0MwkFU/MCFmmXRRANWfwQA4HjrfguFLgtE/h+FeN0UHkshLTLYno43o
         RR80zZHhR3aA/KG6d+bdcGo/IpUHYig7vEN3VY0z+mJeS63UJxklKcjUbR5XsmKclmr3
         ggsg==
X-Forwarded-Encrypted: i=1; AFNElJ9V58vvZbcgoOYDI+OltMhMmQVhn1zGIm+dCBFW0+TTO97KDlnD6885Kh8O1x1j7Nd+QEDlIQAuH6ir@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJAtD/SQqakttPOz7vI799wdqEhFXI7OHM+D//nB6CrW2u8ZZ
	gEzjoUB8kgbMd1DakC7f3WAmYl8IW8X2dQP+EhiQSBZovdnBn9e4w1vhEn+qAGPx
X-Gm-Gg: AeBDiev4xrtFF46fpSWBzMUTlP7ajm9gd4OsGM5+VqMXDe4lq9JuD3EMBZQIw45wwoa
	s8O4ESY822Y0hE+F/OLw6yBULnAOq4Oo6Jmoyg8Fp+RV0DTKvEHeFTZsUKeUeNQiS/C2bF7klvM
	IgxYVe16T8zT/c6+pSPHHgoKLyeXguImmBbvaIlM9F6Wqc8wANOyt/8bKB4ztZK3DZWrduYqf4A
	2QK4LsQBBJvdqUHqxdbxj2EOGoGUVDM/hrx8anuEMnU7vvWVEeCebklSTIrXPbaevs4GtpK2XPu
	k3Ogf0TCRoOdIfIrKt6jKGLnat8W5jNQ27FcMWKQ7TIAGH0X1HGpJVTgF53qEvxgMHYvMxvfel6
	LI7VQhWeOjTp03iBfer2g8Vyl4bY4TBLLpWQzYRrCZrc0hZnRA+GI70wKVr2fnuRticWnZbd4p9
	zddWKufsBRRZxYo98HhLreoUQbXbxH/tXm1Ap8Nno+6hjsqe5mXw6mvkHLks9VhlIOLlUey7c=
X-Received: by 2002:a05:6870:45aa:b0:41c:6512:8419 with SMTP id 586e51a60fabf-423e10dbd2cmr13932555fac.28.1776339015270;
        Thu, 16 Apr 2026 04:30:15 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4268963be6csm3521020fac.10.2026.04.16.04.30.15
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:30:15 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40ede943bf0so4770174fac.2
        for <sparclinux@vger.kernel.org>; Thu, 16 Apr 2026 04:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hbOtdFHskOgEgdb6Y4YUDTyc3DfVo8TnY6wdwOkv+2Wo4bbWN48PjBGwRMyqjy2xzqpXJDsukG5fP@vger.kernel.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,linux.intel.com,lists.linux.dev,pengutronix.de,gondor.apana.org.au,kvack.org,infradead.org,plugable.com,mit.edu,linux-foundation.org,gmail.com,google.com,googlegroups.com,alumni.ethz.ch,zx2c4.com,linaro.org,armlinux.org.uk,lists.infradead.org,arm.com,lists.linux-m68k.org,southpole.se,gmx.de,ellerman.id.au,lists.ozlabs.org,linux.ibm.com,davemloft.net];
	TAGGED_FROM(0.00)[bounces-6716-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,sparclinux@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[sparclinux];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 462AD40D6ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

