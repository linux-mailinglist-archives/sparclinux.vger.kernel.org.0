Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B051EE8F6
	for <lists+sparclinux@lfdr.de>; Thu,  4 Jun 2020 18:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729963AbgFDQ5S (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 4 Jun 2020 12:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgFDQ5S (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 4 Jun 2020 12:57:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340F4C08C5C0;
        Thu,  4 Jun 2020 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=WNuoe0aJej6Twt/hptn1Tc9VMEiTloei55h4/xsUoEc=; b=aGaT6JoG6JwGGaQaEogYAqTBJ9
        xuLUj1OC3CAgpdlWoVQvRYe3kK7pD1+Y7UiKVCazCpq104knW9A+PRMr5JSOj9xSYbfLIqp7uHpJZ
        bKeuIqvGnBXvoDTgDE6rn0ulpPv1XB0E+4Ds/kcenR5J+DohAB/M/KEV83k/F+fYlMFvbrwWJo6c8
        g7oiJEQ4cp8VH3cGFRxCl5Eit0VdyK09s4QIghJc/fNrS+UIQJZJbx/wraFeJ4Gnr/hsFzztcyLGR
        TpS9SjQZBkL77Esd/S8Swvsw4QJaziyO8Q91L1SramyEnqQGTBQu1rLGuVV5x9dHXABr4mnhUL7We
        Ut1HXWLw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jgtAx-0001Kw-1v; Thu, 04 Jun 2020 16:57:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 04D45301ABC;
        Thu,  4 Jun 2020 18:57:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B172E20E061B2; Thu,  4 Jun 2020 18:57:03 +0200 (CEST)
Date:   Thu, 4 Jun 2020 18:57:03 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     David Miller <davem@davemloft.net>
Cc:     mingo@kernel.org, will@kernel.org, tglx@linutronix.de,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        a.darwish@linutronix.de, rostedt@goodmis.org,
        bigeasy@linutronix.de, sparclinux@vger.kernel.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        heiko.carstens@de.ibm.com, linux-s390@vger.kernel.org
Subject: Re: [RFC][PATCH v3 1/5] sparc64: Fix asm/percpu.h build error
Message-ID: <20200604165703.GG3976@hirez.programming.kicks-ass.net>
References: <20200529213550.683440625@infradead.org>
 <20200529214203.673108357@infradead.org>
 <20200529.162917.1970892823680223252.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529.162917.1970892823680223252.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, May 29, 2020 at 04:29:17PM -0700, David Miller wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Fri, 29 May 2020 23:35:51 +0200
> 
> > ../arch/sparc/include/asm/percpu_64.h:7:24: warning: call-clobbered register used for global register variable
> > register unsigned long __local_per_cpu_offset asm("g5");
> 
> The "-ffixed-g5" option on the command line tells gcc that we are
> using 'g5' as a fixed register, so some part of your build isn't using
> the:
> 
> KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
> 
> from arch/sparc/Makefile for some reason.

Thanks, that was the clue I needed.

I think I see, what happens is that these headers end up in the VDSO
build, and that doesn't have these CFLAGS, because userspace.

Let me see what to do about that.
