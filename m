Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8B523BB6F
	for <lists+sparclinux@lfdr.de>; Tue,  4 Aug 2020 15:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgHDNxe (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Aug 2020 09:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgHDNxY (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Aug 2020 09:53:24 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4ABC061756
        for <sparclinux@vger.kernel.org>; Tue,  4 Aug 2020 06:53:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y206so9988748pfb.10
        for <sparclinux@vger.kernel.org>; Tue, 04 Aug 2020 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
        b=jumdjySCSXZVJzizm9OUzoU9OXCS+Cfq57D4M9+nOmcjFx/ImlUYxx8bn1JnW+143W
         B6tMiLN9WKIVbxAyKxyw81HdIULr1/GZN+VKaYR0TvHVg/4jcAFDj42GWXCA2Swm1Yfw
         5v27iYJTlRgBYWmLp+/HqtnWpSjejedeiZ1fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=nig2/fJdYyt3b0Q5A/SU+0msFseeyybXCaAI4dDRdTg=;
        b=HqsWb2ZoYf5OWNhFpzGQiiybkrAJUiyK5hsHV8wq2knWam1w6GUQC4EifHnM8qKc7h
         9OzMXZBWUS6T3p26lN//rBsNehklORagbnDPeHfJcU/MEPdUP4qpsEIPtmIUKUqquZ2O
         gKAoUATuhIARh/5JXvNAkndek28LPNe5LZCm907gP8WEBUJ9Gcz6IcYxzBb5GPtKyQ+q
         CY+u7v0h27zPFXAjXCAaoo/lcMl5m/Uu5stsCqVwQWc9UGYGTakWt/7wl3qQltGiYudi
         vLylrArRQH1VuJWlfc1m+nuebxc2uX9r4AF94uxkGxazOg5qk0r3XpVnDtvllLZrEmnV
         UeNw==
X-Gm-Message-State: AOAM532+fvbpMe+USoaw4yKf3rb5GptfteCBcqxJjsjqPSOPD3egfwB+
        ogZ+5MChYMV5dMu86FfGEcIISw==
X-Google-Smtp-Source: ABdhPJzULAmNSkaX32weXl1O34te5NSuX9EJVhPlxbPjsXptEZqiJedi5i9MSO/avpj2cLsHaUiFtw==
X-Received: by 2002:a63:3587:: with SMTP id c129mr20025647pga.322.1596549199803;
        Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
Received: from localhost (2001-44b8-1113-6700-0414-2e33-60ed-75ec.static.ipv6.internode.on.net. [2001:44b8:1113:6700:414:2e33:60ed:75ec])
        by smtp.gmail.com with ESMTPSA id g8sm9981404pfo.132.2020.08.04.06.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 06:53:19 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>, Baoquan He <bhe@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Ingo Molnar <mingo@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: Re: [PATCH v2 01/17] KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
In-Reply-To: <20200802163601.8189-2-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org> <20200802163601.8189-2-rppt@kernel.org>
Date:   Tue, 04 Aug 2020 23:53:15 +1000
Message-ID: <87tuxio6us.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Mike,

>
> The memory size calculation in kvm_cma_reserve() traverses memblock.memory
> rather than simply call memblock_phys_mem_size(). The comment in that
> function suggests that at some point there should have been call to
> memblock_analyze() before memblock_phys_mem_size() could be used.
> As of now, there is no memblock_analyze() at all and
> memblock_phys_mem_size() can be used as soon as cold-plug memory is
> registerd with memblock.
>
> Replace loop over memblock.memory with a call to memblock_phys_mem_size().
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_builtin.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 7cd3cf3d366b..56ab0d28de2a 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -95,22 +95,15 @@ EXPORT_SYMBOL_GPL(kvm_free_hpt_cma);
>  void __init kvm_cma_reserve(void)
>  {
>  	unsigned long align_size;
> -	struct memblock_region *reg;
> -	phys_addr_t selected_size = 0;
> +	phys_addr_t selected_size;
>  
>  	/*
>  	 * We need CMA reservation only when we are in HV mode
>  	 */
>  	if (!cpu_has_feature(CPU_FTR_HVMODE))
>  		return;
> -	/*
> -	 * We cannot use memblock_phys_mem_size() here, because
> -	 * memblock_analyze() has not been called yet.
> -	 */
> -	for_each_memblock(memory, reg)
> -		selected_size += memblock_region_memory_end_pfn(reg) -
> -				 memblock_region_memory_base_pfn(reg);
>  
> +	selected_size = PHYS_PFN(memblock_phys_mem_size());
>  	selected_size = (selected_size * kvm_cma_resv_ratio / 100) << PAGE_SHIFT;

I think this is correct, but PHYS_PFN does x >> PAGE_SHIFT and then the
next line does x << PAGE_SHIFT, so I think we could combine those two
lines as:

selected_size = PAGE_ALIGN(memblock_phys_mem_size() * kvm_cma_resv_ratio / 100);

(I think that might technically change it from aligning down to aligning
up but I don't think 1 page matters here.)

Kind regards,
Daniel


>  	if (selected_size) {
>  		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
> -- 
> 2.26.2
