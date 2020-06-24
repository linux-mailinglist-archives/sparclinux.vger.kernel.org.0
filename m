Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7ADF207225
	for <lists+sparclinux@lfdr.de>; Wed, 24 Jun 2020 13:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390658AbgFXLc6 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Jun 2020 07:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388925AbgFXLc4 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 24 Jun 2020 07:32:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74063C061795
        for <sparclinux@vger.kernel.org>; Wed, 24 Jun 2020 04:32:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so1932068wrm.4
        for <sparclinux@vger.kernel.org>; Wed, 24 Jun 2020 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qt1v5KPwVtg9+e9cwfIoG4ufrY0z/DdC6WEwpkwGwRY=;
        b=PO3rDTooWldPb7m9fXQ004Kj2l49mgaYAD82B/2PTCqvIPWKGgDAUSUc3TjPSkrSk6
         2HKmM9LxLqSy6eW6xalqb2WlfcofRUI7SkopBqxyeqPN5KFaP/b3GMnyB6Mvl968Yzo9
         M6nRd5g3iEaEMoCYpIUpcKUf54np6GeEwbpcRcPqp1p4xYHMISr0PCEsTZ5KqnufDx/9
         jqFAUMlfFQpiUe6kCE/qTNKZH0uM2JYP8ND3bwXWXqt0cU/n310GFc9WoYrnCWJymjua
         Ks86Qk2/C7smXDLuM9imntU/DrzpJjIf3MInM4A9HjB6SUX8GipQuezL36J4Y/YzfM79
         0LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qt1v5KPwVtg9+e9cwfIoG4ufrY0z/DdC6WEwpkwGwRY=;
        b=aVQbP3Gw+Z/Vn7XIYOqsZ+iVOSHWpxW6taeUG+68+NOvpl0y8MEcrUEGqPHtGDf6ny
         JBVIDcxEqkumRtDX7ghtFepcuWYYoQLiXnUaJBnnx/nw1GApLnHQnC6zgKKPhZCBZ3zI
         DieEcw1Y1Ve1zPyjjPC7hkqs2u9jIWJgzTq2nlIvm7pZ3nAoIRDeCHRWnGzITSmP+Wtv
         s2M4jhJm79Ml33g4elymhBr3O9Bj0yElptWwdQesBkzZDBS+O+VxT0rZPK+K6ACF1H3X
         iFfwPjSw2v0Zy7uNuNqRF3hEiNqVTAYu/OiahcVAT+ecCfK28veQI4BCTAVDfOFcu5SB
         zOPg==
X-Gm-Message-State: AOAM530QKai98YZJ2+cw+Yr2su2IWnCbVSSs+ktDELjytILU5n/tKtR9
        uTebrpLnj20/WQb9QsojoImcAQ==
X-Google-Smtp-Source: ABdhPJy/9BBSYnNE09ZOA9yfYLU2h8l9wONKCCYCzYanyMgrjnHC3enrn/8qL92u09xqSIsKnx4IKA==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr9380625wrg.205.1592998373687;
        Wed, 24 Jun 2020 04:32:53 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id u84sm4305920wme.42.2020.06.24.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 04:32:52 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:32:46 +0200
From:   Marco Elver <elver@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Ahmed S. Darwish" <a.darwish@linutronix.de>, mingo@kernel.org,
        will@kernel.org, tglx@linutronix.de, x86@kernel.org,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        bigeasy@linutronix.de, davem@davemloft.net,
        sparclinux@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, heiko.carstens@de.ibm.com,
        linux-s390@vger.kernel.org, linux@armlinux.org.uk,
        paulmck@kernel.org
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200624113246.GA170324@elver.google.com>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200623202404.GE2483@worktop.programming.kicks-ass.net>
User-Agent: Mutt/1.13.2 (2019-12-18)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 23, 2020 at 10:24PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 08:12:32PM +0200, Peter Zijlstra wrote:
> > Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> > anything happens.
>=20
> OK, so the below patch doesn't seem to have any nasty recursion issues
> here. The only 'problem' is that lockdep now sees report_lock can cause
> deadlocks.

Thanks, using non-raw now makes sense.

> It is completely right about it too, but I don't suspect there's much we
> can do about it, it's pretty much the standard printk() with scheduler
> locks held report.

Right, I think we just have to tolerate the potential risk of deadlock
until there is a way to make all the code that prints in print_report()
scheduler-safe (that includes stack_trace_print()).

Based on your suggested change to core.c, how about the below patch?
Anything we've missed? If you think it's reasonable, please carry it
with the IRQ state tracking changes.

As far as I can tell there are no more warnings together with the other
patch you sent to add '& LOCKDEP_RECURSION_MASK'.

Thanks,
-- Marco

------ >8 ------

=46rom: Marco Elver <elver@google.com>
Date: Wed, 24 Jun 2020 11:23:22 +0200
Subject: [PATCH] kcsan: Make KCSAN compatible with new IRQ state tracking

The new IRQ state tracking code does not honor lockdep_off(), and as
such we should again permit tracing by using non-raw functions in
core.c. Update the lockdep_off() comment in report.c, to reflect the
fact there is still a potential risk of deadlock due to using printk()
=66rom scheduler code.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/core.c   | 5 ++---
 kernel/kcsan/report.c | 9 +++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 15f67949d11e..732623c30359 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -397,8 +397,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t=
 size, int type)
 	}
=20
 	if (!kcsan_interrupt_watcher)
-		/* Use raw to avoid lockdep recursion via IRQ flags tracing. */
-		raw_local_irq_save(irq_flags);
+		local_irq_save(irq_flags);
=20
 	watchpoint =3D insert_watchpoint((unsigned long)ptr, size, is_write);
 	if (watchpoint =3D=3D NULL) {
@@ -539,7 +538,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t=
 size, int type)
 	kcsan_counter_dec(KCSAN_COUNTER_USED_WATCHPOINTS);
 out_unlock:
 	if (!kcsan_interrupt_watcher)
-		raw_local_irq_restore(irq_flags);
+		local_irq_restore(irq_flags);
 out:
 	user_access_restore(ua_flags);
 }
diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index ac5f8345bae9..6b2fb1a6d8cd 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -606,10 +606,11 @@ void kcsan_report(const volatile void *ptr, size_t si=
ze, int access_type,
 		goto out;
=20
 	/*
-	 * With TRACE_IRQFLAGS, lockdep's IRQ trace state becomes corrupted if
-	 * we do not turn off lockdep here; this could happen due to recursion
-	 * into lockdep via KCSAN if we detect a race in utilities used by
-	 * lockdep.
+	 * Because we may generate reports when we're in scheduler code, the use
+	 * of printk() could deadlock. Until such time that all printing code
+	 * called in print_report() is scheduler-safe, accept the risk, and just
+	 * get our message out. As such, also disable lockdep to hide the
+	 * warning, and avoid disabling lockdep for the rest of the kernel.
 	 */
 	lockdep_off();
=20
--=20
2.27.0.111.gc72c7da667-goog
=20
