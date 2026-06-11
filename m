Return-Path: <sparclinux+bounces-6906-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BSf3G2ShKmoFuAMAu9opvQ
	(envelope-from <sparclinux+bounces-6906-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 11 Jun 2026 13:52:04 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747A6718A6
	for <lists+sparclinux@lfdr.de>; Thu, 11 Jun 2026 13:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MetWtrrc;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6906-lists+sparclinux=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="sparclinux+bounces-6906-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7352F3012872
	for <lists+sparclinux@lfdr.de>; Thu, 11 Jun 2026 11:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A63D3CB8F5;
	Thu, 11 Jun 2026 11:51:10 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13233E63B7;
	Thu, 11 Jun 2026 11:51:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178670; cv=none; b=HpUXga57DWmQwb2dV/zYucUlZ+TSzwvJMMxhA+05dWuniDa9p1nbgGRI+AyEIJjRprZjltFZv/XYFpMMb6qvTWmIr12p3Xs469IJEPMSmrHBznVG7wZgHUHgSuK1Kjcc6E4P8K1663HfvU213MJJMPMtxMVfVoj0Cp+K5HW6Scc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178670; c=relaxed/simple;
	bh=PPok5gDOF9NUYuw5o7J/qIsnZFoNJO5XX2yKjk8R8rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLDFH5fq9qda5kuaY+htH/EXBNLwcvpfyIJ+/ZkY34sZpTxDAGgiDc4VuwfraqqXX5AoX+RDSfTOn/Ocop1zvscsKUZDsAbFbinlsZQRo48sXz6aPZSmyMjAAx0QOzpFJiP6FOcaoJ9XahYXJ+jA3TxF+JkcxTev7G2LNGyBYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MetWtrrc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB45A1F00898;
	Thu, 11 Jun 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178668;
	bh=BT1sEEbTnVOk6eL6aYsKhNOuh8LlCELh0FnPZ6pIttA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MetWtrrcxVV3T1O0Ds7aVklaV3qE/dS5NabUkyuWVZ9ZdZjZUI+i45WObN3iW2kFD
	 pU5wVL8PfyU8cz6JsLXKFe49YE89Tu+PR261qgm9z+N8DTsdzYf4ZZxzNpLuGucHRm
	 hZWkE9WsI2D4a+D+TUiabrm2PDeN3trtmY5yqzbym0CIJZuR1oQvOkBRZSeoK051zp
	 f2QWcsqltb5kF0vmEArtB3WXSpet+R6vwGtIXyIcmiRd8YsGOBwLg1GJfVHQm74kIW
	 IaTWzEvl1dJRVmybhrdkUIkq/Sr8nPj01DwlJ+WlxIizusSg5WthQngAJU6Fn963gv
	 5VbWHwedvdQsw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 11 Jun 2026 13:50:48 +0200
Subject: [PATCH 2/3] mm: drop pte_clear_not_present_full()
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-clear_not_present_full_ptes-v1-2-49865fc82629@kernel.org>
References: <20260611-clear_not_present_full_ptes-v1-0-49865fc82629@kernel.org>
In-Reply-To: <20260611-clear_not_present_full_ptes-v1-0-49865fc82629@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@kernel.org,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-6906-lists,sparclinux=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6747A6718A6

In general, there is no good reason to do anything special when clearing
non-present PTEs.

In theory, HW that does have to invalidate TLBs for non-present PTEs could
benefit from a "full" parameter, but fortunately
pte_clear_not_present_full() is not wired up anymore ... and there would
have to be something very convincing for us to care about that to re-add
it.

So, let's just use pte_clear() directly now.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/pgtable.h | 19 ++-----------------
 mm/madvise.c            |  4 ++--
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..cf328f4d1e12 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -954,21 +954,6 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
 	update_mmu_tlb_range(vma, address, ptep, 1);
 }
 
-/*
- * Some architectures may be able to avoid expensive synchronization
- * primitives when modifications are made to PTE's which are already
- * not present, or in the process of an address space destruction.
- */
-#ifndef __HAVE_ARCH_PTE_CLEAR_NOT_PRESENT_FULL
-static inline void pte_clear_not_present_full(struct mm_struct *mm,
-					      unsigned long address,
-					      pte_t *ptep,
-					      int full)
-{
-	pte_clear(mm, address, ptep);
-}
-#endif
-
 #ifndef clear_not_present_full_ptes
 /**
  * clear_not_present_full_ptes - Clear multiple not present PTEs which are
@@ -980,7 +965,7 @@ static inline void pte_clear_not_present_full(struct mm_struct *mm,
  * @full: Whether we are clearing a full mm.
  *
  * May be overridden by the architecture; otherwise, implemented as a simple
- * loop over pte_clear_not_present_full().
+ * loop over pte_clear().
  *
  * Context: The caller holds the page table lock.  The PTEs are all not present.
  * The PTEs are all in the same PMD.
@@ -989,7 +974,7 @@ static inline void clear_not_present_full_ptes(struct mm_struct *mm,
 		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
 {
 	for (;;) {
-		pte_clear_not_present_full(mm, addr, ptep, full);
+		pte_clear(mm, addr, ptep);
 		if (--nr == 0)
 			break;
 		ptep++;
diff --git a/mm/madvise.c b/mm/madvise.c
index cd9bb077072c..f3cda54c1d6a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -698,7 +698,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				clear_not_present_full_ptes(mm, addr, pte, nr, tlb->fullmm);
 			} else if (softleaf_is_hwpoison(entry) ||
 				   softleaf_is_poison_marker(entry)) {
-				pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
+				pte_clear(mm, addr, pte);
 			}
 			continue;
 		}
@@ -1234,7 +1234,7 @@ static int guard_remove_pte_entry(pte_t *pte, unsigned long addr,
 
 	if (is_guard_pte_marker(ptent)) {
 		/* Simply clear the PTE marker. */
-		pte_clear_not_present_full(walk->mm, addr, pte, false);
+		pte_clear(walk->mm, addr, pte);
 		update_mmu_cache(walk->vma, addr, pte);
 	}
 

-- 
2.43.0


