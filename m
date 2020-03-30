Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D453F197629
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2020 10:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgC3IFK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 Mar 2020 04:05:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:23571 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729560AbgC3IFJ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 30 Mar 2020 04:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585555509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nVwRo6XO9WRKmSULb4OWrX5slFKDiMD/LCNJjQ0boIs=;
        b=IIzrUg8jPgrmEVQPxsZ35B7nHXAckKB4sQbtembRyfrd9dS+PE4dbkMsnv8lzdGV/uAXgF
        hBnc/TLm1PKNWueF9CWHY+BisQlmhKhDBbH1nYsyV1t2P1SBP+PF4N6Vq3Mg2y21nb6mgP
        mK1NpybUWmUdLBJJ0505XPT8Ofvp/rU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-l4TLxabQO2KtEB9hP7eswA-1; Mon, 30 Mar 2020 04:05:04 -0400
X-MC-Unique: l4TLxabQO2KtEB9hP7eswA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F135A801E5C;
        Mon, 30 Mar 2020 08:05:00 +0000 (UTC)
Received: from localhost (ovpn-12-53.pek2.redhat.com [10.72.12.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E25953DB;
        Mon, 30 Mar 2020 08:04:59 +0000 (UTC)
Date:   Mon, 30 Mar 2020 16:04:56 +0800
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
Message-ID: <20200330080456.GJ9942@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200329001924.GS3039@MiWiFi-R3L-srv>
 <20200330074426.GB14243@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330074426.GB14243@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 03/30/20 at 09:44am, Michal Hocko wrote:
> On Sun 29-03-20 08:19:24, Baoquan He wrote:
> > On 03/28/20 at 11:31am, Hoan Tran wrote:
> > > In NUMA layout which nodes have memory ranges that span across other nodes,
> > > the mm driver can detect the memory node id incorrectly.
> > > 
> > > For example, with layout below
> > > Node 0 address: 0000 xxxx 0000 xxxx
> > > Node 1 address: xxxx 1111 xxxx 1111
> > 
> > Sorry, I read this example several times, but still don't get what it
> > means. Can it be given with real hex number address as an exmaple? I
> > mean just using the memory layout you have seen from some systems. The
> > change looks interesting though.
> 
> Does this make it more clear?
>            physical address range and its node associaion
>          [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]

I later read it again, have got what Hoan is trying to say, thanks.

I think the change in this patchset makes sense, still have some concern
though, let me add comment in other thread.

