Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C1D3269B3
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 22:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZVvZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Feb 2021 16:51:25 -0500
Received: from mx2.cyber.ee ([45.144.6.23]:39710 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhBZVvZ (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 26 Feb 2021 16:51:25 -0500
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
 <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
 <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <be2123ec-017a-36f3-2baf-47f527380ead@linux.ee>
Date:   Fri, 26 Feb 2021 23:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I started from the beginning with the patches, applying them on top of each other.


> 2. If that sounds like too much work, we could print the instructions in the kernel when we know we're going to return true. (Sorry the formatting of this will likely be messed up):
> 
> diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
> index 27778b65a965..77e31d7c4097 100644
> --- a/arch/sparc/kernel/traps_64.c
> +++ b/arch/sparc/kernel/traps_64.c
> @@ -277,11 +277,13 @@ bool is_no_fault_exception(struct pt_regs *regs)
>                          asi = (insn >> 5);          /* immediate asi    */
>                  if ((asi & 0xf2) == ASI_PNF) {
>                          if (insn & 0x1000000) {     /* op3[5:4]=3       */
> +                               printk(KERN_ALERT "fixing up no fault insn %x\n", insn);
>                                  handle_ldf_stq(insn, regs);
>                                  return true;
>                          } else if (insn & 0x200000) { /* op3[2], stores */
>                                  return false;
>                          }
> +                       printk(KERN_ALERT "fixing up no fault insn %x\n", insn);
>                          handle_ld_nf(insn, regs);
>                          return true;
>                  }
> 
> 3. I have a theory that the instruction may be something like this:
> 
>          sta %f0, [ %g0 ] #ASI_PNF
> 
> which should assemble to 0xc1a01040. You could just try this instruction.

Tried it with this instruction. The following message appears 26 times again and then it hangs:
fixing up no fault insn c1a01040

Starting now, my test program has 0xc1a01040 as first command and oxcf95d1ef as second.


> 4. If this does result in a crash, this patch might be the fix:
> 
> diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
> index 77e31d7c4097..c0d2e3665e69 100644
> --- a/arch/sparc/kernel/traps_64.c
> +++ b/arch/sparc/kernel/traps_64.c
> @@ -276,12 +276,12 @@ bool is_no_fault_exception(struct pt_regs *regs)
>                  else
>                          asi = (insn >> 5);          /* immediate asi    */
>                  if ((asi & 0xf2) == ASI_PNF) {
> +                       if (insn & 0x200000)  /* op3[2], stores */
> +                               return false;
>                          if (insn & 0x1000000) {     /* op3[5:4]=3       */
>                                  printk(KERN_ALERT "fixing up no fault insn %x\n", insn);
>                                  handle_ldf_stq(insn, regs);
>                                  return true;
> -                       } else if (insn & 0x200000) { /* op3[2], stores */
> -                               return false;
>                          }
>                          printk(KERN_ALERT "fixing up no fault insn %x\n", insn);
>                          handle_ld_nf(insn, regs);
> 
> 5. Try the patch in #4 regardless of the outcome of step #3

With this patch applied on top top of previous, it works with nothing in dmesg.


> 5. Here is another patch to try after the others:
> 
> diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
> index c0d2e3665e69..e383738fdd9f 100644
> --- a/arch/sparc/kernel/traps_64.c
> +++ b/arch/sparc/kernel/traps_64.c
> @@ -275,7 +275,7 @@ bool is_no_fault_exception(struct pt_regs *regs)
>                          asi = (regs->tstate >> 24); /* saved %asi       */
>                  else
>                          asi = (insn >> 5);          /* immediate asi    */
> -               if ((asi & 0xf2) == ASI_PNF) {
> +               if (asi == ASI_PNF) {
>                          if (insn & 0x200000)  /* op3[2], stores */
>                                  return false;
>                          if (insn & 0x1000000) {     /* op3[5:4]=3       */

This works too without any hang or warnings.

-- 
Meelis Roos <mroos@linux.ee>
