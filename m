Return-Path: <sparclinux+bounces-7081-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzO0McnLVWoXtgAAu9opvQ
	(envelope-from <sparclinux+bounces-7081-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 07:40:25 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDAF75139E
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 07:40:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suksangroup.co.th header.s=default header.b=ha8IraI6;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-7081-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-7081-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=inbox.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEF903052452
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2026 05:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D3633D505;
	Tue, 14 Jul 2026 05:30:48 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A361A9F96
	for <sparclinux@vger.kernel.org>; Tue, 14 Jul 2026 05:30:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007048; cv=none; b=ZRcg0WeD79pJNqjRH0PPjpYwn8RPG7g36pIW4/MCvchuMGPR4g6yN0Kf0TpOSQ2t4+tmyKOeb8+lT6FQttRyfTfPqyZVBUB1gegBZjaNjnC8JIuabRFUtOZAyDdxsWhiiZixq58z1z/6hOnW/sOPrqLj4U/1Ws9YuJJx/8fpjXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007048; c=relaxed/simple;
	bh=h0aI8p+zeX34Tplq+i9nRzvpg0Bpyt/cJn8Ens0mzXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BELY0+R+MPt9mTApqs7hssgX8ibAJWaTdCVChSCCGJ+bQmKz1LxpZeLig+Gu4sZASYInxLrfGgCCVMaqcyXibHjQVCbU4rJU+EtZt9WzICtPHqdvIgqGS5lfpu3O+gxux6HMzmPMwOFtluMNRbOat9/oSMkfL1RFHWZXa17o+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=ha8IraI6; arc=none smtp.client-ip=103.13.31.55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h0aI8p+zeX34Tplq+i9nRzvpg0Bpyt/cJn8Ens0mzXk=; b=ha8IraI6jBPZYOz4j0k1BzYszt
	RNPpVN+igxOx+K0iBxu4Vbpkq2cWhW0PprQ2ammK1R6l1EtG5IxrhVr/t4gwqi/WjbeftEa+9Wnkw
	RWAa0pBuGtcbucJ88wag3KV/tbUQv3mEt/eSV7n8/HgrDLx4mlKyjggh94pNhc4CZ/Cj/zJCsw8hP
	q2+yYP2l4I/i1eSd5hg05S9118x76ysmi9nUU4J5ajz4tEEecEYOgw1UMpNhE4ZMW8TtxBLHCdbhv
	+P3PlXbRhbNsbK4lI2lNC+w9buAjj5N6ambNPcmFtiEqUsPtrEz9Fmg0vf5ZN+y3ZDIDRVwJ6nvUX
	IgT2z/sw==;
Received: from [207.189.26.187] (port=65138)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVjC-0000000G1a9-0ZlD
	for sparclinux@vger.kernel.org;
	Tue, 14 Jul 2026 12:30:45 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: sparclinux@vger.kernel.org
Subject: Dear sparclinux, project info
Date: 14 Jul 2026 00:30:41 -0500
Message-ID: <20260714003041.5C6AFBA9E2F9E50B@inbox.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.94 / 15.00];
	ABUSE_SURBL(5.00)[lexcapitalgrowth.com:replyto];
	R_DKIM_REJECT(1.00)[suksangroup.co.th:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[inbox.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7081-lists,sparclinux=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[smtp@suksangroup.co.th];
	GREYLIST(0.00)[pass,body];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_GMSV(0.00)[smtp@suksangroup.co.th];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[info@inbox.org,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[suksangroup.co.th:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@inbox.org,sparclinux@vger.kernel.org];
	HAS_REPLYTO(0.00)[hanns.schofield@lexcapitalgrowth.com];
	TAGGED_RCPT(0.00)[sparclinux];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lexcapitalgrowth.com:replyto,inbox.org:from_mime,inbox.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EDAF75139E


Re:Good day sparclinux,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



