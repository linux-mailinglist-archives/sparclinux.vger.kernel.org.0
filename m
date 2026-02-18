Return-Path: <sparclinux+bounces-6293-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMRsDSKDlWlrSAIAu9opvQ
	(envelope-from <sparclinux+bounces-6293-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 18 Feb 2026 10:15:14 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C2154A29
	for <lists+sparclinux@lfdr.de>; Wed, 18 Feb 2026 10:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93F643009577
	for <lists+sparclinux@lfdr.de>; Wed, 18 Feb 2026 09:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FA933A9CF;
	Wed, 18 Feb 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="lebRGddq"
X-Original-To: sparclinux@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDF2FF641
	for <sparclinux@vger.kernel.org>; Wed, 18 Feb 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771406111; cv=none; b=txylsPcgt59RG1Oz/kvouyyKSAlzM0gnE9s58nUkvSZPErL10hrSQ1Sm2knChsjTjQfI9mm+eiSBm5+cGkYRJ2SLC+AejB9HalvuNG5wI5x6Hf5ZS6bJ8/jFNSvRovmO+FGos00QH0+YRDWRZ2z7rDbmFFTCPz71oN5hqZ6VXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771406111; c=relaxed/simple;
	bh=lbALn1znl67VWZrTaiGM6AIFSWNhoOI9BoDSbbchkFk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=BcAMJ5GN4AA66MENuaN4ivay0rMH2EiysGXftSL14nbC5NlELk9EeZXxw8ShkhoG7OnInW9vyMAAJlOT1UbnpR/ZKzw9OnTbiAp7k31oRcm9mUPDUOuc9XrPhQ+kDrbD+ZGQkctxGpr15IiqiaUrPAFpZeLioXhBAM63nCGf124=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=lebRGddq; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:From:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VVg+/uNMcL3mTXrxFNBaUkIYsgpNRd8Zzbvr9q6q7AI=; t=1771406106; x=1772010906; 
	b=lebRGddqUxQFiErBBjVN6z3B/dvcNOlNwmLhLIO3Z+w19a4AWhSu3TQ639qvAM0YWCNJixNCLuE
	M/epLd/jq5W82JIC6Ghr6Zqb15UQDVaqwDI3ZrnE+DDaP54Qygau2j2vJCqGCJ2TD/b8iMdzW+YM9
	lsWJcaILw6Dy+PE7zLbRc1YglMEvtSCj0+JBdeU8U4Yzd9teCGMtuet8SKtUiEwtBVyjNzp2d2Fct
	SsEAlC8c0zru0wlGMb306r3Y5IqhUqatmFQWPR/x7WVCS5wGDv48ihfViY4oEdj36DS5YqC1cNqhH
	OshYghgF+qWu7wQ/E3DzmW12AFk1Wgj/ojhw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vsde6-000000016Ws-1ODH; Wed, 18 Feb 2026 10:14:58 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vsde6-00000003snl-0Wey; Wed, 18 Feb 2026 10:14:58 +0100
Message-ID: <9e78ae7d29df57aac24981d73455078e949a8cfa.camel@physik.fu-berlin.de>
Subject: LLVM builds on SPARC passing the testsuite for the first time
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "<debian-sparc@lists.debian.org>" <debian-sparc@lists.debian.org>
Cc: sparclinux <sparclinux@vger.kernel.org>, gentoo-sparc
	 <gentoo-sparc@lists.gentoo.org>
Date: Wed, 18 Feb 2026 10:14:57 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-6293-lists,sparclinux=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,sparclinux@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[sparclinux];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,llvm.org:url,physik.fu-berlin.de:mid]
X-Rspamd-Queue-Id: A10C2154A29
X-Rspamd-Action: no action

Hi,

thanks to the tireless work of koachan, the LLVM testsuite on SPARC is pass=
ing now
for the first time in years such that the buildbot is passing for Linux SPA=
RC:

https://lab.llvm.org/staging/#/builders/82

I have already requested for the buildbot to be moved to production in the =
next days.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

