Return-Path: <sparclinux+bounces-961-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAF8ABB6E
	for <lists+sparclinux@lfdr.de>; Sat, 20 Apr 2024 13:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDDCF2817BC
	for <lists+sparclinux@lfdr.de>; Sat, 20 Apr 2024 11:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C172563;
	Sat, 20 Apr 2024 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="ZicOOW/V";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="l43BUJm/"
X-Original-To: sparclinux@vger.kernel.org
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1526ACC
	for <sparclinux@vger.kernel.org>; Sat, 20 Apr 2024 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713613403; cv=none; b=QNCJOTdpmSeMf3OjV8Q2Z57cwJs6sgrWV6rF8UlPcWUn2cv5Lr1ftY3VyJmhVB8PbVvXZak80Rl2oBI0CgNpr/DRmE3AXZVaUkuj9RWFcH1uuWW7Zuei1vlICp7IGXSwXZ+iUNKYE/ssUYOlniVnhF2PdJzeiOihxXJ5bM3Odd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713613403; c=relaxed/simple;
	bh=CWpb+UjIM+Wa1SyU2aZ96qljFnfJi45lXvaVXn+ZsRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rezx0t9vxyC4nGbvLswCQ17ZhsUQH+vCByy4LLS2tlmmDPujrNWjrVb0IGXRfaEfucd13DISdhTAn074WT33ae5NnvxtBPmDN/G6jAANjN0OkBlGGcbc9EYPfsjJanZm74dHC/+kZqxWciUlHvfHSGkAVfDzDNzrIpUonyw9sPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=ZicOOW/V; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=l43BUJm/; arc=none smtp.client-ip=46.30.211.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=2hAsso187noZhmI6+mlBe9QIFxiLVH0hhqShdOzAkr8=;
	b=ZicOOW/Vsiy19+EjAWM/cagEXavTjKXmlbx3Zqd0MIdU5uuJ1WkLFI8heSLIMHRwEPozHMcYTIRzo
	 oqTQepl0bbNnNuNaDrxzuQdKBF+llftvEcnaHKfUkmvOizM7xz72qF9wYkbIUnAzDxX0xQJOmCmf/w
	 XLqR33UOgu0bmjICOt0ltQoL9FpJ0rhaPv2XxQr1ITzhc/fqDJxQdKgUr1uXBg1o3hcYZuADSBc+lc
	 IgGTsHZN/nIPdB6OocY7NsYVQDDsA2Vg33bjs5E5F/HxOZbLjeW2L3A8Ejmco1ZieFzKvUGJJ7QqOV
	 xNtWpcR+BAOI+9Y0ntSP8BgFB/Z94Qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=2hAsso187noZhmI6+mlBe9QIFxiLVH0hhqShdOzAkr8=;
	b=l43BUJm/WqSGjzcwU2T4TPxwjeqKffAP2tlnPEoongTNXu3JwRQQqw+VlRdEBVV4c7FmsNOQksoal
	 I9pUDy1AA==
X-HalOne-ID: 03526c3a-ff0b-11ee-aee7-953526d7c221
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 03526c3a-ff0b-11ee-aee7-953526d7c221;
	Sat, 20 Apr 2024 11:42:09 +0000 (UTC)
Date: Sat, 20 Apr 2024 13:42:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dawei Li <dawei.li@shingroup.cn>
Cc: davem@davemloft.net, andreas@gaisler.com, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] sparc/smp: Remove on-stack cpumask var
Message-ID: <20240420114207.GG614130@ravnborg.org>
References: <20240420051547.3681642-1-dawei.li@shingroup.cn>
 <20240420051547.3681642-8-dawei.li@shingroup.cn>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420051547.3681642-8-dawei.li@shingroup.cn>

Hi Dawei

On Sat, Apr 20, 2024 at 01:15:47PM +0800, Dawei Li wrote:
> In general it's preferable to avoid placing cpumasks on the stack, as
> for large values of NR_CPUS these can consume significant amounts of
> stack space and make stack overflows more likely.
> 
> - Change prototype of sparc32_ipi_ops::cross_call() so that it takes
>   const cpumask * arg and all its callers accordingly.
> 
> - As for all cross_call() implementations, divide cpumask_test_cpu() call
>   into several sub calls to avoid on-stack cpumask var.
> 
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>

The code changes looks ok from a quick look.
But we have a bunch of patches pending touching or removing the same
files. On top of this, the right approach would be to take a
look at code from a higher level.

In other words - I advise to drop this, and maybe re-visit in a few
months after the pending patches has hit -next.

Sorry for asking you to look as this.

	Sam

> ---
>  arch/sparc/include/asm/smp_32.h | 12 ++++++------
>  arch/sparc/kernel/kernel.h      | 11 +++++++++++
>  arch/sparc/kernel/leon_smp.c    | 11 ++++-------
>  arch/sparc/kernel/sun4d_smp.c   | 10 ++++------
>  arch/sparc/kernel/sun4m_smp.c   | 10 ++++------
>  5 files changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/smp_32.h b/arch/sparc/include/asm/smp_32.h
> index 2cf7971d7f6c..9b6a166f6a57 100644
> --- a/arch/sparc/include/asm/smp_32.h
> +++ b/arch/sparc/include/asm/smp_32.h
> @@ -54,7 +54,7 @@ void smp_bogo(struct seq_file *);
>  void smp_info(struct seq_file *);
>  
>  struct sparc32_ipi_ops {
> -	void (*cross_call)(void *func, cpumask_t mask, unsigned long arg1,
> +	void (*cross_call)(void *func, const cpumask_t *mask, unsigned long arg1,
>  			   unsigned long arg2, unsigned long arg3,
>  			   unsigned long arg4);
>  	void (*resched)(int cpu);
> @@ -65,29 +65,29 @@ extern const struct sparc32_ipi_ops *sparc32_ipi_ops;
>  
>  static inline void xc0(void *func)
>  {
> -	sparc32_ipi_ops->cross_call(func, *cpu_online_mask, 0, 0, 0, 0);
> +	sparc32_ipi_ops->cross_call(func, cpu_online_mask, 0, 0, 0, 0);
>  }
>  
>  static inline void xc1(void *func, unsigned long arg1)
>  {
> -	sparc32_ipi_ops->cross_call(func, *cpu_online_mask, arg1, 0, 0, 0);
> +	sparc32_ipi_ops->cross_call(func, cpu_online_mask, arg1, 0, 0, 0);
>  }
>  static inline void xc2(void *func, unsigned long arg1, unsigned long arg2)
>  {
> -	sparc32_ipi_ops->cross_call(func, *cpu_online_mask, arg1, arg2, 0, 0);
> +	sparc32_ipi_ops->cross_call(func, cpu_online_mask, arg1, arg2, 0, 0);
>  }
>  
>  static inline void xc3(void *func, unsigned long arg1, unsigned long arg2,
>  		       unsigned long arg3)
>  {
> -	sparc32_ipi_ops->cross_call(func, *cpu_online_mask,
> +	sparc32_ipi_ops->cross_call(func, cpu_online_mask,
>  				    arg1, arg2, arg3, 0);
>  }
>  
>  static inline void xc4(void *func, unsigned long arg1, unsigned long arg2,
>  		       unsigned long arg3, unsigned long arg4)
>  {
> -	sparc32_ipi_ops->cross_call(func, *cpu_online_mask,
> +	sparc32_ipi_ops->cross_call(func, cpu_online_mask,
>  				    arg1, arg2, arg3, arg4);
>  }
>  
> diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
> index a8fb7c0bf053..36747e8f7e36 100644
> --- a/arch/sparc/kernel/kernel.h
> +++ b/arch/sparc/kernel/kernel.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/ftrace.h>
> +#include <linux/smp.h>
>  
>  #include <asm/traps.h>
>  #include <asm/head.h>
> @@ -75,6 +76,16 @@ int sparc32_classify_syscall(unsigned int syscall);
>  #endif
>  
>  #ifdef CONFIG_SPARC32
> +
> +#ifdef CONFIG_SMP
> +static inline bool cpu_for_ipi(const cpumask_t *mask, unsigned int cpu)
> +{
> +	return cpumask_test_cpu(cpu, mask) &&
> +	       cpumask_test_cpu(cpu, cpu_online_mask) &&
> +	       cpu != smp_processor_id();
> +}
> +#endif /* CONFIG_SMP */
> +
>  /* setup_32.c */
>  struct linux_romvec;
>  void sparc32_start_kernel(struct linux_romvec *rp);
> diff --git a/arch/sparc/kernel/leon_smp.c b/arch/sparc/kernel/leon_smp.c
> index 1ee393abc463..291884c8d82a 100644
> --- a/arch/sparc/kernel/leon_smp.c
> +++ b/arch/sparc/kernel/leon_smp.c
> @@ -372,7 +372,7 @@ static struct smp_funcall {
>  static DEFINE_SPINLOCK(cross_call_lock);
>  
>  /* Cross calls must be serialized, at least currently. */
> -static void leon_cross_call(void *func, cpumask_t mask, unsigned long arg1,
> +static void leon_cross_call(void *func, const cpumask_t *mask, unsigned long arg1,
>  			    unsigned long arg2, unsigned long arg3,
>  			    unsigned long arg4)
>  {
> @@ -403,14 +403,11 @@ static void leon_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  		{
>  			register int i;
>  
> -			cpumask_clear_cpu(smp_processor_id(), &mask);
> -			cpumask_and(&mask, cpu_online_mask, &mask);
>  			for (i = 0; i <= high; i++) {
> -				if (cpumask_test_cpu(i, &mask)) {
> +				if (cpu_for_ipi(mask, i)) {
>  					ccall_info.processors_in[i] = 0;
>  					ccall_info.processors_out[i] = 0;
>  					leon_send_ipi(i, LEON3_IRQ_CROSS_CALL);
> -
>  				}
>  			}
>  		}
> @@ -420,7 +417,7 @@ static void leon_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  
>  				while (!ccall_info.processors_in[i])
> @@ -429,7 +426,7 @@ static void leon_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  
>  				while (!ccall_info.processors_out[i])
> diff --git a/arch/sparc/kernel/sun4d_smp.c b/arch/sparc/kernel/sun4d_smp.c
> index 9a62a5cf3337..7dc57ca05728 100644
> --- a/arch/sparc/kernel/sun4d_smp.c
> +++ b/arch/sparc/kernel/sun4d_smp.c
> @@ -281,7 +281,7 @@ static struct smp_funcall {
>  static DEFINE_SPINLOCK(cross_call_lock);
>  
>  /* Cross calls must be serialized, at least currently. */
> -static void sun4d_cross_call(void *func, cpumask_t mask, unsigned long arg1,
> +static void sun4d_cross_call(void *func, const cpumask_t *mask, unsigned long arg1,
>  			     unsigned long arg2, unsigned long arg3,
>  			     unsigned long arg4)
>  {
> @@ -315,10 +315,8 @@ static void sun4d_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  		{
>  			register int i;
>  
> -			cpumask_clear_cpu(smp_processor_id(), &mask);
> -			cpumask_and(&mask, cpu_online_mask, &mask);
>  			for (i = 0; i <= high; i++) {
> -				if (cpumask_test_cpu(i, &mask)) {
> +				if (cpu_for_ipi(mask, i)) {
>  					ccall_info.processors_in[i] = 0;
>  					ccall_info.processors_out[i] = 0;
>  					sun4d_send_ipi(i, IRQ_CROSS_CALL);
> @@ -331,7 +329,7 @@ static void sun4d_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  				while (!ccall_info.processors_in[i])
>  					barrier();
> @@ -339,7 +337,7 @@ static void sun4d_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  				while (!ccall_info.processors_out[i])
>  					barrier();
> diff --git a/arch/sparc/kernel/sun4m_smp.c b/arch/sparc/kernel/sun4m_smp.c
> index 056df034e79e..3f43f64e3489 100644
> --- a/arch/sparc/kernel/sun4m_smp.c
> +++ b/arch/sparc/kernel/sun4m_smp.c
> @@ -170,7 +170,7 @@ static struct smp_funcall {
>  static DEFINE_SPINLOCK(cross_call_lock);
>  
>  /* Cross calls must be serialized, at least currently. */
> -static void sun4m_cross_call(void *func, cpumask_t mask, unsigned long arg1,
> +static void sun4m_cross_call(void *func, const cpumask_t *mask, unsigned long arg1,
>  			     unsigned long arg2, unsigned long arg3,
>  			     unsigned long arg4)
>  {
> @@ -191,10 +191,8 @@ static void sun4m_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  		{
>  			register int i;
>  
> -			cpumask_clear_cpu(smp_processor_id(), &mask);
> -			cpumask_and(&mask, cpu_online_mask, &mask);
>  			for (i = 0; i < ncpus; i++) {
> -				if (cpumask_test_cpu(i, &mask)) {
> +				if (cpu_for_ipi(mask, i)) {
>  					ccall_info.processors_in[i] = 0;
>  					ccall_info.processors_out[i] = 0;
>  					sun4m_send_ipi(i, IRQ_CROSS_CALL);
> @@ -210,7 +208,7 @@ static void sun4m_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  				while (!ccall_info.processors_in[i])
>  					barrier();
> @@ -218,7 +216,7 @@ static void sun4m_cross_call(void *func, cpumask_t mask, unsigned long arg1,
>  
>  			i = 0;
>  			do {
> -				if (!cpumask_test_cpu(i, &mask))
> +				if (!cpu_for_ipi(mask, i))
>  					continue;
>  				while (!ccall_info.processors_out[i])
>  					barrier();
> -- 
> 2.27.0

