Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 515141A4A3B
	for <lists+sparclinux@lfdr.de>; Fri, 10 Apr 2020 21:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgDJTQU (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 10 Apr 2020 15:16:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43956 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726203AbgDJTQU (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 10 Apr 2020 15:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586546179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mwSL4Svde7cDyREN44P4y94Qc6dx9Sv2bNY13UCrEho=;
        b=BCq9/dHDdKFYRrAjKI63OhKa4fkohIcfoT8HZNSvzCe0wflLxY8vSHMaNUdlAogf5tK3Oa
        iQwNjINST84PLtYN1QFJ/OQcwv53Z5iOQD98IXEetYUoiO7ISVpsdIq8AvMZ+g1HSO9jxo
        HFWCNqzXctpI3qu0kaHN8pUHQlufudQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-SV-aebm3Ox-U05Lxvq3VsQ-1; Fri, 10 Apr 2020 15:16:17 -0400
X-MC-Unique: SV-aebm3Ox-U05Lxvq3VsQ-1
Received: by mail-qk1-f197.google.com with SMTP id f187so1510402qkd.11
        for <sparclinux@vger.kernel.org>; Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mwSL4Svde7cDyREN44P4y94Qc6dx9Sv2bNY13UCrEho=;
        b=XOaLcMCGdMtZQXtSqTRkDF0Sk38Nn+MtXSdPJs3H2AbM1w9zk7eVrIFgS+Wk2xWv4b
         /5IzYdFMLRXqlpWC8RIvQ1nCyGg9cK8YenJg2i9i/1ZcCOIPA7HoDNI3YljZeso+6cQy
         i1atL2hGsKpafPshf/0PBWxTp++BPetZ5s+xA4qT928RlHbXRr4w/wPgZbHJMNFQzIug
         NuWIClOE6O53Sl/PJlVZU0ToColzzyPuZG2BFdx5vQVAoX4s1LIoPkKIwkGTloSyLsIV
         PMye0Au3EU7f47qtxs63eZv9b8HYFy8VdGtR10UbTv4aXhcr9wq1du1o+WuSRRhqukPd
         9myQ==
X-Gm-Message-State: AGi0PuaRZulsaB7IjZuzBS4XLIaaJ0tqcOvXPQHHOA+EL2JCE95+PTvD
        yzl3yPiVD32IvzMHnwXiL0a9nOywPe6si/ksv1eUof+cF5ujv+cUTHUwvTB24u7noPP4+4QgruP
        MIV/8AlXKmzIOvtnQFHRT5w==
X-Received: by 2002:a05:620a:89d:: with SMTP id b29mr5792234qka.329.1586546177443;
        Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLiuHO8rQfrWs/w6IUs43Srn34pCDFpZie/ieWUpJNT3bX04my6S/Xtwb+5j5ZmCFgzwIqbpg==
X-Received: by 2002:a05:620a:89d:: with SMTP id b29mr5792202qka.329.1586546177111;
        Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id b13sm1590230qtp.46.2020.04.10.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:16:16 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:16:13 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Longpeng <longpeng2@huawei.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 1/4] hugetlbfs: add arch_hugetlb_valid_size
Message-ID: <20200410191613.GD3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401183819.20647-2-mike.kravetz@oracle.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Apr 01, 2020 at 11:38:16AM -0700, Mike Kravetz wrote:
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 2eb6c234d594..81606223494f 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>  				 pte_t *ptep, pte_t pte, unsigned long sz);
>  #define set_huge_swap_pte_at set_huge_swap_pte_at
> +bool __init arch_hugetlb_valid_size(unsigned long size);
> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size

Sorry for chimming in late.

Since we're working on removing arch-dependent codes after all.. I'm
thinking whether we can define arch_hugetlb_valid_size() once in the
common header (e.g. linux/hugetlb.h), then in mm/hugetlb.c:

bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
{
	return size == HPAGE_SIZE;
}

We can simply redefine arch_hugetlb_valid_size() in arch specific C
files where we want to override the default.  Would that be slightly
cleaner?

Thanks,

-- 
Peter Xu

