Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E178173E241
	for <lists+sparclinux@lfdr.de>; Mon, 26 Jun 2023 16:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjFZOh3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Jun 2023 10:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjFZOh1 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 26 Jun 2023 10:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED20010C2
        for <sparclinux@vger.kernel.org>; Mon, 26 Jun 2023 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687790201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tvcSqXCnz9zVXylEiOugaJe8PBAXaMauU+4YTqF2Kks=;
        b=ct4PatFkbBsjEKIKtSqgEa9zU+ug52tY/jG4bGhtKsOanMOmu9Nk3IjzAlzIg2e3A7CBPx
        iDLc441UQQT624q3xAc1FcIUXHcIlHV/L1QFcG7kfxAmZg3cjhho8rMEEJ7idFpuZj0+W2
        /CNjcxVwhoKClPa0SM2qf8gxj3syXy4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-tHw4a6asNsqBbKrwdeP2yQ-1; Mon, 26 Jun 2023 10:36:38 -0400
X-MC-Unique: tHw4a6asNsqBbKrwdeP2yQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-763a397a3ceso385383785a.1
        for <sparclinux@vger.kernel.org>; Mon, 26 Jun 2023 07:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790197; x=1690382197;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvcSqXCnz9zVXylEiOugaJe8PBAXaMauU+4YTqF2Kks=;
        b=POxZ6NsfkSkxcRRy+fdHNGHcixnfaVVUqLNFdT/Jh9XgtdfM9P9Cf65yPmKpfLBK+a
         2fHLQSNm/OPY35nCHuCtpxIvmbhwTNGw5McCcvzTSUriPng4MkrRnZrjspW8O9zVcbVL
         Dusvn88GbSlfJ9L3znuQi+YfIMNH5Ob7rg6rpeGvYGemc78ZJ5wBGc1z4rf9iEgJ2HD4
         5PmU0NIshwX+xCXJHkRBDEe7LJVmTSDwE8tfk6Sli/Lz+ZVwfvNHqp7kuZsHTqmrj6aK
         0RIGJwMc4AZJbBlKotDqYzpHa1WefKLV+IG6Mf4unMnq3pM28rB5zmx5qZBsQfnM42bu
         vqGg==
X-Gm-Message-State: AC+VfDwrGVPiwPut846ON4N1ZULVyqNdKzvkKX+eWxngrMqmdlNw3heG
        v3H1zhwT2UbFjcUMvH1zGjgsejwwdANsiE1HX6RloKSofrLv/P9tViZMZh9vPvcNaUD0AnlxEGZ
        bDw/Ika0LqcHjzIn+RtoKnw==
X-Received: by 2002:a05:620a:2b88:b0:762:5179:5d97 with SMTP id dz8-20020a05620a2b8800b0076251795d97mr26896692qkb.12.1687790197708;
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79/JfP3Hny6V9tnqkHShvsxIy9E8rAkOfBtz9lcAvMdQVNdzhuBr1C3eS+Bxuk3VP5Pg8PBg==
X-Received: by 2002:a05:620a:2b88:b0:762:5179:5d97 with SMTP id dz8-20020a05620a2b8800b0076251795d97mr26896682qkb.12.1687790197466;
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
Received: from ypodemsk.tlv.csb (IGLD-84-229-250-192.inter.net.il. [84.229.250.192])
        by smtp.gmail.com with ESMTPSA id pe34-20020a05620a852200b00765a71e399bsm1204141qkn.55.2023.06.26.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
Message-ID: <cccb5351e48b11e6c657bcfa28632f49cb9cc800.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync
 IPI only to MM CPUs
From:   ypodemsk@redhat.com
To:     Dave Hansen <dave.hansen@intel.com>, mtosatti@redhat.com,
        ppandit@redhat.com, david@redhat.com, linux@armlinux.org.uk,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        keescook@chromium.org, paulmck@kernel.org, frederic@kernel.org,
        will@kernel.org, peterz@infradead.org, ardb@kernel.org,
        samitolvanen@google.com, juerg.haefliger@canonical.com,
        arnd@arndb.de, rmk+kernel@armlinux.org.uk, geert+renesas@glider.be,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        sebastian.reichel@collabora.com, rppt@kernel.org,
        aneesh.kumar@linux.ibm.com, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date:   Mon, 26 Jun 2023 17:36:28 +0300
In-Reply-To: <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
         <20230620144618.125703-3-ypodemsk@redhat.com>
         <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
         <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
         <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, 2023-06-22 at 06:37 -0700, Dave Hansen wrote:
> On 6/22/23 06:14, ypodemsk@redhat.com wrote:
> > I will send a new version with the local variable as you suggested
> > soon.
> > As for the config name, what about CONFIG_ARCH_HAS_MM_CPUMASK?
> 
> The confusing part about that name is that mm_cpumask() and
> mm->cpu_bitmap[] are defined unconditionally.  So, they're *around*
> unconditionally but just aren't updated.
> 
I think your right about the config name,
How about the
CONFIG_ARCH_USE_MM_CPUMASK?
This has the right semantic as these archs use the cpumask field of the
mm struct.

> BTW, it would also be nice to have _some_ kind of data behind this
> patch.
> 
> Fewer IPIs are better I guess, but it would still be nice if you
> could say:
> 
> 	Before this patch, /proc/interrupts showed 123 IPIs/hour for an
> 	isolated CPU.  After the approach here, it was 0.
> 
> ... or something.

This is part of an ongoing effort to remove IPIs and this one was found
via code inspection.


