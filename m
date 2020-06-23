Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30024205A0C
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jun 2020 20:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733069AbgFWSAG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 23 Jun 2020 14:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbgFWSAF (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 23 Jun 2020 14:00:05 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6FFC061573
        for <sparclinux@vger.kernel.org>; Tue, 23 Jun 2020 11:00:05 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t194so4188569wmt.4
        for <sparclinux@vger.kernel.org>; Tue, 23 Jun 2020 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wcyp7xJ9VH6Ce5YmoH+01qglUFlPRs0bPBHrFHPBGrU=;
        b=b0gWdjg9shIjXDAXSuaxcUf0kvXH4yOK4YqHK+9dT9MEpAkVd6umkpXAERDfyobiWl
         iXYdhTzGdCZyETgQEnsKBMRw2uD1/6EG+a2gNOJxd+k6D/sDEhaX6N+anOTYiE5UTlEW
         9guLzwsJbj9ourTGn7rQyP3RVBIwQBwAZ/LZZzmAPQobTh1G7a54oM7BKIaUVWVU7sYR
         92sTnOH08HPqyhu7XVR11xnX2duZHFm8vCQNLqhX6EcurG9VD3S0w6GR/Cq7XgDKoDq9
         1VJ29HZZZHA+0Um8K2+yTGYbKt5FDsWkltk1RndhkdGr1x6j4EAOX4DINZmI1bfl6Cvx
         oAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wcyp7xJ9VH6Ce5YmoH+01qglUFlPRs0bPBHrFHPBGrU=;
        b=ekkc/YIYFcGHHhF0227hYe0V8mcQ7bBBf5f+aluMzKhbmS/G67fQ2mCxDggyv3oISj
         8pWpIC8hn0jPGl4axpU52W2zw1g2COEo/q/XNDpZYFu5rmQWVcrC2RjciPis7UEcpOXD
         iuFvBEE+XsTkWTUKIVZ8SMoU+0g7SUS7RHI0facu1kDj4bKkfT6kVXZiq1E2w1fQEMaj
         y4g9Ft13ZmiaFUD9koOA5yo4oi3zJkc+L2LdpERHm9sbeRjwW00HA+fIqFJHmB6Blyxk
         YshUE1rjUw9ZUf/fkldY2Kj+WaHger6d2FK4jFgGCpxzdZzExKVVlG4H6/QBPwoRNesW
         4mtA==
X-Gm-Message-State: AOAM532Etep6Ny+jRjvXJDhMTcAEzssTU4VswGHcPT0m8ONUuenllt46
        TimHL45kEF/n3IkVyZkPMmom4g==
X-Google-Smtp-Source: ABdhPJyBS+rhzsc1deZ1Ay1FOdoRDXOTCxrPOjQRzUCugXkZeGKEC8Ks241Yw7kTMxlqgYm+GZsCyQ==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr25343911wmj.84.1592935203860;
        Tue, 23 Jun 2020 11:00:03 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id r1sm22986260wrn.29.2020.06.23.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 11:00:03 -0700 (PDT)
Date:   Tue, 23 Jun 2020 19:59:57 +0200
From:   Marco Elver <elver@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Ahmed S. Darwish" <a.darwish@linutronix.de>, mingo@kernel.org,
        will@kernel.org, tglx@linutronix.de, x86@kernel.org,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        bigeasy@linutronix.de, davem@davemloft.net,
        sparclinux@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, heiko.carstens@de.ibm.com,
        linux-s390@vger.kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623175957.GA106514@elver.google.com>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623163730.GA4800@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.13.2 (2019-12-18)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 23, 2020 at 06:37PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 06:13:21PM +0200, Ahmed S. Darwish wrote:
> > Well, freshly merged code is using it. For example, KCSAN:
> > 
> >     => f1bc96210c6a ("kcsan: Make KCSAN compatible with lockdep")
> >     => kernel/kcsan/report.c:
> > 
> >     void kcsan_report(...)
> >     {
> > 	...
> >         /*
> >          * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
> >          * we do not turn off lockdep here; this could happen due to recursion
> >          * into lockdep via KCSAN if we detect a race in utilities used by
> >          * lockdep.
> >          */
> >         lockdep_off();
> > 	...
> >     }
> 
> Marco, do you remember what exactly happened there? Because I'm about to
> wreck that. That is, I'm going to make TRACE_IRQFLAGS ignore
> lockdep_off().

Yeah, I was trying to squash any kind of recursion:

	lockdep -> other libs ->
		-> KCSAN
		-> print report
		-> dump stack, printk and friends
		-> lockdep -> other libs
			-> KCSAN ...

Some history:

* Initial patch to fix:
	https://lore.kernel.org/lkml/20200115162512.70807-1-elver@google.com/

* KCSAN+lockdep+ftrace:
	https://lore.kernel.org/lkml/20200214211035.209972-1-elver@google.com/

lockdep now has KCSAN_SANITIZE := n, but we still need to ensure that
there are no paths out of lockdep, or the IRQ flags tracing code, that
might lead through other libs, through KCSAN, libs used to generate a
report, and back to lockdep.

I never quite figured out the exact trace that led to corruption, but
avoiding any kind of potential for recursion was the only thing that
would avoid the check_flags() warnings.

Thanks,
-- Marco
