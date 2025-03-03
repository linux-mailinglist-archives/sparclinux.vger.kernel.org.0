Return-Path: <sparclinux+bounces-3239-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F1A4C313
	for <lists+sparclinux@lfdr.de>; Mon,  3 Mar 2025 15:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7EA18923B2
	for <lists+sparclinux@lfdr.de>; Mon,  3 Mar 2025 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36DA213E60;
	Mon,  3 Mar 2025 14:16:01 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDD221324F;
	Mon,  3 Mar 2025 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011361; cv=none; b=YPoG/m64t40sYN2GxiOskMi0H0SPrrJLJTavl3OQxZQA+Enatmz2p71B+ppL0TVnqp4cr2ubvBgmnQsGxg5pu6vTHLGcuyOzWP6mds0FSUS7xXDxT14vqhZ6KskR/2VVzQHclrpyvkOc5jKOqORjXg8yqCqxUu2xgPAiF48Znq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011361; c=relaxed/simple;
	bh=n7QaXbzZBzjDb7zEaetrjA+0DEIV2YJ6OgKGAXYlBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTOm/CzQ03c01ON6sQ1qOw0dnKswe3wWdsG/gzMo6mFpCDFJjPzBB5ERWZhllswJ8GrMp75yivZae9w/kCcUgz5znvaBenygEKsZ3Ca89yfTV5bMlFJGjTjuiWtAOmdFN/btpTTFYFBM2d7HGA8ZC7RckVgfF/f4NfUW2kRI14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ABF8175A;
	Mon,  3 Mar 2025 06:16:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6783F66E;
	Mon,  3 Mar 2025 06:15:56 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 2/5] fs/proc/task_mmu: Reduce scope of lazy mmu region
Date: Mon,  3 Mar 2025 14:15:36 +0000
Message-ID: <20250303141542.3371656-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the way arch_[enter|leave]_lazy_mmu_mode() is called in
pagemap_scan_pmd_entry() to follow the normal pattern of holding the ptl
for user space mappings. As a result the scope is reduced to only the
pte table, but that's where most of the performance win is.

While I believe there wasn't technically a bug here, the original scope
made it easier to accidentally nest or, worse, accidentally call
something like kmap() which would expect an immediate mode pte
modification but it would end up deferred.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 fs/proc/task_mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index c17615e21a5d..b0f189815512 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2459,22 +2459,19 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	spinlock_t *ptl;
 	int ret;
 
-	arch_enter_lazy_mmu_mode();
-
 	ret = pagemap_scan_thp_entry(pmd, start, end, walk);
-	if (ret != -ENOENT) {
-		arch_leave_lazy_mmu_mode();
+	if (ret != -ENOENT)
 		return ret;
-	}
 
 	ret = 0;
 	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, start, &ptl);
 	if (!pte) {
-		arch_leave_lazy_mmu_mode();
 		walk->action = ACTION_AGAIN;
 		return 0;
 	}
 
+	arch_enter_lazy_mmu_mode();
+
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
 		for (addr = start; addr != end; pte++, addr += PAGE_SIZE) {
@@ -2543,8 +2540,8 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
 
-	pte_unmap_unlock(start_pte, ptl);
 	arch_leave_lazy_mmu_mode();
+	pte_unmap_unlock(start_pte, ptl);
 
 	cond_resched();
 	return ret;
-- 
2.43.0


