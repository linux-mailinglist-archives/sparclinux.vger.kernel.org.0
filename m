Return-Path: <sparclinux+bounces-6854-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAFJJ4+KFGr4OAcAu9opvQ
	(envelope-from <sparclinux+bounces-6854-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 19:44:47 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E545CD6E3
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 19:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A337B3002B7E
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 17:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F271E318B9D;
	Mon, 25 May 2026 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sxE8KVk0"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252326C3B0;
	Mon, 25 May 2026 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731080; cv=none; b=oPCS2D4l5I8Du6jMAJFs5ZcIm3SZIFo0RMYI3HWS0aEmfniqGlGOMnXrdyNtzhidmS2W3/PLcZaTNCQxKXG5XDgoRde7kURdhxWeQVVhIlCe80IGVf5LcgsdQsKszZ0rwVy3oPXQd1+A3k1pzX8CUqNTavWp3gWeh9oTuQOMlYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731080; c=relaxed/simple;
	bh=MKy45pcxCmuJSLqPg9Zy4kbxX3vPZAVdv+I4rwm7Er8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WcSKUe+ISPwoCR6aoPYiGljhVR/dQgz6LdJdGCUQVfwNdFiaVjHZxh78uJd6nkDV/RiL5Dh2zA0sCCVOW0njfkvEyelEbhgkos8EZ5l7VmMM5kzz3u7LpTcYblLBmTtjd9gywjL6maMuZZU5NbUblsU8naDa8RsJVdA9UMxYb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sxE8KVk0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6B31F000E9;
	Mon, 25 May 2026 17:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779731079;
	bh=UsS+4LaQ1tSyd44fUtup0tvTHxQ0dvwI1z80+7KABI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sxE8KVk0lHeoo+7dtVMeRsdjiiGmU7useMmJ0y9i2PuuFkTuSVkuk2uuNP2qdfSQ+
	 6Vs7Z6O4MUk7kSeA37JOTHybG3jZhQoFYcdKXnzHvTG+ZC52xSJamw2D87ZvEldLu2
	 oCy/kQi87yza6wfJsMO89yGhxXNGVns2pOzTZvV8=
Date: Mon, 25 May 2026 10:44:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sparc: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Message-Id: <20260525104439.ce06c784e4b8bf25cadaf8e9@linux-foundation.org>
In-Reply-To: <20260525-sparc-clear_user_page-v2-1-e7a47fbcf439@weissschuh.net>
References: <20260525-sparc-clear_user_page-v2-1-e7a47fbcf439@weissschuh.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6854-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,weissschuh.net:email,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: 98E545CD6E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 10:36:21 +0200 Thomas Wei=DFschuh <linux@weissschuh.net=
> wrote:

> The loop in clear_user_pages() iterates over all pages and calls
> clear_user_page() for each of them. During the loop "vaddr" is modified.
> However on sparc clear_user() is a macro which does not use "vaddr".
> The compiler sees a variable which is modified but never used and emits
> a warning for that:
>=20
> 	include/linux/highmem.h: In function 'clear_user_pages':
> 	include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not u=
sed [-Wunused-but-set-parameter=3D]
> 		static inline void clear_user_pages(void *addr, unsigned long vaddr,
>=20
> Other architectures use an inline function for clear_user_page() which
> avoids the warning. This is not possible on sparc, as
> sparc_flush_page_to_ram() is not yet declared where clear_user_page() is
> defined. Including cacheflush_32.h will trigger recursive and lots of
> other issues.
>=20
> So hide the warning with a cast to (void) instead.
>=20
> While we are here, do the same for copy_user_page().

A pleasing solution to these sorts of problems is often "don't use
macros".  Other architectures use inlined C for these functions - will
that work for sparc?


