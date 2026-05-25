Return-Path: <sparclinux+bounces-6856-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP/qE2W0FGpbPgcAu9opvQ
	(envelope-from <sparclinux+bounces-6856-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 22:43:17 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA585CEB3C
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 22:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D389530069AD
	for <lists+sparclinux@lfdr.de>; Mon, 25 May 2026 20:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74953451A7;
	Mon, 25 May 2026 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QRrG+Jyi"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFA4C97;
	Mon, 25 May 2026 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741589; cv=none; b=NtKVlZqx0V2wH/2pPr8F1byPeQugOIGStwdF18qJ7DDLDOYMVe77XG9P/mc4h/LtV6qu9s/QJgHNUWRymSJOszro371Hrr7lcrVLh3AZwxciz1xeGi/zT+TkDO9/2Ev2EeTWKLmXwfPMzPzXuUdWvxQ6CB4Mz1tEPj/O7lcEE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741589; c=relaxed/simple;
	bh=dHXV5aP5N83DP99Lq2gXtKKjsXxUcKwQnafXNksITyQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=orR5jYMwbDg877kfVH680PggP22ut/pLXbK2JEJ2y3oQzDjBTdEo9qXDzHtYehmC1MGnKGFw/uxeZTHJBXuyiOnGzfaA/t+NkpC+2oJd7JsCts4rPMilt2OAqv/lv6g6QsRS4H9hVEERNONPsodLrk7gUDa1LGd3TYYYknXI6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QRrG+Jyi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D835C1F000E9;
	Mon, 25 May 2026 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779741588;
	bh=tC0EXkh43LAKavatMnYRfVv7P7qGBC/NuUZuhsOUubw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QRrG+JyifSO7rmecdKRqPzyLyF/c2WP8AximfpmwjuYghHqdGDGvEODkpYme3Zm7W
	 tkttcF+F+9j4wqpe8fnpbbPbiwDvj9uM2tyaprmDmkJ0d1l+lptkHvoNUbi+2gI6Zs
	 2WTzkbBPn8vy3HgrirWR3WRvsWjP8m+pbtv5jTDk=
Date: Mon, 25 May 2026 13:39:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sparc: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Message-Id: <20260525133947.8e4f427cad8c8fa9c7d9d9a8@linux-foundation.org>
In-Reply-To: <07713350-d55b-4be7-acf8-3853b08c0358@t-8ch.de>
References: <20260525-sparc-clear_user_page-v2-1-e7a47fbcf439@weissschuh.net>
	<20260525104439.ce06c784e4b8bf25cadaf8e9@linux-foundation.org>
	<07713350-d55b-4be7-acf8-3853b08c0358@t-8ch.de>
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
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6856-lists,sparclinux=lfdr.de];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,sparclinux@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4FA585CEB3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 21:48:14 +0200 Thomas Wei=DFschuh <linux@weissschuh.net=
> wrote:

> On 2026-05-25 10:44:39-0700, Andrew Morton wrote:
> > On Mon, 25 May 2026 10:36:21 +0200 Thomas Wei=DFschuh <linux@weissschuh=
.net> wrote:
> >=20
> > > The loop in clear_user_pages() iterates over all pages and calls
> > > clear_user_page() for each of them. During the loop "vaddr" is modifi=
ed.
> > > However on sparc clear_user() is a macro which does not use "vaddr".
> > > The compiler sees a variable which is modified but never used and emi=
ts
> > > a warning for that:
> > >=20
> > > 	include/linux/highmem.h: In function 'clear_user_pages':
> > > 	include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but n=
ot used [-Wunused-but-set-parameter=3D]
> > > 		static inline void clear_user_pages(void *addr, unsigned long vaddr,
> > >=20
> > > Other architectures use an inline function for clear_user_page() which
> > > avoids the warning. This is not possible on sparc, as
> > > sparc_flush_page_to_ram() is not yet declared where clear_user_page()=
 is
> > > defined. Including cacheflush_32.h will trigger recursive and lots of
> > > other issues.
> > >=20
> > > So hide the warning with a cast to (void) instead.
> > >=20
> > > While we are here, do the same for copy_user_page().
> >=20
> > A pleasing solution to these sorts of problems is often "don't use
> > macros".  Other architectures use inlined C for these functions - will
> > that work for sparc?
>=20
> Probably yes. But it would require a major reshuffling of the header
> files to get the dependencies right. So I went with the easy solution to
> avoid a lot of churn. As I tried to explain this in the patch message.

Oh, OK, thanks, reading skills, sorry for noise.

