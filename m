Return-Path: <sparclinux+bounces-1348-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9A908A6B
	for <lists+sparclinux@lfdr.de>; Fri, 14 Jun 2024 12:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16134287502
	for <lists+sparclinux@lfdr.de>; Fri, 14 Jun 2024 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AC0195800;
	Fri, 14 Jun 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULvZR+wS"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FD19539F
	for <sparclinux@vger.kernel.org>; Fri, 14 Jun 2024 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718362133; cv=none; b=bG9Vgu9GXHA7Gd6WV6vlwbwTJCSGCPIKIg4exMpXnkDbiEjnfyFZAZaVh8zOBB/3HcESVtBBJwqEDQMv+8kjYeccSmr57CPYIjnfiwgOyjW4k1An3pE+hqWQeF6DyiLVQXKjT3lNCCI/ta+OAMcFF8Vro8T2jyCBhi+mK0ZIvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718362133; c=relaxed/simple;
	bh=ZXU+0RMH0fz/pS+haFqcAKCaYVHjid2A9LxGhmMo8l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1nGDEa2vpEvlQB0RZDvkXyGgoHLADiaqKnvS5qTr99UtpJ41mQdbmVg9UhAIt3/So7AnCMshFZkdcau2dwMPnAkDE6AVcjMnrSRWY+z/aNTgLzla7GbRCbMEdixDsS0cerC5jEC8uU4reF0tfxbeG4Iy2KAph0mKpvGOjf4CzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULvZR+wS; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2ecd25e5aso1637205a91.2
        for <sparclinux@vger.kernel.org>; Fri, 14 Jun 2024 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718362129; x=1718966929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJRFKVvp1PoPGBhKf/e9VTmU0CVL3sNznYNLbRBztzw=;
        b=ULvZR+wS/hE9Ui0qxEbqShEACnlnuqbK3iolxi1ecMvyMEimcZ24gSzDDE32Z7b+5J
         +tdfjNEoxG/j2Xf5rPDInV5r4ac4S1ApyS3huSDtwpbUwe7ZRuRPhYvPXbEgEe9bCEq+
         /z24duZhwsIet0UpbZGW7vtSPieFmWgSOX3ZR0NTeRTi64lN3xJna5lRUyW3ReFGBmCf
         B1jZFUuDpaiOhKCJ12wWsKgmdxGMTbfdIHVzro/HXkoCsyPXBBuJKTGTvVVn1lz3wqhR
         b2uCeu4nKD34TiWlLyt/Zv7m1AjUrjSQW+afecZRB0TiyMqxIw6VtSN5lGjuZZ8a4gR/
         LuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718362129; x=1718966929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJRFKVvp1PoPGBhKf/e9VTmU0CVL3sNznYNLbRBztzw=;
        b=oF65tf16Sdw7lazDlgMiRZUS3ecahZILIKgmesxpBjNGjQUjQ3ZaCWtIE+x/tF+D2R
         5Y9Zl0+856t5rpedrm4NwhCs3mjCi2ARiKxZtX0jiKQ51mCGlNKD9LsT9uO2rTq7UQMH
         4clMvnEx7CrQXP5ZLymOX2UuW/Lv8G3zWyN/uVlrIIdKEYMD3PRaRIvXX7IFV8BKbrHc
         B1yM17CoDNI2bOZnRfBGZu3KsxoweNdfdYhf+QyyX2TT+RfbnYC5nbZJDrol9+ppInr6
         LySccHK+t21qQBNXReIno/o6uOTw4GmFNaHk2cBzCB/P9QgX+iSq3LFu33gZ/H+cl1du
         hg3A==
X-Forwarded-Encrypted: i=1; AJvYcCWbb1EnpZIcbZ0C68+XaS3KcKZpcDdHuhLHuf48gH2OG/YZggHtIw+X57THcoezHlVc5HkEcI616LvcNVfpoW8JeZ6M+VK5w37Fsg==
X-Gm-Message-State: AOJu0YwHaA+x9Up0IccJgwjZ0MO1g2tdMGvHWnbsafSfnj/7WJ+gTHDw
	5hNoIa3XceffBhR8q7t/iKKTabmxGW7OsRRTG7ZSYRdjLuUA/AiOvbJrD1eyOsUf4jguDsDLyfn
	5zibQD3LpnSbS7hQEgT5J+oodI2hL8g0GFTW1vg==
X-Google-Smtp-Source: AGHT+IFBNs6asuW3ITzwrzxBuJ34dIEDrFFiB0cxCgEUXerjbV3bUVsVACrV/h+c0Xuym4jmu0bWBIKinZhT1ShFBqQ=
X-Received: by 2002:a17:90a:928a:b0:2c2:e97f:89d5 with SMTP id
 98e67ed59e1d1-2c4dbd44d6amr2419553a91.42.1718362128949; Fri, 14 Jun 2024
 03:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613181613.4329-1-kprateek.nayak@amd.com> <20240614092801.GL8774@noisy.programming.kicks-ass.net>
In-Reply-To: <20240614092801.GL8774@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 14 Jun 2024 12:48:37 +0200
Message-ID: <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Andrew Donnellan <ajd@linux.ibm.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, 
	Kees Cook <keescook@chromium.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Tony Battersby <tonyb@cybernetics.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Brian Gerst <brgerst@gmail.com>, Leonardo Bras <leobras@redhat.com>, 
	Imran Khan <imran.f.khan@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Rik van Riel <riel@surriel.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	David Vernet <void@manifault.com>, Julia Lawall <julia.lawall@inria.fr>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jun 13, 2024 at 06:15:59PM +0000, K Prateek Nayak wrote:
> > Effects of call_function_single_prep_ipi()
> > ==========================================
> >
> > To pull a TIF_POLLING thread out of idle to process an IPI, the sender
> > sets the TIF_NEED_RESCHED bit in the idle task's thread info in
> > call_function_single_prep_ipi() and avoids sending an actual IPI to the
> > target. As a result, the scheduler expects a task to be enqueued when
> > exiting the idle path. This is not the case with non-polling idle states
> > where the idle CPU exits the non-polling idle state to process the
> > interrupt, and since need_resched() returns false, soon goes back to
> > idle again.
> >
> > When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
> > a large part of which runs with local IRQ disabled. In case of ipistorm,
> > when measuring IPI throughput, this large IRQ disabled section delays
> > processing of IPIs. Further auditing revealed that in absence of any
> > runnable tasks, pick_next_task_fair(), which is called from the
> > pick_next_task() fast path, will always call newidle_balance() in this
> > scenario, further increasing the time spent in the IRQ disabled section.
> >
> > Following is the crude visualization of the problem with relevant
> > functions expanded:
> > --
> > CPU0                                                  CPU1
> > ====                                                  ====
> >                                                       do_idle() {
> >                                                               __current_set_polling();
> >                                                               ...
> >                                                               monitor(addr);
> >                                                               if (!need_resched())
> >                                                                       mwait() {
> >                                                                       /* Waiting */
> > smp_call_function_single(CPU1, func, wait = 1) {                              ...
> >       ...                                                                     ...
> >       set_nr_if_polling(CPU1) {                                               ...
> >               /* Realizes CPU1 is polling */                                  ...
> >               try_cmpxchg(addr,                                               ...
> >                           &val,                                               ...
> >                           val | _TIF_NEED_RESCHED);                           ...
> >       } /* Does not send an IPI */                                            ...
> >       ...                                                             } /* mwait exit due to write at addr */
> >       csd_lock_wait() {                                       }
> >       /* Waiting */                                           preempt_set_need_resched();
> >               ...                                             __current_clr_polling();
> >               ...                                             flush_smp_call_function_queue() {
> >               ...                                                     func();
> >       } /* End of wait */                                     }
> > }                                                             schedule_idle() {
> >                                                                       ...
> >                                                                       local_irq_disable();
> > smp_call_function_single(CPU1, func, wait = 1) {                      ...
> >       ...                                                             ...
> >       arch_send_call_function_single_ipi(CPU1);                       ...
> >                                               \                       ...
> >                                                \                      newidle_balance() {
> >                                                 \                             ...
> >                                             /* Delay */                       ...
> >                                                   \                   }
> >                                                    \                  ...
> >                                                     \-------------->  local_irq_enable();
> >                                                                       /* Processes the IPI */
> > --
> >
> >
> > Skipping newidle_balance()
> > ==========================
> >
> > In an earlier attempt to solve the challenge of the long IRQ disabled
> > section, newidle_balance() was skipped when a CPU waking up from idle
> > was found to have no runnable tasks, and was transitioning back to
> > idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
> > may be viable for CPUs that are idling with tick enabled, where the
> > newidle_balance() has the opportunity to pull tasks onto the idle CPU.
>
> I don't think we should be relying on this in any way shape or form.
> NOHZ can kill that tick at any time.
>
> Also, semantically, calling newidle from the idle thread is just daft.
> You're really not newly idle in that case.
>
> > Vincent [5] pointed out a case where the idle load kick will fail to
> > run on an idle CPU since the IPI handler launching the ILB will check
> > for need_resched(). In such cases, the idle CPU relies on
> > newidle_balance() to pull tasks towards itself.
>
> Is this the need_resched() in _nohz_idle_balance() ? Should we change
> this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
> something long those lines?

It's not only this but also in do_idle() as well which exits the loop
to look for tasks to schedule

>
> I mean, it's fairly trivial to figure out if there really is going to be
> work there.
>
> > Using an alternate flag instead of NEED_RESCHED to indicate a pending
> > IPI was suggested as the correct approach to solve this problem on the
> > same thread.
>
> So adding per-arch changes for this seems like something we shouldn't
> unless there really is no other sane options.
>
> That is, I really think we should start with something like the below
> and then fix any fallout from that.

The main problem is that need_resched becomes somewhat meaningless
because it doesn't  only mean "I need to resched a task" and we have
to add more tests around even for those not using polling

>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0935f9d4bb7b..cfa45338ae97 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5799,7 +5800,7 @@ static inline struct task_struct *
>  __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>  {
>         const struct sched_class *class;
> -       struct task_struct *p;
> +       struct task_struct *p = NULL;
>
>         /*
>          * Optimization: we know that if all tasks are in the fair class we can
> @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>         if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
>                    rq->nr_running == rq->cfs.h_nr_running)) {
>
> -               p = pick_next_task_fair(rq, prev, rf);
> -               if (unlikely(p == RETRY_TASK))
> -                       goto restart;
> +               if (rq->nr_running) {

How do you make the diff between a spurious need_resched() because of
polling and a cpu becoming idle ? isn't rq->nr_running null in both
cases ?
In the later case, we need to call sched_balance_newidle() but not in the former

> +                       p = pick_next_task_fair(rq, prev, rf);
> +                       if (unlikely(p == RETRY_TASK))
> +                               goto restart;
> +               }
>
>                 /* Assume the next prioritized class is idle_sched_class */
>                 if (!p) {

