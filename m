Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6951A37FC
	for <lists+sparclinux@lfdr.de>; Thu,  9 Apr 2020 18:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgDIQ2B (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 9 Apr 2020 12:28:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4920 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726883AbgDIQ17 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 9 Apr 2020 12:27:59 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 039G3N21089897
        for <sparclinux@vger.kernel.org>; Thu, 9 Apr 2020 12:27:59 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 309206nrtr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <sparclinux@vger.kernel.org>; Thu, 09 Apr 2020 12:27:59 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <sparclinux@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 9 Apr 2020 17:27:35 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 9 Apr 2020 17:27:28 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 039GRklf52756716
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Apr 2020 16:27:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5C3511C04C;
        Thu,  9 Apr 2020 16:27:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AE74D11C050;
        Thu,  9 Apr 2020 16:27:43 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.201.53])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  9 Apr 2020 16:27:43 +0000 (GMT)
Date:   Thu, 9 Apr 2020 19:27:41 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>,
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
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330175100.GD30942@linux.ibm.com>
 <20200330182301.GM14243@dhcp22.suse.cz>
 <20200331081423.GE30942@linux.ibm.com>
 <20200331085513.GE30449@dhcp22.suse.cz>
 <20200331140332.GA2129@MiWiFi-R3L-srv>
 <20200331142138.GL30449@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331142138.GL30449@dhcp22.suse.cz>
X-TM-AS-GCONF: 00
x-cbid: 20040916-0008-0000-0000-0000036DAB16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040916-0009-0000-0000-00004A8F4DFB
Message-Id: <20200409162741.GA9387@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-09_05:2020-04-07,2020-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090119
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Mar 31, 2020 at 04:21:38PM +0200, Michal Hocko wrote:
> On Tue 31-03-20 22:03:32, Baoquan He wrote:
> > Hi Michal,
> > 
> > On 03/31/20 at 10:55am, Michal Hocko wrote:
> > > On Tue 31-03-20 11:14:23, Mike Rapoport wrote:
> > > > Maybe I mis-read the code, but I don't see how this could happen. In the
> > > > HAVE_MEMBLOCK_NODE_MAP=y case, free_area_init_node() calls
> > > > calculate_node_totalpages() that ensures that node->node_zones are entirely
> > > > within the node because this is checked in zone_spanned_pages_in_node().
> > > 
> > > zone_spanned_pages_in_node does chech the zone boundaries are within the
> > > node boundaries. But that doesn't really tell anything about other
> > > potential zones interleaving with the physical memory range.
> > > zone->spanned_pages simply gives the physical range for the zone
> > > including holes. Interleaving nodes are essentially a hole
> > > (__absent_pages_in_range is going to skip those).
> > > 
> > > That means that when free_area_init_core simply goes over the whole
> > > physical zone range including holes and that is why we need to check
> > > both for physical and logical holes (aka other nodes).
> > > 
> > > The life would be so much easier if the whole thing would simply iterate
> > > over memblocks...
> > 
> > The memblock iterating sounds a great idea. I tried with putting the
> > memblock iterating in the upper layer, memmap_init(), which is used for
> > boot mem only anyway. Do you think it's doable and OK? It yes, I can
> > work out a formal patch to make this simpler as you said. The draft code
> > is as below. Like this it uses the existing code and involves little change.
> 
> Doing this would be a step in the right direction! I haven't checked the
> code very closely though. The below sounds way too simple to be truth I
> am afraid. First for_each_mem_pfn_range is available only for
> CONFIG_HAVE_MEMBLOCK_NODE_MAP (which is one of the reasons why I keep
> saying that I really hate that being conditional). Also I haven't really
> checked the deferred initialization path - I have a very vague
> recollection that it has been converted to the memblock api but I have
> happilly dropped all that memory.

The Baoquan's patch almost did it, at least for simple case of qemu with 2
nodes. It's only missing the adjustment to the size passed to
memmap_init_zone() as it may change because of clamping.

I've drafted something that removes HAVE_MEMBLOCK_NODE_MAP and added this
patch there [1]. For several memory configurations I could emulate with
qemu it worked.
I'm going to wait a bit to see of kbuild is happy and then I'll send the
patches.

Baoquan, I took liberty to add your SoB, hope you don't mind.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=memblock/all-have-node-map 
  
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 138a56c0f48f..558d421f294b 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -6007,14 +6007,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
> >  		 * function.  They do not exist on hotplugged memory.
> >  		 */
> >  		if (context == MEMMAP_EARLY) {
> > -			if (!early_pfn_valid(pfn)) {
> > -				pfn = next_pfn(pfn);
> > -				continue;
> > -			}
> > -			if (!early_pfn_in_nid(pfn, nid)) {
> > -				pfn++;
> > -				continue;
> > -			}
> >  			if (overlap_memmap_init(zone, &pfn))
> >  				continue;
> >  			if (defer_init(nid, pfn, end_pfn))
> > @@ -6130,9 +6122,17 @@ static void __meminit zone_init_free_lists(struct zone *zone)
> >  }
> >  
> >  void __meminit __weak memmap_init(unsigned long size, int nid,
> > -				  unsigned long zone, unsigned long start_pfn)
> > +				  unsigned long zone, unsigned long range_start_pfn)
> >  {
> > -	memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
> > +	unsigned long start_pfn, end_pfn;
> > +	unsigned long range_end_pfn = range_start_pfn + size;
> > +	int i;
> > +	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
> > +		start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
> > +		end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
> > +		if (end_pfn > start_pfn)
> > +			memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
> > +	}
> >  }
> >  
> >  static int zone_batchsize(struct zone *zone)
> 
> -- 
> Michal Hocko
> SUSE Labs

-- 
Sincerely yours,
Mike.

