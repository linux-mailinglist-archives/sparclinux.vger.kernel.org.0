Return-Path: <sparclinux+bounces-6851-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IfFGgbcEWq+rQYAu9opvQ
	(envelope-from <sparclinux+bounces-6851-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2026 18:55:34 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FD5BFEB6
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2026 18:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B74F3012328
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2026 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8F6257827;
	Sat, 23 May 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ep1rK/zM"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0631F985
	for <sparclinux@vger.kernel.org>; Sat, 23 May 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779555269; cv=none; b=kmIkEsBjeOJ9ScHYd0hHG7x3Ec53FWa0K50ubEONAvcn+3Gj8pRBLo5AKBJ9E42DiPYuqXeEBPgJ295e8I/WYan5UlkOzow2NXexvgDFk6hgbCzwkDE5G7eX1qzlQRcBFAe+NDErbwMKCsQMvv7rEQWMPHvBME6yRKF3S1pR6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779555269; c=relaxed/simple;
	bh=ibuIO+aAG3K1KGklkGKKCx56tIMfkPBlgd+iMnohY7c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qlUGSaK/J3z/M1YClMQTzKUCuEWkbJ+nE2j6mGS8WfRrIj9UcX7ES+LS/Pze29JAe2xOnTJfWi7iqeV94gBy3iAQYYw7iaUdxB/NUb+EvuDYOnOfNgem1e5j6elTgTTTkRkHbxy4JWjrnv88LoqSc1z9fMpgDZf+GeSC3zZVPcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ep1rK/zM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5761F000E9;
	Sat, 23 May 2026 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779555267;
	bh=ZN5o432wxDfbglDQi3EPlICxvkm9fqCcJ5dcvgyatQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ep1rK/zMEJV2IwXzzCPVQvcv2Os6prHVLDjg3I1PlqSjkMwI8iRL/TylUTE+YFVAi
	 jZ/6GJpPDzhFYIhDKyqTHXGp0CRUTQjkqDXOLKg2UN7SnTt/odogdgcWbcJxQICult
	 W2DYFYOsH6XdbM4QTa+EfZ314DZdigdCfIlZqk/I=
Date: Sat, 23 May 2026 09:54:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: sparclinux@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com
Subject: Re: [patch 1/1] sparc: add _mcount() prototype
Message-Id: <20260523095427.ef875aa8d2908a65fcb193c5@linux-foundation.org>
In-Reply-To: <d754f87694da033d9d80581c9a60df891e3c763d.camel@physik.fu-berlin.de>
References: <20260523042535.C3A6B1F000E9@smtp.kernel.org>
	<d754f87694da033d9d80581c9a60df891e3c763d.camel@physik.fu-berlin.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6851-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E62FD5BFEB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 23 May 2026 09:49:13 +0200 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> Hi Andrew,
> 
> On Fri, 2026-05-22 at 21:25 -0700, Andrew Morton wrote:
> > From: Andrew Morton <akpm@linux-foundation.org>
> > Subject: sparc: add _mcount() prototype
> > Date: Fri May 22 09:20:26 PM PDT 2026
> > 
> > sparc64 defconfig told me
> > 
> > WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
> > Is "_mcount" prototyped in <asm/asm-prototypes.h>?
> 
> I think that must be a regression as I haven't seen this before. I should
> pull and build a current kernel, my last build was around v7.1-rc1.

OK.  I tried bare 7.1-rc4, the warning is there.  gcc-15.2.0.


