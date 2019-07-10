Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0CB640DE
	for <lists+sparclinux@lfdr.de>; Wed, 10 Jul 2019 07:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfGJF7M (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 Jul 2019 01:59:12 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:46746 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfGJF7M (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 Jul 2019 01:59:12 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hl5cV-0004bB-Pv; Wed, 10 Jul 2019 07:58:23 +0200
Date:   Wed, 10 Jul 2019 07:58:21 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Hoan Tran OS <hoan@os.amperecomputing.com>
cc:     Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
In-Reply-To: <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
Message-ID: <alpine.DEB.2.21.1907100755010.1758@nanos.tec.linutronix.de>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com> <1561501810-25163-4-git-send-email-Hoan@os.amperecomputing.com> <alpine.DEB.2.21.1906260032250.32342@nanos.tec.linutronix.de>
 <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hoan,

On Wed, 10 Jul 2019, Hoan Tran OS wrote:
> On 6/25/19 3:45 PM, Thomas Gleixner wrote:
> > On Tue, 25 Jun 2019, Hoan Tran OS wrote:
> >> @@ -1567,15 +1567,6 @@ config X86_64_ACPI_NUMA
> >>   	---help---
> >>   	  Enable ACPI SRAT based node topology detection.
> >>   
> >> -# Some NUMA nodes have memory ranges that span
> >> -# other nodes.  Even though a pfn is valid and
> >> -# between a node's start and end pfns, it may not
> >> -# reside on that node.  See memmap_init_zone()
> >> -# for details.
> >> -config NODES_SPAN_OTHER_NODES
> >> -	def_bool y
> >> -	depends on X86_64_ACPI_NUMA
> > 
> > the changelog does not mention that this lifts the dependency on
> > X86_64_ACPI_NUMA and therefore enables that functionality for anything
> > which has NUMA enabled including 32bit.
> > 
> 
> I think this config is used for a NUMA layout which NUMA nodes addresses 
> are spanned to other nodes. I think 32bit NUMA also have the same issue 
> with that layout. Please correct me if I'm wrong.

I'm not saying you're wrong, but it's your duty to provide the analysis why
this is correct for everything which has NUMA enabled.

> > The core mm change gives no helpful information either. You just copied the
> > above comment text from some random Kconfig.
> 
> Yes, as it's a correct comment and is used at multiple places.

Well it maybe correct in terms of explaining what this is about, it still
does not explain why this is needed by default on everything which has NUMA
enabled.

Thanks,

	tglx
