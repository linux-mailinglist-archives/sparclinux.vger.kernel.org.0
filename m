Return-Path: <sparclinux+bounces-203-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C283CC4A
	for <lists+sparclinux@lfdr.de>; Thu, 25 Jan 2024 20:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CABA1C23DBA
	for <lists+sparclinux@lfdr.de>; Thu, 25 Jan 2024 19:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A5213A27A;
	Thu, 25 Jan 2024 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4YMjjO1"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D3137C30
	for <sparclinux@vger.kernel.org>; Thu, 25 Jan 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211224; cv=none; b=EjO61G9Hf4aUCCgHlFFqtdR8j9ss3yYezrjIBbeMgrjpeaWvRc2FHdYpWXKsFaq9pKPP7jU04enkZ9CSq4qCKciyPDPZUZ2x9iM5P3bVE7JUXocHXw/aFk1roccgSlajKQ65/+tegIngRGWWd7QqoOvH2L3FWP8bltK7lzh1oB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211224; c=relaxed/simple;
	bh=d5aGWTZLGgQ6E2iBgTai8/pl3kQ878+LejDvI7sJPBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3gqWGialOEniQaH6H93vI4oitUq9VGs1gPZZKVn0i3/9Lfv1QStmnGnb7n37jcjTIWh5jXIgcRuC73/4CUWQFd4rrT3+tYaTj3hdTmh6oc0+uiPBZuniqQREXppN65HCsFFff7oMKyLVjgtYvlBaYYg+hmkbfkUFLZSCJlGmM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4YMjjO1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWsEpSrdwYXBoeIhNs8GBnzc96pxJH9YBnNESaF0zxU=;
	b=L4YMjjO1+MmRdnA6lUNQc8nwv1aV3hVaHo9Ym4L4p0KgohXy64zpyiq5b6pSh3RmSzkKgM
	b2Sczt9EifhCImEdgJ9CvIr0UEOOw59SfR++4aUpFpkfG2b8g1ZAgFiRdDH8+a9HAz2BBu
	AFO1cQsPEwluUzWpaRbZgO54bhW/91s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-z2AXiQwENJ2OgR2MM0KiwQ-1; Thu, 25 Jan 2024 14:33:36 -0500
X-MC-Unique: z2AXiQwENJ2OgR2MM0KiwQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E036870822;
	Thu, 25 Jan 2024 19:33:34 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6302492BC6;
	Thu, 25 Jan 2024 19:33:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
Date: Thu, 25 Jan 2024 20:32:22 +0100
Message-ID: <20240125193227.444072-11-david@redhat.com>
In-Reply-To: <20240125193227.444072-1-david@redhat.com>
References: <20240125193227.444072-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Let's use our handy new helper. Note that the implementation is slightly
different, but shouldn't really make a difference in practice.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/pgtable.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index a04ae4449a025..549a440ed7f65 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -220,10 +220,7 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 			break;
 		ptep++;
 		addr += PAGE_SIZE;
-		/*
-		 * increment the pfn.
-		 */
-		pte = pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
+		pte = pte_next_pfn(pte);
 	}
 }
 
-- 
2.43.0


