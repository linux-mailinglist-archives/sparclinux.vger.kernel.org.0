Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A15B1A4A61
	for <lists+sparclinux@lfdr.de>; Fri, 10 Apr 2020 21:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDJT1D (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 10 Apr 2020 15:27:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26458 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726702AbgDJT1C (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 10 Apr 2020 15:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586546822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ddNmEkCT3NuYAPr19Gh+8RyFM7t2I+OUmUTTKHVjsXQ=;
        b=R4H65oV/piiaFxCONv2hcd8uancE7pSECUD7QWxBzAOxcWBeqN9pEqRellE6VOpm+CkyqF
        nD605fpUH+9FLepEoOx6LXHdwhoL1sOwGQyNtgV1ki1Hg5DDi+ayeIhvzsJI8044A3/WvE
        tNOvb2uCzedeyxcKHAsyfjilBGTzgYY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-3AWSTFidNwmGlWnyEww4gA-1; Fri, 10 Apr 2020 15:27:00 -0400
X-MC-Unique: 3AWSTFidNwmGlWnyEww4gA-1
Received: by mail-qt1-f200.google.com with SMTP id x4so2685052qti.8
        for <sparclinux@vger.kernel.org>; Fri, 10 Apr 2020 12:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ddNmEkCT3NuYAPr19Gh+8RyFM7t2I+OUmUTTKHVjsXQ=;
        b=TLaR62KwUpQrKhzPr35LYHM4kHL82n5ECz4o16QFehqS6EusDWRA+86YolW4OSeghQ
         RmVrMSiSuPAxrF2eZtnTFJcc5fXS91zkJfV9ObEEACPkxOnJFwcqaqqcgXBmyzEv/JMR
         ZJrmfKHTGfSHKdRww5VcPu2KfHnvwMopbN4CYDkdP0oIUJkRC280fJlrmEFZR+bhCKu5
         kLa9ySH7UDYho1SHM0tZ8lTMH+qujokEWI17OpSc+R4tqPbEQB0T+yEppRcwE5jtswX7
         xcpRHwJWwhPzCZ2ZAgwgVhcCEOL1Pjhb84jr/vr+AEcY3nAvNlpZ+NqNzto0RxIjPm0Y
         jvOQ==
X-Gm-Message-State: AGi0PuYMymm2HQdSg7MmAhb5KHVmtphC64nKlnwaeZIc717SOXvwPylM
        ZnAJ+0JzweXiC6T2XvOuyV9mzTfY/uf4rvooDW2TcSc0O4qLUiGgYC+rm40bSfyhcjkrIXMfLld
        is96H2cZ7G0rcFoL8ttrK/w==
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr769592qta.188.1586546820320;
        Fri, 10 Apr 2020 12:27:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypJUBND9mw4a79BsRjlZQBzcyo9K+K4n4uLp4F1mRayVM5WnYx0Zu2cY7436wozu46yjuIupKQ==
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr769568qta.188.1586546820098;
        Fri, 10 Apr 2020 12:27:00 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id o33sm2321940qtj.62.2020.04.10.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:26:59 -0700 (PDT)
Date:   Fri, 10 Apr 2020 15:26:56 -0400
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
Subject: Re: [PATCH v2 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
Message-ID: <20200410192656.GE3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-3-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401183819.20647-3-mike.kravetz@oracle.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Apr 01, 2020 at 11:38:17AM -0700, Mike Kravetz wrote:
> Now that architectures provide arch_hugetlb_valid_size(), parsing
> of "hugepagesz=" can be done in architecture independent code.
> Create a single routine to handle hugepagesz= parsing and remove
> all arch specific routines.  We can also remove the interface
> hugetlb_bad_size() as this is no longer used outside arch independent
> code.
> 
> This also provides consistent behavior of hugetlbfs command line
> options.  The hugepagesz= option should only be specified once for
> a specific size, but some architectures allow multiple instances.
> This appears to be more of an oversight when code was added by some
> architectures to set up ALL huge pages sizes.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

This could change the error messages for a wrong setup on archs, but I
guess it's not a big deal, assuming even to capture error people will
majorly still look for error lines in general..

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

