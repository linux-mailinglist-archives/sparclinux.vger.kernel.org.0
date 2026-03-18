Return-Path: <sparclinux+bounces-6498-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M1cF2GHumnSXgIAu9opvQ
	(envelope-from <sparclinux+bounces-6498-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 12:07:13 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B292BA7D3
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 12:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FD731A9866
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2026 11:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15DF3BED56;
	Wed, 18 Mar 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rU9KH6SS"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A83B8BBC;
	Wed, 18 Mar 2026 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831555; cv=none; b=kVt/bGnhOSQFEaytQjLb0DFXXWMv052JxqCHxBmLSdthpxEdmnioXXbuRg2wdD/bm0X2NSGBF6NGea+i7LsO6WNy8sPZciwOq7Gg9wpEhsUDfASzlp2Bbk/IDQO67Al3AkQiMZF5il0blobAxuDrXQt969OjMgfQ3NS6aa/wheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831555; c=relaxed/simple;
	bh=Zoj4gf8i7wyLd0/obmXgnP8SmqlA2rGZ2C3jdfoF95I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRms/CXZOCoC1whGgubhU8pkC5P2NJl40M3Qnl+VCV6mpB/jsXEXZBXUH8zGcspKPdcZdyg4tQxmblxmKgm72IMPWu0r8QPTtlBciX0Sj+ZH8VkwCaDN/pbrtMHd/OiHkjBoNRcyYS0xzd3y9VAm/FDh0PDhRS6DASdsDA9OEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rU9KH6SS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF89C2BCB2;
	Wed, 18 Mar 2026 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831554;
	bh=Zoj4gf8i7wyLd0/obmXgnP8SmqlA2rGZ2C3jdfoF95I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rU9KH6SSU1eVwCpzSqG52mlBGTcHrnXJ5NciS3FbIP6iXmaONG7+xGMFW+GrF35KS
	 zApVxwPoOJ5fh+Co7piBNJXn3gxE+VHO8+L3iQYdzjxIlcHmmjxtFljUbD8p1qNJoT
	 z/1yZqOnDz1d497ur2v46avMjjrGtSJk9mzG1pXYvXZuFRG3crBPg1olXJFtQVl1yF
	 fNWDB+4gQ6fV+7YL6m3tMRlyfsZiQWIlpYAnNSJ2HqhGu9LvLzjynIP10m2Jc3PE8u
	 h1HkHzkZfEUXm8Q9p8zEJnkpY6RZa5ZmY6CN8WUzLeIxFjjq2BkX7EHPJYF8Wiua/3
	 UCiMaIWQPw4rA==
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
Subject: [PATCH 3/8] mm: move free_reserved_area() to mm/memblock.c
Date: Wed, 18 Mar 2026 12:58:22 +0200
Message-ID: <20260318105827.1358927-4-rppt@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6498-lists,sparclinux=lfdr.de];
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
X-Rspamd-Queue-Id: C8B292BA7D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

free_reserved_area() is related to memblock as it frees reserved memory
back to the buddy allocator, similar to what memblock_free_late() does.

Move free_reserved_area() to mm/memblock.c to prepare for further
consolidation of the functions that free reserved memory.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c   | 37 ++++++++++++++++++++++++++++++++++++-
 mm/page_alloc.c | 36 ------------------------------------
 2 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index b3ddfdec7a80..8f3010dddc58 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -893,6 +893,42 @@ int __init_memblock memblock_remove(phys_addr_t base, phys_addr_t size)
 	return memblock_remove_range(&memblock.memory, base, size);
 }
 
+unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
+{
+	void *pos;
+	unsigned long pages = 0;
+
+	start = (void *)PAGE_ALIGN((unsigned long)start);
+	end = (void *)((unsigned long)end & PAGE_MASK);
+	for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
+		struct page *page = virt_to_page(pos);
+		void *direct_map_addr;
+
+		/*
+		 * 'direct_map_addr' might be different from 'pos'
+		 * because some architectures' virt_to_page()
+		 * work with aliases.  Getting the direct map
+		 * address ensures that we get a _writeable_
+		 * alias for the memset().
+		 */
+		direct_map_addr = page_address(page);
+		/*
+		 * Perform a kasan-unchecked memset() since this memory
+		 * has not been initialized.
+		 */
+		direct_map_addr = kasan_reset_tag(direct_map_addr);
+		if ((unsigned int)poison <= 0xFF)
+			memset(direct_map_addr, poison, PAGE_SIZE);
+
+		free_reserved_page(page);
+	}
+
+	if (pages && s)
+		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
+
+	return pages;
+}
+
 /**
  * memblock_free - free boot memory allocation
  * @ptr: starting address of the  boot memory allocation
@@ -1776,7 +1812,6 @@ void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 		totalram_pages_inc();
 	}
 }
-
 /*
  * Remaining API functions
  */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2d4b6f1a554e..df3d61253001 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6234,42 +6234,6 @@ void adjust_managed_page_count(struct page *page, long count)
 }
 EXPORT_SYMBOL(adjust_managed_page_count);
 
-unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
-{
-	void *pos;
-	unsigned long pages = 0;
-
-	start = (void *)PAGE_ALIGN((unsigned long)start);
-	end = (void *)((unsigned long)end & PAGE_MASK);
-	for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
-		struct page *page = virt_to_page(pos);
-		void *direct_map_addr;
-
-		/*
-		 * 'direct_map_addr' might be different from 'pos'
-		 * because some architectures' virt_to_page()
-		 * work with aliases.  Getting the direct map
-		 * address ensures that we get a _writeable_
-		 * alias for the memset().
-		 */
-		direct_map_addr = page_address(page);
-		/*
-		 * Perform a kasan-unchecked memset() since this memory
-		 * has not been initialized.
-		 */
-		direct_map_addr = kasan_reset_tag(direct_map_addr);
-		if ((unsigned int)poison <= 0xFF)
-			memset(direct_map_addr, poison, PAGE_SIZE);
-
-		free_reserved_page(page);
-	}
-
-	if (pages && s)
-		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
-
-	return pages;
-}
-
 void free_reserved_page(struct page *page)
 {
 	clear_page_tag_ref(page);
-- 
2.51.0


