Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF27196A39
	for <lists+sparclinux@lfdr.de>; Sun, 29 Mar 2020 01:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgC2ATi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 28 Mar 2020 20:19:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50760 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726604AbgC2ATi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Sat, 28 Mar 2020 20:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585441176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vaewZEk2eYYox9uyi7WlaKYkj/uEgqOwrp4YGqapC0o=;
        b=bf2t5/3UtZB+ZZqNV/rAnnsMXSlWiCYYhsQx9KU9H0ltIBEQL9TFo/Fqhd2OITXd0edYFx
        ME4eKixx9+a+HNW/Diit591OaIK52m3dSXrfT9OBAEoMubyhvCg1WhZwouwl1t+7wP5KSU
        YSeO5i+KxJFGpmxglOY2Qkw695a3o3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ivzlOkrCNy-K-x1Z03nVDw-1; Sat, 28 Mar 2020 20:19:34 -0400
X-MC-Unique: ivzlOkrCNy-K-x1Z03nVDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BD918A8C80;
        Sun, 29 Mar 2020 00:19:29 +0000 (UTC)
Received: from localhost (ovpn-12-30.pek2.redhat.com [10.72.12.30])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B78510013A1;
        Sun, 29 Mar 2020 00:19:27 +0000 (UTC)
Date:   Sun, 29 Mar 2020 08:19:24 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Hoan Tran <Hoan@os.amperecomputing.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        lho@amperecomputing.com, mmorana@amperecomputing.com
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200329001924.GS3039@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 03/28/20 at 11:31am, Hoan Tran wrote:
> In NUMA layout which nodes have memory ranges that span across other nodes,
> the mm driver can detect the memory node id incorrectly.
> 
> For example, with layout below
> Node 0 address: 0000 xxxx 0000 xxxx
> Node 1 address: xxxx 1111 xxxx 1111

Sorry, I read this example several times, but still don't get what it
means. Can it be given with real hex number address as an exmaple? I
mean just using the memory layout you have seen from some systems. The
change looks interesting though.

> 
> Note:
>  - Memory from low to high
>  - 0/1: Node id
>  - x: Invalid memory of a node
> 
> When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> config, mm only checks the memory validity but not the node id.
> Because of that, Node 1 also detects the memory from node 0 as below
> when it scans from the start address to the end address of node 1.
> 
> Node 0 address: 0000 xxxx xxxx xxxx
> Node 1 address: xxxx 1111 1111 1111
> 
> This layout could occur on any architecture. Most of them enables
> this config by default with CONFIG_NUMA. This patch, by default, enables
> CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> 
> v3:
>  * Revise the patch description
> 
> V2:
>  * Revise the patch description
> 
> Hoan Tran (5):
>   mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
>   powerpc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> 
>  arch/powerpc/Kconfig | 9 ---------
>  arch/s390/Kconfig    | 8 --------
>  arch/sparc/Kconfig   | 9 ---------
>  arch/x86/Kconfig     | 9 ---------
>  mm/page_alloc.c      | 2 +-
>  5 files changed, 1 insertion(+), 36 deletions(-)
> 
> -- 
> 1.8.3.1
> 
> 

