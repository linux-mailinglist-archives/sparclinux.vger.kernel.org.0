Return-Path: <sparclinux+bounces-6777-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDhrIUvwAWpfmgEAu9opvQ
	(envelope-from <sparclinux+bounces-6777-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 11 May 2026 17:05:47 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD79510D3A
	for <lists+sparclinux@lfdr.de>; Mon, 11 May 2026 17:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C622F306C7F8
	for <lists+sparclinux@lfdr.de>; Mon, 11 May 2026 14:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8033FFAD3;
	Mon, 11 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qq6v9hCJ"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF73FFAAA;
	Mon, 11 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511501; cv=none; b=DjNbYlbLUP6byy6CgxoTdsFdWqJ9y+IFROOQrlHw21xc96Fc+EbNfuKeeCLHv0eE+hV8yp/oSQSqMyF8hPx48SE659DIwgVRTGiW0cSQM82DbHUa55LGkfPDxQuNUPgdDBkYfEud23KCKPb0qGzNEGVTGbR/x6VaZPvJmFw4zxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511501; c=relaxed/simple;
	bh=Ocv0eUycPk0CJDmrlNGryA52QS55d9KUwCdX+WPq4N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChryWQYDcXp9bLqn0cIoGv6nymqx1GeqZl4FfgQjYaVkL9OaJWDl87rzI9HsJfskFvKO1g2lT9FR4KQDayyzS5ZVqaBWQx9fyC+tKgToTId4erf5HydJCgh47m5Rg6jSj593+npGsc7zIVkSqhDTtiK+zyjHyA/SsvLGkEIAQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qq6v9hCJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68499C2BCB0;
	Mon, 11 May 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778511500;
	bh=Ocv0eUycPk0CJDmrlNGryA52QS55d9KUwCdX+WPq4N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qq6v9hCJCNAOPwWEuRPCYdzi53rg5FZ2AHVl1yPd4FR12j4VY5yjDUVHT0J2egt/V
	 hU8S6L/lRa215mjso+6ImB1+redlPb8jXZ9iLdo3x5PnLtjoLT9m+mZa8K7qvx6A4h
	 6RdX46hlMpP8DHITatCq8BlnFogL51I5q72kWZ8c=
Date: Mon, 11 May 2026 16:58:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, sparclinux@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, Xin Zhao <jackzxcui1989@163.com>,
	Joseph Tilahun <jtilahun@astranis.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH tty v4 0/6] 8250: Add console flow control
Message-ID: <2026051157-antelope-epidermal-6238@gregkh>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506121606.5805-1-john.ogness@linutronix.de>
X-Rspamd-Queue-Id: DBD79510D3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6777-lists,sparclinux=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,samsung.com,davemloft.net,linux.intel.com,lists.infradead.org,bp.renesas.com,glider.be,163.com,astranis.com,oss.qualcomm.com,wunner.de,treblig.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[sparclinux,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 02:21:55PM +0206, John Ogness wrote:
> Hi,
> 
> This is v4 of a series to implement console flow control for the
> 8250 serial driver. v3 is here [0].
> 
> The 8250 driver already has code in place to support console flow
> control. However, there is no way to activate it and it is
> incomplete. This series provides the necessary missing pieces while
> attempting to be as conservative as possible, so as not to introduce
> any side effects into the many 8250 variants or other non-8250 serial
> drivers.

This had some rejections in drivers/tty/serial/sh-sci.c, what
branch/tree did you make this against?

thanks,

greg k-h

