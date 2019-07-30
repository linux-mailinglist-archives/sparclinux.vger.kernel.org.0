Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA7D7A2F0
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jul 2019 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfG3IOU (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 30 Jul 2019 04:14:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:36754 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726535AbfG3IOU (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 30 Jul 2019 04:14:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 59F32ABE9;
        Tue, 30 Jul 2019 08:14:18 +0000 (UTC)
Date:   Tue, 30 Jul 2019 10:14:15 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Hoan Tran OS <hoan@os.amperecomputing.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        Paul Mackerras <paulus@samba.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "x86@kernel.org" <x86@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Open Source Submission <patches@amperecomputing.com>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will.deacon@arm.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "David S . Miller" <davem@davemloft.net>,
        "willy@infradead.org" <willy@infradead.org>
Subject: Re: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20190730081415.GN9330@dhcp22.suse.cz>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
 <20190712070247.GM29483@dhcp22.suse.cz>
 <586ae736-a429-cf94-1520-1a94ffadad88@os.amperecomputing.com>
 <20190712121223.GR29483@dhcp22.suse.cz>
 <20190712143730.au3662g4ua2tjudu@willie-the-truck>
 <20190712150007.GU29483@dhcp22.suse.cz>
 <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

[Sorry for a late reply]

On Mon 15-07-19 17:55:07, Hoan Tran OS wrote:
> Hi,
> 
> On 7/12/19 10:00 PM, Michal Hocko wrote:
[...]
> > Hmm, I thought this was selectable. But I am obviously wrong here.
> > Looking more closely, it seems that this is indeed only about
> > __early_pfn_to_nid and as such not something that should add a config
> > symbol. This should have been called out in the changelog though.
> 
> Yes, do you have any other comments about my patch?

Not really. Just make sure to explicitly state that
CONFIG_NODES_SPAN_OTHER_NODES is only about __early_pfn_to_nid and that
doesn't really deserve it's own config and can be pulled under NUMA.

> > Also while at it, does HAVE_MEMBLOCK_NODE_MAP fall into a similar
> > bucket? Do we have any NUMA architecture that doesn't enable it?
> > 
> 
> As I checked with arch Kconfig files, there are 2 architectures, riscv 
> and microblaze, do not support NUMA but enable this config.
> 
> And 1 architecture, alpha, supports NUMA but does not enable this config.

Care to have a look and clean this up please?

-- 
Michal Hocko
SUSE Labs
