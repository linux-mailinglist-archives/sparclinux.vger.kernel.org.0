Return-Path: <sparclinux+bounces-7041-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gme3KB1fT2qGfQIAu9opvQ
	(envelope-from <sparclinux+bounces-7041-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 09 Jul 2026 10:43:09 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3896572E6B6
	for <lists+sparclinux@lfdr.de>; Thu, 09 Jul 2026 10:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-7041-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="sparclinux+bounces-7041-lists+sparclinux=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 959B7302DFA0
	for <lists+sparclinux@lfdr.de>; Thu,  9 Jul 2026 08:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4023F99E9;
	Thu,  9 Jul 2026 08:42:16 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043473F9288
	for <sparclinux@vger.kernel.org>; Thu,  9 Jul 2026 08:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586534; cv=none; b=GE+YgOGInCdqHhQB86ax5/sdcetplp72xx+cgeBFeZl39njEgD68vy+slNr8dzXTfj9gr44GvQzL3MLYKMz4C4m+eexIvILxanX5d0ODu9B2oZFMLiOFSWer/IFGAWiC/SSVOy19ax21iA5fFZgW9UrcO5wWBBuEtX7+GzUZ78c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586534; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2ay5/chJW8EPv9YUUPskHI4U/4AJvwACLlIHIBCwQGr1SI8w/gBLLMM7HII7GrIqRV87eomY+3IQxF6PTxgGPpYVUyLh7VMBgv2n4ToGZyKBQUQYb/xA4fenvptlie6G7Bv8ew8kfDG+mY/LqNZLFi/Rn1mxGOP1vUz2ghmRvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bef75a83e4so497811e0c.2
        for <sparclinux@vger.kernel.org>; Thu, 09 Jul 2026 01:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586530; x=1784191330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=TA/e6CjA/t9+lY7aMTJrA4sA6PuZUgTfRewg9SzQHggNqVzOVVUQwYZCa4/+xniyXb
         T9+btn9922y1wKK6yTafjNOvx8uAKET9Gya+2Zl2rTJeF/5U+zwClp42jC/OLOUcmKbr
         fc/jXG41whZBlaoWW42MimIlC8ZXrxYDKE9oy5eNMsaemJ/rZRPL1LCleAW9Ihsb9wQi
         pgYnpXUATvfhWXoWAeziWo86tVJ8cKEZOu/5GNGLyEIqJwpfGkWBwMSpghe1Ou83l73x
         2FLkECBx3NcgVBxx/3eR1GbfqHX2ZaaJpXIjvh8YvnOkPD/l7BLRloHec3OEv/IApUex
         ncNA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5TDR6y2vWillU6YrQiWVOQAE/bThANQqp4r8Uc6DYGhpLngCFH252HAHkxn+wbUy3LszYpBFtAmjh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/LYY9iyQSELeLxdJsh4+8DCEuvYUw7jDSNnQFiQuDivDk5Ae
	x30tD7Y3kaHpO7ir7KchdS7l3R0qUaqpUoPjfrooSm0+a9tgNbR6h8CwCwTfU1EXhsU=
X-Gm-Gg: AfdE7clWXZcA0/A+/8pleJvb4qHSobf1cnfAMS/LrQPVNmzjOhwHAvRb1F0X9e1FxJG
	cyqpTlNMd0qhWI/F9ZN0LQwQfhVbJI7oXtS7vZjaRq48V2QuQGdnrp0ONxnrptFzDL+TAxchHhB
	j1wFMIty9LpymXVY7TQFAvpIaVm0d3UvE++agf1SA1ZkSDDbjsfJ+k9aSkH+oaU8KEchc533MyV
	JVut/wNa3yYWiGf2Ibbd1EL8BOiX3pJ9MZ3OS2H9lEsOOADImGoV83Sox8447WKmSbfcTYqJT0R
	xx/AWBz4FWr6Ah/j8onah9EX6cOx/WecXlfQQoEDCPU4wPFTxAnAWoNf28RwHgg1G6WXUdZ2X9K
	e8idDxd6Z7It3Ekst63a8+mzCONfFKwUK4Xke3zhaAIqVLDslnzouyOe93LTw3n2Uslo+aAbPDr
	QhEEZAvRvzUgSq2h9Z9TaTGkDsgBNKroYC1iuW0dtgAz1ivr7gSA==
X-Received: by 2002:a05:6122:4fa2:b0:5bd:aa13:c992 with SMTP id 71dfb90a1353d-5bf75f05075mr3319094e0c.12.1783586529776;
        Thu, 09 Jul 2026 01:42:09 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm3375373e0c.8.2026.07.09.01.42.08
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9696369925aso494414241.0
        for <sparclinux@vger.kernel.org>; Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqV68C1c4f34l3ogB9lJf9LbVoN5GdKHLrb86Y7bG2xdDdLcWewIkjC7lN20O9giH2QALq/f0PjpqL4@vger.kernel.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7041-lists,sparclinux=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,arndb.de,redhat.com,linaro.org,kernel.org,armlinux.org.uk,arm.com,monstr.eu,alpha.franken.de,gmx.de,users.sourceforge.jp,davemloft.net,gaisler.com,zankel.net,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,huawei.com,nod.at,suse.de,lwn.net];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:arnd@arndb.de,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:vgupta@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:guoren@kernel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:tsbogend@alpha.franken.de,m:dinguyen@kernel.org,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:davem@davemloft.net,m:andreas@gaisler.com,m:chris@zankel.net,m:linux-alpha@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arch@vger.kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:l
 oongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:richard@nod.at,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,sparclinux@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3896572E6B6

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

