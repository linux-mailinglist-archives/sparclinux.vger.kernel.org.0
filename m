Return-Path: <sparclinux+bounces-6943-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MzfLI2F4QmoF8AkAu9opvQ
	(envelope-from <sparclinux+bounces-6943-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 15:51:29 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D46DB8E7
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 15:51:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="WV42/Xmb";
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6943-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="sparclinux+bounces-6943-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B48F130451ED
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB9B326941;
	Mon, 29 Jun 2026 13:50:12 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA10282F13;
	Mon, 29 Jun 2026 13:50:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741012; cv=none; b=MBPpR9DOpT3/eHqxJWkB8kRqN7pZii2YzpUTxw3LE/w2WCEKKT4sBdc8AbbLNKctiR3AFyRd6DOY09NIMLLluqMA1FTZQCzOwUXixee1oYPtKTfAreoug6CUPTRh9F3F8t9RTlQLXEXcIiYSY7oFGqjK+pAPnWkFIxoX9WDTvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741012; c=relaxed/simple;
	bh=SpzwnkKVjeN33kPXJcx2AI7MFCbXH8Ii9jfO+mNHImA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFFiO2KDCFbGoBiklqZ8rTQlp2mPyaw+DeSLEiDbDlQh3uaLoQ+Iu23sH3zF8uOqb4UB68zRsDKKplAtm5maQRTkmgcriFtuddQezPnFAlyytbicn6E6XbUrc3mfWwuTt5SYrqOMq1tPt4YjHi2a6i5RyVyH3k4ApAEiBF1j1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV42/Xmb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308341F00A3A;
	Mon, 29 Jun 2026 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782741011;
	bh=4ZaedSRrpHFjNO1R6B1tpmcbF1xO81AFjh3EFzP2Lb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WV42/Xmb2BlEiMmiPWNnXK8Fgacum43ZD0Hm5gcBIC5Kg+fPFyV2rY+Etw6L9vNaG
	 hbsDujI6YqNVhiZ05IjDH9QNBbfIYBSys+H1Jc6/6JixPc1pcScqLC9/Lz/f3OFhba
	 ToJMpgcfq7IMopXmQSa7WR95qtjXK1d982owIbX+E4uItMKNXU/f1U+3p1RWGA0tp+
	 IWpzHnJHp0a7MmduZ2zwWOqzgTofNPExqgVIrmHWcMPm1zZ17OoBQRTqNsG53BiBE5
	 UHFk5UFAsib6y4fLK2h3k7rOr8pQMRwr4h9zhmliBWVWkSROnF7nfp5KiFeuFYBaC4
	 ee/T+lUIrl7uQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 29 Jun 2026 15:49:47 +0200
Subject: [PATCH v2 1/3] sparc/mm: drop custom pte_clear_not_present_full()
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-clear_not_present_full_ptes-v2-1-96089871a1e7@kernel.org>
References: <20260629-clear_not_present_full_ptes-v2-0-96089871a1e7@kernel.org>
In-Reply-To: <20260629-clear_not_present_full_ptes-v2-0-96089871a1e7@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@kernel.org,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-6943-lists,sparclinux=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 025D46DB8E7

On sparc64, pte_clear_not_present_full() nowadays does a simple
__set_pte_at(). In __set_pte_at() -> maybe_tlb_batch_add(), we check
pte_accessible() to see whether to call tlb_batch_add().

However, non-present PTEs are surely not accessible, so tlb_batch_add()
is never called and the "full" parameter is irrelevant.

Let's drop the helper and just let common code do a pte_clear().

pte_clear() on sparc64 maps to set_pte_at()->set_ptes()->__set_pte_at()
... so it ends up calling the same function, just with "full=0".

Given that "full" is irrelevant, there is no change.

We added pte_clear_not_present_full() for sparc64 in commit 90f08e399d05
("sparc: mmu_gather rework"), and I suspect that it was already not
required back then.

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/sparc/include/asm/pgtable_64.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 74ede706fb325..0837ebbc5dce6 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -945,10 +945,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #define pte_clear(mm,addr,ptep)		\
 	set_pte_at((mm), (addr), (ptep), __pte(0UL))
 
-#define __HAVE_ARCH_PTE_CLEAR_NOT_PRESENT_FULL
-#define pte_clear_not_present_full(mm,addr,ptep,fullmm)	\
-	__set_pte_at((mm), (addr), (ptep), __pte(0UL), (fullmm))
-
 #ifdef DCACHE_ALIASING_POSSIBLE
 #define __HAVE_ARCH_MOVE_PTE
 #define move_pte(pte, old_addr, new_addr)				\

-- 
2.43.0


