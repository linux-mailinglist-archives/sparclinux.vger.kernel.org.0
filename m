Return-Path: <sparclinux+bounces-530-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C24873489
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 11:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C6E1C20E4F
	for <lists+sparclinux@lfdr.de>; Wed,  6 Mar 2024 10:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653A15F566;
	Wed,  6 Mar 2024 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLeURglk"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352B605CA
	for <sparclinux@vger.kernel.org>; Wed,  6 Mar 2024 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721731; cv=none; b=IQikmGOZR+ZZZ0MJJdMKrcTBKK3/IsMDyzd1hPT3ImH5nGNOqYmkmcjQfoeeZPFO8x8Z4vUmFVKICEkpCfKpV5xj9TzRBvNRpDvfbTf1Rsk2lLyr8u+4mGCcLb4C0kEu6wimQ9284TpAiZpar9+bRNnT0RZZR3JwqdFZwaIqgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721731; c=relaxed/simple;
	bh=TOc5ZVxpN+gjn979gpSdbWiDJGT5Kkl4rfkIMqncNfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qg8frHnVWaFMndH0dfkBQbincyjohMo079+yr+W41YVSS/reQLeFqSDBO17qvYAlN+niBWkYNsJMyr0h2ng4/p8hpM5UzYvJfy99hA/ee9l3lwNIoPDOM5ObztLU3WhdcSXG5quHU+RSyrHe4IAaSBRMRd0SxZvwbpncuI0dgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLeURglk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20nNimBrOEQv87l0vyMx8t0O66X6ZMzRQtOERvnhrUo=;
	b=cLeURglkwkRzHo8oQ5I3fyDGuW7soNfjQWd8FO14Gca63TxWBsBfKUXoeNk6uUFKhuig6J
	utyBNIGWl97HCI5HYGSN6OR/vaZqghgo61+6h6JrAfj6zqwxRWTxoki23LtIpNvtX4IsBW
	6LOnPn6qrQP8c+4PwT2qojIuuFrMIdc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-oo52lPpuOsCDdbHCtpeneA-1; Wed,
 06 Mar 2024 05:42:04 -0500
X-MC-Unique: oo52lPpuOsCDdbHCtpeneA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7D471C05AF3;
	Wed,  6 Mar 2024 10:42:03 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2C5112131D;
	Wed,  6 Mar 2024 10:41:56 +0000 (UTC)
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
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH RFC 01/13] mm/hmm: Process pud swap entry without pud_huge()
Date: Wed,  6 Mar 2024 18:41:35 +0800
Message-ID: <20240306104147.193052-2-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

From: Peter Xu <peterx@redhat.com>

Swap pud entries do not always return true for pud_huge() for all archs.
x86 and sparc (so far) allow it, but all the rest do not accept a swap
entry to be reported as pud_huge().  So it's not safe to check swap entries
within pud_huge().  Check swap entries before pud_huge(), so it should be
always safe.

This is the only place in the kernel that (IMHO, wrongly) relies on
pud_huge() to return true on pud swap entries.  The plan is to cleanup
pXd_huge() to only report non-swap mappings for all archs.

Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hmm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 277ddcab4947..c44391a0246e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -424,7 +424,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	walk->action = ACTION_CONTINUE;
 
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud)) {
+	if (pud_none(pud) || !pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
@@ -435,11 +435,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		unsigned long *hmm_pfns;
 		unsigned long cpu_flags;
 
-		if (!pud_present(pud)) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole(start, end, -1, walk);
-		}
-
 		i = (addr - range->start) >> PAGE_SHIFT;
 		npages = (end - addr) >> PAGE_SHIFT;
 		hmm_pfns = &range->hmm_pfns[i];
-- 
2.44.0


