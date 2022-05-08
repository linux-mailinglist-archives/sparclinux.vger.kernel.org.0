Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1787E51EDCF
	for <lists+sparclinux@lfdr.de>; Sun,  8 May 2022 15:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbiEHNfv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 8 May 2022 09:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbiEHNft (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 8 May 2022 09:35:49 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01191101D5
        for <sparclinux@vger.kernel.org>; Sun,  8 May 2022 06:31:58 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so14834407pju.2
        for <sparclinux@vger.kernel.org>; Sun, 08 May 2022 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PmPqsk4Ds+rkfpu3nL2hTmPZ4zZI7ndI1Rv+jcAXn+g=;
        b=SyLOThmLnXTk6qRKX1oo9DRLScsXkpBQJcjqc2ZX8BklsBr9Jd5/4XzS5R0rdBNn64
         Gj08t8HnQPHGWv/6lK5azajHcMs4BDXMAWO/si9Vg++doIk4TwR6gjg96i/2Ieo239U+
         GD/hhn1ajJzQO2Fu00Id46ibFUBWFedLdoweGjfehLyxDpd+kx2jhOMeAvgK4hJi70uy
         2Sxen0AzDNegfxiv3X3keWQqOByVGhCLH68rwxiyhvd4lp5cQorNpjcRm00TCUGhYcZj
         TpQMhfYAi5LQjolnYmnz+/jetR/+obipzK9Rq4yk9iPkemX0aPQqHJMSY4KTNlniPFzy
         Gz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PmPqsk4Ds+rkfpu3nL2hTmPZ4zZI7ndI1Rv+jcAXn+g=;
        b=Lx+y4aELPQzx3+rZb3511eSRJB4ukNFB2tKd9OibJ0g/CuvMiP3HcVuiTOp4qXDtbo
         rfou4vV1zdV0K8ZFQyQ3iZQ7ZC1kVx+eIqCSNOxfigHrEYkVd8YcxLlWwGGEmZUZZT1E
         Q1Y7/Pv/8j66y1PlR3ekn3VnH+6Gpk97HaggcxJkMtriQwXy4mYszNfQyksauR7hciCx
         RPMUVetOvzKL3ULJFTVKw+gw6xe3RfcpRsP8Yn0Aph+fP0o3/XU7+6A02859RyL2B1bH
         N15/8TQ8XBmiq4pqwfzrMu/gn3bXNmszeazGcqWlm+ebhQgHFeHZO3F3ouRBCwbXFzeV
         6mhw==
X-Gm-Message-State: AOAM532sEWssYH3mkTNgNH+nWb2JgvdS0MZBXCrY33iUIoJ9xZ4RF8Dq
        3cefdro7W/hzXAXa5GxQzxILgg==
X-Google-Smtp-Source: ABdhPJxahffH9rcJXLYibIJ0tdGcqVx0aeXH5wYUXoWTVBpSrJpN/ltMk318QQF+PAogtyB3/7uLhQ==
X-Received: by 2002:a17:90b:4c88:b0:1dc:60c2:25b2 with SMTP id my8-20020a17090b4c8800b001dc60c225b2mr21748033pjb.133.1652016717528;
        Sun, 08 May 2022 06:31:57 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id cj25-20020a056a00299900b0050dc76281e1sm6590444pfb.187.2022.05.08.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 06:31:57 -0700 (PDT)
Date:   Sun, 8 May 2022 21:31:54 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     akpm@linux-foundation.org, mike.kravetz@oracle.com,
        catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when migration
Message-ID: <YnfGSu8tPzTt9ozL@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <1ec8a987be1a5400e077260a300d0079564b1472.1652002221.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec8a987be1a5400e077260a300d0079564b1472.1652002221.git.baolin.wang@linux.alibaba.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, May 08, 2022 at 05:36:40PM +0800, Baolin Wang wrote:
> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When migrating a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it and remap it with
> a migration pte entry. This is correct for PMD or PUD size hugetlb,
> since they always contain only one pmd entry or pud entry in the
> page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes. So we will nuke or remap only one pte
> or pmd entry for this CONT-PTE/PMD size hugetlb page, which is
> not expected for hugetlb migration. The problem is we can still
> continue to modify the subpages' data of a hugetlb page during
> migrating a hugetlb page, which can cause a serious data consistent
> issue, since we did not nuke the page table entry and set a
> migration pte for the subpages of a hugetlb page.
> 
> To fix this issue, we should change to use huge_ptep_clear_flush()
> to nuke a hugetlb page table, and remap it with set_huge_pte_at()
> and set_huge_swap_pte_at() when migrating a hugetlb page, which
> already considered the CONT-PTE or CONT-PMD size hugetlb.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

This looks fine to me.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
