Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69E019766B
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2020 10:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgC3I2X (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 Mar 2020 04:28:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33074 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729594AbgC3I2V (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 30 Mar 2020 04:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585556900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=urh/QqSLIbmDRa1+bqKhLnHsVy5DBePTPVKLtVq9St4=;
        b=EsRfzs1UbRRzzHvzCDBR89TFxK7WB3SI4kr0K9y0skyFMYSEis/3ocFbANRwy/GK87HzHt
        8WWbyFPLLAsn/pb2x2F4+xUS24i4wAgBSqXgRo7D5DrtSjIzqTV1dApOdX2BEtOxBHvhF2
        2tbDkBPQphbulHDcfX3UJrQnfFd2sPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-SBmE0C2qM4iblPlKXUQf2w-1; Mon, 30 Mar 2020 04:28:18 -0400
X-MC-Unique: SBmE0C2qM4iblPlKXUQf2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A90F18CA243;
        Mon, 30 Mar 2020 08:28:14 +0000 (UTC)
Received: from localhost (ovpn-12-53.pek2.redhat.com [10.72.12.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4451B100EBAF;
        Mon, 30 Mar 2020 08:28:13 +0000 (UTC)
Date:   Mon, 30 Mar 2020 16:28:09 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Hoan Tran <Hoan@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20200330082809.GB6352@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330081659.GA6352@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330081659.GA6352@MiWiFi-R3L-srv>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 03/30/20 at 04:16pm, Baoquan He wrote:
> On 03/30/20 at 09:42am, Michal Hocko wrote:
> > On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> > > In NUMA layout which nodes have memory ranges that span across other nodes,
> > > the mm driver can detect the memory node id incorrectly.
> > > 
> > > For example, with layout below
> > > Node 0 address: 0000 xxxx 0000 xxxx
> > > Node 1 address: xxxx 1111 xxxx 1111
> > > 
> > > Note:
> > >  - Memory from low to high
> > >  - 0/1: Node id
> > >  - x: Invalid memory of a node
> > > 
> > > When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> > > config, mm only checks the memory validity but not the node id.
> > > Because of that, Node 1 also detects the memory from node 0 as below
> > > when it scans from the start address to the end address of node 1.
> > > 
> > > Node 0 address: 0000 xxxx xxxx xxxx
> > > Node 1 address: xxxx 1111 1111 1111
> > > 
> > > This layout could occur on any architecture. Most of them enables
> > > this config by default with CONFIG_NUMA. This patch, by default, enables
> > > CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> > 
> > I am not opposed to this at all. It reduces the config space and that is
> > a good thing on its own. The history has shown that meory layout might
> > be really wild wrt NUMA. The config is only used for early_pfn_in_nid
> > which is clearly an overkill.
> > 
> > Your description doesn't really explain why this is safe though. The
> > history of this config is somehow messy, though. Mike has tried
> > to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
> > NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
> > ("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
> > reasoning what so ever. This doesn't make it really easy see whether
> > reasons for reintroduction are still there. Maybe there are some subtle
> > dependencies. I do not see any TBH but that might be burried deep in an
> > arch specific code.
> 
> Yeah, since early_pfnnid_cache was added, we do not need worry about the
> performance. But when I read the mem init code on x86 again, I do see there
> are codes to handle the node overlapping, e.g in numa_cleanup_meminfo(),
> when store node id into memblock. But the thing is if we have
> encountered the node overlapping, we just return ahead of time, leave
> something uninitialized. I am wondering if the system with node
> overlapping can still run heathily.

Ok, I didn't read code carefully. That is handling case where memblock
with different node id overlap, it needs return. In the example
Hoan gave, it has no problem, system can run well. Please ignore above
comment.

