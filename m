Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0442371F98C
	for <lists+sparclinux@lfdr.de>; Fri,  2 Jun 2023 07:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbjFBFLe (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 2 Jun 2023 01:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbjFBFLc (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 2 Jun 2023 01:11:32 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A90192
        for <sparclinux@vger.kernel.org>; Thu,  1 Jun 2023 22:11:31 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-565aa2cc428so16286797b3.1
        for <sparclinux@vger.kernel.org>; Thu, 01 Jun 2023 22:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685682690; x=1688274690;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6bETEgptaQmknN3KJaLXizDl5W0dZfHJTvGtn11hDc=;
        b=qa851WImwA3lMZ07+PCbTmfx3yIALpFTmduEOo5G2zdDKXUxzfUG+V+18Foeh7bAun
         q6tsRbOyfZYtbS3OjOdH5dItro2SpIrlVyxvW5l7fHCPLbibqf/4EV5K0CLG54OjqPV8
         A1m/h5RhcgSkaq4j/vUhdGdhrlZJtOWUEvbwjsasYtdk9dnqF6cOX5ljLlJ6mXuue9et
         HlUxdB6UD6X0U4mEYyw4XQc7b7Yq1NPdzS76zqMwtSdLePdAdbnaWJMqmEUrCGC85kUJ
         SyUGlv6ukiwzpjlLHZiDGZ/hdqMTp8uqzwQsgV4NB1OCxU0jIerSQZhohHGmqk6GbcJR
         YnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685682690; x=1688274690;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6bETEgptaQmknN3KJaLXizDl5W0dZfHJTvGtn11hDc=;
        b=buB4WIHPqbtoYQLib+dx2vR3w/rwPPKmi3yzk2iqkc/ZETKkloYj4sle97kXwjiCnz
         H94W43/K/7l14pZ53TsSnYlQB/de2cTN88gy4O+p3Zrcey2hHrdsy9J8Z3awFFWciAzk
         QyFOMK3zAHoAuW+TTdVsCkxahfFhNxd5oclQ+zVhAOuCn2qHba4Kh548N0JWbwINsNs1
         YhmPjtLQY8u0n+OtuaFlPCTKgSWaODYYqpPYUuX2Mg0AyAG0z8YtcKtei4aeSSaGKTnD
         3Qzw+IoSM2qcg1TTRLOK+AR8BZeBvTZSCYTlBewLb0+SB6l8KuaCy5zQnvKqjZMiJw/V
         JXzQ==
X-Gm-Message-State: AC+VfDyL5K3fpoHNvURDqL1lH4y10qRRDMqJc+AgcMCLmEL0TatkwYcJ
        PEcsb2qD3cF0TrAqZ0Pe9X7bJQ==
X-Google-Smtp-Source: ACHHUZ4ugmc1ZmPREvUjpX2pr+1vA9rk2z3oN7r1F0vAyTghykORwfl8B4/1qO9owgGpM7DimQDt5Q==
X-Received: by 2002:a0d:d752:0:b0:55a:59cb:4c1a with SMTP id z79-20020a0dd752000000b0055a59cb4c1amr11588341ywd.14.1685682690514;
        Thu, 01 Jun 2023 22:11:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d14-20020a81d34e000000b00568ab5dd873sm135039ywl.65.2023.06.01.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 22:11:29 -0700 (PDT)
Date:   Thu, 1 Jun 2023 22:11:25 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Jann Horn <jannh@google.com>
cc:     Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 10/12] mm/khugepaged: collapse_pte_mapped_thp() with
 mmap_read_lock()
In-Reply-To: <CAG48ez2X5oZyxaFniZ-HeGHDGjNuPBewGTjZLEHPWkBbBCaigg@mail.gmail.com>
Message-ID: <dad171e1-cacf-e430-e91f-649ebeab605b@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <563340a4-7ac9-7cc8-33d8-f7cc6ef19ea6@google.com> <CAG48ez2X5oZyxaFniZ-HeGHDGjNuPBewGTjZLEHPWkBbBCaigg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-1043245876-1685682689=:27841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-1043245876-1685682689=:27841
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 31 May 2023, Jann Horn wrote:
> On Mon, May 29, 2023 at 8:26=E2=80=AFAM Hugh Dickins <hughd@google.com> w=
rote:
> > Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
> > It does need mmap_read_lock(), but it does not need mmap_write_lock(),
> > nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
> > paths are relying on pte_offset_map_lock() and pmd_lock(), so use those=
=2E
>=20
> I think there's a weirdness in the existing code, and this change
> probably turns that into a UAF bug.
>=20
> collapse_pte_mapped_thp() can be called on an address that might not
> be associated with a VMA anymore, and after this change, the page
> tables for that address might be in the middle of page table teardown
> in munmap(), right? The existing mmap_write_lock() guards against
> concurrent munmap() (so in the old code we are guaranteed to either
> see a normal VMA or not see the page tables anymore), but
> mmap_read_lock() only guards against the part of munmap() up to the
> mmap_write_downgrade() in do_vmi_align_munmap(), and unmap_region()
> (including free_pgtables()) happens after that.

Excellent point, thank you.  Don't let anyone overhear us, but I have
to confess to you that that mmap_write_downgrade() has never impinged
forcefully enough on my consciousness: it's still my habit to think of
mmap_lock as exclusive over free_pgtables(), and I've not encountered
this bug in my testing.

Right, I'll gladly incorporate your collapse_pte_mapped_thp()
rearrangement below.  And am reassured to realize that by removing
mmap_lock dependence elsewhere, I won't have got it wrong in other places.

Thanks,
Hugh

>=20
> So we can now enter collapse_pte_mapped_thp() and race with concurrent
> free_pgtables() such that a PUD disappears under us while we're
> walking it or something like that:
>=20
>=20
> int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>           bool install_pmd)
> {
>   struct mmu_notifier_range range;
>   unsigned long haddr =3D addr & HPAGE_PMD_MASK;
>   struct vm_area_struct *vma =3D vma_lookup(mm, haddr); // <<< returns NU=
LL
>   struct page *hpage;
>   pte_t *start_pte, *pte;
>   pmd_t *pmd, pgt_pmd;
>   spinlock_t *pml, *ptl;
>   int nr_ptes =3D 0, result =3D SCAN_FAIL;
>   int i;
>=20
>   mmap_assert_locked(mm);
>=20
>   /* Fast check before locking page if already PMD-mapped */
>   result =3D find_pmd_or_thp_or_none(mm, haddr, &pmd); // <<< PUD UAF in =
here
>   if (result =3D=3D SCAN_PMD_MAPPED)
>     return result;
>=20
>   if (!vma || !vma->vm_file || // <<< bailout happens too late
>       !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>     return SCAN_VMA_CHECK;
>=20
>=20
> I guess the right fix here is to make sure that at least the basic VMA
> revalidation stuff (making sure there still is a VMA covering this
> range) happens before find_pmd_or_thp_or_none()? Like:
>=20
>=20
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 301c0e54a2ef..5db365587556 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1481,15 +1481,15 @@ int collapse_pte_mapped_thp(struct mm_struct
> *mm, unsigned long addr,
>=20
>          mmap_assert_locked(mm);
>=20
> +        if (!vma || !vma->vm_file ||
> +            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
> +                return SCAN_VMA_CHECK;
> +
>          /* Fast check before locking page if already PMD-mapped */
>          result =3D find_pmd_or_thp_or_none(mm, haddr, &pmd);
>          if (result =3D=3D SCAN_PMD_MAPPED)
>                  return result;
>=20
> -        if (!vma || !vma->vm_file ||
> -            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
> -                return SCAN_VMA_CHECK;
> -
>          /*
>           * If we are here, we've succeeded in replacing all the native p=
ages
>           * in the page cache with a single hugepage. If a mm were to fau=
lt-in
>=20
---1463760895-1043245876-1685682689=:27841--
