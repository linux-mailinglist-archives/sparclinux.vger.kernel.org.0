Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C45A6A5C98
	for <lists+sparclinux@lfdr.de>; Tue, 28 Feb 2023 16:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjB1P6B (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 28 Feb 2023 10:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjB1P5u (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 28 Feb 2023 10:57:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B02132CC5
        for <sparclinux@vger.kernel.org>; Tue, 28 Feb 2023 07:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677599795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=L7YliKV/d3202CCEuU9Fu2ac86tPOoUC+750FU1UZiFNnKKVsSvv9T7SgjZOSG/zn0wRsS
        KY458A7FWA74fitA5SLEBpgpLgM7VD7z6cx4ectDFvde8wsW2gXG2GVzJ6wVslmhqI/Rb1
        YK4AHB1E0McrSW3VjATaBEavJpoDBjY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-p7g-uwKlMWOdGE3AWYBqoQ-1; Tue, 28 Feb 2023 10:56:34 -0500
X-MC-Unique: p7g-uwKlMWOdGE3AWYBqoQ-1
Received: by mail-wm1-f71.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so7083303wms.1
        for <sparclinux@vger.kernel.org>; Tue, 28 Feb 2023 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=Sq/saH8NtAJpLGsYWGrHH/uOPUiAa0J/vetV5SUpUun5BI4U+n+A+LMnV4BCuhsqL2
         EMbG8TmYaQIemj6gZ703bHhZ1mY8iuiLgPmEsJre2lOJsBmWEsd6cUGXDiAItQpFnXlv
         KzVrWUgt9ooY99WJ1dv/8FM5Dx1dyouZ1oZD83vzxRVRTEjhak7jb0U3wgtqS63iqsoT
         D7OXKp16dpstBLOiaGLj8d4W4FqoRIl1vw3uWmjKBbailhb54rLnxW9Knr07cPThNXEY
         S7m2HXanyN9pmBDIphlRM6CK3Cno3dOY9FOnAna8Akbs2+BKsI8isK63LzOsGG1t41gH
         D9Hg==
X-Gm-Message-State: AO0yUKW5Dlynm85CR8K1NQ+JD6RTnzR/cOamCeFSsW9ziHfkzq7J5Y2w
        5ab2rlKsKnk9MzSYsObrymZP72dbvfYUz5Y17CTNcN36w+E9O09fu7OM9W8BRn/BhJbxc2RpHuD
        3LeJDI9+CZge54fU0hP46Mw==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985255wmb.12.1677599793386;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2v9f8GltbBAhuiD5VLcyopD+EwumVs1dLk0qMzdF/fI8DkaFn74NX3LW8zhnIM6FtbCCQg==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985221wmb.12.1677599793078;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm13465165wmb.9.2023.02.28.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:56:32 -0800 (PST)
Message-ID: <bd656b2c-9a20-dea9-dcef-9cc965bccc9e@redhat.com>
Date:   Tue, 28 Feb 2023 16:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Content-Language: en-US
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        hughd@google.com, jhubbard@nvidia.com, jgg@nvidia.com,
        rppt@linux.ibm.com, shy828301@gmail.com, vbabka@suse.cz,
        namit@vmware.com, aarcange@redhat.com, peterx@redhat.com,
        linux-mm@kvack.org, x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
References: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 28.02.23 16:50, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the offset. This reduces the maximum swap space per file: on 32bit
>> to 16 GiB (was 32 GiB).
> 
> Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

Patch is already upstream, so we can't add tags unfortunately. Thanks 
for the review!

-- 
Thanks,

David / dhildenb

