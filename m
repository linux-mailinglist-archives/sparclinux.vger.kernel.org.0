Return-Path: <sparclinux+bounces-1659-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71819934472
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2024 00:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F64283390
	for <lists+sparclinux@lfdr.de>; Wed, 17 Jul 2024 22:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EA748CCC;
	Wed, 17 Jul 2024 22:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EB5mQ+DO"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9D3D552
	for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2024 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721253751; cv=none; b=U7/AI2+m4bA5gNPQAwp5JQYt+GBggKdr5b12V2tBAlHhrY1QxNsSJIGSZtFjWQclv3exQY9aNa8pqiWfEKF6XDeGt7zGKTY3t0CrW2YSggqwH6KQGNpo9P0uTJ4lrqQodgeJzTQ0woW5U2RwYT+zzT7BGs64G/Yxq8iUpn7CkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721253751; c=relaxed/simple;
	bh=K7ProdCJxZcSwLnZoqcS+egwgE3aFeaAcBdG7Gygzyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVSoWNBVo3eBVBfefM3gM1qJWmyb/EtiLqdN/vqUuFNPsqV7SJTMk5gmM5N/yAh1VuZZ9dNIom+ffqAojHq6W4KBni0XDIdSzN3+Mfhd8ppkPGPophwnTDLTnDyYzAX7VcheNy9MW9O/NRpsoOsr6nnCZcTB4HzrCH0uOZzqLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EB5mQ+DO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
	b=EB5mQ+DOuFjJjq8xbmkGhy87jrnrnfqgEZKIbhBf1rVED1EYg2OCVvrxNVxgDQJ9dcsKmf
	Ei7ubkoBE8sGch1Qaxnzbl2omKUPWwJj1GS6+W72qWAWot2TfABa2MBp908z+8U4AoVyXo
	aF/INSV0GdnJLT97N8NxxeXLyCkHWio=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-1_9uXMKoOqOQjuCrKHX3PQ-1; Wed, 17 Jul 2024 18:02:27 -0400
X-MC-Unique: 1_9uXMKoOqOQjuCrKHX3PQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-448335bb53aso257661cf.0
        for <sparclinux@vger.kernel.org>; Wed, 17 Jul 2024 15:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253747; x=1721858547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
        b=wGudNPlW+mhj4iH/zxDcXWtS5+51Df7+ib9WZh6rAb8LyjPrfamrX9p/TjYr1t63mH
         wTdFxuewW3XYT3DFFmqn4m7q8zRBiA6790FGyi9BLdpE4Yx8duSt8l7BH61Ni51Q0+y8
         aaaB3KVQjJjwdgqbZkjwt4v5S9tYic4/q7QybKAU7m1cA13fX2/ULjVO84K1WONOANZT
         ckygh0mg7Xmt2JDfd5YsSk9wFxaRErp+hUWSpqTmiaxAaasvCrjaSp292i9Cr152GiDB
         xGPPxwFXYlqw6WWeLbjaaFA93WYQu342MWDIANAT5vGVfGvtToDUNyOExZam63V5e4rG
         Uxdg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+1M9/3LXpdxLl6fozJttrWiZV/YP65hjfqxUAQwRdAbkOW0O4JphLPwW0StuTotXuxGIQeoabTkITLVfIV+xxTCtw9jFIH8GwA==
X-Gm-Message-State: AOJu0YwKhVB7f1SYaoQ5Tb7yaCm0hlW47ARyM0qb1SEQUcD7ug4dzgVz
	or4vicH+JotDUCvtAG+R09ApK5J73C8D8xvkwNP7kQHBna+rd3SlKU1VozMuivv516Vxfupv2hl
	THIjx2Gu6g9KhUmtrWYcGdAR9NVxWw5GBJ2OpK7k2O65CgXxoCs3O7ktkosU=
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472631cf.10.1721253746699;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7KLWkbU1UwJKSHrhdblARNi4OMqfXeCTcT+ovTUhvRHwOTG0GQKyZtUb2OdQ3d+/fWLwEbg==
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472521cf.10.1721253746301;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	peterx@redhat.com,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Date: Wed, 17 Jul 2024 18:02:15 -0400
Message-ID: <20240717220219.3743374-3-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce two more sub-options for PGTABLE_HAS_HUGE_LEAVES:

  - PGTABLE_HAS_PMD_LEAVES: set when there can be PMD mappings
  - PGTABLE_HAS_PUD_LEAVES: set when there can be PUD mappings

It will help to identify whether the current build may only want PMD
helpers but not PUD ones, as these sub-options will also check against the
arch support over HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD].

Note that having them depend on HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD] is
still some intermediate step.  The best way is to have an option say
"whether arch XXX supports PMD/PUD mappings" and so on.  However let's
leave that for later as that's the easy part.  So far, we use these options
to stably detect per-arch huge mapping support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 10 +++++++---
 mm/Kconfig              |  6 ++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 711632df7edf..37482c8445d1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -96,14 +96,18 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order)))
 
-#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
-#define HPAGE_PMD_SHIFT PMD_SHIFT
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #else
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
 #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
 #endif
 
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+#define HPAGE_PMD_SHIFT PMD_SHIFT
+#else
+#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
+#endif
+
 #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
 #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
diff --git a/mm/Kconfig b/mm/Kconfig
index 60796402850e..2dbdc088dee8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -860,6 +860,12 @@ endif # TRANSPARENT_HUGEPAGE
 config PGTABLE_HAS_HUGE_LEAVES
 	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
 
+config PGTABLE_HAS_PMD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE && PGTABLE_HAS_HUGE_LEAVES
+
+config PGTABLE_HAS_PUD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD && PGTABLE_HAS_HUGE_LEAVES
+
 #
 # UP and nommu archs use km based percpu allocator
 #
-- 
2.45.0


