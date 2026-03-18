Return-Path: <sparclinux+bounces-6500-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDgsCaaHumnSXgIAu9opvQ
	(envelope-from <sparclinux+bounces-6500-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 12:08:22 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA142BA834
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 12:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECB5331B422E
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1FA3BED17;
	Wed, 18 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYu8UWE0"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD763BAD8C;
	Wed, 18 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831577; cv=none; b=bdEwxsdAEnTNKgE4NpJaQUrFditpmK9EenrEpV2CT07dLH0NuOQ2LuEJ/LPXEQHD/91IpUHLxhMcPXRvE3awvDbBXPIqKphbnI07P8aLQcYpKwpN+fe7S0WZvf6C4FW+xUK3fbI+i1X4izGCd6DMr/emlE0eVy0mcXqsCKItTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831577; c=relaxed/simple;
	bh=3jRGnlRsbxlziNoo+921sbArWCqbGJ6zS/W7kucFKbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxlBQNKtNYPyLkxYg3R/ZVroHjW+Gk906JtmCKeeUtQOZzmgY+NfFSfqHnnMDoEX/ZkFfDdz1wY22/jahjwy28sCw+ldAKxsmri+x57VEAVQ+E7XDptIcFZ3/E2AiMMPSOT0IQDr1Oz5JrRd5Orbl3/LO3Szv2r57U+VS4hPG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYu8UWE0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2464EC2BCB3;
	Wed, 18 Mar 2026 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831576;
	bh=3jRGnlRsbxlziNoo+921sbArWCqbGJ6zS/W7kucFKbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AYu8UWE0uFP7kB52RIh6t5RHb8Lm82CthAw5o2Oz3/zBoVceCs4mevcwy6gXgoXy3
	 zXfPELcxFDWWiacgMliiuggXx4CV15PRxM42zTRXwcC3AeoBO09S3lAQHEwKxmkc7u
	 S7zXJ3CpTFE4MwPOLMtCKjhcoKMWuzWjdNv96Yp+/yqtszyHDPqhX4x4WIqEjLXCRy
	 S3fvXz5m7LXo+SKILBEx1LpyBkMBSiLRc03d6ukL/MmLsvH4qH3q9/64XLA1d9HPwg
	 5R9bM+nCssf+m8rw1md06HV3Yf1v3AkdohGI5IDu5nkObk79u9DBk47nkf1xIJ97j2
	 QS9n6tdkUUzmA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andreas Larsson <andreas@gaisler.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 5/8] memblock: extract page freeing from free_reserved_area() into a helper
Date: Wed, 18 Mar 2026 12:58:24 +0200
Message-ID: <20260318105827.1358927-6-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318105827.1358927-1-rppt@kernel.org>
References: <20260318105827.1358927-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,zeniv.linux.org.uk,gaisler.com,kernel.org,alien8.de,arm.com,davemloft.net,linux.intel.com,linaro.org,redhat.com,suse.cz,cmpxchg.org,oracle.com,linux.ibm.com,samsung.com,ellerman.id.au,suse.com,gmail.com,zytor.com,nvidia.com,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.infradead.org,kvack.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6500-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9EA142BA834
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are two functions that release pages to the buddy allocator late in
the boot: free_reserved_area() and memblock_free_late().

Currently they are using different underlying functionality,
free_reserved_area() runs each page being freed via free_reserved_page()
and memblock_free_late() uses memblock_free_pages() -> __free_pages_core(),
but in the end they both boil down to a loop that frees a range page by
page.

Extract the loop frees pages from free_reserved_area() into a helper and
use that helper in memblock_free_late().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c | 55 +++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 27d4c9889b59..87bd200a8cc9 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -893,26 +893,12 @@ int __init_memblock memblock_remove(phys_addr_t base, phys_addr_t size)
 	return memblock_remove_range(&memblock.memory, base, size);
 }
 
-unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
+static unsigned long __free_reserved_area(phys_addr_t start, phys_addr_t end,
+					  int poison)
 {
-	phys_addr_t start_pa, end_pa;
 	unsigned long pages = 0, pfn;
 
-	/*
-	 * end is the first address past the region and it may be beyond what
-	 * __pa() or __pa_symbol() can handle.
-	 * Use the address included in the range for the cnversion and add back
-	 * 1 afterwards.
-	 */
-	if (__is_kernel((unsigned long)start)) {
-		start_pa = __pa_symbol(start);
-		end_pa = __pa_symbol(end - 1) + 1;
-	} else {
-		start_pa = __pa(start);
-		end_pa = __pa(end - 1) + 1;
-	}
-
-	for_each_valid_pfn(pfn, PFN_UP(start_pa), PFN_DOWN(end_pa)) {
+	for_each_valid_pfn(pfn, PFN_UP(start), PFN_DOWN(end)) {
 		struct page *page = pfn_to_page(pfn);
 		void *direct_map_addr;
 
@@ -934,7 +920,29 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 		free_reserved_page(page);
 		pages++;
 	}
+	return pages;
+}
+
+unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
+{
+	phys_addr_t start_pa, end_pa;
+	unsigned long pages;
+
+	/*
+	 * end is the first address past the region and it may be beyond what
+	 * __pa() or __pa_symbol() can handle.
+	 * Use the address included in the range for the cnversion and add back
+	 * 1 afterwards.
+	 */
+	if (__is_kernel((unsigned long)start)) {
+		start_pa = __pa_symbol(start);
+		end_pa = __pa_symbol(end - 1) + 1;
+	} else {
+		start_pa = __pa(start);
+		end_pa = __pa(end - 1) + 1;
+	}
 
+	pages = __free_reserved_area(start_pa, end_pa, poison);
 	if (pages && s)
 		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
 
@@ -1810,20 +1818,15 @@ void *__init __memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
  */
 void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 {
-	phys_addr_t cursor, end;
+	phys_addr_t end = base + size - 1;
 
-	end = base + size - 1;
 	memblock_dbg("%s: [%pa-%pa] %pS\n",
 		     __func__, &base, &end, (void *)_RET_IP_);
-	kmemleak_free_part_phys(base, size);
-	cursor = PFN_UP(base);
-	end = PFN_DOWN(base + size);
 
-	for (; cursor < end; cursor++) {
-		memblock_free_pages(cursor, 0);
-		totalram_pages_inc();
-	}
+	kmemleak_free_part_phys(base, size);
+	__free_reserved_area(base, base + size, -1);
 }
+
 /*
  * Remaining API functions
  */
-- 
2.51.0


