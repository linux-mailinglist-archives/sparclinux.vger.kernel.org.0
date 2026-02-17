Return-Path: <sparclinux+bounces-6290-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hpLqGonElGmqHgIAu9opvQ
	(envelope-from <sparclinux+bounces-6290-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 20:42:01 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D714FB15
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 20:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BAEB300B45B
	for <lists+sparclinux@lfdr.de>; Tue, 17 Feb 2026 19:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE1B36F437;
	Tue, 17 Feb 2026 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="mnunnIyG"
X-Original-To: sparclinux@vger.kernel.org
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7EA259CBD;
	Tue, 17 Feb 2026 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771357296; cv=none; b=dt+XtajI3jX82clD+/h1xVdaDIPR/U8oekETm/hL2lx1kZeBkQMYLIRAUpuyAha6ueLqJtAaMnOdHfLpzBu/3Dh+7WjToxVBV2wa6QO35VrKWO/8N5qHnW4e+X0s+2Cyhrj+5HBWW7k47Dl8srQ+ZluoIPlk3ijfPiZAL+p34T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771357296; c=relaxed/simple;
	bh=57dGq5uI0abW3QqDIcQT25yoAnJ7Uu8UUHyFEFLLvSY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M03CMFv/O7z/DCtQfLETnTDoMCUHMyTNGiyqK73n+qHbr5P/iNDdEtSTTQLTDvBLJIleVhW4cnM1I3BmpzviA2VjNDbo+ImmJDNeOMus7UznWz8Spl4pFWkSHRjuzM/lgnaYInfM5RmSeb1szH6sFvPD3ViRdMZb1xYIW0Qfmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=mnunnIyG; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Message-ID: <276c9e7c2e45b4170e102d45066a8892ba33d541.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1771357292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57dGq5uI0abW3QqDIcQT25yoAnJ7Uu8UUHyFEFLLvSY=;
	b=mnunnIyGGknuW1zwD/wY5Sb9hq2UYUA2T1YBXjEcMqkGRYAmqTHhD4yiQQK1eVmsh3xrN5
	sC1AH0GPF0ecqyU8sVx4M/+n/VBtWqF3wLR55rdfaCRuEZwn09n/Ttctjv5WTzxY8z1CHb
	H/XRmJIsKgD4iAloiOoPDoXFVyyX7D0=
Subject: Re: [PATCH] sparc: iommu/pci_sun4v: fix page alignment in dma
 mapping
From: Stian Halseth <stian@itx.no>
To: Leon Romanovsky <leon@kernel.org>, John Paul Adrian Glaubitz
	 <glaubitz@physik.fu-berlin.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, David Miller
	 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Feb 2026 20:41:32 +0100
In-Reply-To: <359aa017-ca72-460d-96dc-c3b46edb186c@app.fastmail.com>
References: <20260217162141.4669-2-stian@itx.no>
	 <60c8265afe8be501a9eb5c811c5b564b0842b156.camel@physik.fu-berlin.de>
	 <3a12bf53d43c608968a97350a6b6a7db9df612dd.camel@itx.no>
	 <2124864d0640cd5d8f0697b1d01061ccf3e4243c.camel@physik.fu-berlin.de>
	 <b3da4bf0-d66a-404c-8d29-cfd58f89e84e@app.fastmail.com>
	 <4d219c0521dc14e51ffffc954d283dfd05fdce38.camel@itx.no>
	 <359aa017-ca72-460d-96dc-c3b46edb186c@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[itx.no,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[itx.no:s=mx.itx.no];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6290-lists,sparclinux=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[itx.no:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stian@itx.no,sparclinux@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lkml.org:url,itx.no:mid,itx.no:dkim,itx.no:email]
X-Rspamd-Queue-Id: B54D714FB15
X-Rspamd-Action: no action

On Tue, 2026-02-17 at 19:52 +0200, Leon Romanovsky wrote:
>=20
>=20
> On Tue, Feb 17, 2026, at 19:33, Stian Halseth wrote:
> > Hi Leon,
> >=20
> >=20
> > On Tue, 2026-02-17 at 19:25 +0200, Leon Romanovsky wrote:
> > >=20
> > >=20
> > > On Tue, Feb 17, 2026, at 19:16, John Paul Adrian Glaubitz wrote:
> > > > Hi Stian,
> > > >=20
> > > > On Tue, 2026-02-17 at 17:48 +0100, Stian Halseth wrote:
> > > > > Thanks for the review and suggestions.
> > > > >=20
> > > > > On Tue, 2026-02-17 at 17:38 +0100, John Paul Adrian Glaubitz
> > > > > wrote:
> > > > > > Hi Stian,
> > > > > >=20
> > > > > > please rephrase the subject to:
> > > > > >=20
> > > > > > =C2=A0sparc: Fix page alignment in dma mapping
> > > > > >=20
> > > > > > Your patch is not specific to sun4v but also fixes generic
> > > > > > sparc
> > > > > > code,
> > > > > > so you should remove the part "iommu/pci_sun4v:" from the
> > > > > > subject.
> > > > > >=20
> > > > > Understood =E2=80=94 I will update the patch subject as suggested=
.
> > > > > > On Tue, 2026-02-17 at 17:21 +0100, stian@itx.no=C2=A0wrote:
> > > > > > > From: Stian Halseth <stian@itx.no>
> > > > > > >=20
> > > > > > > 'phys' may include an offset within the page, while
> > > > > > > 'base_paddr' is
> > > > > > > already page-aligned.
> > > > > > >=20
> > > > > > > This caused incorrect DMA mapping in dma_4u_map_phys and
> > > > > > > dma_4v_map_phys.
> > > > > > >=20
> > > > > > > Fix both functions by masking phys with IO_PAGE_MASK or
> > > > > > > subtracting
> > > > > > > the page offset.
> > > > > >=20
> > > > > > Please remove the newlines between your sentences, they're
> > > > > > not
> > > > > > necessary
> > > > > > and also trim the lines at 80 columns.
> > > > >=20
> > > > > Will do =E2=80=94 I=E2=80=99ll reformat the commit message to 80-=
column lines
> > > > > and remove extra newlines.
> > > >=20
> > > > Perfect! I have nothing to add. Let's have Andreas review your
> > > > patch ;-).
> > >=20
> > > Please add Fixes line, so the patch will be taken to stable@ in
> > > automatic way.
> > I currently have:
> > Fixes: 38c0d0ebf520 ("sparc: Use physical address DMA mapping")
> >=20
> > Is this sufficient, or do I need to add something else?
>=20
> Ohh, you added extra line between signed-of-by and fixes line.
>=20
> Just remove that extra blank line.
>=20
> Thanks=20
Ah, I see what you mean now. There _was_ an extra line in the first
submitted patch [1]. This is not the case in the updated patch v2 [2],
submitted Tue, 17 Feb 2026 17:21:13 +0100.

Let me know if there's still an issue with the latest patch, or if I've
made a mistake when submitting it. My first patch to LKML, sorry about
the extra work :)

>=20
> > >=20
> > > Thanks=20
> > >=20
> > > >=20
> > > > Adrian
> > > >=20
> > > > --=20
> > > > =C2=A0.''`.=C2=A0 John Paul Adrian Glaubitz
> > > > : :' :=C2=A0 Debian Developer
> > > > `. `'=C2=A0=C2=A0 Physicist
> > > > =C2=A0 `-=C2=A0=C2=A0=C2=A0 GPG: 62FF 8A75 84E0 2956 9546=C2=A0 000=
6 7426 3B37 F5B5 F913
> >=20
> > --=20
> > Best regards
> > Stian Halseth
> > =E2=80=8B

[1] https://lkml.org/lkml/2026/2/17/845
[2] https://lkml.org/lkml/2026/2/17/908

--=20
Best regards
Stian Halseth
=E2=80=8B

