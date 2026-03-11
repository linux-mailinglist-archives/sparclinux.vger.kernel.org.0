Return-Path: <sparclinux+bounces-6479-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMeHEd4rsWkBrgIAu9opvQ
	(envelope-from <sparclinux+bounces-6479-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 11 Mar 2026 09:46:22 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FAA25F9D8
	for <lists+sparclinux@lfdr.de>; Wed, 11 Mar 2026 09:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9F33031F38
	for <lists+sparclinux@lfdr.de>; Wed, 11 Mar 2026 08:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE353BF667;
	Wed, 11 Mar 2026 08:45:52 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A053BC681;
	Wed, 11 Mar 2026 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218751; cv=none; b=H3wJSkeYf/yB+rIemZ7L581b9Vzdi0uhv4L54XuomRwGNElpQMJfrUIQEIsDuEBDJI0niK/YpFXrraazR0ss+yuOz2LJj1oQ0l8DJWw2zEbuV28YWFFFLjxoitFOv2bautWl6QrehZ/Fk7Bb9FUXmdFF7wBJ4GtpNB9vsiNdn0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218751; c=relaxed/simple;
	bh=Tmt46hJ14n5mJT8WpkY0LC2/s3w1NMyJdvLKZ2I0GjA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TDNIQe5w1+RIe1CB4UW5AfOqSpfrm+ZB/QBux/cN9+p+XRP43UXXCgxDOzCnXPd6U9pk4eZ37ohKSmAdcUEZ/gMA+ilLXNyT08hgujZpgVmk/5NzF5zeEi1VOvdgWmCnJOW2+U6p2fkRJsgzb0PtyHlVoahIQJtGtZrkLvD/8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B2DA52ABFDE;
	Wed, 11 Mar 2026 09:45:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WEWZ2Vf5OE-e; Wed, 11 Mar 2026 09:45:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B927A2A8813;
	Wed, 11 Mar 2026 09:45:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XcOBs61suAQS; Wed, 11 Mar 2026 09:45:34 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 297CD2A87F7;
	Wed, 11 Mar 2026 09:45:34 +0100 (CET)
Date: Wed, 11 Mar 2026 09:45:33 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, will <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy, CS GROUP" <chleroy@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, davem <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, mingo <mingo@redhat.com>, 
	bp <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>, 
	x86 <x86@kernel.org>, hpa <hpa@zytor.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	dan j williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, 
	Li Nan <linan122@huawei.com>, tytso <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, 
	linux-alpha <linux-alpha@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	loongarch <loongarch@lists.linux.dev>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	linux-raid <linux-raid@vger.kernel.org>
Message-ID: <942530005.19163.1773218733711.JavaMail.zimbra@nod.at>
In-Reply-To: <20260311070416.972667-4-hch@lst.de>
References: <20260311070416.972667-1-hch@lst.de> <20260311070416.972667-4-hch@lst.de>
Subject: Re: [PATCH 03/27] um/xor: cleanup xor.h
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: um/xor: cleanup xor.h
Thread-Index: ROrz3iTmErkYXUli/cm3A2WDQMn1kg==
X-Rspamd-Queue-Id: D5FAA25F9D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6479-lists,sparclinux=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,mit.edu,zx2c4.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	RCVD_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[sparclinux];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[56];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.455];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Since commit c055e3eae0f1 ("crypto: xor - use ktime for template
> benchmarking") the benchmarking works just fine even for TT_MODE_INFCPU,
> so drop the workarounds.  Note that for CPUs supporting AVX2, which
> includes almost everything built in the last 10 years, the AVX2
> implementation is forced anyway.
>=20
> CONFIG_X86_32 is always correctly set for UM in arch/x86/um/Kconfig,
> so don't override it either.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
> arch/um/include/asm/xor.h | 16 ----------------
> 1 file changed, 16 deletions(-)

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

