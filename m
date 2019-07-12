Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8267E66762
	for <lists+sparclinux@lfdr.de>; Fri, 12 Jul 2019 09:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfGLHCw (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 12 Jul 2019 03:02:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:46300 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbfGLHCw (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 12 Jul 2019 03:02:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 21758AFF9;
        Fri, 12 Jul 2019 07:02:50 +0000 (UTC)
Date:   Fri, 12 Jul 2019 09:02:47 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Hoan Tran OS <hoan@os.amperecomputing.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
        "H . Peter Anvin" <hpa@zytor.com>,
        "David S . Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Open Source Submission <patches@amperecomputing.com>
Subject: Re: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20190712070247.GM29483@dhcp22.suse.cz>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu 11-07-19 23:25:44, Hoan Tran OS wrote:
> In NUMA layout which nodes have memory ranges that span across other nodes,
> the mm driver can detect the memory node id incorrectly.
> 
> For example, with layout below
> Node 0 address: 0000 xxxx 0000 xxxx
> Node 1 address: xxxx 1111 xxxx 1111
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
> This layout could occur on any architecture. This patch enables
> CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA to fix this issue.

Yes it can occur on any arch but most sane platforms simply do not
overlap physical ranges. So I do not really see any reason to
unconditionally enable the config for everybody. What is an advantage?

-- 
Michal Hocko
SUSE Labs
