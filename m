Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0224728883
	for <lists+sparclinux@lfdr.de>; Thu,  8 Jun 2023 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbjFHTa2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 8 Jun 2023 15:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbjFHTaX (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 8 Jun 2023 15:30:23 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58C81BF0
        for <sparclinux@vger.kernel.org>; Thu,  8 Jun 2023 12:30:19 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33b921e4e8fso4371835ab.3
        for <sparclinux@vger.kernel.org>; Thu, 08 Jun 2023 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252619; x=1688844619;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=Z+1ROWx9LnxdX5nt3Yo9Gw9A1LjKJHFc2WtgcRAYaFIpj6m1+MueknjL2tetH/Yt/E
         Jkma5NMQVv2CGzmJBnvKYmHLILgxFTZBZe29Vg5F330+u2fSbBPVEtX3NRx2YFJBGUmp
         kCJjjc7KvjHhyEDucY5j+/eHT1OpuVlzl/VgAMVyKWRQ9P9ksfEE7oKQrQHB2ZVzogis
         AlGkparAM9e3I8OX/wc+UGRKJ9WTDNWGaUDF7YaTiCVpSxpo1NNn2hyrTeXSAmMOPutQ
         TUN3B1UmJFKBBqlJCwM8cMmQBeV6xJ4ogL/1WbFBc8kxJTJPQLfJ0hWbM0sLcNxIcm/D
         dTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252619; x=1688844619;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=ady4DsfSDCuvkmvZZwSWsZxSnW64iY2ol6EltS/hbhgWAIrSyeGKuAmUcINTRqF37N
         wWHbnkM+ZK4FiYNYGbfg5o0JQwIrq4f/4fOV1dzHYjKnMQp2cQaHQ4DUEtmQKnf0mmjn
         rS8uwW56w7UWnXPl1hGmtJKnY90JRpvHcLnVNlWKiINGJcXw6nnLtGvqkTvSpOpdhs7T
         iOT/PX3DBy0Y7oW7MOfxH4VwUx7Ww+Hwr+ZVwhJFlZflEEdtGM26qF4NVm+OkAZ7KZXi
         VuGV/8oDHg1YSUnSd5eFgXuZESfvtJFjocfCfLDuvgMPRNs3fn6TOx3MziyuAc00d5Pj
         1vxA==
X-Gm-Message-State: AC+VfDyvu3NfuF1qYhfJZRWtMdvNAOHx8a4ybxqPu5iW0ZI8+nsQMnm+
        ds2iJJPrZR/S3pHmsDIOtIeWyw==
X-Google-Smtp-Source: ACHHUZ5FLPawoStHwp2n90KOP3LMuG/l1wNARr8CXyW4COytL00Jtvx4PAa220fnQj49mz7p+WoCNQ==
X-Received: by 2002:a92:d34a:0:b0:33b:820:41ad with SMTP id a10-20020a92d34a000000b0033b082041admr8096921ilh.9.1686252619199;
        Thu, 08 Jun 2023 12:30:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h184-20020a256cc1000000b00bad07875d9bsm450282ybc.11.2023.06.08.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:30:18 -0700 (PDT)
Date:   Thu, 8 Jun 2023 12:30:14 -0700 (PDT)
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
        Peter Zijlstra <peterz@infradead.org>,
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
        Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: [PATCH v2 17/23] sh/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <ee885978-7355-624b-cfe2-c3d75672b842@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
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

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sh/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 999ab5916e69..6cb0ad73dbb9 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -38,7 +38,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			if (pud) {
 				pmd = pmd_alloc(mm, pud, addr);
 				if (pmd)
-					pte = pte_alloc_map(mm, pmd, addr);
+					pte = pte_alloc_huge(mm, pmd, addr);
 			}
 		}
 	}
@@ -63,7 +63,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (pud) {
 				pmd = pmd_offset(pud, addr);
 				if (pmd)
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3

