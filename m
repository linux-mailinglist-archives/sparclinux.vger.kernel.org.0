Return-Path: <sparclinux+bounces-228-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D9840598
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 13:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489241F23C90
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 12:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF3564CEF;
	Mon, 29 Jan 2024 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NByIchO8"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB067758
	for <sparclinux@vger.kernel.org>; Mon, 29 Jan 2024 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532485; cv=none; b=FcnRA96YQ3MREcPJcPDgA0LYXQgnFk9v4kgEoFC7FArZIjgdj76URJ0I82OAaGG4CS/ENJosoZGfhrEi1+dMVGFDhRBcopzfxPBqiFKw5r5sPEsF23kUEyoJYelRxgYDw0AuPTBm2MYhdGQ8TCQlCLzZ5AjvOGQyXmRENmNcZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532485; c=relaxed/simple;
	bh=lsGdSPP9yjmN8xBq+o4rxdKZkBy0rfcqymp4kG2/GB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMOSA8YSj8sCJbhCuoZPvwys9trj2jLmtpH3tx+YXU4v4Z64vcD34v4CxSqt4K2O2jMEl0nrwxpzhED7h6Djjcduz1bD1p2StZPYFFFdwliDtlvX1yUaUkJ7/O7dZ7mOuqMz18NLT9DS/++tEW3fVRvG7xUM83JJ3dz51aSPW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NByIchO8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3Tbdl4mZ+WM96lxB3iHDtUIqesuPBdfScoz5at5AOg=;
	b=NByIchO8KE5MLtJDmZfH8OGs8LhDuR5XlJfDrE+D+ZFF7kvZjZg3oGzpFYv8JkhaYoDr0K
	35qCMawuqCqv/98fmQ7lS/x2hcnYcRhOwCZBrrodxUL3Iqfj2IZG5Eqrdp29pTn1gg8ySC
	9ahUEBPIg2NjP1z0Cy9vOtKDoL1JuE8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380--x5t9X58Pm--BZadaKlp-Q-1; Mon, 29 Jan 2024 07:47:58 -0500
X-MC-Unique: -x5t9X58Pm--BZadaKlp-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50FF85A58A;
	Mon, 29 Jan 2024 12:47:56 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED7E8B;
	Mon, 29 Jan 2024 12:47:51 +0000 (UTC)
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
Subject: [PATCH v3 10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
Date: Mon, 29 Jan 2024 13:46:44 +0100
Message-ID: <20240129124649.189745-11-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Let's use our handy new helper. Note that the implementation is slightly
different, but shouldn't really make a difference in practice.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/pgtable.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index a04ae4449a02..549a440ed7f6 100644
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


