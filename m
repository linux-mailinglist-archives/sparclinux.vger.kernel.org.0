Return-Path: <sparclinux+bounces-5441-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D77BFFA11
	for <lists+sparclinux@lfdr.de>; Thu, 23 Oct 2025 09:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3A7A503D9E
	for <lists+sparclinux@lfdr.de>; Thu, 23 Oct 2025 07:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC39D2E6CDA;
	Thu, 23 Oct 2025 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="QNlHnrn/"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7442C11C2;
	Thu, 23 Oct 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204089; cv=none; b=rPqhkAPdhSMF/iSycijVhjeCgyDwEhxsgZeSHExZC9JQO6DdAfxS62e4T0XWal/jpsBBJsAy5gBL8CPPtQX80Zhxw5pR0unKK/r5uAzVS9x+xXWExVIRMYFwVrKL6DvoCte6rturMYBRK/QtUj87oktxtw7K41wxpl+A06/ysWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204089; c=relaxed/simple;
	bh=+HsRzDs8IBxXYR8tu9jQXA2eKFmvx9n1ZSbIla6Dyw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmysLHBnTZCZHZIkcNWX3es3NDBak/ntZRVj8/hcGE9QXU2sRTNwuSOzPYSf8gqBdDQLBNcBo+oFDGn+KlxCxu7SLJ1kR0JtNj4qU/af+54DppJbEN4+L7k/eigImqrVBQz5jDvWAuvOyZcOqLMvJFi180qN2OfFwOelnOGVH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=QNlHnrn/; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1761204083; x=1761463283;
	bh=+HsRzDs8IBxXYR8tu9jQXA2eKFmvx9n1ZSbIla6Dyw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QNlHnrn/SLZBP7JLA6ma/rKRJis+vcnjgT40cpFvWTuFTnERMEhV0yi4/U+E4Fq7Y
	 3oPqx6jnPe3qH8JsvY1QcMIpr+Jk2zRa4GKYQd14WUH/HzoB4PAZh4wnLEbM6bULY4
	 bvXnp6lWDtmnjlrLNnh75z/g2T4Ajvag/Aeyc94O6IcivVKN99Es4IBggH5Tti4Nnt
	 deaLdnCRmCIjexFeZN8OdoTXpX+qpyqY7TYiDxjmYO9zrOgavhY/FkCEzNucQxHikG
	 +MLRGkSEMIkBPKJybTzc1aDH4i5e4+tWyy8mVDS4ptpMutzqag8N2sRO6n7PYPPycu
	 GCuvelCvTSA+Q==
Date: Thu, 23 Oct 2025 07:21:21 +0000
To: Nick Bowler <nbowler@draconx.ca>
From: Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, linux-rtc@vger.kernel.org, stable@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
In-Reply-To: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
Feedback-ID: 133791852:user:proton
X-Pm-Message-ID: 334da54a4dd577e91e3c6fc50e62b2d72fd6a417
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, 23 October 2025 at 06:45, Nick Bowler <nbowler@draconx.ca> wro=
te:

> After a stable kernel update, the hwclock command seems no longer
> functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
>=20
> # hwclock
> [...long delay...]

I assume this is 10 seconds long.

> hwclock: select() to /dev/rtc0 to wait for clock tick timed out

And this is 100% reproducible, or does it sometimes work and sometimes fail=
?

> On prior kernels, there is no problem:
>=20
> # hwclock
> 2025-10-22 22:21:04.806992-04:00
>=20
> I reproduced the same failure on 6.18-rc2 and bisected to this commit:
>=20
> commit 795cda8338eab036013314dbc0b04aae728880ab
> Author: Esben Haabendal esben@geanix.com
>=20
> Date: Fri May 16 09:23:35 2025 +0200
>=20
> rtc: interface: Fix long-standing race when setting alarm
>=20
> This commit was backported to all current 6.x stable branches,
> as well as 5.15.x, so they all have the same regression.
>=20
> Reverting this commit on top of 6.18-rc2 corrects the problem.
>=20
> Let me know if you need any more info!

Are you using the util-linux hwclock command? Which version?

Do you have CONFIG_RTC_INTF_DEV_UIE_EMUL enabled?

Can you run `hwclock --verbose`, both with and without the reverted commit,
and send the output from that?

/Esben

