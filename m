Return-Path: <sparclinux+bounces-380-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902B861CB2
	for <lists+sparclinux@lfdr.de>; Fri, 23 Feb 2024 20:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B809B230C1
	for <lists+sparclinux@lfdr.de>; Fri, 23 Feb 2024 19:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45331448FE;
	Fri, 23 Feb 2024 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="Himi804K";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="JLDJWSde"
X-Original-To: sparclinux@vger.kernel.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7171448D8
	for <sparclinux@vger.kernel.org>; Fri, 23 Feb 2024 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708717151; cv=none; b=Tz/6pyv9v4scnuxELHs4fJ/FTH+5NZU56bSM4/0san846Qw0YeTjBXpG6Sf66FRzMghzgh+qq+aCFEpe87gq8ll5VgcL7LIqWe9HUPkf/gcktTnpUZsxqI2Dz9A/XoEgaq0RXQgoeBQysGfVC9bGeS01Wwlxq+t+bXuB0W5m3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708717151; c=relaxed/simple;
	bh=gtjsAtzY6CoR2uHPdcQk0akokLqtoegbn5o87uU296A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J41msMojWgVXrIzKRxVSa2JvXAmeaMgj+1Hl77yHZYDi/TEF25rpl03WuSkiVNJJaGlZmDo95GyT+EHesUq6ZY1xXMKZ+G7X5Ptw3GvVf6C9moCqTVpdN4aWJ4H3WMlCAJvEzAUjG9K1kNeqORgDBIVZfPacI7JgkDB6RgcZygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=Himi804K; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=JLDJWSde; arc=none smtp.client-ip=46.30.211.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=vu84hH5wRX3+Gs3JvJLrbmmDszO+NlEAIZz3j6i15YE=;
	b=Himi804KE7bsZ6kFLeknxwAxVJhaUDkq1b9PrxlmwGUZVdEybO2jj+2enpaSFdOSmYuUv+wxhruqk
	 OBffDeyUKCq1mvj9fPDvxY0dEEy+LVkR3riBb43Y3cf1+aksru/NZrXwHDWqK4QE9ys3MD1btyzndd
	 SOdpWH0uIC2NB5Bc6glcatY8+xyDfrDqFieHcw3bnz0A8TynfB2cWKlAbTCYFDrhMuyRYr3q/Pknzp
	 Gjd7Wka2g/09ceH9epSUt9WNwN9FGJVlKecbhXO4ugcp+NuMveJdzsqjUvrDFJt9ubTgewkNZLKMlL
	 1RcR0DxSqx6k3Y7NTv1sGMpM8Lu06Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=vu84hH5wRX3+Gs3JvJLrbmmDszO+NlEAIZz3j6i15YE=;
	b=JLDJWSdeYgburo9haKco0WXEWlTU9LkFLZKrhthvQYjfNirWZI+Wd9tRPQqsdvbVYNG/LkdYoiYyR
	 nCsTwFrDw==
X-HalOne-ID: 323fe0ec-d283-11ee-ade9-657a30c718c6
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 323fe0ec-d283-11ee-ade9-657a30c718c6;
	Fri, 23 Feb 2024 19:39:04 +0000 (UTC)
Date: Fri, 23 Feb 2024 20:39:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: sparclinux <sparclinux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: sparc: patch to fix parport_pc build on 32-bit
Message-ID: <20240223193903.GA2938185@ravnborg.org>
References: <4c4e2845-c7a8-4d0b-aa4a-7c5e3399b3dc@infradead.org>
 <20240223093416.GA2800152@ravnborg.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223093416.GA2800152@ravnborg.org>

Hi Randy,

On Fri, Feb 23, 2024 at 10:34:16AM +0100, Sam Ravnborg wrote:
> Hi Randy/Andreas.
> 
> On Thu, Feb 22, 2024 at 09:15:28PM -0800, Randy Dunlap wrote:
> > Hi Andreas,
> > 
> > Please pick up this patch from June/2023. I have already replied to
> > the patch with:
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> > 
> > and I just rechecked it on linux-next-20240223 to make sure that it
> > builds cleanly. It does; however, there is one trivial merge warning:
> > 
> > patching file arch/sparc/include/asm/parport.h
> > Hunk #1 succeeded at 20 (offset 1 line).
> > Hunk #2 succeeded at 252 (offset 1 line).
> > 
> > The patch:
> > https://lore.kernel.org/lkml/alpine.DEB.2.21.2306190121540.14084@angie.orcam.me.uk/
> 
> I took a quick look at the patch. It does the minimal to fix the build
> but the ebus_dma thing is only used by sparc64 an should not be visible
> at all for sparc32.
> 
> I think the right fix is to make the current
> arch/sparc/include/asm/parport.h sparc64 specific and use
> asm-generic/parport.h for sparc32.

I posted a set of fixes here, including an updated parport fix.
https://lore.kernel.org/sparclinux/20240223-sam-fix-sparc32-all-builds-v1-0-5c60fd5c9250@ravnborg.org/T/#t

	Sam

