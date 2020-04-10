Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C551A4A7D
	for <lists+sparclinux@lfdr.de>; Fri, 10 Apr 2020 21:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgDJTe2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 10 Apr 2020 15:34:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27872 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726726AbgDJTe1 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 10 Apr 2020 15:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586547267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dR0pnT92lTl7PiXH1/vycyqLlKqG/upjftJ1HpISkMA=;
        b=LX0OxR2w0kPWwvsxu0xV3/HQXXpoxvpJ8g+og0O5a7FitVUEWxgutKv+I6GPqqr2SRigJd
        /VP9YiHOakXdO9iLclTYSdBNIV54RhAtL7xZi9NqIRRHOf3P1IhpUbdZp5x9qYhqqDhp2H
        kz5ra127yZwWpir5YPSPrRAKEhv4vMo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-AyAMlGGIM2GgyP3Inh1ToQ-1; Fri, 10 Apr 2020 15:34:23 -0400
X-MC-Unique: AyAMlGGIM2GgyP3Inh1ToQ-1
Received: by mail-qt1-f199.google.com with SMTP id e44so2710289qta.9
        for <sparclinux@vger.kernel.org>; Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dR0pnT92lTl7PiXH1/vycyqLlKqG/upjftJ1HpISkMA=;
        b=HGifPaqRIRtzpuNRNliiFY3Vnq+Bu9ii4S1HAbnrFtmF0/dobXHxVjNIXqxAiF89Uz
         uBr7kjGzPjAAV49b9z5yHC/Xo6rJpv1xzG+JkeTKB7SPknNCh/Ew9RV1da5xlqxU6yu8
         4dk0Tx8CB/9ltoAVlAvG5cCt/84qg3jyjUZWPIv4/dpwN/2sIazdixs35ZqMfsZOCEJN
         MUxWPm8UiX0N35kTtYi6VdrHAbXhAsgXSHttVrrVpm7NjxDQnbA0UpI4qz6BnlWHfQWC
         o+QD72AeRdvhOrBxeMOaPi2MhAnQQSSar4UUJf56w60Qp+Km5bm2miRjn7rxKJqdXOLo
         S+/w==
X-Gm-Message-State: AGi0Pua58TyXZdBKxzwpvDj8zV+P9qeBUoJFhzlUT1x3EMo2q/PSiAUC
        f6LPRzwRzMLFjLpi1AV/VOvAWY/T7aWYlSTHqXDGkO3FiBdrVvcIVFGoTtm19/e1tOFCis5jnt+
        se/synxmSxjU5PrdVYhLeyw==
X-Received: by 2002:ac8:6d06:: with SMTP id o6mr768731qtt.165.1586547263228;
        Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKE+9gdKAAzqM7E075abKl7yEhzpSisddiPAFgdbjLHprLwAVDEdymEnBo0qMB8GT4NFqVJjg==
X-Received: by 2002:ac8:6d06:: with SMTP id o6mr768725qtt.165.1586547263017;
        Fri, 10 Apr 2020 12:34:23 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id m11sm2214328qkg.130.2020.04.10.12.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:34:22 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:34:19 -0400
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
Subject: Re: [PATCH v2 3/4] hugetlbfs: remove hugetlb_add_hstate() warning
 for existing hstate
Message-ID: <20200410193419.GF3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-4-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401183819.20647-4-mike.kravetz@oracle.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Apr 01, 2020 at 11:38:18AM -0700, Mike Kravetz wrote:

[...]

> @@ -3255,7 +3254,6 @@ void __init hugetlb_add_hstate(unsigned int order)
>  	unsigned long i;
>  
>  	if (size_to_hstate(PAGE_SIZE << order)) {
> -		pr_warn("hugepagesz= specified twice, ignoring\n");
>  		return;
>  	}

Nitpick: I think the brackets need to be removed to follow linux
coding style.  With that:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

