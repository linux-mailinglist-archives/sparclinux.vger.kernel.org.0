Return-Path: <sparclinux+bounces-146-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAD18372E2
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jan 2024 20:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03E41F29E9E
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jan 2024 19:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA823FE5C;
	Mon, 22 Jan 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csksOMVo"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864FA47761
	for <sparclinux@vger.kernel.org>; Mon, 22 Jan 2024 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705952567; cv=none; b=qfwbIy5hhdcn9XVXg+NZ+QmEcb4T1GCFIeRoyYcOEGn5fn689z/CfceGgbhy7mQL0BMSKex3STDXWSfuOrsponJcDD6MHuw5j0fAdp9lqO4D7z1v5eWv/XNcZ69i17Oy9EHzZW0zU8g6fUmzp7AHttt4yp+vbQ3AejZ6NC5t9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705952567; c=relaxed/simple;
	bh=i0x34T0llV7o6T5UjghIUitqouBPFYqGEeZr8ttQaOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6zH0vgA0QNVpmiByGFHECl34sF3MDjtQgBN7l4W9KhdQlnaXLTsn0+SVtwEXOqK0S0rNULeKAxbRfcOB0kOD21cE1F6yyg532JlHSEuXT01OkG38KWQuM3fQ8wmrsU2mZsz/wELbUAi+mN76XnamkWqSJKhDN1G4ICE+sKNBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=csksOMVo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8imtZo6vz5POOPfjS1eojctB3SqsK1V0htYi8JXsE8=;
	b=csksOMVocUEX1rak27SAaPiqTDp4HOua5/ALLiJlZS4UP1D0vkobi3tddxCPafViuL7vgT
	0PPX+29RwYEQQ5mDLDYNocawQd/GEE1uiu9O6f5jBY99ngHHeCNkDDYlRwnNFDHzjrvzW2
	edN7BajvQNQcthKISNyzzfjyR4Quvcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-DdD_mImzNUSPGQ0oBD5LBQ-1; Mon, 22 Jan 2024 14:42:43 -0500
X-MC-Unique: DdD_mImzNUSPGQ0oBD5LBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7920E879844;
	Mon, 22 Jan 2024 19:42:41 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.195.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3EE13C2E;
	Mon, 22 Jan 2024 19:42:36 +0000 (UTC)
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
Subject: [PATCH v1 06/11] sparc/pgtable: define PFN_PTE_SHIFT
Date: Mon, 22 Jan 2024 20:41:55 +0100
Message-ID: <20240122194200.381241-7-david@redhat.com>
In-Reply-To: <20240122194200.381241-1-david@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

We want to make use of pte_next_pfn() outside of set_ptes(). Let's
simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/sparc/include/asm/pgtable_64.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index a8c871b7d7860..652af9d63fa29 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -929,6 +929,8 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	maybe_tlb_batch_add(mm, addr, ptep, orig, fullmm, PAGE_SHIFT);
 }
 
+#define PFN_PTE_SHIFT		PAGE_SHIFT
+
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
-- 
2.43.0


