Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430B1298B50
	for <lists+sparclinux@lfdr.de>; Mon, 26 Oct 2020 12:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391685AbgJZLFh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Oct 2020 07:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60298 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1773080AbgJZLFh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 26 Oct 2020 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603710335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uR3SoUQ38JQhR3FzkH7b6r+ChPHdaTScYhjRwjs5L+4=;
        b=HlpA2vaWkks1DzlbhXHM5sNLLcmX9dG1Pwhi+ravy6rRl5hUvqozaIbZhnQB766Hlsda18
        KxXPS3lad0m25HgEyRgcMMAv9IJjDkzL4ga6WxPH77/fU7SRcCMA16ep7sUqygbS1n3nJk
        7md1Mprb4TBOVDrePmogd+bEQvJsu7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-pGgOFeOzOUSKAoeWEvAb1w-1; Mon, 26 Oct 2020 07:05:30 -0400
X-MC-Unique: pGgOFeOzOUSKAoeWEvAb1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FB0101F7B0;
        Mon, 26 Oct 2020 11:05:25 +0000 (UTC)
Received: from [10.36.113.62] (ovpn-113-62.ams2.redhat.com [10.36.113.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00EE61043269;
        Mon, 26 Oct 2020 11:05:14 +0000 (UTC)
Subject: Re: [PATCH 1/4] mm: introduce debug_pagealloc_map_pages() helper
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Christoph Lameter <cl@linux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Len Brown <len.brown@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>, Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-pm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        x86@kernel.org
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-2-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
Date:   Mon, 26 Oct 2020 12:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201025101555.3057-2-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 25.10.20 11:15, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the
> kernel direct mapping after free_pages(). The pages than need to be
> mapped back before they could be used. Theese mapping operations use 
> __kernel_map_pages() guarded with with debug_pagealloc_enabled().
> 
> The only place that calls __kernel_map_pages() without checking
> whether DEBUG_PAGEALLOC is enabled is the hibernation code that
> presumes availability of this function when ARCH_HAS_SET_DIRECT_MAP
> is set. Still, on arm64, __kernel_map_pages() will bail out when
> DEBUG_PAGEALLOC is not enabled but set_direct_map_invalid_noflush()
> may render some pages not present in the direct map and hibernation
> code won't be able to save such pages.
> 
> To make page allocation debugging and hibernation interaction more
> robust, the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP
> has to be made more explicit.
> 
> Start with combining the guard condition and the call to 
> __kernel_map_pages() into a single debug_pagealloc_map_pages()
> function to emphasize that __kernel_map_pages() should not be called
> without DEBUG_PAGEALLOC and use this new function to map/unmap pages
> when page allocation debug is enabled.
> 
> As the only remaining user of kernel_map_pages() is the hibernation
> code, mode that function into kernel/power/snapshot.c closer to a
> caller.

s/mode/move/

> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com> --- 
> include/linux/mm.h      | 16 +++++++--------- kernel/power/snapshot.c
> | 11 +++++++++++ mm/memory_hotplug.c     |  3 +-- mm/page_alloc.c
> |  6 ++---- mm/slab.c               |  8 +++----- 5 files changed, 24
> insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h index
> ef360fe70aaf..14e397f3752c 100644 --- a/include/linux/mm.h +++
> b/include/linux/mm.h @@ -2927,21 +2927,19 @@ static inline bool
> debug_pagealloc_enabled_static(void) #if
> defined(CONFIG_DEBUG_PAGEALLOC) ||
> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) extern void
> __kernel_map_pages(struct page *page, int numpages, int enable);
> 
> -/* - * When called in DEBUG_PAGEALLOC context, the call should most
> likely be - * guarded by debug_pagealloc_enabled() or
> debug_pagealloc_enabled_static() - */ -static inline void 
> -kernel_map_pages(struct page *page, int numpages, int enable) 
> +static inline void debug_pagealloc_map_pages(struct page *page, +
> int numpages, int enable) { -	__kernel_map_pages(page, numpages,
> enable); +	if (debug_pagealloc_enabled_static()) +
> __kernel_map_pages(page, numpages, enable); } + #ifdef
> CONFIG_HIBERNATION extern bool kernel_page_present(struct page
> *page); #endif	/* CONFIG_HIBERNATION */ #else	/*
> CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */ -static
> inline void -kernel_map_pages(struct page *page, int numpages, int
> enable) {} +static inline void debug_pagealloc_map_pages(struct page
> *page, +					     int numpages, int enable) {} #ifdef
> CONFIG_HIBERNATION static inline bool kernel_page_present(struct page
> *page) { return true; } #endif	/* CONFIG_HIBERNATION */ diff --git
> a/kernel/power/snapshot.c b/kernel/power/snapshot.c index
> 46b1804c1ddf..fa499466f645 100644 --- a/kernel/power/snapshot.c +++
> b/kernel/power/snapshot.c @@ -76,6 +76,17 @@ static inline void
> hibernate_restore_protect_page(void *page_address) {} static inline
> void hibernate_restore_unprotect_page(void *page_address) {} #endif
> /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> 
> +#if defined(CONFIG_DEBUG_PAGEALLOC) ||
> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) +static inline void 
> +kernel_map_pages(struct page *page, int numpages, int enable) +{ +
> __kernel_map_pages(page, numpages, enable); +} +#else +static inline
> void +kernel_map_pages(struct page *page, int numpages, int enable)
> {} +#endif +

That change should go into a separate patch.


For the debug_pagealloc_map_pages() parts

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

