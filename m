Return-Path: <sparclinux+bounces-223-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A88840584
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 13:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508191F21A26
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jan 2024 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEC764AA1;
	Mon, 29 Jan 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGpjSR5g"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342AF66B2A
	for <sparclinux@vger.kernel.org>; Mon, 29 Jan 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532452; cv=none; b=TxzKjbuvXrmWaFG7eedwYmDLpMgOPVSgdJGKrQCz6g7JRgLiCx6OWgz/L/uTE4i13afrBN0ppuQZTaJ+9hi8KmoP6Lolk3+UoQiD8mweZ8skckEobyO9v7LGUW4XZWyxifD3LonhvGLqFZnuTpIpgTqtGXXJAUcBW++/OSxFVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532452; c=relaxed/simple;
	bh=IY5FrFcWDNKL1OGj460vClP2gN7wCnsLeRSuqWL8xaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJQnDtfRtN2i8nx0f6zGRzBa0kHxjDbBvReiQM0x8Km5thts3IqVnpkHw5QQ3uHaNjsd+uNMJS6yAgq50LZqhzD7/JjXNxkOIDN8STmlqDrV9xi6+FDIhQRpDP6KqDZO1/kNmtPO+jdW49PPipE1vz+RK7PsztkWXOpX00bHuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGpjSR5g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TR23YVq6t+vxDxzPS6q2xEOscQxVIS4+3klgCmYFiGs=;
	b=BGpjSR5g5v2yBapXUeubig6P9XDIgafAd8W7MsMxkq9m7XX/5+UnMB8qcVg/0QJ7V1mlOh
	9IDBFVGrXM/fIOAPWGuQwBHlo1fp7IW4ku3yRIILLtDEvU7lGYWXd2q9BdyrUvHkfKmpjV
	dnY1TtolOqUFKkeLJ9HLAFSWUx0SshA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-aMm9C5FkN5Gfoo5yJn1Edw-1; Mon,
 29 Jan 2024 07:47:28 -0500
X-MC-Unique: aMm9C5FkN5Gfoo5yJn1Edw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB8C329AC02A;
	Mon, 29 Jan 2024 12:47:26 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D62B107BD;
	Mon, 29 Jan 2024 12:47:21 +0000 (UTC)
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
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 05/15] riscv/pgtable: define PFN_PTE_SHIFT
Date: Mon, 29 Jan 2024 13:46:39 +0100
Message-ID: <20240129124649.189745-6-david@redhat.com>
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

We want to make use of pte_next_pfn() outside of set_ptes(). Let's
simply define PFN_PTE_SHIFT, required by pte_next_pfn().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..add5cd30ab34 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -523,6 +523,8 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
 	set_pte(ptep, pteval);
 }
 
+#define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
+
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pteval, unsigned int nr)
 {
-- 
2.43.0


