Return-Path: <sparclinux+bounces-6816-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YONhMpfHBWrDbAIAu9opvQ
	(envelope-from <sparclinux+bounces-6816-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 14 May 2026 15:01:11 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB85420DF
	for <lists+sparclinux@lfdr.de>; Thu, 14 May 2026 15:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64FD33017786
	for <lists+sparclinux@lfdr.de>; Thu, 14 May 2026 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056503C2B8B;
	Thu, 14 May 2026 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSdIO3QM"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E763B2FC2;
	Thu, 14 May 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763630; cv=none; b=MCwvExJZBG6F2J7TbZ4jYp5TPqU/g8tcSKMjUZqlvTmaeE8hfFE/VQvT8cEoQIeI45UUFnqx69KiqZwXrb9KQ5MTMcDCABPS8YkGbcxaCGYkqm0Kzk2R6hbhplAZvnVbe1Qquvr1SdLXofEilaEXhDLiiRaQ6MPo0/3v48C7okM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763630; c=relaxed/simple;
	bh=KMwg1ZJonpP22evmkhxL0puLNLtsmWrf60LlcCdhmlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5zhqID+Olsg/v6vOWtBRJFxTg4sIQ0cEg4EAKYJIMWoFo3EE+x2Oc2rk2ewP/E8c/JRjdYjWoefcF/7nQBUSJpdhnFQD9EnJtynCQn2AFZHIKVL4iwCXW241hWHeD0Z4ACpd5+LRLpM3trjY1DlBQrPxpFNpz1PdYQN4sXJFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSdIO3QM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B843C2BCB3;
	Thu, 14 May 2026 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763630;
	bh=KMwg1ZJonpP22evmkhxL0puLNLtsmWrf60LlcCdhmlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSdIO3QMmfOhZyln7utFkcY67H5q4R6aiuGsrPvHzUhcMVep2v31kY7l4vokdQ7LR
	 4L2aZHtKaKyFM7H6zoqzAzlTYwQVvaIZYRxoDOpj1xk6HZZtMlUkHn8sHCi/Jq+ga2
	 LMzbKrjduxvDbr6gp6+nk29N/CBoqwg/xyJMN/q5lUZFryGySCnqKFQDfGheORmnKz
	 P6Sgi8DKF55DuThuLcEpbLPek0d5ATuOa8r2bllhkVShSW1EEuZq4WXLFEY0InTdJE
	 4S3D1yVlARnBaKlWjO5xUOKJsSd2/Ey9fHhRtW5U66LNZ+UIuVYcw+8kAMKWsHi8yh
	 dwg/Swzu66TIA==
Date: Thu, 14 May 2026 22:00:26 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] sparc: Disable compat support with LLD
Message-ID: <20260514130026.GC1781775@ax162>
References: <20260508000834.834824-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508000834.834824-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: AADB85420DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6816-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gaisler.com,gmail.com,google.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:08:34PM -0700, Rosen Penev wrote:
> An LLVM=1 sparc64 allmodconfig enables COMPAT and then tries to
> build the 32-bit vDSO. That path cannot be linked with ld.lld:
> 
>   ld.lld: error: unknown emulation: elf32_sparc
> 
> ld.lld does not support the 32-bit SPARC ELF emulation used for
> the compat vDSO, so keep COMPAT disabled when LLD is the linker.
> This avoids selecting an unsupported build path while leaving the
> existing GNU ld configuration unchanged.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

It does not sound like sparc32 will be supported in ld.lld without
someone contributing the work:

  https://github.com/llvm/llvm-project/issues/100320#issuecomment-2254229711

So this seems reasonable, even if we don't support ld.lld for sparc64
in the kernel right now.

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/sparc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index a6b787efc2c4..681ab2fd3d8a 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -474,6 +474,7 @@ endmenu
>  config COMPAT
>  	bool
>  	depends on SPARC64
> +	depends on !LD_IS_LLD
>  	default y
>  	select HAVE_UID16
>  	select ARCH_WANT_OLD_COMPAT_IPC
> -- 
> 2.54.0
> 

-- 
Cheers,
Nathan

