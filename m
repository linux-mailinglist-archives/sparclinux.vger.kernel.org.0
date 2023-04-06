Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294326D9BCD
	for <lists+sparclinux@lfdr.de>; Thu,  6 Apr 2023 17:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239694AbjDFPHq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 6 Apr 2023 11:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239672AbjDFPHg (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 6 Apr 2023 11:07:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C254DAD02;
        Thu,  6 Apr 2023 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=w0SObkY+pHUk30QF/T/49A8Ec+D+ZKrAW6VBtZQhwf4=; b=j7Fc4zxUxTtlcw5lRvD3o/FO95
        vd+g08D1sixa2R2KaSiy1LVmxgPohYklc4gHHSm1Taw7s0FRExXtIAJcK83szPro54l4LbaLUVEI0
        DuYemUHB6v+udPGcT3CyayjiJP6rcBcfxYdSnyZl3r4HZeRhKOYjCPH03Nr4Zh/3MKjTT4PLydE08
        gNp/OmtpGKGtGtscTMcA5G2I+asU9E2lhirwZkJNyrP8+22twBUl6F6yeFeznVIX6v57KKJdlNf91
        3m9t5jwv6kmKwFYiwD1TYX4EXCIIw0+dwy9Z6NHfS9Su7GySsref4CZXHV3d3rT1j5ccaqf/WLFTF
        YxR1HpFA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pkRC4-00HWBW-No; Thu, 06 Apr 2023 15:06:32 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 805333000DC;
        Thu,  6 Apr 2023 17:06:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 661CC212E36AE; Thu,  6 Apr 2023 17:06:31 +0200 (CEST)
Date:   Thu, 6 Apr 2023 17:06:31 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Yair Podemsky <ypodemsk@redhat.com>, linux@armlinux.org.uk,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, will@kernel.org, aneesh.kumar@linux.ibm.com,
        akpm@linux-foundation.org, arnd@arndb.de, keescook@chromium.org,
        paulmck@kernel.org, jpoimboe@kernel.org, samitolvanen@google.com,
        ardb@kernel.org, juerg.haefliger@canonical.com,
        rmk+kernel@armlinux.org.uk, geert+renesas@glider.be,
        tony@atomide.com, linus.walleij@linaro.org,
        sebastian.reichel@collabora.com, nick.hawkins@hpe.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, vschneid@redhat.com, dhildenb@redhat.com,
        alougovs@redhat.com, jannh@google.com
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230406150631.GR386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
 <ZC69Wmqjdwk+I8kn@tpad>
 <20230406132928.GM386572@hirez.programming.kicks-ass.net>
 <20230406140423.GA386634@hirez.programming.kicks-ass.net>
 <1654e2d5-5a32-a253-e335-0ee42f69f5ef@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654e2d5-5a32-a253-e335-0ee42f69f5ef@redhat.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Apr 06, 2023 at 04:42:02PM +0200, David Hildenbrand wrote:
> On 06.04.23 16:04, Peter Zijlstra wrote:
> > On Thu, Apr 06, 2023 at 03:29:28PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 06, 2023 at 09:38:50AM -0300, Marcelo Tosatti wrote:
> > > 
> > > > > To actually hit this path you're doing something really dodgy.
> > > > 
> > > > Apparently khugepaged is using the same infrastructure:
> > > > 
> > > > $ grep tlb_remove_table khugepaged.c
> > > > 	tlb_remove_table_sync_one();
> > > > 	tlb_remove_table_sync_one();
> > > > 
> > > > So just enabling khugepaged will hit that path.
> > > 
> > > Urgh, WTF..
> > > 
> > > Let me go read that stuff :/
> > 
> > At the very least the one on collapse_and_free_pmd() could easily become
> > a call_rcu() based free.
> > 
> > I'm not sure I'm following what collapse_huge_page() does just yet.
> 
> It wants to replace a leaf page table by a THP (Transparent Huge Page mapped
> by a PMD). So we want to rip out a leaf page table while other code
> (GUP-fast) might still be walking it. 

Right, I got that far.

> In contrast to freeing the page table,
> we put it into a list where it can be reuse when having to PTE-map a THP
> again.

Yeah, this is the bit I couldn't find, that code is a bit of a maze.

> Now, similar to after freeing the page table, someone else could reuse that
> page table and modify it.

So ideally we'll RCU free the page instead of sticking it on that list.
