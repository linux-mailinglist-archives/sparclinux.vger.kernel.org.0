Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1455537476E
	for <lists+sparclinux@lfdr.de>; Wed,  5 May 2021 20:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhEER4q (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 May 2021 13:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbhEER4g (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 5 May 2021 13:56:36 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4AAC026CCB
        for <sparclinux@vger.kernel.org>; Wed,  5 May 2021 10:27:21 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so2394274otu.8
        for <sparclinux@vger.kernel.org>; Wed, 05 May 2021 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JIG5LLXWdpg9zojMMRRLnT8KwKVn0+Fa9SXUYjSITY=;
        b=Esk6Xw2grk6X5VGJLTGmLr63qYQtYzobA6l8CuObASYKlU6YZ8lT804xtGZpj3wpU4
         m27XzBwahAWLIExjkHzfNqQ/GX3UNMN8IKeuVFRFWNF25hnglLOtgdLGK3ioAhHogNTo
         bHbLw8Imy6L1f+oBuAvpniTx4Z9gN4Jr41ZePmWBfa2u2ConWLPuB+ji7eAQfWsaVq3B
         wvzeL2tlOWwzQzLy5P/bdemfLByFfIv8ziQ9un4QdYQRvtYgm0y0S834OjuFLh5f0/lB
         Gl/b6R7LVW4gvdMNWQ5d8QeGyTtA+YkOcQe1cfRmfhdvehI7zXCv21T8ErpmUt0EG3+t
         plHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JIG5LLXWdpg9zojMMRRLnT8KwKVn0+Fa9SXUYjSITY=;
        b=p5JpENJNl7Sv62bCDT7GuVU/cit/6nHCQ8q2lWUXawaMDo5laLxs7zVhp2Avy5GoMB
         rI7TPN8n4BDNHKrIJO6OBr4Z/uJdZDqwyYLJook4/W2jmXA59wsA5yYTrvv3v1VlUS7p
         Xozjg9eFaMjnINpZF78kMtsLYbMhtuBIn4bSA9z32NnGdlO9IG3/Z/pNemvvbVAt+HuI
         98Fdh7A2j3kNrV9AoPDJQ8pdiL5vpRAIqZU1wpGCur/jHEw+141IYnk1WQA6LY9k3b+x
         XwzbOjBnx8x7ZVC+X1Sqfb4EtUciCqpNLKfHiWkIJrK8fdW4QCjfmi5FVD4bPXXzpeyx
         7n7w==
X-Gm-Message-State: AOAM531vhlyUGD9suQ3+wzVsFoR0NJAfoC+eRQKyqE5TxR9O1bXWNOeW
        mLfKOaRcTrBvDFu8RG6WRFKgwx36ysVuztpMTcEepA==
X-Google-Smtp-Source: ABdhPJxa+srA1MRn+COtNridSRExFrfj34Zj1v6vHL47IJQ3reXFv8U1xAzQbEcZ2nfMlJKF/bzTAsL+4cJ/fmHsDp4=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr25558136otn.233.1620235640677;
 Wed, 05 May 2021 10:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <m1tuni8ano.fsf_-_@fess.ebiederm.org> <20210505141101.11519-1-ebiederm@xmission.com>
 <20210505141101.11519-10-ebiederm@xmission.com>
In-Reply-To: <20210505141101.11519-10-ebiederm@xmission.com>
From:   Marco Elver <elver@google.com>
Date:   Wed, 5 May 2021 19:26:00 +0200
Message-ID: <CANpmjNPS_mCs3_5boGrVwnUmC4szG8dudvPqjAMcrM7JSYWvLw@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] signal: Factor force_sig_perf out of perf_sigtrap
To:     "Eric W. Beiderman" <ebiederm@xmission.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Florian Weimer <fweimer@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, 5 May 2021 at 16:11, Eric W. Beiderman <ebiederm@xmission.com> wrote:
> From: "Eric W. Biederman" <ebiederm@xmission.com>
>
> Separate generating the signal from deciding it needs to be sent.
>
> v1: https://lkml.kernel.org/r/m17dkjqqxz.fsf_-_@fess.ebiederm.org
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  include/linux/sched/signal.h |  1 +
>  kernel/events/core.c         | 11 ++---------
>  kernel/signal.c              | 13 +++++++++++++
>  3 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index 7daa425f3055..1e2f61a1a512 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -318,6 +318,7 @@ int send_sig_mceerr(int code, void __user *, short, struct task_struct *);
>
>  int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper);
>  int force_sig_pkuerr(void __user *addr, u32 pkey);
> +int force_sig_perf(void __user *addr, u32 type, u64 sig_data);
>
>  int force_sig_fault_trapno(int sig, int code, void __user *addr, int trapno);
>  int send_sig_fault_trapno(int sig, int code, void __user *addr, int trapno,
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 928b166d888e..48ea8863183b 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6394,8 +6394,6 @@ void perf_event_wakeup(struct perf_event *event)
>
>  static void perf_sigtrap(struct perf_event *event)
>  {
> -       struct kernel_siginfo info;
> -
>         /*
>          * We'd expect this to only occur if the irq_work is delayed and either
>          * ctx->task or current has changed in the meantime. This can be the
> @@ -6410,13 +6408,8 @@ static void perf_sigtrap(struct perf_event *event)
>         if (current->flags & PF_EXITING)
>                 return;
>
> -       clear_siginfo(&info);
> -       info.si_signo = SIGTRAP;
> -       info.si_code = TRAP_PERF;
> -       info.si_errno = event->attr.type;
> -       info.si_perf = event->attr.sig_data;
> -       info.si_addr = (void __user *)event->pending_addr;
> -       force_sig_info(&info);
> +       force_sig_perf((void __user *)event->pending_addr,
> +                      event->attr.type, event->attr.sig_data);
>  }
>
>  static void perf_pending_event_disable(struct perf_event *event)
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 697c5fe58db8..49560ceac048 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1753,6 +1753,19 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
>  }
>  #endif
>
> +int force_sig_perf(void __user *addr, u32 type, u64 sig_data)
> +{
> +       struct kernel_siginfo info;
> +
> +       clear_siginfo(&info);
> +       info.si_signo = SIGTRAP;
> +       info.si_errno = type;
> +       info.si_code  = TRAP_PERF;
> +       info.si_addr  = addr;
> +       info.si_perf  = sig_data;
> +       return force_sig_info(&info);
> +}
> +
>  #if IS_ENABLED(CONFIG_SPARC)
>  int force_sig_fault_trapno(int sig, int code, void __user *addr, int trapno)
>  {
> --
> 2.30.1
>
