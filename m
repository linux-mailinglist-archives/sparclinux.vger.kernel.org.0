Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8FA5190B87
	for <lists+sparclinux@lfdr.de>; Tue, 24 Mar 2020 11:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgCXKw7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 24 Mar 2020 06:52:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbgCXKw4 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 24 Mar 2020 06:52:56 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CBB1208D6;
        Tue, 24 Mar 2020 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585047176;
        bh=4AeA8qWdzDTXrdHBQNY6oqVXBpONA5xeP0MnGuOm3ws=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B9iQT6/H/5Xzq0o5fj8/mJPPykRqVvFDZd+Iu3LD/DFJ2124mZU0uBeaVbbb3zEEr
         PwjG8wArYlccQ+1WL4hCBdLvOYHbwLSHf05qoj+foYATyS+3w6+GlXPr8S3LFfydPd
         LiWJRA0Jiku5UnMwGZq5U3lutrGCxpLUHeoWu0vg=
From:   Will Deacon <will@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Matt Fleming <matt@codeblueprint.co.uk>,
        sparclinux@vger.kernel.org
Subject: [PATCH 4/4] sparc32: mm: Reduce allocation size for PMD and PTE tables
Date:   Tue, 24 Mar 2020 10:40:05 +0000
Message-Id: <20200324104005.11279-5-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200324104005.11279-1-will@kernel.org>
References: <20200324104005.11279-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Now that the page table allocator can free page table allocations
smaller than PAGE_SIZE, reduce the size of the PMD and PTE allocations
to avoid needlessly wasting memory.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/sparc/include/asm/pgtsrmmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/pgtsrmmu.h b/arch/sparc/include/asm/pgtsrmmu.h
index 58ea8e8c6ee7..7708d015712b 100644
--- a/arch/sparc/include/asm/pgtsrmmu.h
+++ b/arch/sparc/include/asm/pgtsrmmu.h
@@ -17,8 +17,8 @@
 /* Number of contexts is implementation-dependent; 64k is the most we support */
 #define SRMMU_MAX_CONTEXTS	65536
 
-#define SRMMU_PTE_TABLE_SIZE		(PAGE_SIZE)
-#define SRMMU_PMD_TABLE_SIZE		(PAGE_SIZE)
+#define SRMMU_PTE_TABLE_SIZE		(PTRS_PER_PTE*4)
+#define SRMMU_PMD_TABLE_SIZE		(PTRS_PER_PMD*4)
 #define SRMMU_PGD_TABLE_SIZE		(PTRS_PER_PGD*4)
 
 /* Definition of the values in the ET field of PTD's and PTE's */
-- 
2.20.1

