Return-Path: <sparclinux+bounces-6520-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFDdM4PywGkSPAQAu9opvQ
	(envelope-from <sparclinux+bounces-6520-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:57:55 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BD2EDF50
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 08:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC83A3007E19
	for <lists+sparclinux@lfdr.de>; Mon, 23 Mar 2026 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738013630BF;
	Mon, 23 Mar 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5My3+MQ"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC11363090;
	Mon, 23 Mar 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252164; cv=none; b=HhZ2XFO9SXtYMM/66hTJL1Ohy9NgsyEIb0/K6Xw0VIdfWIrjGa400RNbnRlue2CUwLYQfjIllMQD31OVt8eL2v0X8Qbk8Nuujw7Z8B61rQH5e0RVGg9N+qE/Ktq3I2LCSGEPHq/snzq1RN/mK14qZMnfry2P4Oiq59PHyFNzcO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252164; c=relaxed/simple;
	bh=H66xl/BIJkTq28ukNF8WEu/fNAsPeeebsB5A/nwWYaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAzKc21/oTyCm+hmKhGKiFf8xK+8Kt0Id4VyX4OR+jm0oJp++CSElXKPKF3k33vya8c/b6vp5MZ5o3I5ScPe9PoOt7d5YIFYWMd0OdX0Tob8AJ4dxkRSExqvb6wdX8TOUQjKMSOio+egmVzknYJpWDrWMvqteduXquJQmNKytSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5My3+MQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3804AC4CEF7;
	Mon, 23 Mar 2026 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252163;
	bh=H66xl/BIJkTq28ukNF8WEu/fNAsPeeebsB5A/nwWYaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5My3+MQvuPzdJ/eqnURHDufO2mFAIraPI31J+w/BDj7mSnOzz+bBSQ1nkIe6BHbp
	 XVpJh7sZx9NFenINTf9GYQ137cP6vq3WlrCC8bnp6YDsHPgO8DCjw+QUFpZuyiQRev
	 4ZiDp6rsouY8nD13d6IOzKlDukyiP/rqJ1UKAgnZiOiYzFhPGMGLMTbUTFoLqAqxjQ
	 tmiRSnujVaLodu+eJjuLWv5yflUsq2SZE3WtD7/jj+hDdLQLtnmbP8EpnzzEK7QIi7
	 D0NRQA1iQ/GFpfYatJJU9GNNL+T6vp+PtI6c81WogxjFBeSkYizd+xg4X95TFNbYpb
	 0iF2JqU+gfR1g==
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
Subject: [PATCH v2 3/9] powerpc: opal-core: pair alloc_pages_exact() with free_pages_exact()
Date: Mon, 23 Mar 2026 09:48:30 +0200
Message-ID: <20260323074836.3653702-4-rppt@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,zeniv.linux.org.uk,gaisler.com,kernel.org,alien8.de,arm.com,davemloft.net,linux.intel.com,linaro.org,redhat.com,suse.cz,cmpxchg.org,oracle.com,linux.ibm.com,samsung.com,ellerman.id.au,suse.com,gmail.com,zytor.com,nvidia.com,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.infradead.org,kvack.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6520-lists,sparclinux=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 538BD2EDF50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

opal-core allocates buffers with alloc_pages_exact(), but then
marks them as reserved and frees using free_reserved_area().

This is completely unnecessary and the pages allocated with
alloc_pages_exact() can be naturally freed with free_pages_exact().

Replace freeing of memory in opalcore_cleanup() with
free_pages_exact() and simplify allocation code so that it won't mark
allocated pages as reserved.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/powerpc/platforms/powernv/opal-core.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index e76e462f55f6..32662d30d70f 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -303,7 +303,6 @@ static int __init create_opalcore(void)
 	struct device_node *dn;
 	struct opalcore *new;
 	loff_t opalcore_off;
-	struct page *page;
 	Elf64_Phdr *phdr;
 	Elf64_Ehdr *elf;
 	int i, ret;
@@ -328,11 +327,6 @@ static int __init create_opalcore(void)
 		oc_conf->opalcorebuf_sz = 0;
 		return -ENOMEM;
 	}
-	count = oc_conf->opalcorebuf_sz / PAGE_SIZE;
-	page = virt_to_page(oc_conf->opalcorebuf);
-	for (i = 0; i < count; i++)
-		mark_page_reserved(page + i);
-
 	pr_debug("opalcorebuf = 0x%llx\n", (u64)oc_conf->opalcorebuf);
 
 	/* Read OPAL related device-tree entries */
@@ -437,10 +431,7 @@ static void opalcore_cleanup(void)
 
 	/* free the buffer used for setting up OPAL core */
 	if (oc_conf->opalcorebuf) {
-		void *end = (void *)((u64)oc_conf->opalcorebuf +
-				     oc_conf->opalcorebuf_sz);
-
-		free_reserved_area(oc_conf->opalcorebuf, end, -1, NULL);
+		free_pages_exact(oc_conf->opalcorebuf, oc_conf->opalcorebuf_sz);
 		oc_conf->opalcorebuf = NULL;
 		oc_conf->opalcorebuf_sz = 0;
 	}
-- 
2.53.0


