Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF4573658F
	for <lists+sparclinux@lfdr.de>; Tue, 20 Jun 2023 10:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjFTIAv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 20 Jun 2023 04:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbjFTIAS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 20 Jun 2023 04:00:18 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2DE19AF
        for <sparclinux@vger.kernel.org>; Tue, 20 Jun 2023 00:59:55 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5700b37da3fso39520887b3.1
        for <sparclinux@vger.kernel.org>; Tue, 20 Jun 2023 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247995; x=1689839995;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5HWe45UW6rQUJiJNVLC4MPu6AngULI5k321Sbm9Ew=;
        b=PTqSZx2nNI4PV4JwXAt99NVosmlLWlQ/KYn1Uf1f3Yd1Z3NVe7obF1sAci/vRU4j/I
         /dODEkNukKEVJX5QJOgx8A4SVofs7E+EBk4aUKnEe/gxIGiuFO4K0lGYei4SR6tcYKnK
         AduYU9eLhwRb6vByQAsUQ6tUe6SjjlibwcGiUn9EmoAEYZk/fTkwOJxts/LviFdlBYyU
         2HDG5towuNEQ5CvzS8P4/0FmCn98RyYyORjokeprTYbqe1PhIQYQex8ifvvnbwDxRbO6
         McJrcKmHoDDBglMt6fs5aQdKWv2A5unXxMstk7k6pfo7pQ4FA/PbwXapoPL1ZYXTeDU7
         ON7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247995; x=1689839995;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5HWe45UW6rQUJiJNVLC4MPu6AngULI5k321Sbm9Ew=;
        b=dKyL/Jfzsmr22C+4xu2HaqcBi+9ebe7NUG0LmAy8pksYkribeV2NfLKqUwORfpciTH
         9Aki2HPFq+tHKH3kymMXHQ2tKKZYVsyz1R1t0kh6KkxwlM88b0BpPIUZheHZw9kzal6B
         FCmc1NOfPwtgIg25VVDrGyH9n4Jf1dFO7H9zMHzAHA5kcWhfYsVfnhduC9l0ZnSnyCHB
         hnd+AtHZg+C+WZKCX2UhFPXsohhLePqVxP0CrpzqbAA2a7B+LXztamv9Tar5CRJDWEDU
         d4iY+XOpG8t9F/6qGJtAwAXNjusKqrnFSnfItehiThrim3BU46zwBuiL6pxuI/ILzDV+
         XkDQ==
X-Gm-Message-State: AC+VfDyikRmfg4S/EoiWROR1ISgCPzaG5z3yvt5PPc32EACdrKLOPFfD
        D9KMd/7e/fu3plEN3FP1pULfUA==
X-Google-Smtp-Source: ACHHUZ515t86hS4ZGbNoo4Ty1vmElBXGedGoznKelWut2eqFES40KQtwKfY1cJoUB4hv3Ba9PnrZlQ==
X-Received: by 2002:a5b:bc9:0:b0:bb4:14a2:fb4a with SMTP id c9-20020a5b0bc9000000b00bb414a2fb4amr2548922ybr.9.1687247993367;
        Tue, 20 Jun 2023 00:59:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v190-20020a257ac7000000b00ba88763e5b5sm268132ybc.2.2023.06.20.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:59:53 -0700 (PDT)
Date:   Tue, 20 Jun 2023 00:59:48 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Yang Shi <shy828301@gmail.com>,
        Mel Gorman <mgorman@techsingularity.net>,
        Peter Xu <peterx@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Steven Price <steven.price@arm.com>,
        SeongJae Park <sj@kernel.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Huang Ying <ying.huang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Zack Rusin <zackr@vmware.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Minchan Kim <minchan@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Song Liu <song@kernel.org>,
        Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Jann Horn <jannh@google.com>,
        Vishal Moola <vishal.moola@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 12/12] mm: delete mmap_write_trylock() and
 vma_try_start_write()
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <27505a8-e717-61ce-ab70-5f79d9bf646b@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

mmap_write_trylock() and vma_try_start_write() were added just for
khugepaged, but now it has no use for them: delete.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/mm.h        | 17 -----------------
 include/linux/mmap_lock.h | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3c2e56980853..9b24f8fbf899 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -690,21 +690,6 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 	up_write(&vma->vm_lock->lock);
 }
 
-static inline bool vma_try_start_write(struct vm_area_struct *vma)
-{
-	int mm_lock_seq;
-
-	if (__is_vma_write_locked(vma, &mm_lock_seq))
-		return true;
-
-	if (!down_write_trylock(&vma->vm_lock->lock))
-		return false;
-
-	vma->vm_lock_seq = mm_lock_seq;
-	up_write(&vma->vm_lock->lock);
-	return true;
-}
-
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 {
 	int mm_lock_seq;
@@ -730,8 +715,6 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
-static inline bool vma_try_start_write(struct vm_area_struct *vma)
-		{ return true; }
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma,
 				     bool detached) {}
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index aab8f1b28d26..d1191f02c7fa 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -112,16 +112,6 @@ static inline int mmap_write_lock_killable(struct mm_struct *mm)
 	return ret;
 }
 
-static inline bool mmap_write_trylock(struct mm_struct *mm)
-{
-	bool ret;
-
-	__mmap_lock_trace_start_locking(mm, true);
-	ret = down_write_trylock(&mm->mmap_lock) != 0;
-	__mmap_lock_trace_acquire_returned(mm, true, ret);
-	return ret;
-}
-
 static inline void mmap_write_unlock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_released(mm, true);
-- 
2.35.3

