Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529EB1A42A1
	for <lists+sparclinux@lfdr.de>; Fri, 10 Apr 2020 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgDJGqo (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 10 Apr 2020 02:46:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43869 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725858AbgDJGqo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 10 Apr 2020 02:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586501201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0zUfVt7mgJNJCuwkZj/ZTQSIXiHqwpNQ3G1o5Vhakx4=;
        b=KXeuZ0Y3Q4Fd1oRBxZdrCmwCr9pXYjt0e6MhyYKis8OyQqQr8KWvmUAOrdc70aWeFHfF9M
        KLhAI9PihDHgf0aaW9zMDYUVEPA6dJ1CAMSoXtCORYwLJsc/atu6GrOlNL8OCNgtZFOOQ1
        YkBGCIYXta3WoMzYn0TjRL6M31G9pXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Z0rWAvSEOYaWut_WfuFMDw-1; Fri, 10 Apr 2020 02:46:36 -0400
X-MC-Unique: Z0rWAvSEOYaWut_WfuFMDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 854D6107ACC4;
        Fri, 10 Apr 2020 06:46:31 +0000 (UTC)
Received: from localhost (ovpn-13-236.pek2.redhat.com [10.72.13.236])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 21183272A6;
        Fri, 10 Apr 2020 06:46:29 +0000 (UTC)
Date:   Fri, 10 Apr 2020 14:46:26 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
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
Subject: Re: [PATCH RFC] mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP (was: Re:
 [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA)
Message-ID: <20200410064626.GF2129@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330092127.GB30942@linux.ibm.com>
 <20200330095843.GF14243@dhcp22.suse.cz>
 <20200331215618.GG30942@linux.ibm.com>
 <20200401054227.GC2129@MiWiFi-R3L-srv>
 <20200401075155.GH30942@linux.ibm.com>
 <20200402080144.GK22681@dhcp22.suse.cz>
 <20200409144119.GE2129@MiWiFi-R3L-srv>
 <20200409153321.GQ18386@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409153321.GQ18386@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 04/09/20 at 05:33pm, Michal Hocko wrote:
> On Thu 09-04-20 22:41:19, Baoquan He wrote:
> > On 04/02/20 at 10:01am, Michal Hocko wrote:
> > > On Wed 01-04-20 10:51:55, Mike Rapoport wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Apr 01, 2020 at 01:42:27PM +0800, Baoquan He wrote:
> > > [...]
> > > > > From above information, we can remove HAVE_MEMBLOCK_NODE_MAP, and
> > > > > replace it with CONFIG_NUMA. That sounds more sensible to store nid into
> > > > > memblock when NUMA support is enabled.
> > > >  
> > > > Replacing CONFIG_HAVE_MEMBLOCK_NODE_MAP with CONFIG_NUMA will work, but
> > > > this will not help cleaning up the whole node/zone initialization mess and
> > > > we'll be stuck with two implementations.
> > > 
> > > Yeah, this is far from optimal.
> > > 
> > > > The overhead of enabling HAVE_MEMBLOCK_NODE_MAP is only for init time as
> > > > most architectures will anyway discard the entire memblock, so having it in
> > > > a UMA arch won't be a problem. The only exception is arm that uses
> > > > memblock for pfn_valid(), here we may also think about a solution to
> > > > compensate the addition of nid to the memblock structures. 
> > > 
> > > Well, we can make memblock_region->nid defined only for CONFIG_NUMA.
> > > memblock_get_region_node would then unconditionally return 0 on UMA.
> > > Essentially the same way we do NUMA for other MM code. I only see few
> > > direct usage of region->nid.
> > 
> > Checked code again, seems HAVE_MEMBLOCK_NODE_MAP is selected directly in
> > all ARCHes which support it. Means HAVE_MEMBLOCK_NODE_MAP is enabled by
> > default on those ARCHes, and has no dependency on CONFIG_NUMA at all.
> > E.g on x86, it just calls free_area_init_nodes() in generic code path,
> > while free_area_init_nodes() is defined in CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > ifdeffery scope. So I tend to agree with Mike to remove
> > HAVE_MEMBLOCK_NODE_MAP firstly on all ARCHes. We can check if it's worth
> > only defining memblock_region->nid for CONFIG_NUMA case after
> > HAVE_MEMBLOCK_NODE_MAP is removed.
> 
> This can surely go in separate patches. What I meant to say is the
> region->nid is by definition 0 on !CONFIG_NUMA.

I see, thanks.

