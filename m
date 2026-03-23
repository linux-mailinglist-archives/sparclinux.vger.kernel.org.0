Return-Path: <sparclinux+bounces-6524-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA9tA1TywGnxOwQAu9opvQ
	(envelope-from <sparclinux+bounces-6524-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:57:08 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A12EDF18
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6297308DB86
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 07:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E1C364058;
	Mon, 23 Mar 2026 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWVLvFut"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE113603D9;
	Mon, 23 Mar 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252208; cv=none; b=nFQfKsYo+TpTZdyM5Cy09WriOrL1JAKqxm8jGuGAelU9ZkPIMs34QTmrtg0SGVsou77o9qTIlniUJRch5Mrwq8kXpa1M1UGDyLATX6AEBc6BmM3w+GiBberTNBzATwYf1A4CqRQ0gcdTWp95NHqYV4KJiijIH5TgUMfRIeSVE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252208; c=relaxed/simple;
	bh=JX9RHWZi5vuFIJLodu0lHA5nrZZIkASHjFmUizN2RBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nA4j4qzJ/THfRiDtZbjSqUaviDmkXKL/ks4TnGZk0ggIOmm9sa4AwU6H1Hrcmy5tdyUPtIjDiPMEk1ONRIiX14ho5mq8RwsAVG9sWs/t5Gh7QB+8kOjRXHLX7pR+30LQ1tICqfcsJ2Eakr0Gt+7KcKfCaIT82m7anG3rV2uUZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWVLvFut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBAEC4CEF7;
	Mon, 23 Mar 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252208;
	bh=JX9RHWZi5vuFIJLodu0lHA5nrZZIkASHjFmUizN2RBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWVLvFut4f6MYN3wwvVgBsvFdFfwPxFVLIxEnZF2GAp0JQd7HON8/QxygCU2ypG3q
	 85RF6aLIrLIQls+Z9PC1N5+z9V63pBv8iSd7N325b75nqcJrfzheijh13oNYSPPUHF
	 7H4UTJH2FCWdxQJdQJ0moQ/robJ3B0VZTNpPoyjWFkZEoeQUN2laq6KQhmOmXfYL+r
	 ATjY+R2jtWYZYg2H6wmqiRgYcaDRVxYkBHUXg6eZ2dnlzyU+afaaq90pMJbntP0NXj
	 8kFILSXJOVGHQNzneF/T6HYv7O2tYy9lrUVFuGHfpzFLaD+zWwYbsaZr6rNdr5t1Nb
	 oKdXVBglapLiQ==
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
Subject: [PATCH v2 7/9] memblock: make free_reserved_area() update memblock if ARCH_KEEP_MEMBLOCK=y
Date: Mon, 23 Mar 2026 09:48:34 +0200
Message-ID: <20260323074836.3653702-8-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323074836.3653702-1-rppt@kernel.org>
References: <20260323074836.3653702-1-rppt@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6524-lists,sparclinux=lfdr.de];
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
X-Rspamd-Queue-Id: 6B7A12EDF18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

On architectures that keep memblock after boot, freeing of reserved memory
with free_reserved_area() is paired with an update of memblock arrays,
usually by a call to memblock_free().

Make free_reserved_area() directly update memblock.reserved when
ARCH_KEEP_MEMBLOCK is enabled.

Remove the now-redundant explicit memblock_free() call from
arm64::free_initmem() and the #ifdef CONFIG_ARCH_KEEP_MEMBLOCK block
from the generic free_initrd_mem().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/mm/init.c | 3 ---
 init/initramfs.c     | 7 -------
 mm/memblock.c        | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 96711b8578fd..07b17c708702 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -385,9 +385,6 @@ void free_initmem(void)
 	WARN_ON(!IS_ALIGNED((unsigned long)lm_init_begin, PAGE_SIZE));
 	WARN_ON(!IS_ALIGNED((unsigned long)lm_init_end, PAGE_SIZE));
 
-	/* Delete __init region from memblock.reserved. */
-	memblock_free(lm_init_begin, lm_init_end - lm_init_begin);
-
 	free_reserved_area(lm_init_begin, lm_init_end,
 			   POISON_FREE_INITMEM, "unused kernel");
 	/*
diff --git a/init/initramfs.c b/init/initramfs.c
index 139baed06589..bca0922b2850 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -652,13 +652,6 @@ void __init reserve_initrd_mem(void)
 
 void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
 {
-#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-	unsigned long aligned_start = ALIGN_DOWN(start, PAGE_SIZE);
-	unsigned long aligned_end = ALIGN(end, PAGE_SIZE);
-
-	memblock_free((void *)aligned_start, aligned_end - aligned_start);
-#endif
-
 	free_reserved_area((void *)start, (void *)end, POISON_FREE_INITMEM,
 			"initrd");
 }
diff --git a/mm/memblock.c b/mm/memblock.c
index ccdf3d225626..0ad968c2f2e8 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -942,6 +942,12 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 		end_pa = __pa(end - 1) + 1;
 	}
 
+	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
+		if (start_pa < end_pa)
+			memblock_remove_range(&memblock.reserved,
+					      start_pa, end_pa - start_pa);
+	}
+
 	pages = __free_reserved_area(start_pa, end_pa, poison);
 	if (pages && s)
 		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
-- 
2.53.0


