Return-Path: <sparclinux+bounces-6621-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPYNAFw8ymmd6wUAu9opvQ
	(envelope-from <sparclinux+bounces-6621-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2026 11:03:24 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C5357B5B
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2026 11:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0DD2302A385
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2026 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0187B3B47C3;
	Mon, 30 Mar 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyVV6yho"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E603B3898;
	Mon, 30 Mar 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861248; cv=none; b=es/t8zhjVGlE4SPBodY/rgIBnPSJZgeT2qXqbEG74R+HfN4rVVUNZLzQAG9K4a8Xj5wnXBJmoDGMOw3BNRHKrOtivpGwYqhjrUSbOxifj7SJwjxnYgsIZoC4bYeIUxxhYWTyeFyecbRD7+/l6tCDaGlW7C6/MH2CwJ29/BF/HSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861248; c=relaxed/simple;
	bh=kryiSL0c5gWoP5Xn33RlQGuB1fDy2r29C8AZwGGNizM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMmMq3bqTtmK1jmbVL+FDFpZYD4SJWE+ZBHLq/jqvQ0Uf5NtxhKMCYw+lPwr09pXzIoD5tFWwNvxFpSBGQLewvOh2mPjj6TWG6LIb0kA6lpG0D7Hwidm+cl+O9JisKVSLGebcZN4kYticFyp4I2krGhikjHrcvJ6oM3KDujHlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyVV6yho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BC8C4CEF7;
	Mon, 30 Mar 2026 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861247;
	bh=kryiSL0c5gWoP5Xn33RlQGuB1fDy2r29C8AZwGGNizM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WyVV6yhoGLHl2DGlMtLNk2PLvv1LoFNZHT4upzyLknoqI3XroAjHB9I1ha+vU4mPX
	 jqLByu7cdkfcSBvwjAbgeSA7t1FnsQjdZlrHnf9SNnPEyV8aXCVfzuhI/9ayog85j2
	 ZCfecMUhBhB9NayIQbTF+29vTra1H0L8yHpOy9Fwzj1WruGul10WlXsrznGUH8EUO4
	 yAVoSQA1pK/w43OyYruiDlv+uPCsaxYtmh6p3C7asR9EeKI1wjuzkpsIcL4izJJluW
	 H7vlwohlhoQLLz7U0ZJ9f5WNsHXklzmi3Z/jx+6T/BWbr7v0B1OnwuC2GYBfZcweMT
	 Fa1JpYbf/eG2w==
Message-ID: <b1c93301-c12a-46a6-ba92-53e8f9a28022@kernel.org>
Date: Mon, 30 Mar 2026 11:00:37 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] mm: move free_reserved_area() to mm/memblock.c
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andreas Larsson <andreas@gaisler.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <jackmanb@google.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Brauner <brauner@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20260323074836.3653702-1-rppt@kernel.org>
 <20260323074836.3653702-5-rppt@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260323074836.3653702-5-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6621-lists,sparclinux=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,zeniv.linux.org.uk,gaisler.com,kernel.org,alien8.de,arm.com,davemloft.net,linux.intel.com,linaro.org,redhat.com,suse.cz,cmpxchg.org,oracle.com,linux.ibm.com,samsung.com,ellerman.id.au,suse.com,gmail.com,zytor.com,nvidia.com,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.infradead.org,kvack.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB4C5357B5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 08:48, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> free_reserved_area() is related to memblock as it frees reserved memory
> back to the buddy allocator, similar to what memblock_free_late() does.
> 
> Move free_reserved_area() to mm/memblock.c to prepare for further
> consolidation of the functions that free reserved memory.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


