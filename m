Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18DF81977C0
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2020 11:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgC3JVs (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 Mar 2020 05:21:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40210 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727943AbgC3JVr (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 30 Mar 2020 05:21:47 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02U93bOg050296
        for <sparclinux@vger.kernel.org>; Mon, 30 Mar 2020 05:21:46 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3022qfv4ur-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <sparclinux@vger.kernel.org>; Mon, 30 Mar 2020 05:21:45 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <sparclinux@vger.kernel.org> from <rppt@linux.ibm.com>;
        Mon, 30 Mar 2020 10:21:36 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 30 Mar 2020 10:21:28 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 02U9LWUN30998770
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Mar 2020 09:21:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9F31E42041;
        Mon, 30 Mar 2020 09:21:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C9B7942042;
        Mon, 30 Mar 2020 09:21:29 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.206.230])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 30 Mar 2020 09:21:29 +0000 (GMT)
Date:   Mon, 30 Mar 2020 12:21:27 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Hoan Tran <Hoan@os.amperecomputing.com>,
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
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330074246.GA14243@dhcp22.suse.cz>
X-TM-AS-GCONF: 00
x-cbid: 20033009-0012-0000-0000-0000039AD42F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033009-0013-0000-0000-000021D7DB3F
Message-Id: <20200330092127.GB30942@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-30_01:2020-03-27,2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=606 mlxscore=0 phishscore=0 suspectscore=1
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300086
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Mar 30, 2020 at 09:42:46AM +0200, Michal Hocko wrote:
> On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> > In NUMA layout which nodes have memory ranges that span across other nodes,
> > the mm driver can detect the memory node id incorrectly.
> > 
> > For example, with layout below
> > Node 0 address: 0000 xxxx 0000 xxxx
> > Node 1 address: xxxx 1111 xxxx 1111
> > 
> > Note:
> >  - Memory from low to high
> >  - 0/1: Node id
> >  - x: Invalid memory of a node
> > 
> > When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> > config, mm only checks the memory validity but not the node id.
> > Because of that, Node 1 also detects the memory from node 0 as below
> > when it scans from the start address to the end address of node 1.
> > 
> > Node 0 address: 0000 xxxx xxxx xxxx
> > Node 1 address: xxxx 1111 1111 1111
> > 
> > This layout could occur on any architecture. Most of them enables
> > this config by default with CONFIG_NUMA. This patch, by default, enables
> > CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> 
> I am not opposed to this at all. It reduces the config space and that is
> a good thing on its own. The history has shown that meory layout might
> be really wild wrt NUMA. The config is only used for early_pfn_in_nid
> which is clearly an overkill.
> 
> Your description doesn't really explain why this is safe though. The
> history of this config is somehow messy, though. Mike has tried
> to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
> NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
> ("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
> reasoning what so ever. This doesn't make it really easy see whether
> reasons for reintroduction are still there. Maybe there are some subtle
> dependencies. I do not see any TBH but that might be burried deep in an
> arch specific code.

Well, back then early_pfn_in_nid() was arch-dependant, today everyone
except ia64 rely on HAVE_MEMBLOCK_NODE_MAP. So, if the memblock node map
is correct, that using CONFIG_NUMA instead of CONFIG_NODES_SPAN_OTHER_NODES
would only mean that early_pfn_in_nid() will cost several cycles more on
architectures that didn't select CONFIG_NODES_SPAN_OTHER_NODES (i.e. arm64
and sh).
Agian, ia64 is an exception here.


> > v3:
> >  * Revise the patch description
> > 
> > V2:
> >  * Revise the patch description
> > 
> > Hoan Tran (5):
> >   mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
> >   powerpc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> >   x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> >   sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> >   s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> > 
> >  arch/powerpc/Kconfig | 9 ---------
> >  arch/s390/Kconfig    | 8 --------
> >  arch/sparc/Kconfig   | 9 ---------
> >  arch/x86/Kconfig     | 9 ---------
> >  mm/page_alloc.c      | 2 +-
> >  5 files changed, 1 insertion(+), 36 deletions(-)
> > 
> > -- 
> > 1.8.3.1
> > 
> 
> -- 
> Michal Hocko
> SUSE Labs

-- 
Sincerely yours,
Mike.

