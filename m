Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107B97A752C
	for <lists+sparclinux@lfdr.de>; Wed, 20 Sep 2023 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjITICR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 20 Sep 2023 04:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjITICK (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 20 Sep 2023 04:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30BBA1
        for <sparclinux@vger.kernel.org>; Wed, 20 Sep 2023 01:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695196891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rnpCpoK1Qphye/H0at9y+THlkxPvcEo2r5PdFTxqnHY=;
        b=b6aYi71saap/Q6w8BgWz6mQXiXVwgl0Fs+rUU4R6MWfhjDt9zNt3fGEd7AVhhr8pr9zJre
        OC2aryCtmSl1R8Z8O+dyOWLwWSn26BY3/LKeLeQC8y8e4mb7iJyL2fQPd1q498UpI3K2uK
        7w23AtkppUnbnq9ylCYxW3UKmmU65BU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-_NqTihRQMVaMKV-BwaFFEQ-1; Wed, 20 Sep 2023 04:01:29 -0400
X-MC-Unique: _NqTihRQMVaMKV-BwaFFEQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31f79595669so238942f8f.0
        for <sparclinux@vger.kernel.org>; Wed, 20 Sep 2023 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196888; x=1695801688;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnpCpoK1Qphye/H0at9y+THlkxPvcEo2r5PdFTxqnHY=;
        b=QuYZrEMXox7tPx3q6VyYd61ztgpTds4QCNObIYvHlGEeRvLlAHhq9ZJ8uDVdbIM1zT
         ORCYETUCICh51fkSifPgUff6Pk5o7HvLf91888AzkKH5s5mE7We6bWPaOq4DAQmM0mIR
         FeoIH85Min+8Fv/hyyIj1CwqM/K4xqCXv2gQlH7RXNLjqwVgqPEs2Fgiep7Vgw3OpAhF
         xfqS4KVDHKnu2jo7iN4gBXTKQbsrgm8vtSULJ13ahwUpRcoNxbPumJYDKx0k4JP6r0O3
         UkaI7O8fymkucL/FZ8Sbdk2sLOHw9MRWO6YMwZT9DCrcwghz7uWTFLKo/0pXInNQTX71
         h1IA==
X-Gm-Message-State: AOJu0YxPCP0DZarSDj4d4WVUbLapOdqbk5qyk1HrEF2R1yKMdOaFj81N
        AGh8oVcZMrJAdD9iU3wZpyvqy5zXkrE0ZOqrB5j+j8d3N8Gcjkm0+BMAYNd0A40oHdYAPH7WQ6b
        R54a/u5mqqS59WubMGRXVxg==
X-Received: by 2002:a5d:4691:0:b0:317:6579:2b9f with SMTP id u17-20020a5d4691000000b0031765792b9fmr1441901wrq.30.1695196888609;
        Wed, 20 Sep 2023 01:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjMaHCrb95S6OjzxI7LM9YzqMZD+FHo9V0ilc7E6hmphf8oly7XaHzjchfvY6rdHHetD1Jw==
X-Received: by 2002:a5d:4691:0:b0:317:6579:2b9f with SMTP id u17-20020a5d4691000000b0031765792b9fmr1441876wrq.30.1695196888277;
        Wed, 20 Sep 2023 01:01:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b0031c5e9c2ed7sm17627845wrr.92.2023.09.20.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:01:27 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
        deller@gmx.de
Cc:     linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 1/5] fbdev: Avoid file argument in fb_pgprotect()
In-Reply-To: <20230912135050.17155-2-tzimmermann@suse.de>
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-2-tzimmermann@suse.de>
Date:   Wed, 20 Sep 2023 10:01:27 +0200
Message-ID: <87il85l1d4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Only PowerPC's fb_pgprotect() needs the file argument, although
> the implementation does not use it. Pass NULL to the internal

Can you please mention the function that's the implementation for
PowerPC ? If I'm looking at the code correctly, that function is
phys_mem_access_prot() defined in the arch/powerpc/mm/mem.c file:

pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
			      unsigned long size, pgprot_t vma_prot)
{
	if (ppc_md.phys_mem_access_prot)
		return ppc_md.phys_mem_access_prot(file, pfn, size, vma_prot);

	if (!page_is_ram(pfn))
		vma_prot = pgprot_noncached(vma_prot);

	return vma_prot;
}

and if set, ppc_md.phys_mem_access_prot is pci_phys_mem_access_prot()
that is defined in the arch/powerpc/kernel/pci-common.c source file:

https://elixir.bootlin.com/linux/v6.6-rc2/source/arch/powerpc/kernel/pci-common.c#L524

That function indeed doesn't use the file argument. So your patch looks
correct to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

