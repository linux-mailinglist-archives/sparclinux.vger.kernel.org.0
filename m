Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B6C6FD55A
	for <lists+sparclinux@lfdr.de>; Wed, 10 May 2023 06:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbjEJEtv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 May 2023 00:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbjEJEta (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 May 2023 00:49:30 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86E549CD
        for <sparclinux@vger.kernel.org>; Tue,  9 May 2023 21:49:27 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so34047372276.1
        for <sparclinux@vger.kernel.org>; Tue, 09 May 2023 21:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694167; x=1686286167;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=UYgN7SHJ+Kw138ag8h0xP8PheSyb+TyI5VHSIDjj4n9RShp4GncXL3XJ5EHxhXiibK
         bWM2WA341yCPavofD2L+dwTh/k8wbtnqGHGh+6b5/c/SY6HIHVlS/8x1ncbIt6FJFxer
         ySWLGEH9EXtIKdzeP4dp9W7nQnr+88zaaLX+AbAlYcn/Ke5bUTdA+Amtpc+UhTK8ZOe6
         nlHKHHzGDYa0yETI6dqk3ia7Fkbq7SWABYpcMHvXrsQB+4fKcTN3DFHn/90Y6UPXvP9F
         JN8mOaRS8n0XqBndVMSP+yTIoj8bABXUPMMg0RRYx7fWa70GyDb3jL+GXnDzUgXw6flR
         jauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694167; x=1686286167;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=dGE3PKooblTtY14QVUvgUmuwWCmtyKD5QUcZifT43KZ1CePbis/T6hIIOYCd5UbCdG
         OeB9AQvb5/F+W50bAFXJ/+pV/a3dlZjz2ehnq7aooyHBTCL6NLkeArkmC4twcPx4LNK+
         9P12jAuM6x1PbNJAaQ9RccINiwRbfuzylHLFIR1FqqZP/AZpQMUwL2kujMZjsDjri3eN
         UFz3LRqcgcDFcbRkyjvHXM9ELhn55hW61zrKTFi30D3wzF0AfkMjr+Zmi1rdNlJIVXa6
         io8RAuXll/oMtq3YTQu5PifWCmorbur/f8sItXICV7m9F5MbQNlWkkjsKyAn6U3ng6VU
         CZqw==
X-Gm-Message-State: AC+VfDzdeuvY84jqxCnAwtd7tWxmLrW6C1Jv48bTJGyqFOAOajdlQS4c
        us/Q8CqxwZxSVXsUyKHA/R49ig==
X-Google-Smtp-Source: ACHHUZ4tqpw6+aM6rxWFz6kp/xXo9T82LwXaR685ltqxNG0QuiQjYqghFAwvEDZVatjZsBeLNAG4xw==
X-Received: by 2002:a0d:c604:0:b0:55a:3502:d2ca with SMTP id i4-20020a0dc604000000b0055a3502d2camr16180522ywd.13.1683694166794;
        Tue, 09 May 2023 21:49:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h67-20020a0df746000000b0054601a8399csm18738ywf.119.2023.05.09.21.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:49:26 -0700 (PDT)
Date:   Tue, 9 May 2023 21:49:22 -0700 (PDT)
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
Subject: [PATCH 06/23] microblaze: allow pte_offset_map() to fail
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <12141321-df3-a8bf-18e-e27d13f24b74@google.com>
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/microblaze/kernel/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/kernel/signal.c b/arch/microblaze/kernel/signal.c
index c3aebec71c0c..c78a0ff48066 100644
--- a/arch/microblaze/kernel/signal.c
+++ b/arch/microblaze/kernel/signal.c
@@ -194,7 +194,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 
 	preempt_disable();
 	ptep = pte_offset_map(pmdp, address);
-	if (pte_present(*ptep)) {
+	if (ptep && pte_present(*ptep)) {
 		address = (unsigned long) page_address(pte_page(*ptep));
 		/* MS: I need add offset in page */
 		address += ((unsigned long)frame->tramp) & ~PAGE_MASK;
@@ -203,7 +203,8 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 		invalidate_icache_range(address, address + 8);
 		flush_dcache_range(address, address + 8);
 	}
-	pte_unmap(ptep);
+	if (ptep)
+		pte_unmap(ptep);
 	preempt_enable();
 	if (err)
 		return -EFAULT;
-- 
2.35.3

