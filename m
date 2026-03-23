Return-Path: <sparclinux+bounces-6519-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PZUJHvwwGkUOwQAu9opvQ
	(envelope-from <sparclinux+bounces-6519-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:49:15 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D82EDC61
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B3B03004936
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E39363090;
	Mon, 23 Mar 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJkHNMOm"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E032D63F8;
	Mon, 23 Mar 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252153; cv=none; b=Hgf3naqIXQA1j/ZXw9/bBALNB1FmUuUNAxrLbZ+AC8biG+rQvncXoM7Ny/ivQ5PeyjhwflcYfnqCjsRAUMM3abn6r4Csry9BhOePnyRAnVpr3KmNk4JPjgnUHIw/ff+dx/rxyYC1t3dD65jgdhzzNWlYR1je0N6qXK9tGVj2Qls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252153; c=relaxed/simple;
	bh=IEszaCrFLo/Rs8yG7tIln7RmG7s5ArmJTUt7L+grDBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8gQxFYmG+7rxamV6HRl2biVrXxlBQtvDTRmUw2vmyAjI/ck5cKyUt0Cvq5etuUoa5Ihzt86lEKR1Aq0olMQvTg/NpkNQgiamTwzc3TH5kV8cZaIW8o3TSsqNb5kuucfPedsMV+T2c6ZkpvixqbrDwapIMjXpWqUNpaISy1Kox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJkHNMOm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161B9C2BC9E;
	Mon, 23 Mar 2026 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252152;
	bh=IEszaCrFLo/Rs8yG7tIln7RmG7s5ArmJTUt7L+grDBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJkHNMOmwoIFLTcd31YucBrDfzfANQW+xkkREf7kQp1YDYI6vfV8/hVhcG3l8g/jK
	 sQngYeWtYhv0ZkW+8RpdtrXoti30446exi6Ju2/Ux3my4Q287Qpr4iWYaKli+PF0u9
	 vL/UiFYGZsmNZ4bQKMUXEy7AH5R6vF3zaUA3sbrcBu/WMLiPFtPcKLGomrzmqCTzqi
	 PwkOo9OAQEaeopupEyTaQ/a8bAo4WgnB6AuNb75FaxwKNBNMNqccFmqdvaop/ltQA0
	 aYjKEuyW1vof5rqfOJ6PkR20WHVtA+dub6QcUQQxq3ViDq6QsOyMq2uvJPowcDC5VL
	 AoERA5+OddeHw==
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
Subject: [PATCH v2 2/9] powerpc: fadump: pair alloc_pages_exact() with free_pages_exact()
Date: Mon, 23 Mar 2026 09:48:29 +0200
Message-ID: <20260323074836.3653702-3-rppt@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,zeniv.linux.org.uk,gaisler.com,kernel.org,alien8.de,arm.com,davemloft.net,linux.intel.com,linaro.org,redhat.com,suse.cz,cmpxchg.org,oracle.com,linux.ibm.com,samsung.com,ellerman.id.au,suse.com,gmail.com,zytor.com,nvidia.com,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.infradead.org,kvack.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6519-lists,sparclinux=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 332D82EDC61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

fadump allocates buffers with alloc_pages_exact(), but then marks them
as reserved and frees using free_reserved_area().

This is completely unnecessary and the pages allocated with
alloc_pages_exact() can be naturally freed with free_pages_exact().

Replace freeing of memory in fadump_free_buffer() with
free_pages_exact() and simplify allocation code so that it won't mark
allocated pages as reserved.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/powerpc/kernel/fadump.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4ebc333dd786..501d43bf18f3 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -775,24 +775,12 @@ void __init fadump_update_elfcore_header(char *bufp)
 
 static void *__init fadump_alloc_buffer(unsigned long size)
 {
-	unsigned long count, i;
-	struct page *page;
-	void *vaddr;
-
-	vaddr = alloc_pages_exact(size, GFP_KERNEL | __GFP_ZERO);
-	if (!vaddr)
-		return NULL;
-
-	count = PAGE_ALIGN(size) / PAGE_SIZE;
-	page = virt_to_page(vaddr);
-	for (i = 0; i < count; i++)
-		mark_page_reserved(page + i);
-	return vaddr;
+	return  alloc_pages_exact(size, GFP_KERNEL | __GFP_ZERO);
 }
 
 static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
 {
-	free_reserved_area((void *)vaddr, (void *)(vaddr + size), -1, NULL);
+	free_pages_exact((void *)vaddr, size);
 }
 
 s32 __init fadump_setup_cpu_notes_buf(u32 num_cpus)
-- 
2.53.0


