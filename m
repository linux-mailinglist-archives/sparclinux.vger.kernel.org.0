Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C607849FD
	for <lists+sparclinux@lfdr.de>; Tue, 22 Aug 2023 21:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjHVTLB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 22 Aug 2023 15:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjHVTLB (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 22 Aug 2023 15:11:01 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5C2CEA
        for <sparclinux@vger.kernel.org>; Tue, 22 Aug 2023 12:10:59 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-570e1832cc1so1239090eaf.2
        for <sparclinux@vger.kernel.org>; Tue, 22 Aug 2023 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692731458; x=1693336258;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQel4RgNhxgk/AAhqW/nAOn0kPiLXQfoLmnalyqIi64=;
        b=5JwyMFYvi0OD4mdojayyGpwSZHcbAytYeAtnE7MibV1tAF6SgoCLsB//DV/hGRQAf7
         c4C+blWdMkYvJc5z/BVKEJ5IO13eri+1BtevVsKnvLaTD0O1oCgAeAaOVhrQvoXQwzUi
         FBC2QlGTF5PlDsr4019zQfHrYKg/N1lROVz9wLA9UOxemfMjOKuBFTyvg9J6UQWemZqh
         EC71Try8JOZukw4l9uc4A684zGu0e0Yg8X2MzLul5fftKIL4CdzSe+XLcMUDEEtfVtw9
         faYRmXMRMpla6ypOplKeSvwwVw7kQ3+VXDlAxf9mlnlIrodzJQQoglYgHfUHMzTtX58w
         +8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692731458; x=1693336258;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQel4RgNhxgk/AAhqW/nAOn0kPiLXQfoLmnalyqIi64=;
        b=KDJXqedDefF4GWbHuUxbyukRrWFvXYXzD7Q1y9Ls8qgVCy1uK/VdMPzgY2fEBZE/aU
         eYDmJh0ENEltbn5SzXspXRRFZUEpybX27geoz5y1gRIEkTzGloH6nBvSr20PxUqUPO1b
         rAOGXb+eU2fkg9HJqSlKyclpSHB5UgCELv1IkakqGxXNgFJRbg7Zb1mF81eQN0sqNA6b
         WjLU5x8pNTmlQgRpl3JKmyuhjXyfNA3WfPhSuCj/43qstS5NQjkXLbaqSeV6nSCLBM7A
         hyERsqdOSTS0q314acIdWBWLDEGTCC9Im6UFLFqfBJ2Wm+c8j9D9/ZCVNjrQ7hwgWKry
         FNDw==
X-Gm-Message-State: AOJu0YyZnw0awm/PKE+BkFm/GP5UAUf5XiAC+mb/Di7LKC/ISTeA1460
        cm3r8pzM0+8evIxp9R09kIAyrg==
X-Google-Smtp-Source: AGHT+IEBm3m/LaDBf/1DgkyNDU6zxtVn+hbaxrHnTVvmv8dzjr9ChOJoftygo0pLRcze1/DlIgis3g==
X-Received: by 2002:a05:6358:33a2:b0:135:99fa:a125 with SMTP id i34-20020a05635833a200b0013599faa125mr10540178rwd.1.1692731458157;
        Tue, 22 Aug 2023 12:10:58 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d74-20020a25e64d000000b00d7360e0b240sm2487223ybh.31.2023.08.22.12.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:10:57 -0700 (PDT)
Date:   Tue, 22 Aug 2023 12:10:46 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Matthew Wilcox <willy@infradead.org>
cc:     Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
        Jann Horn <jannh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Yang Shi <shy828301@gmail.com>,
        Mel Gorman <mgorman@techsingularity.net>,
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
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vishal Moola <vishal.moola@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
        Zach O'Keefe <zokeefe@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        sparclinux@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
In-Reply-To: <ZOUCVRxM8aPH6fva@casper.infradead.org>
Message-ID: <3f926b9-ee3c-5cae-d7ad-9b3e1986bcbf@google.com>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com> <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com> <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com> <ZOTGvfO31pleXrPF@x1n> <1b7c7056-d742-86bf-fec-fdb024b2381@google.com>
 <ZOUCVRxM8aPH6fva@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, 22 Aug 2023, Matthew Wilcox wrote:
> On Tue, Aug 22, 2023 at 11:34:19AM -0700, Hugh Dickins wrote:
> > (Yes, the locking is a bit confusing: but mainly for the unrelated reason,
> > that with the split locking configs, we never quite know whether this lock
> > is the same as that lock or not, and so have to be rather careful.)
> 
> Is it time to remove the PTE split locking config option?  I believe all
> supported architectures have at least two levels of page tables, so if we
> have split ptlocks, ptl and pml are always different from each other (it's
> just that on two level machines, pmd == pud == p4d == pgd).  With huge
> thread counts now being the norm, it's hard to see why anybody would want
> to support SMP and !SPLIT_PTE_PTLOCKS.  To quote the documentation ...
> 
>   Split page table lock for PTE tables is enabled compile-time if
>   CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
>   If split lock is disabled, all tables are guarded by mm->page_table_lock.
> 
> You can barely buy a wrist-watch without eight CPUs these days.

Whilst I'm still happy with my 0-CPU wrist-watch, I do think you're right:
that SPLIT_PTLOCK_CPUS business was really just a safety-valve for when
introducing split ptlock in the first place, 4 pulled out of a hat, and
the unsplit ptlock path quite under-tested.

But I'll leave it to someone else do the job of removing it whenever.

Hugh
