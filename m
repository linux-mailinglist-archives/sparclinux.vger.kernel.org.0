Return-Path: <sparclinux+bounces-2110-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA17964CE8
	for <lists+sparclinux@lfdr.de>; Thu, 29 Aug 2024 19:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ED1F1C22068
	for <lists+sparclinux@lfdr.de>; Thu, 29 Aug 2024 17:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE0C1B6541;
	Thu, 29 Aug 2024 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qyZUgth2"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2131B6546
	for <sparclinux@vger.kernel.org>; Thu, 29 Aug 2024 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724952813; cv=none; b=MSBHyvJqriJ9xm96bDgF8sSA5W9hnhPKlUvxlR3bXfD3fz2BV9BVHMylYgDF9zWi67Jpvx0ynNrEDSI8XDP/s9cOy8YwsUZM95P8NgxKhlwn1q/VHOXVrPWBW0WNQpA1QJX0zfnu3L5/B7R4kwYWQirHLPPEc6yH/Wl3TrTXWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724952813; c=relaxed/simple;
	bh=xq019WSbU/+BH2MTqfSQdLA7OMmY7hhfvIXVLV7r5gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbuUY3AIxsWOqVgHRu4gdvgEi7rxLSU6aBKqaqzyT5+gQkPHYd2cG/FadJUPuXVHPEA6CJIvTqnGQjRPdrNSF/azWsF8VQ6KVL64UxMzXNNtLfo9TtdHP7W6Vux6SZk7CoQGAdcLWqbZiC6duPBJfIlKlSopiydRtp599t2Nzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qyZUgth2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso638843a12.1
        for <sparclinux@vger.kernel.org>; Thu, 29 Aug 2024 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724952809; x=1725557609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=qyZUgth2dly3nMWS8qXjdxaDbdECPTmlyUQ1VrybCYw6A8/eT0YKVOMybRt52K2AlX
         8fDy5AD1LmEYw3+rVhuawDZyraBlZMCKUuIZWZ1Mjd+iiXKpLY444eIQd4U/19Tzm93A
         I2cQQD8YXKzH6pNUBmQDDqYgKWKU91aMJXmc+R3wxL/d4XYTu/ftEzmRHERrZpSYsc+H
         4EqHFdhj0G0TI2LzKEwdxqHIhYmd3s4BEh1k9xoLa506EIBuDgaXrMTe9FcOIZe1EFF/
         slCQ789BQWSVmH3nkHR2t5U+6SkwFEAN3v1PDl/JfywwsWmea+FgjeveM3ZpSjDHpcJH
         U5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724952809; x=1725557609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=irdrLGlR1ME0dXbqJfMwmFzvFhUoYORvkKEwenBtcY6fO8RVBBUPzvEPdGcXihzppm
         szJFwCkBIomVRoDtfxWGN4HsdhtXOt5Z4UKzZbw6yc8zu676soQtCeaCrGobde8j+tCt
         lVVGDlHp3AC3YZZZkn7BoVKxTwN5ZFxxYQp+FiQYKkn8pKiWCq9AjgUG1RpZ1KJC3nFx
         X3zF66sMVqLgIQQyHcOsyN6sffGYKG8ey+v9azljAM4p26NyolU0FQtMkfkGTWbgwQ33
         xWCbhKfAejkm5EIxa4KtCQCVoujA0q+lDQy1s0kHkTIw3gBUSRS4aaofBno69Io+rVG/
         3vKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBq0AQuUxQY5BcubioSqyk74Jl49JIlUheX/A40oGvo0HmzEC5wDS6UeZoVIg6IXRG+y+4uwI5IBZb@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXwRd9NsM/pWxz5zxiSu5cZHarQ468/2Ad/lK62JTzqXHOcib
	5+i3x8KNNAmrIE2n/7DOXynsbr08qI1Lc7wrPJ+QoYzpLN5K0WwtQkEll60VZBw=
X-Google-Smtp-Source: AGHT+IEMMPSZiUHtBfNuQb92KkzHdlzWvSIVDrDVVbnqmIDING28StXdegl4Q9VHUGwvTGBDq12VFQ==
X-Received: by 2002:a17:90b:524a:b0:2d3:90e1:41c7 with SMTP id 98e67ed59e1d1-2d85638414emr3575500a91.31.1724952808963;
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c81:fe51:78cb:fc02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0fdf44sm1949050a91.6.2024.08.29.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:33:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <ZtCw4vgonbJzV1xs@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <ZtAxwJFH_hAh1BPG@tiehlicka>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtAxwJFH_hAh1BPG@tiehlicka>

On Thu, Aug 29, 2024 at 10:30:56AM +0200, Michal Hocko wrote:
> On Thu 29-08-24 00:15:57, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> > 
> > The riscv architecture needs a way to similarly restrict the virtual
> > address space. On the riscv port of OpenJDK an error is thrown if
> > attempted to run on the 57-bit address space, called sv57 [1].  golang
> > has a comment that sv57 support is not complete, but there are some
> > workarounds to get it to mostly work [2].
> > 
> > These applications work on x86 because x86 does an implicit 47-bit
> > restriction of mmap() address that contain a hint address that is less
> > than 48 bits.
> > 
> > Instead of implicitly restricting the address space on riscv (or any
> > current/future architecture), a flag would allow users to opt-in to this
> > behavior rather than opt-out as is done on other architectures. This is
> > desirable because it is a small class of applications that do pointer
> > masking.
> 
> IIRC this has been discussed at length when 5-level page tables support
> has been proposed for x86. Sorry I do not have a link handy but lore
> should help you. Linus was not really convinced and in the end vetoed it
> and prefer that those few applications that benefit from greater address
> space would do that explicitly than other way around.

I believe I found the conversation you were referring to. Ingo Molnar
recommended a flag similar to what I have proposed [1]. Catalin
recommended to make 52-bit opt-in on arm64 [2]. Dave Hansen brought up
MPX [3].

However these conversations are tangential to what I am proposing. arm64
and x86 decided to have the default address space be 48 bits. However
this was done on a per-architecture basis with no way for applications
to have guarantees between architectures. Even this behavior to restrict
to 48 bits does not even appear in the man pages, so would require
reading the kernel source code to understand that this feature is
available. Then to opt-in to larger address spaces, applications have to
know to provide a hint address that is greater than 47 bits, mmap() will
then return an address that contains up to 56 bits on x86 and 52 bits on
arm64. This difference of 4 bits causes inconsistency and is part of the
problem I am trying to solve with this flag.

I am not proposing to change x86 and arm64 away from using their opt-out
feature, I am instead proposing a standard ABI for applications that
need some guarantees of the bits used in pointers.

- Charlie

Link: https://lore.kernel.org/lkml/20161209050130.GC2595@gmail.com/ [1]
Link: https://lore.kernel.org/lkml/20161209105120.GA3705@e104818-lin.cambridge.arm.com/
[2]
Link:
https://lore.kernel.org/lkml/a2f86495-b55f-fda0-40d2-242c45d3c1f3@intel.com/
[3]

> 
> -- 
> Michal Hocko
> SUSE Labs

