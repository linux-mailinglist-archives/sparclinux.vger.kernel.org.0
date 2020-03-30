Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EE4197980
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2020 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbgC3KoI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 Mar 2020 06:44:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:55761 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729069AbgC3KoI (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 30 Mar 2020 06:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585565046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ubZwCgodS3U5y1iwpfdeziXkCswHWi54UlMSk9s9wOI=;
        b=Fvq9oDUl9JS8l+gPV6z3jP9lBqsc1KN3knHBwlDqXR7NA/TGnm06e22kt+k5R+z/nTW1mi
        0c2sTWCTNL8r2UUd7cfVrT6sUkF127yr2HUdlMs76+LRx064k4Jm+mqeCKN451hhp9OvfU
        trawdxkXrd0k2fWpbJpEHiefcUsUM40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-RWReSoGTPOenn7_wlRjk4w-1; Mon, 30 Mar 2020 06:44:04 -0400
X-MC-Unique: RWReSoGTPOenn7_wlRjk4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE63913F7;
        Mon, 30 Mar 2020 10:44:00 +0000 (UTC)
Received: from localhost (ovpn-12-192.pek2.redhat.com [10.72.12.192])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 20B5E19757;
        Mon, 30 Mar 2020 10:43:59 +0000 (UTC)
Date:   Mon, 30 Mar 2020 18:43:56 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Hoan Tran <Hoan@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
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
Message-ID: <20200330104356.GD6352@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330092127.GB30942@linux.ibm.com>
 <20200330095843.GF14243@dhcp22.suse.cz>
 <20200330102619.GC30942@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330102619.GC30942@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 03/30/20 at 01:26pm, Mike Rapoport wrote:
> On Mon, Mar 30, 2020 at 11:58:43AM +0200, Michal Hocko wrote:
> > On Mon 30-03-20 12:21:27, Mike Rapoport wrote:
> > > On Mon, Mar 30, 2020 at 09:42:46AM +0200, Michal Hocko wrote:
> > > > On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> > > > > In NUMA layout which nodes have memory ranges that span across other nodes,
> > > > > the mm driver can detect the memory node id incorrectly.
> > > > > 
> > > > > For example, with layout below
> > > > > Node 0 address: 0000 xxxx 0000 xxxx
> > > > > Node 1 address: xxxx 1111 xxxx 1111
> > > > > 
> > > > > Note:
> > > > >  - Memory from low to high
> > > > >  - 0/1: Node id
> > > > >  - x: Invalid memory of a node
> > > > > 
> > > > > When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> > > > > config, mm only checks the memory validity but not the node id.
> > > > > Because of that, Node 1 also detects the memory from node 0 as below
> > > > > when it scans from the start address to the end address of node 1.
> > > > > 
> > > > > Node 0 address: 0000 xxxx xxxx xxxx
> > > > > Node 1 address: xxxx 1111 1111 1111
> > > > > 
> > > > > This layout could occur on any architecture. Most of them enables
> > > > > this config by default with CONFIG_NUMA. This patch, by default, enables
> > > > > CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> > > > 
> > > > I am not opposed to this at all. It reduces the config space and that is
> > > > a good thing on its own. The history has shown that meory layout might
> > > > be really wild wrt NUMA. The config is only used for early_pfn_in_nid
> > > > which is clearly an overkill.
> > > > 
> > > > Your description doesn't really explain why this is safe though. The
> > > > history of this config is somehow messy, though. Mike has tried
> > > > to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
> > > > NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
> > > > ("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
> > > > reasoning what so ever. This doesn't make it really easy see whether
> > > > reasons for reintroduction are still there. Maybe there are some subtle
> > > > dependencies. I do not see any TBH but that might be burried deep in an
> > > > arch specific code.
> > > 
> > > Well, back then early_pfn_in_nid() was arch-dependant, today everyone
> > > except ia64 rely on HAVE_MEMBLOCK_NODE_MAP.
> > 
> > What would it take to make ia64 use HAVE_MEMBLOCK_NODE_MAP? I would
> > really love to see that thing go away. It is causing problems when
> > people try to use memblock api.
> 
> Sorry, my bad, ia64 does not have NODES_SPAN_OTHER_NODES, but it does have
> HAVE_MEMBLOCK_NODE_MAP.
> 
> I remember I've tried killing HAVE_MEMBLOCK_NODE_MAP, but I've run into
> some problems and then I've got distracted. I too would like to have
> HAVE_MEMBLOCK_NODE_MAP go away, maybe I'll take another look at it.
>  
> > > So, if the memblock node map
> > > is correct, that using CONFIG_NUMA instead of CONFIG_NODES_SPAN_OTHER_NODES
> > > would only mean that early_pfn_in_nid() will cost several cycles more on
> > > architectures that didn't select CONFIG_NODES_SPAN_OTHER_NODES (i.e. arm64
> > > and sh).
> > 
> > Do we have any idea on how much of an overhead that is? Because this is
> > per each pfn so it can accumulate a lot! 
> 
> It's O(log(N)) where N is the amount of the memory banks (ie. memblock.memory.cnt)

This is for the Node id searching. But early_pfn_in_nid() is calling for
each pfn, this is the big one, I think. Otherwise, it may be optimized
as no-op.

>  
> > > Agian, ia64 is an exception here.
> > 
> > Thanks for the clarification!
> > -- 
> > Michal Hocko
> > SUSE Labs
> 
> -- 
> Sincerely yours,
> Mike.
> 
> 

