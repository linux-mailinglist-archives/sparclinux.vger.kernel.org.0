Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB81769E10
	for <lists+sparclinux@lfdr.de>; Mon, 31 Jul 2023 19:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbjGaRF1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 31 Jul 2023 13:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbjGaREo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 31 Jul 2023 13:04:44 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06BA194;
        Mon, 31 Jul 2023 10:03:59 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d1c988afebfso5035285276.2;
        Mon, 31 Jul 2023 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823038; x=1691427838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=TvM6DExj/MTq0Jm70GY7llkizJv0Xrt3jOhv1061u2jelnUc+8n8NrIEW+BAV0minS
         1tyB2hh96LoZso6xWTQsTKE9iOzQkPYOcn2oO7CJPClzabUQT8JEbqLe1hGOluEbesF4
         LKkTfn07m+I0Vuueep3IFUQUJltM6JJHBDBn8n653IK02ME5fuHReejoNwtCex5xQyzn
         Y1wOj8DVfr6r9eQ6TYR15inSR6hHDxry08oKRDaKIhjxxmp2hbT5OuHr1D1+R6xelNHE
         JPdzrcJvaKmiiybVsDU25/RyZDaqIgMV6uxOUr6sp0q3qR3F0X4P6bOEInakDYMw/wf5
         mu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823038; x=1691427838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EZnRhm4Fj3KaK4sFjI+P1mIVDNOtVXSgVauozi7/LE=;
        b=LgE2HaGrY8oUtxfUP1cKzLsVCmjou8HZD8j0NxeQgTlrFgQhAuj7GptX1vIsJMBdIc
         PRGZFiEBLQ3U/e2Q1Dbtl6TPqhWruFMFWzxjKaCnsyQg30fCMM3kF/jdBwqy2H6YdCEn
         FRVEDmxO9v5131QQK9iOZgUrGSTsDuAy/i5+QMJByrF+alnQQVwkBYCrXElkjrojXqu5
         Z/e1BR3XyAdBDDizQAla4HcUqwfIKZYIndK0jHxEonoY8lDwWo4t6dvBq8x+6YCeOiiT
         QF4FsQ2wmXbhDdCDCgeS7yf9UOGpVYhsmV3ZK+iDnsws6hEHAmUxZqUa+Jw0VY5caZpS
         /KVw==
X-Gm-Message-State: ABy/qLbhYpRL7JCqNFKTc9UmvgnZI55Ht+yS+ZLw+XBJFE82BAPhXXer
        UHEtKOcNeCvEbIg/Y1ameYo=
X-Google-Smtp-Source: APBJJlH90WRLRIm5YDV2YMBRfelNi7WH7+bbsrmY7NpvynPWnsTYJfLOq9UWydp0DqF9z3jWR7ijAw==
X-Received: by 2002:a25:e08b:0:b0:d18:e435:bdc0 with SMTP id x133-20020a25e08b000000b00d18e435bdc0mr11858543ybg.57.1690823037763;
        Mon, 31 Jul 2023 10:03:57 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:57 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 10/31] mm: Convert ptlock_free() to use ptdescs
Date:   Mon, 31 Jul 2023 10:03:11 -0700
Message-Id: <20230731170332.69404-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 774fe83c0c16..ffddae95af78 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2842,7 +2842,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2858,7 +2858,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2899,7 +2899,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2913,7 +2913,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2987,7 +2987,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 4fee273595e2..e5e370cdac23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6242,8 +6242,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-void ptlock_free(struct page *page)
+void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, page->ptl);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
-- 
2.40.1

