Return-Path: <sparclinux+bounces-6960-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMoxAUy5Q2pTfwoAu9opvQ
	(envelope-from <sparclinux+bounces-6960-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 14:40:44 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D26E4490
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 14:40:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=jgSEgznx;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6960-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="sparclinux+bounces-6960-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C7553061778
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 12:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7732438551A;
	Tue, 30 Jun 2026 12:38:32 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814F3FD12A
	for <sparclinux@vger.kernel.org>; Tue, 30 Jun 2026 12:38:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823112; cv=none; b=URRfhyXtofAd5W1cVcEjrh2tGLVtCfvJ34VzvA6oGbjXUSsWMTE/Ovzey8081TaAA6T+2X5m0nukUWSm4rjKyI38hlkvFQVAiqk3SGtOjlrmIp9gvWO2MtMH5qRvFt6UON+PY3UnYtz32RCCYyUrakV6Oeg5o7qfeFPIWgSXBdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823112; c=relaxed/simple;
	bh=wwukuDKbyljD7hId+oIoTVO7P14eUg01P4v4+Ftn7VA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rnhu7bgsWdhA/f/imHZN2iXzz3zqVgTANqqNRAdRZxKV23C9dXJ0yPkm7KV4rpH7qy3DIVOJJKdZjhvfjW5R55RqGDHuOv2UTlFnQFBmMjBNNtzReA6fY5x2VzGqY/sa9UF5AN4Cl+Nyr/Jp8n8VqunbCYzVgEdBNso+qogm1t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jgSEgznx; arc=none smtp.client-ip=95.215.58.180
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782823109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wwukuDKbyljD7hId+oIoTVO7P14eUg01P4v4+Ftn7VA=;
	b=jgSEgznxBiHGQaexqZhJkecqo2BuwDaiUFnh5YpQFZ9C/GoUdN7hdqIrEOAZ5aNblcamMw
	iv6u9XKMGSbVfvZf1nt+cwmRBML8NyeguYi/xGsDFnS3FC2QqntjZ20gltPoXsMtN+lduw
	QjDRfgzcPuAoUoCiHCPJEf6RyCceCXA=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jannh@google.com,
	peterz@infradead.org,
	osalvador@kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 2/3] mm: drop pte_clear_not_present_full()
Date: Tue, 30 Jun 2026 20:38:04 +0800
Message-Id: <20260630123804.10313-1-lance.yang@linux.dev>
In-Reply-To: <20260629-clear_not_present_full_ptes-v2-2-96089871a1e7@kernel.org>
References: <20260629-clear_not_present_full_ptes-v2-2-96089871a1e7@kernel.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-6960-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lance.yang@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 761D26E4490


On Mon, Jun 29, 2026 at 03:49:48PM +0200, David Hildenbrand (Arm) wrote:
>In general, there is no good reason to do anything special when clearing
>non-present PTEs.
>
>In theory, HW that does have to invalidate TLBs for non-present PTEs could
>benefit from a "full" parameter, but fortunately
>pte_clear_not_present_full() is not wired up anymore ... and there would
>have to be something very convincing for us to care about that to re-add
>it.
>
>So, let's just use pte_clear() directly now. To avoid the compiler
>complaining on some configs about unused "addr" parameter, silence that
>here.
>
>Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

With the sparc64 override gone, pte_clear_not_present_full() is just
pte_clear() :)

LGTM. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

