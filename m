Return-Path: <sparclinux+bounces-6959-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mv2vDVi0Q2oBfgoAu9opvQ
	(envelope-from <sparclinux+bounces-6959-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 14:19:36 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE76E4195
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 14:19:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=afnIokYB;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6959-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="sparclinux+bounces-6959-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901CF303AB4B
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2026 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5445409100;
	Tue, 30 Jun 2026 12:04:02 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F113ACF0B
	for <sparclinux@vger.kernel.org>; Tue, 30 Jun 2026 12:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821042; cv=none; b=KR+/Ae8qqebetTEZJ5pTqzjsawBgOWyZlEUAg6eTVao/+HNHokuhCL+H5duqjqwG12UYWlSdL6X6FYyPJW1tDtSE9Jyr/s9o11QgSL+nWWRD4hZUoiNT0O4ppkSITCoy1ti6LbHgIArRGYrdjAYSF+UBL7YWv5Na1r1ZkTNysSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821042; c=relaxed/simple;
	bh=V/DMUiQ1VPaw+ocwoQ3oyh/3Cnm4EySYJMIokcHus7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k16G3LYVE50L0EnqAn2L2koVKbiU7QJYeAzBPUuMDdyIchNOWgSkdTkJA1sFzdxMvmkPCklH2J19k7J6m3rc024yF+O71PMo6oDHMbGsoyV88WdEstMODJEnojyvYoEhl2PxhoGyiAvXmWWNq+s/n3HfNSWVph/vfsVPMCIsKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=afnIokYB; arc=none smtp.client-ip=91.218.175.172
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782821039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/DMUiQ1VPaw+ocwoQ3oyh/3Cnm4EySYJMIokcHus7g=;
	b=afnIokYBOW1Nsyw5v2FMpAPhzWDSn8Xmhm8lmi4QXXJYhfCyHTu/UVshzew1eNimj7yZJl
	5tPyYbPjrpHXa0TJ2MYRl71Qf/B0aW970KDwwl91kx9ODE/LlDdCTkLiwA5pgrxNr3s57T
	Dh0Z1m+HITnk4VjZz8g8g/Gx9nDfeSE=
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
Subject: Re: [PATCH v2 1/3] sparc/mm: drop custom pte_clear_not_present_full()
Date: Tue, 30 Jun 2026 20:03:44 +0800
Message-Id: <20260630120344.81142-1-lance.yang@linux.dev>
In-Reply-To: <20260629-clear_not_present_full_ptes-v2-1-96089871a1e7@kernel.org>
References: <20260629-clear_not_present_full_ptes-v2-1-96089871a1e7@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lance.yang@linux.dev,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6959-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[3];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:email,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ADE76E4195


On Mon, Jun 29, 2026 at 03:49:47PM +0200, David Hildenbrand (Arm) wrote:
>On sparc64, pte_clear_not_present_full() nowadays does a simple
>__set_pte_at(). In __set_pte_at() -> maybe_tlb_batch_add(), we check
>pte_accessible() to see whether to call tlb_batch_add().
>
>However, non-present PTEs are surely not accessible, so tlb_batch_add()
>is never called and the "full" parameter is irrelevant.
>
>Let's drop the helper and just let common code do a pte_clear().
>
>pte_clear() on sparc64 maps to set_pte_at()->set_ptes()->__set_pte_at()
>... so it ends up calling the same function, just with "full=0".
>
>Given that "full" is irrelevant, there is no change.
>
>We added pte_clear_not_present_full() for sparc64 in commit 90f08e399d05
>("sparc: mmu_gather rework"), and I suspect that it was already not
>required back then.
>
>Cc: Peter Zijlstra <peterz@infradead.org>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

fullmm only matters if an old non-present PTE can pass pte_accessible().
IIUC, that doesn't happen on sparc64 :)

LGTM. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

