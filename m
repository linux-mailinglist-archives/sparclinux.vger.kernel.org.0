Return-Path: <sparclinux+bounces-533-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E48734A9
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 11:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36A9B23277
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 10:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B271E605C9;
	Wed,  6 Mar 2024 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRjm1fdi"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F961E520
	for <sparclinux@vger.kernel.org>; Wed,  6 Mar 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721752; cv=none; b=Vv3W1vEBO1gLQNlHQHQgAeu/9thni9tHUoHCQntytBu8vdV5tPMKGui50/yiC/SAJdtsh01N7WSH9pfcndKcva3cLPfgm2tcE7r6B8w/QtYZ/lfMhNW+9lE4dvMziEl4G9zWmO5YQ48LelBdKoHNuWO2JVEpxfzrO5AXg3dHJhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721752; c=relaxed/simple;
	bh=xsXv+igcIa2LD7vY6Lm1s+FcdmOPBabwjo2Ma8p3Wuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bF5+cm+VbQpxyaetYbMJJlilKYdadkkn/QHrHkWSEFVlMrQTPP2b0l4AcAyGdgB77yDI1htq7GbJFX0zmrivAixXuvBsmaeqFjuqKkE4x6/4Eda0VNUD5M7/Hx+ToITX6JZeZOV9qtbhuGIK2B2SK6K0eeouZaiI4LbC2QS3B/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRjm1fdi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtZJyICZEGrBJHpYWSu5beimQ7UmPGzVa4S5UCB/Dcs=;
	b=VRjm1fdi9IkjkEYwRTvp3lQqzyJKLYUGUs7D0K5tF8+0MQOJ8Blf4Uq/jnwHJSv8lBach3
	Fm6jcvee1YDSWtw+GWZ+F7DwpVfOz5VLXBIkWMGyvLegp9sQ7Q9kSZJxmhOXQ1mAGj25gH
	7jyWP0ekFp+V5COySdFO+W3snmuhmIY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-pSuV4CgQPZqjr3JAlJcBuA-1; Wed,
 06 Mar 2024 05:42:27 -0500
X-MC-Unique: pSuV4CgQPZqjr3JAlJcBuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22C123C0DF60;
	Wed,  6 Mar 2024 10:42:26 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 252A3112131D;
	Wed,  6 Mar 2024 10:42:17 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Jason Gunthorpe <jgg@nvidia.com>,
	peterx@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	x86@kernel.org,
	sparclinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH RFC 04/13] mm/x86: Change pXd_huge() behavior to exclude swap entries
Date: Wed,  6 Mar 2024 18:41:38 +0800
Message-ID: <20240306104147.193052-5-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

From: Peter Xu <peterx@redhat.com>

This patch partly reverts below commits:

3a194f3f8ad0 ("mm/hugetlb: make pud_huge() and follow_huge_pud() aware of non-present pud entry")
cbef8478bee5 ("mm/hugetlb: pmd_huge() returns true for non-present hugepage")

Right now, pXd_huge() definition across kernel is unclear. We have two
groups that think differently on swap entries:

  - x86/sparc:     Allow pXd_huge() to accept swap entries
  - all the rest:  Doesn't allow pXd_huge() to accept swap entries

This is so confusing.  Since the sparc helpers seem to be added in 2016,
which is after x86's (2015), so sparc could have followed a trend.  x86
proposed such swap handling in 2015 to resolve hugetlb swap entries hit in
GUP, but now GUP guards swap entries with !pXd_present() in all layers so
we should be safe.

We should define this API properly, one way or another, rather than keep
them defined differently across archs.

Gut feeling tells me that pXd_huge() shouldn't include swap entries, and it
turns out that I am not the only one thinking so, the question was raised
when the current pmd_huge() for x86 was proposed by Ville Syrjälä:

https://lore.kernel.org/all/Y2WQ7I4LXh8iUIRd@intel.com/

  I might also be missing something obvious, but why is it even necessary
  to treat PRESENT==0+PSE==0 as a huge entry?

It is also questioned when Jason Gunthorpe reviewed the other patchset on
swap entry handlings:

https://lore.kernel.org/all/20240221125753.GQ13330@nvidia.com/

Revert its meaning back to original.  It shouldn't have any functional
change as we should be ready with guards on !pXd_present() explicitly
everywhere.

Note that I also dropped the "#if CONFIG_PGTABLE_LEVELS > 2", it was there
probably because it was breaking things when 3a194f3f8ad0 was proposed,
according to the report here:

https://lore.kernel.org/all/Y2LYXItKQyaJTv8j@intel.com/

Now we shouldn't need that.

Instead of reverting to _PAGE_PSE raw check, leverage pXd_leaf().

Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/mm/hugetlbpage.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 5804bbae4f01..8362953a24ce 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -20,29 +20,19 @@
 #include <asm/elf.h>
 
 /*
- * pmd_huge() returns 1 if @pmd is hugetlb related entry, that is normal
- * hugetlb entry or non-present (migration or hwpoisoned) hugetlb entry.
- * Otherwise, returns 0.
+ * pmd_huge() returns 1 if @pmd is hugetlb related entry.
  */
 int pmd_huge(pmd_t pmd)
 {
-	return !pmd_none(pmd) &&
-		(pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
+	return pmd_leaf(pmd);
 }
 
 /*
- * pud_huge() returns 1 if @pud is hugetlb related entry, that is normal
- * hugetlb entry or non-present (migration or hwpoisoned) hugetlb entry.
- * Otherwise, returns 0.
+ * pud_huge() returns 1 if @pud is hugetlb related entry.
  */
 int pud_huge(pud_t pud)
 {
-#if CONFIG_PGTABLE_LEVELS > 2
-	return !pud_none(pud) &&
-		(pud_val(pud) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
-#else
-	return 0;
-#endif
+	return pud_leaf(pud);
 }
 
 #ifdef CONFIG_HUGETLB_PAGE
-- 
2.44.0


