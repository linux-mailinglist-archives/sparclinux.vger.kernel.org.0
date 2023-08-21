Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754D278355E
	for <lists+sparclinux@lfdr.de>; Tue, 22 Aug 2023 00:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjHUWAb (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 21 Aug 2023 18:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjHUWA3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 21 Aug 2023 18:00:29 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE0C132
        for <sparclinux@vger.kernel.org>; Mon, 21 Aug 2023 15:00:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fef2fafee2so37955e9.0
        for <sparclinux@vger.kernel.org>; Mon, 21 Aug 2023 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692655223; x=1693260023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KOwCMKv6gJICwnu0jRAkIqxjiFqWwB1qyLCAsgnqG0=;
        b=GteawMKeBcSYYxB5NoJ6lzY/28FUdtap7t1+xDQM0cJlS8vJEH5GY96KoWIps9Sk7O
         VDj/1icJn91iQZUkTMRivf7OMZ2V3mQbslacTxlXRV39Jt5mpUgnsvdt44cvPIMcWqtX
         +fjUTiHXJHBwTe5JI81osxHS/NoXXht+0iZrMEtsQ3IKIz+W7vZSnCKNgZriUm+LT3bp
         03U5XB+InX0PJx6qtOWRFp0e6wc1m+uUsjlpmX58+VfazcoVxxvV3QLLDv3mpl3gDuVh
         YF+x77K50LJ4VgutxI22scfDw+NvPzOBx30b5l7UbMbxp1nBVHfBnGf4VpNgfnwxNnEK
         1c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692655223; x=1693260023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KOwCMKv6gJICwnu0jRAkIqxjiFqWwB1qyLCAsgnqG0=;
        b=Id+Cd6wGXStycvV1pPJztDK4Em2gOoXMsXWaaMxAd26WsmOdQ7OSigNktBJlagWRz9
         Cww4Cn/+YeYrIQZLCn7MbIFQK8bpJplNoFicLA48oo92/lObPKnyXNotscvLY49jYLSu
         m+hSE7IzEvPlaTRXMf8TWwCpcnHW4fEvJd6udKB3qdYPopxEdd0cOC28yW9EkiumI1rR
         UmVFaveuT1LfCTp8jjsKsCe2WagQzEFUQoOvpDpiY3XYOhGO6/sC7/twfquhlnGF90Mo
         qmkavH33AkWm6NKngzJ1UcQFIkte5h9FA8mi6Eb2LXx6j7WdvKuBO3zfaY+prt4DK9SU
         VSPg==
X-Gm-Message-State: AOJu0Yxmo5Y/NwUTNiVid6dHNudpG13CAvwxztwXtTxBCafSbYMhn+9O
        W4vcUWODEIxP0QzSuWiXmqOl/Embl41zhkC7xOuEMA==
X-Google-Smtp-Source: AGHT+IH64SpGveN9dGK2zvuRPaovHVk4+hMnYMZFm087iCMpl0qOKktqy2IA+4bd+qpox23ZOFiqzmDaa1UD37turPI=
X-Received: by 2002:a05:600c:1d23:b0:3fd:e15:6d5 with SMTP id
 l35-20020a05600c1d2300b003fd0e1506d5mr45830wms.2.1692655223487; Mon, 21 Aug
 2023 15:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
In-Reply-To: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Mon, 21 Aug 2023 23:59:46 +0200
Message-ID: <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
To:     Hugh Dickins <hughd@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vishal Moola <vishal.moola@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
        "Zach O'Keefe" <zokeefe@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        sparclinux@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 21, 2023 at 9:51=E2=80=AFPM Hugh Dickins <hughd@google.com> wro=
te:
> Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
> shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp()
> thought it had emptied: page lock on the huge page is enough to protect
> against WP faults (which find the PTE has been cleared), but not enough
> to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.
>
> retract_page_tables() protects against this by checking !vma->anon_vma;
> but we know that MADV_COLLAPSE needs to be able to work on private shmem
> mappings, even those with an anon_vma prepared for another part of the
> mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
> mappings which are userfaultfd_armed().  Whether it needs to work on
> private shmem mappings which are userfaultfd_armed(), I'm not so sure:
> but assume that it does.

I think we couldn't rely on anon_vma here anyway, since holding the
mmap_lock in read mode doesn't prevent concurrent creation of an
anon_vma?

> Just for this case, take the pmd_lock() two steps earlier: not because
> it gives any protection against this case itself, but because ptlock
> nests inside it, and it's the dropping of ptlock which let the bug in.
> In other cases, continue to minimize the pmd_lock() hold time.

Special-casing userfaultfd like this makes me a bit uncomfortable; but
I also can't find anything other than userfaultfd that would insert
pages into regions that are khugepaged-compatible, so I guess this
works?

I guess an alternative would be to use a spin_trylock() instead of the
current pmd_lock(), and if that fails, temporarily drop the page table
lock and then restart from step 2 with both locks held - and at that
point the page table scan should be fast since we expect it to usually
be empty.
