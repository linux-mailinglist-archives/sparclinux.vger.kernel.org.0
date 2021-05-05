Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BFA374766
	for <lists+sparclinux@lfdr.de>; Wed,  5 May 2021 20:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbhEERzw (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 May 2021 13:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbhEERzj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 5 May 2021 13:55:39 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F19C08EAF4
        for <sparclinux@vger.kernel.org>; Wed,  5 May 2021 10:26:48 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so2392735otu.8
        for <sparclinux@vger.kernel.org>; Wed, 05 May 2021 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3poF+beBDnX4l8Ai+zuu23YCTL7KQlMKYEV0R5ettxQ=;
        b=MdEwPkQItEW4URkAw6ucDjaorsF77efvaPNLxopau4KuX8azCpyzuSPTgNQlGNmYj0
         vA3GgQHsdLxx462vK/+7jiHc1C0hSVypns6GFz6T9uuB/+m+JrCn2DtBlulMLD476GSD
         yMBAxJKEnmGoKVZGh/lAcUT2kijtIDSCMr1UKN7ycMhXU1RiSfANy4pwly64RZYvhBzL
         FwYu+qDuA4RReYv3Izo21fFZ3Q9fTQF4L3OBuTfAWJ3g5nkNWVYUOuJYLh6nl4xDvWpj
         +xViNajs5GPb1Pbga7tTDV7Ffmw3SitLLLWZr+lwZzPFwPnL/+m+GOqTyQnh2hAChvQf
         8Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3poF+beBDnX4l8Ai+zuu23YCTL7KQlMKYEV0R5ettxQ=;
        b=ryJKrywFl4vdNLks1CcraYapcg0xVACud58OQacbcEf5tgxRANVP4E/G9j8aqzrLiK
         Gw+QdcKOhWDgVNIDzpS/gvfxaqCRSNimsJJ3BWvSEWSlTFexXiN3wypJE6/l13rTu9T1
         Tj7Oerk7pREplA5C3iid+DVIYG9qwJXPXPqoLlLH6hgFAwFrSdsMjm3pqvXuXyF3kVwd
         P1knh/P33285elAyUJignu6cEUw+HhV0XkPxEnw7m6mLaSuwRE5usr+VewwcEc+pNaaH
         EIKZjVdxCnIL0GhP+69/LDi9GcmV3kivnmWr6ixnKYd+2eLreA7oN4oPvIeX0B39i6PP
         f/ow==
X-Gm-Message-State: AOAM5311RP02KgzoLm6OTSzR28rwL3/0V7olewxVel44WcAGQQpawCtv
        3/qtwjJc5a+IT+EfcX4MxOw8y4WHsf8YtMTfbUvpNA==
X-Google-Smtp-Source: ABdhPJzNyC7yQLTU11iD8KYqLPEIg5esBUGsnHPbHG30iUPGKdtRpUXrbapWyCwk2tXOgeu+LVUluVrAEwm4nQStrUI=
X-Received: by 2002:a05:6830:410e:: with SMTP id w14mr23868961ott.251.1620235607636;
 Wed, 05 May 2021 10:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <m1tuni8ano.fsf_-_@fess.ebiederm.org> <20210505141101.11519-1-ebiederm@xmission.com>
 <20210505141101.11519-7-ebiederm@xmission.com>
In-Reply-To: <20210505141101.11519-7-ebiederm@xmission.com>
From:   Marco Elver <elver@google.com>
Date:   Wed, 5 May 2021 19:25:00 +0200
Message-ID: <CANpmjNPYDhRiLY6MBPeJozdMtJZ-Uwv-ANwBBKiSOb5f6PM4=A@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] signal: Use dedicated helpers to send signals
 with si_trapno set
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
> Now that si_trapno is no longer expected to be present for every fault
> reported using siginfo on alpha and sparc remove the trapno parameter
> from force_sig_fault, force_sig_fault_to_task and send_sig_fault.
>
> Add two new helpers force_sig_fault_trapno and send_sig_fautl_trapno
> for those signals where trapno is expected to be set.
>
> v1: https://lkml.kernel.org/r/m1eeers7q7.fsf_-_@fess.ebiederm.org
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Reviewed-by: Marco Elver <elver@google.com>



> ---
>  arch/alpha/kernel/osf_sys.c      |  2 +-
>  arch/alpha/kernel/signal.c       |  4 +--
>  arch/alpha/kernel/traps.c        | 24 ++++++++---------
>  arch/alpha/mm/fault.c            |  4 +--
>  arch/sparc/kernel/process_64.c   |  2 +-
>  arch/sparc/kernel/sys_sparc_32.c |  2 +-
>  arch/sparc/kernel/sys_sparc_64.c |  2 +-
>  arch/sparc/kernel/traps_32.c     | 22 ++++++++--------
>  arch/sparc/kernel/traps_64.c     | 44 ++++++++++++++------------------
>  arch/sparc/kernel/unaligned_32.c |  2 +-
>  arch/sparc/mm/fault_32.c         |  2 +-
>  arch/sparc/mm/fault_64.c         |  2 +-
>  include/linux/sched/signal.h     | 12 +++------
>  kernel/signal.c                  | 41 +++++++++++++++++++++--------
>  14 files changed, 88 insertions(+), 77 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index d5367a1c6300..80c5d7fbe66a 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -878,7 +878,7 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
>
>                         send_sig_fault(SIGFPE, si_code,
>                                        (void __user *)NULL,  /* FIXME */
> -                                      0, current);
> +                                      current);
>                 }
>                 return 0;
>         }
> diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
> index 948b89789da8..bc077babafab 100644
> --- a/arch/alpha/kernel/signal.c
> +++ b/arch/alpha/kernel/signal.c
> @@ -219,7 +219,7 @@ do_sigreturn(struct sigcontext __user *sc)
>
>         /* Send SIGTRAP if we're single-stepping: */
>         if (ptrace_cancel_bpt (current)) {
> -               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc, 0,
> +               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc,
>                                current);
>         }
>         return;
> @@ -247,7 +247,7 @@ do_rt_sigreturn(struct rt_sigframe __user *frame)
>
>         /* Send SIGTRAP if we're single-stepping: */
>         if (ptrace_cancel_bpt (current)) {
> -               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc, 0,
> +               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *) regs->pc,
>                                current);
>         }
>         return;
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 921d4b6e4d95..0dddf9ecc1f4 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -227,7 +227,7 @@ do_entArith(unsigned long summary, unsigned long write_mask,
>         }
>         die_if_kernel("Arithmetic fault", regs, 0, NULL);
>
> -       send_sig_fault(SIGFPE, si_code, (void __user *) regs->pc, 0, current);
> +       send_sig_fault_trapno(SIGFPE, si_code, (void __user *) regs->pc, 0, current);
>  }
>
>  asmlinkage void
> @@ -268,12 +268,12 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>                         regs->pc -= 4;  /* make pc point to former bpt */
>                 }
>
> -               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc, 0,
> +               send_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc,
>                                current);
>                 return;
>
>               case 1: /* bugcheck */
> -               send_sig_fault(SIGTRAP, TRAP_UNK, (void __user *) regs->pc, 0,
> +               send_sig_fault(SIGTRAP, TRAP_UNK, (void __user *) regs->pc,
>                                current);
>                 return;
>
> @@ -335,8 +335,8 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>                         break;
>                 }
>
> -               send_sig_fault(signo, code, (void __user *) regs->pc, regs->r16,
> -                              current);
> +               send_sig_fault_trapno(signo, code, (void __user *) regs->pc,
> +                                     regs->r16, current);
>                 return;
>
>               case 4: /* opDEC */
> @@ -360,9 +360,9 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>                         if (si_code == 0)
>                                 return;
>                         if (si_code > 0) {
> -                               send_sig_fault(SIGFPE, si_code,
> -                                              (void __user *) regs->pc, 0,
> -                                              current);
> +                               send_sig_fault_trapno(SIGFPE, si_code,
> +                                                     (void __user *) regs->pc,
> +                                                     0, current);
>                                 return;
>                         }
>                 }
> @@ -387,7 +387,7 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>                       ;
>         }
>
> -       send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc, 0, current);
> +       send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc, current);
>  }
>
>  /* There is an ifdef in the PALcode in MILO that enables a
> @@ -402,7 +402,7 @@ do_entDbg(struct pt_regs *regs)
>  {
>         die_if_kernel("Instruction fault", regs, 0, NULL);
>
> -       force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc, 0);
> +       force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc);
>  }
>
>
> @@ -964,12 +964,12 @@ do_entUnaUser(void __user * va, unsigned long opcode,
>                         si_code = SEGV_MAPERR;
>                 mmap_read_unlock(mm);
>         }
> -       send_sig_fault(SIGSEGV, si_code, va, 0, current);
> +       send_sig_fault(SIGSEGV, si_code, va, current);
>         return;
>
>  give_sigbus:
>         regs->pc -= 4;
> -       send_sig_fault(SIGBUS, BUS_ADRALN, va, 0, current);
> +       send_sig_fault(SIGBUS, BUS_ADRALN, va, current);
>         return;
>  }
>
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
> index 09172f017efc..eee5102c3d88 100644
> --- a/arch/alpha/mm/fault.c
> +++ b/arch/alpha/mm/fault.c
> @@ -219,13 +219,13 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
>         mmap_read_unlock(mm);
>         /* Send a sigbus, regardless of whether we were in kernel
>            or user mode.  */
> -       force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address, 0);
> +       force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
>         if (!user_mode(regs))
>                 goto no_context;
>         return;
>
>   do_sigsegv:
> -       force_sig_fault(SIGSEGV, si_code, (void __user *) address, 0);
> +       force_sig_fault(SIGSEGV, si_code, (void __user *) address);
>         return;
>
>  #ifdef CONFIG_ALPHA_LARGE_VMALLOC
> diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
> index 7afd0a859a78..29e67854d5a4 100644
> --- a/arch/sparc/kernel/process_64.c
> +++ b/arch/sparc/kernel/process_64.c
> @@ -518,7 +518,7 @@ void synchronize_user_stack(void)
>
>  static void stack_unaligned(unsigned long sp)
>  {
> -       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *) sp, 0);
> +       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *) sp);
>  }
>
>  static const char uwfault32[] = KERN_INFO \
> diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
> index be77538bc038..082a551897ed 100644
> --- a/arch/sparc/kernel/sys_sparc_32.c
> +++ b/arch/sparc/kernel/sys_sparc_32.c
> @@ -151,7 +151,7 @@ sparc_breakpoint (struct pt_regs *regs)
>  #ifdef DEBUG_SPARC_BREAKPOINT
>          printk ("TRAP: Entering kernel PC=%x, nPC=%x\n", regs->pc, regs->npc);
>  #endif
> -       force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc, 0);
> +       force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc);
>
>  #ifdef DEBUG_SPARC_BREAKPOINT
>         printk ("TRAP: Returning to space: PC=%x nPC=%x\n", regs->pc, regs->npc);
> diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
> index 6b92fadb6ec7..1e9a9e016237 100644
> --- a/arch/sparc/kernel/sys_sparc_64.c
> +++ b/arch/sparc/kernel/sys_sparc_64.c
> @@ -514,7 +514,7 @@ asmlinkage void sparc_breakpoint(struct pt_regs *regs)
>  #ifdef DEBUG_SPARC_BREAKPOINT
>          printk ("TRAP: Entering kernel PC=%lx, nPC=%lx\n", regs->tpc, regs->tnpc);
>  #endif
> -       force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->tpc, 0);
> +       force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->tpc);
>  #ifdef DEBUG_SPARC_BREAKPOINT
>         printk ("TRAP: Returning to space: PC=%lx nPC=%lx\n", regs->tpc, regs->tnpc);
>  #endif
> diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
> index 247a0d9683b2..5630e5a395e0 100644
> --- a/arch/sparc/kernel/traps_32.c
> +++ b/arch/sparc/kernel/traps_32.c
> @@ -102,8 +102,8 @@ void do_hw_interrupt(struct pt_regs *regs, unsigned long type)
>         if(regs->psr & PSR_PS)
>                 die_if_kernel("Kernel bad trap", regs);
>
> -       force_sig_fault(SIGILL, ILL_ILLTRP,
> -                       (void __user *)regs->pc, type - 0x80);
> +       force_sig_fault_trapno(SIGILL, ILL_ILLTRP,
> +                              (void __user *)regs->pc, type - 0x80);
>  }
>
>  void do_illegal_instruction(struct pt_regs *regs, unsigned long pc, unsigned long npc,
> @@ -116,7 +116,7 @@ void do_illegal_instruction(struct pt_regs *regs, unsigned long pc, unsigned lon
>                regs->pc, *(unsigned long *)regs->pc);
>  #endif
>
> -       send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)pc, current);
>  }
>
>  void do_priv_instruction(struct pt_regs *regs, unsigned long pc, unsigned long npc,
> @@ -124,7 +124,7 @@ void do_priv_instruction(struct pt_regs *regs, unsigned long pc, unsigned long n
>  {
>         if(psr & PSR_PS)
>                 die_if_kernel("Penguin instruction from Penguin mode??!?!", regs);
> -       send_sig_fault(SIGILL, ILL_PRVOPC, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGILL, ILL_PRVOPC, (void __user *)pc, current);
>  }
>
>  /* XXX User may want to be allowed to do this. XXX */
> @@ -145,7 +145,7 @@ void do_memaccess_unaligned(struct pt_regs *regs, unsigned long pc, unsigned lon
>  #endif
>         send_sig_fault(SIGBUS, BUS_ADRALN,
>                        /* FIXME: Should dig out mna address */ (void *)0,
> -                      0, current);
> +                      current);
>  }
>
>  static unsigned long init_fsr = 0x0UL;
> @@ -291,7 +291,7 @@ void do_fpe_trap(struct pt_regs *regs, unsigned long pc, unsigned long npc,
>                 else if (fsr & 0x01)
>                         code = FPE_FLTRES;
>         }
> -       send_sig_fault(SIGFPE, code, (void __user *)pc, 0, fpt);
> +       send_sig_fault(SIGFPE, code, (void __user *)pc, fpt);
>  #ifndef CONFIG_SMP
>         last_task_used_math = NULL;
>  #endif
> @@ -305,7 +305,7 @@ void handle_tag_overflow(struct pt_regs *regs, unsigned long pc, unsigned long n
>  {
>         if(psr & PSR_PS)
>                 die_if_kernel("Penguin overflow trap from kernel mode", regs);
> -       send_sig_fault(SIGEMT, EMT_TAGOVF, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGEMT, EMT_TAGOVF, (void __user *)pc, current);
>  }
>
>  void handle_watchpoint(struct pt_regs *regs, unsigned long pc, unsigned long npc,
> @@ -327,13 +327,13 @@ void handle_reg_access(struct pt_regs *regs, unsigned long pc, unsigned long npc
>         printk("Register Access Exception at PC %08lx NPC %08lx PSR %08lx\n",
>                pc, npc, psr);
>  #endif
> -       force_sig_fault(SIGBUS, BUS_OBJERR, (void __user *)pc, 0);
> +       force_sig_fault(SIGBUS, BUS_OBJERR, (void __user *)pc);
>  }
>
>  void handle_cp_disabled(struct pt_regs *regs, unsigned long pc, unsigned long npc,
>                         unsigned long psr)
>  {
> -       send_sig_fault(SIGILL, ILL_COPROC, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGILL, ILL_COPROC, (void __user *)pc, current);
>  }
>
>  void handle_cp_exception(struct pt_regs *regs, unsigned long pc, unsigned long npc,
> @@ -343,13 +343,13 @@ void handle_cp_exception(struct pt_regs *regs, unsigned long pc, unsigned long n
>         printk("Co-Processor Exception at PC %08lx NPC %08lx PSR %08lx\n",
>                pc, npc, psr);
>  #endif
> -       send_sig_fault(SIGILL, ILL_COPROC, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGILL, ILL_COPROC, (void __user *)pc, current);
>  }
>
>  void handle_hw_divzero(struct pt_regs *regs, unsigned long pc, unsigned long npc,
>                        unsigned long psr)
>  {
> -       send_sig_fault(SIGFPE, FPE_INTDIV, (void __user *)pc, 0, current);
> +       send_sig_fault(SIGFPE, FPE_INTDIV, (void __user *)pc, current);
>  }
>
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
> index a850dccd78ea..6863025ed56d 100644
> --- a/arch/sparc/kernel/traps_64.c
> +++ b/arch/sparc/kernel/traps_64.c
> @@ -107,8 +107,8 @@ void bad_trap(struct pt_regs *regs, long lvl)
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGILL, ILL_ILLTRP,
> -                       (void __user *)regs->tpc, lvl);
> +       force_sig_fault_trapno(SIGILL, ILL_ILLTRP,
> +                              (void __user *)regs->tpc, lvl);
>  }
>
>  void bad_trap_tl1(struct pt_regs *regs, long lvl)
> @@ -201,8 +201,7 @@ void spitfire_insn_access_exception(struct pt_regs *regs, unsigned long sfsr, un
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGSEGV, SEGV_MAPERR,
> -                       (void __user *)regs->tpc, 0);
> +       force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)regs->tpc);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -237,7 +236,7 @@ void sun4v_insn_access_exception(struct pt_regs *regs, unsigned long addr, unsig
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *) addr, 0);
> +       force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *) addr);
>  }
>
>  void sun4v_insn_access_exception_tl1(struct pt_regs *regs, unsigned long addr, unsigned long type_ctx)
> @@ -321,7 +320,7 @@ void spitfire_data_access_exception(struct pt_regs *regs, unsigned long sfsr, un
>         if (is_no_fault_exception(regs))
>                 return;
>
> -       force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)sfar, 0);
> +       force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)sfar);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -385,13 +384,13 @@ void sun4v_data_access_exception(struct pt_regs *regs, unsigned long addr, unsig
>          */
>         switch (type) {
>         case HV_FAULT_TYPE_INV_ASI:
> -               force_sig_fault(SIGILL, ILL_ILLADR, (void __user *)addr, 0);
> +               force_sig_fault(SIGILL, ILL_ILLADR, (void __user *)addr);
>                 break;
>         case HV_FAULT_TYPE_MCD_DIS:
> -               force_sig_fault(SIGSEGV, SEGV_ACCADI, (void __user *)addr, 0);
> +               force_sig_fault(SIGSEGV, SEGV_ACCADI, (void __user *)addr);
>                 break;
>         default:
> -               force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)addr, 0);
> +               force_sig_fault(SIGSEGV, SEGV_MAPERR, (void __user *)addr);
>                 break;
>         }
>  }
> @@ -568,7 +567,7 @@ static void spitfire_ue_log(unsigned long afsr, unsigned long afar, unsigned lon
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGBUS, BUS_OBJERR, (void *)0, 0);
> +       force_sig_fault(SIGBUS, BUS_OBJERR, (void *)0);
>  }
>
>  void spitfire_access_error(struct pt_regs *regs, unsigned long status_encoded, unsigned long afar)
> @@ -2069,8 +2068,7 @@ void do_mcd_err(struct pt_regs *regs, struct sun4v_error_entry ent)
>         /* Send SIGSEGV to the userspace process with the right signal
>          * code
>          */
> -       force_sig_fault(SIGSEGV, SEGV_ADIDERR, (void __user *)ent.err_raddr,
> -                       0);
> +       force_sig_fault(SIGSEGV, SEGV_ADIDERR, (void __user *)ent.err_raddr);
>  }
>
>  /* We run with %pil set to PIL_NORMAL_MAX and PSTATE_IE enabled in %pstate.
> @@ -2184,7 +2182,7 @@ bool sun4v_nonresum_error_user_handled(struct pt_regs *regs,
>         }
>         if (attrs & SUN4V_ERR_ATTRS_PIO) {
>                 force_sig_fault(SIGBUS, BUS_ADRERR,
> -                               (void __user *)sun4v_get_vaddr(regs), 0);
> +                               (void __user *)sun4v_get_vaddr(regs));
>                 return true;
>         }
>
> @@ -2340,8 +2338,7 @@ static void do_fpe_common(struct pt_regs *regs)
>                         else if (fsr & 0x01)
>                                 code = FPE_FLTRES;
>                 }
> -               force_sig_fault(SIGFPE, code,
> -                               (void __user *)regs->tpc, 0);
> +               force_sig_fault(SIGFPE, code, (void __user *)regs->tpc);
>         }
>  }
>
> @@ -2395,8 +2392,7 @@ void do_tof(struct pt_regs *regs)
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGEMT, EMT_TAGOVF,
> -                       (void __user *)regs->tpc, 0);
> +       force_sig_fault(SIGEMT, EMT_TAGOVF, (void __user *)regs->tpc);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -2415,8 +2411,7 @@ void do_div0(struct pt_regs *regs)
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGFPE, FPE_INTDIV,
> -                       (void __user *)regs->tpc, 0);
> +       force_sig_fault(SIGFPE, FPE_INTDIV, (void __user *)regs->tpc);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -2612,7 +2607,7 @@ void do_illegal_instruction(struct pt_regs *regs)
>                         }
>                 }
>         }
> -       force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)pc, 0);
> +       force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)pc);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -2632,7 +2627,7 @@ void mem_address_unaligned(struct pt_regs *regs, unsigned long sfar, unsigned lo
>         if (is_no_fault_exception(regs))
>                 return;
>
> -       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *)sfar, 0);
> +       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *)sfar);
>  out:
>         exception_exit(prev_state);
>  }
> @@ -2650,7 +2645,7 @@ void sun4v_do_mna(struct pt_regs *regs, unsigned long addr, unsigned long type_c
>         if (is_no_fault_exception(regs))
>                 return;
>
> -       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *) addr, 0);
> +       force_sig_fault(SIGBUS, BUS_ADRALN, (void __user *) addr);
>  }
>
>  /* sun4v_mem_corrupt_detect_precise() - Handle precise exception on an ADI
> @@ -2697,7 +2692,7 @@ void sun4v_mem_corrupt_detect_precise(struct pt_regs *regs, unsigned long addr,
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGSEGV, SEGV_ADIPERR, (void __user *)addr, 0);
> +       force_sig_fault(SIGSEGV, SEGV_ADIPERR, (void __user *)addr);
>  }
>
>  void do_privop(struct pt_regs *regs)
> @@ -2712,8 +2707,7 @@ void do_privop(struct pt_regs *regs)
>                 regs->tpc &= 0xffffffff;
>                 regs->tnpc &= 0xffffffff;
>         }
> -       force_sig_fault(SIGILL, ILL_PRVOPC,
> -                       (void __user *)regs->tpc, 0);
> +       force_sig_fault(SIGILL, ILL_PRVOPC, (void __user *)regs->tpc);
>  out:
>         exception_exit(prev_state);
>  }
> diff --git a/arch/sparc/kernel/unaligned_32.c b/arch/sparc/kernel/unaligned_32.c
> index ef5c5207c9ff..455f0258c745 100644
> --- a/arch/sparc/kernel/unaligned_32.c
> +++ b/arch/sparc/kernel/unaligned_32.c
> @@ -278,5 +278,5 @@ asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn)
>  {
>         send_sig_fault(SIGBUS, BUS_ADRALN,
>                        (void __user *)safe_compute_effective_address(regs, insn),
> -                      0, current);
> +                      current);
>  }
> diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
> index de2031c2b2d7..fa858626b85b 100644
> --- a/arch/sparc/mm/fault_32.c
> +++ b/arch/sparc/mm/fault_32.c
> @@ -83,7 +83,7 @@ static void __do_fault_siginfo(int code, int sig, struct pt_regs *regs,
>                 show_signal_msg(regs, sig, code,
>                                 addr, current);
>
> -       force_sig_fault(sig, code, (void __user *) addr, 0);
> +       force_sig_fault(sig, code, (void __user *) addr);
>  }
>
>  static unsigned long compute_si_addr(struct pt_regs *regs, int text_fault)
> diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
> index 0a6bcc85fba7..9a9652a15fed 100644
> --- a/arch/sparc/mm/fault_64.c
> +++ b/arch/sparc/mm/fault_64.c
> @@ -176,7 +176,7 @@ static void do_fault_siginfo(int code, int sig, struct pt_regs *regs,
>         if (unlikely(show_unhandled_signals))
>                 show_signal_msg(regs, sig, code, addr, current);
>
> -       force_sig_fault(sig, code, (void __user *) addr, 0);
> +       force_sig_fault(sig, code, (void __user *) addr);
>  }
>
>  static unsigned int get_fault_insn(struct pt_regs *regs, unsigned int insn)
> diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
> index 3f6a0fcaa10c..7daa425f3055 100644
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -298,11 +298,6 @@ static inline void kernel_signal_stop(void)
>
>         schedule();
>  }
> -#ifdef __ARCH_SI_TRAPNO
> -# define ___ARCH_SI_TRAPNO(_a1) , _a1
> -#else
> -# define ___ARCH_SI_TRAPNO(_a1)
> -#endif
>  #ifdef __ia64__
>  # define ___ARCH_SI_IA64(_a1, _a2, _a3) , _a1, _a2, _a3
>  #else
> @@ -310,14 +305,11 @@ static inline void kernel_signal_stop(void)
>  #endif
>
>  int force_sig_fault_to_task(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
>         , struct task_struct *t);
>  int force_sig_fault(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr));
>  int send_sig_fault(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
>         , struct task_struct *t);
>
> @@ -327,6 +319,10 @@ int send_sig_mceerr(int code, void __user *, short, struct task_struct *);
>  int force_sig_bnderr(void __user *addr, void __user *lower, void __user *upper);
>  int force_sig_pkuerr(void __user *addr, u32 pkey);
>
> +int force_sig_fault_trapno(int sig, int code, void __user *addr, int trapno);
> +int send_sig_fault_trapno(int sig, int code, void __user *addr, int trapno,
> +                         struct task_struct *task);
> +
>  int force_sig_ptrace_errno_trap(int errno, void __user *addr);
>
>  extern int send_sig_info(int, struct kernel_siginfo *, struct task_struct *);
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 3d3ba7949788..7eaa8d84db4c 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1651,7 +1651,6 @@ void force_sigsegv(int sig)
>  }
>
>  int force_sig_fault_to_task(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
>         , struct task_struct *t)
>  {
> @@ -1662,9 +1661,6 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
>         info.si_errno = 0;
>         info.si_code  = code;
>         info.si_addr  = addr;
> -#ifdef __ARCH_SI_TRAPNO
> -       info.si_trapno = trapno;
> -#endif
>  #ifdef __ia64__
>         info.si_imm = imm;
>         info.si_flags = flags;
> @@ -1674,16 +1670,13 @@ int force_sig_fault_to_task(int sig, int code, void __user *addr
>  }
>
>  int force_sig_fault(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr))
>  {
>         return force_sig_fault_to_task(sig, code, addr
> -                                      ___ARCH_SI_TRAPNO(trapno)
>                                        ___ARCH_SI_IA64(imm, flags, isr), current);
>  }
>
>  int send_sig_fault(int sig, int code, void __user *addr
> -       ___ARCH_SI_TRAPNO(int trapno)
>         ___ARCH_SI_IA64(int imm, unsigned int flags, unsigned long isr)
>         , struct task_struct *t)
>  {
> @@ -1694,9 +1687,6 @@ int send_sig_fault(int sig, int code, void __user *addr
>         info.si_errno = 0;
>         info.si_code  = code;
>         info.si_addr  = addr;
> -#ifdef __ARCH_SI_TRAPNO
> -       info.si_trapno = trapno;
> -#endif
>  #ifdef __ia64__
>         info.si_imm = imm;
>         info.si_flags = flags;
> @@ -1763,6 +1753,37 @@ int force_sig_pkuerr(void __user *addr, u32 pkey)
>  }
>  #endif
>
> +#if IS_ENABLED(CONFIG_SPARC)
> +int force_sig_fault_trapno(int sig, int code, void __user *addr, int trapno)
> +{
> +       struct kernel_siginfo info;
> +
> +       clear_siginfo(&info);
> +       info.si_signo = sig;
> +       info.si_errno = 0;
> +       info.si_code  = code;
> +       info.si_addr  = addr;
> +       info.si_trapno = trapno;
> +       return force_sig_info(&info);
> +}
> +#endif
> +
> +#if IS_ENABLED(CONFIG_ALPHA)
> +int send_sig_fault_trapno(int sig, int code, void __user *addr, int trapno,
> +                         struct task_struct *t)
> +{
> +       struct kernel_siginfo info;
> +
> +       clear_siginfo(&info);
> +       info.si_signo = sig;
> +       info.si_errno = 0;
> +       info.si_code  = code;
> +       info.si_addr  = addr;
> +       info.si_trapno = trapno;
> +       return send_sig_info(info.si_signo, &info, t);
> +}
> +#endif
> +
>  /* For the crazy architectures that include trap information in
>   * the errno field, instead of an actual errno value.
>   */
> --
> 2.30.1
