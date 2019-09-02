Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53600A5C98
	for <lists+sparclinux@lfdr.de>; Mon,  2 Sep 2019 21:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfIBTOZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 2 Sep 2019 15:14:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59776 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfIBTOZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 2 Sep 2019 15:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jLmXpLU6F1RGPbvNG04Pwx+M4aB058HdSSdmCuhuLak=; b=MxjTgV8bZ/vnbyEIo7ShiEkfd
        SP+QohNWyJGW02YHqhG1zz869tBe2uU7PuojcRw1Zs5ukgPS6rL9wdA0HnrNgFfOP28E/lK2p2osb
        w5xYSw+vr5c8AUvIzZNUH26vmrEPk3C5GZ9p+Zpv9iiflvzZf9pXmRnHjpNECUiNoRE3C4WP08sTP
        cl6/D2gJAdO5v9k9cHViJrzuEqxymeQtg77QbxifP30bEmMCc1zxS8wxcbyeC7UeqjoPofr3YKxDB
        urv3c9YFiwH3K+PMmqtJmkUl3EYkyojUd1Y3w+s3b2aXA6zcCXOwUAABYW9RTNUoeMHGo55EGLEbj
        DT5K99l4Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i4rmS-0007wO-BG; Mon, 02 Sep 2019 19:14:24 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1EC32301A76;
        Mon,  2 Sep 2019 21:13:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E09FA29B9FF21; Mon,  2 Sep 2019 21:14:21 +0200 (CEST)
Date:   Mon, 2 Sep 2019 21:14:21 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, dalias@libc.org,
        linux-sh@vger.kernel.org, catalin.marinas@arm.com,
        dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
        linuxarm@huawei.com, jiaxun.yang@flygoat.com,
        linux-kernel@vger.kernel.org, mwb@linux.vnet.ibm.com,
        paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
        chenhc@lemote.com, will@kernel.org, linux-s390@vger.kernel.org,
        ysato@users.sourceforge.jp, mpe@ellerman.id.au, x86@kernel.org,
        rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
        mingo@redhat.com, jeffrey.t.kirsher@intel.com,
        benh@kernel.crashing.org, jhogan@kernel.org,
        nfont@linux.vnet.ibm.com, mattst88@gmail.com, len.brown@intel.com,
        gor@linux.ibm.com, anshuman.khandual@arm.com,
        ink@jurassic.park.msu.ru, cai@lca.pw, luto@kernel.org,
        tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
        linux-arm-kernel@lists.infradead.org, rth@twiddle.net,
        axboe@kernel.dk, robin.murphy@arm.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
        linux-alpha@vger.kernel.org, bp@alien8.de,
        akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902191421.GT2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
 <20190902182252.GC35858@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902182252.GC35858@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Sep 02, 2019 at 08:22:52PM +0200, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:

> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index f0dd8e38fee3..2caf204966a0 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2120,8 +2120,16 @@ int device_add(struct device *dev)
> >  		dev->kobj.parent = kobj;
> >  
> >  	/* use parent numa_node */
> > -	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
> > -		set_dev_node(dev, dev_to_node(parent));
> > +	if (dev_to_node(dev) == NUMA_NO_NODE) {
> > +		if (parent)
> > +			set_dev_node(dev, dev_to_node(parent));
> > +#ifdef CONFIG_NUMA
> > +		else {
> > +			pr_err("device: '%s': has no assigned NUMA node\n", dev_name(dev));
> > +			set_dev_node(dev, 0);
> > +		}
> > +#endif
> 
> BTW., is firmware required to always provide a NUMA node on NUMA systems?
> 
> I.e. do we really want this warning on non-NUMA systems that don't assign 
> NUMA nodes?

Good point; we might have to exclude nr_node_ids==1 systems from
warning.

> Also, even on NUMA systems, is firmware required to provide a NUMA node - 
> i.e. is it in principle invalid to offer no NUMA binding?

I think so; a device needs to be _somewhere_, right? Typically though;
devices are on a PCI bus, and the PCI bridge itself will have a NUMA
binding and then the above parent rule will make everything just work.

But I don't see how you can be outside of the NUMA topology.
