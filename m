Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3FB2062E9
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jun 2020 23:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393073AbgFWVJS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 23 Jun 2020 17:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391521AbgFWUeV (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 23 Jun 2020 16:34:21 -0400
Received: from casper.infradead.org (unknown [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBC0C061573;
        Tue, 23 Jun 2020 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=zZ9ZwwPDMMp7BvMEq8EyOsJmlN/xF7BcziW3McexKPw=; b=cgVqGLE15DsOhKQPCCWADScd6J
        RjV//ZuVBYwgm/bNvaMm3QXBYNmo02AYWxJkY/2WaxgRPk7rP2wszqc18skOWnf/MqurHSMUWZQAu
        EEV1w0DUhNxOIX+qDNchE/AvrYT7BGdjTW+DgCATQM1ZpWT2NwwUPeJ/YXNtIBaxPwhP4cLwzuvRW
        Gy+Ii7D86w2z4wmNuMjEy5DOduGQXwWdsbVQEBv5Gu7qk46hYIANV8d9AMQh14vIwefWYyvUys2xL
        bcA9M8a+qokxiBquFfj0BbnW1Gaz89VK+nq6CMmgio7rvkbT3e1GTD2P56Y/J3TfIgxGjfUVkm2ZX
        qJKo60Cg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jnpbZ-0004Bx-GE; Tue, 23 Jun 2020 20:33:18 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 1EBD3983A87; Tue, 23 Jun 2020 22:33:17 +0200 (CEST)
Date:   Tue, 23 Jun 2020 22:33:17 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Marco Elver <elver@google.com>
Cc:     "Ahmed S. Darwish" <a.darwish@linutronix.de>, mingo@kernel.org,
        will@kernel.org, tglx@linutronix.de, x86@kernel.org,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        bigeasy@linutronix.de, davem@davemloft.net,
        sparclinux@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, heiko.carstens@de.ibm.com,
        linux-s390@vger.kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623203317.GG4496@worktop.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623202404.GE2483@worktop.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 23, 2020 at 10:24:04PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 08:12:32PM +0200, Peter Zijlstra wrote:
> > Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> > anything happens.
> 
> OK, so the below patch doesn't seem to have any nasty recursion issues
> here. The only 'problem' is that lockdep now sees report_lock can cause
> deadlocks.
> 
> It is completely right about it too, but I don't suspect there's much we
> can do about it, it's pretty much the standard printk() with scheduler
> locks held report.

Just for giggles I added the below and that works fine too. Right until
the report_lock deadlock splat of course, thereafter lockdep is
disabled.

diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index ac5f8345bae9..a011cf0a1611 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -459,6 +459,8 @@ static void set_other_info_task_blocking(unsigned long *flags,
 	 */
 	int timeout = max(kcsan_udelay_task, kcsan_udelay_interrupt);

+	lockdep_assert_held(&report_lock);
+
 	other_info->task = current;
 	do {
 		if (is_running) {
@@ -495,6 +497,8 @@ static void set_other_info_task_blocking(unsigned long *flags,
 		 other_info->task == current);
 	if (is_running)
 		set_current_state(TASK_RUNNING);
+
+	lockdep_assert_held(&report_lock);
 }

 /* Populate @other_info; requires that the provided @other_info not in use. */
