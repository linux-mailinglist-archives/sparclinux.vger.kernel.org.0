Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1878A6FD570
	for <lists+sparclinux@lfdr.de>; Wed, 10 May 2023 06:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbjEJEwm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 May 2023 00:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbjEJEwj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 May 2023 00:52:39 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF21272C
        for <sparclinux@vger.kernel.org>; Tue,  9 May 2023 21:52:36 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-b983027d0faso8692881276.0
        for <sparclinux@vger.kernel.org>; Tue, 09 May 2023 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694356; x=1686286356;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/pWRyMl+DKjSxR+96RJZ1aR1tS5RvJyhJKXen2hGiQ=;
        b=xdSNWZzA71Dn4PjSJ/2LhqeF5r1JevaGaRgpoS69f1WOD9bhyOsVwChSsl62EbUoE2
         9cnM7TV7zP/+dkaQIS04gEZsgS+3y2H8ZK/Bphg85NyOLG7YB4uljYqtMwzBINkb9uAc
         Qg8lSbjmhMLr4mA9fzJNs5WYmacpWClDgIdvFtjewDeSGePxRCKcQAns2EMoohHps9+8
         S/YpDXqiv4vPhVzyygfg06y+shcq7WCfEpVB4klTCpxP9lMZUivNHG3zXi2wJbvPV+fq
         bKOy9gNDnov9JiPlPv0RSMj3z9ndQZvcZqYURqj9IDWet3DFKA/Lg6LIl2Rd/fMVxLQn
         5Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694356; x=1686286356;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/pWRyMl+DKjSxR+96RJZ1aR1tS5RvJyhJKXen2hGiQ=;
        b=V19AZ5PoMuzHV2E8Yd+Upl0u4K1OtHFlgD/m3rDT1NfYxc/uuZ5RaIwlkZD7xBizwF
         NRKmgeoODQ2jHVdPaxeODnEHGxctLsVezjHh/EFgyOGEwTJJQ+7o9mLFMt4TFe4ULtXe
         SoDVD6QMmf06AKHtqGzFCIrOHtrgGgv/E2n2jLn7ZepHmWnd7OnytfhD1gqumDn9DE4C
         jvXYcriUBMyvX3wRT3XXp8LKxwdSODq8SUv5P5A/qAAlXfSRVqiaCzKvsxmhCvUI9XDU
         mzYF1Ny4861lGSdoxThMD6rOx7mRPM66kT4Brz3XB8hxgae/i7M5+Zfla9TCOpKVW/1y
         yLMg==
X-Gm-Message-State: AC+VfDzSOOHEWWLvFkQctx78MCMeCfKXThtqvctS40CUKFInmK7Yv9Wb
        OCkw1K/okXP9TN/KxJua50Ktjg==
X-Google-Smtp-Source: ACHHUZ6J+F8J+T+3sf+ZeNloEZY2mqXZ4z6wckfThiZ54x80vQ+jP1v1hMPi/dn45eihWxG2Dt7Wzw==
X-Received: by 2002:a25:344e:0:b0:b9d:b79b:3b89 with SMTP id b75-20020a25344e000000b00b9db79b3b89mr17243065yba.18.1683694355907;
        Tue, 09 May 2023 21:52:35 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h6-20020a258a86000000b00b9a80b9e08esm3435393ybl.12.2023.05.09.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:52:35 -0700 (PDT)
Date:   Tue, 9 May 2023 21:52:31 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 08/23] parisc: add pte_unmap() to balance get_ptep()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <44ebbf90-5fbb-2815-17c7-fcfe3c87d78e@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

To keep balance in future, remember to pte_unmap() after a successful
get_ptep().  And (we might as well) pretend that flush_cache_pages()
really needed a map there, to read the pfn before "unmapping".

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 1d3b8bc8a623..b0c969b3a300 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -425,10 +425,15 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 		if (parisc_requires_coherency()) {
+			bool needs_flush = false;
 			pte_t *ptep;
 
 			ptep = get_ptep(mpnt->vm_mm, addr);
-			if (ptep && pte_needs_flush(*ptep))
+			if (ptep) {
+				needs_flush = pte_needs_flush(*ptep);
+				pte_unmap(ptep);
+			}
+			if (needs_flush)
 				flush_user_cache_page(mpnt, addr);
 		} else {
 			/*
@@ -560,14 +565,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 static void flush_cache_page_if_present(struct vm_area_struct *vma,
 	unsigned long vmaddr, unsigned long pfn)
 {
-	pte_t *ptep = get_ptep(vma->vm_mm, vmaddr);
+	bool needs_flush = false;
+	pte_t *ptep;
 
 	/*
 	 * The pte check is racy and sometimes the flush will trigger
 	 * a non-access TLB miss. Hopefully, the page has already been
 	 * flushed.
 	 */
-	if (ptep && pte_needs_flush(*ptep))
+	ptep = get_ptep(vma->vm_mm, vmaddr);
+	if (ptep) {
+		needs_flush = pte_needs_flush(*ptep))
+		pte_unmap(ptep);
+	}
+	if (needs_flush)
 		flush_cache_page(vma, vmaddr, pfn);
 }
 
@@ -634,17 +645,22 @@ static void flush_cache_pages(struct vm_area_struct *vma, unsigned long start, u
 	pte_t *ptep;
 
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		bool needs_flush = false;
 		/*
 		 * The vma can contain pages that aren't present. Although
 		 * the pte search is expensive, we need the pte to find the
 		 * page pfn and to check whether the page should be flushed.
 		 */
 		ptep = get_ptep(vma->vm_mm, addr);
-		if (ptep && pte_needs_flush(*ptep)) {
+		if (ptep) {
+			needs_flush = pte_needs_flush(*ptep);
+			pfn = pte_pfn(*ptep);
+			pte_unmap(ptep);
+		}
+		if (needs_flush) {
 			if (parisc_requires_coherency()) {
 				flush_user_cache_page(vma, addr);
 			} else {
-				pfn = pte_pfn(*ptep);
 				if (WARN_ON(!pfn_valid(pfn)))
 					return;
 				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-- 
2.35.3

