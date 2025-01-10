Return-Path: <sparclinux+bounces-3053-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B57A09A13
	for <lists+sparclinux@lfdr.de>; Fri, 10 Jan 2025 19:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D0697A3097
	for <lists+sparclinux@lfdr.de>; Fri, 10 Jan 2025 18:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9168E24B228;
	Fri, 10 Jan 2025 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VWgrr3+M"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A324B220
	for <sparclinux@vger.kernel.org>; Fri, 10 Jan 2025 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534904; cv=none; b=QsEPA2ElPwlnTPdxKBqhORWkXwEpWxTN0PLPOg/TMmGQmFkmTmn/ZfyZK4d6McM1sSBX5+IZWvuGLRT3rzEnR5k/TatOUFMtb7vG3I7oUVaoBwkPgJv5gffZbXW8x27Ij0hi+cl+FQGQTGHW5KpWCbYHLl3SFwKgrWOLa1mcK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534904; c=relaxed/simple;
	bh=Ua0Eznh6vBIqJokkBKNt1xiE4aA9cS4fZDm05XjqWbo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r/WccC9icfeRjG+Dbh6uVnyMiMtzoL+Ewbi5eUBabWllPU8KnPSXQDE4DUnXIa0Xvc7uI+seezHRt7VVnY5CDeSm8Gicw+xTKlKNsMMDfpM4UB5LuNDAAy3FyTHSoIQ62Je4yJ/+697eqHu8pC9HZb78XexkusQ+/TpJ4J/+HTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VWgrr3+M; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-301e3d7adceso12189941fa.3
        for <sparclinux@vger.kernel.org>; Fri, 10 Jan 2025 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534901; x=1737139701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGrdWVEeU4Ptbj/O5LlMCmxq+nbCGI8+4U1HKBQ0dew=;
        b=VWgrr3+MRMDITcl+zW7GKskhNQ0mtTHE1z14j2XnvlXD5DcbQAYt2SWhNGGALlI7++
         yqauszd+Ec+J33FuWm3Wraoo+oOYsVzfdxKzOO7zjlKt2C2WcjxWcG/qKZd3NzhuQIZK
         bGxhpdfBKyx+Nkdq4AMZpM89IPT3SUc0/yRyu9ziL1P9a8NiovhGOZVuhhsDzmIpDkik
         ClA/e/1d6k0EYPtJEfjgWc2v9BkAfM+JfOGlLV5gKZqIZF3RMgUWZFZbsHijUger7fSB
         nk1c2sAinEa/Y+pNaYoYrStEXYRhDQTEwuOQt31KhkSshhA37qrzPvw1kZzKIfs7c2F/
         EYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534901; x=1737139701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGrdWVEeU4Ptbj/O5LlMCmxq+nbCGI8+4U1HKBQ0dew=;
        b=s+Qve3EOcI8JzWnyv3nr7h7jxN4lyYNxmE1CEAfmKnz5i4aOVRWqb9K0nk4t01UsYl
         ddatzHuDcb72sknkOb3UlpH+h9WQbCLI/Oz7kgmV91gHcGlYCeKn/6lkH2KmM04o/L/8
         QABfPz1JsE3Jd703wjKQpkklRZHI4GK0EvNnM7QEProBwkFXCkafedIM1dayGgMq6Tmw
         DW8L+VyTCNUy1m0jT+MTU6F6Spxnj5iSMZxnQPh2M8zdmt/kj6nPDrir7DUIGps2gm+v
         q0U5jcWy/gv8FnfzI29MStSBKcs3mQ6TX5wvHeFFLPadMVuPKwM3xae9ajro9q5OvFZB
         9WYA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSI8sIT7VKBwooaJYDKPkDl9p85r0e7ikqoNrRKh/41o1X0l+5+rDSxT9o/m1yc59nANo2QrZ6XHm@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIN6gpuVYOxTahZq8yXfI4Y4vqDrz4WD2G9c/3I/7J8Rv7NYM
	9nmHegQRjDGVSxE1x6LQ/g6F8YSaUqsYu1cMnnRHPBRyraN8l6y0lpKom4FsAXk9cdvTkS34iuV
	q3NF/wDhaLA==
X-Google-Smtp-Source: AGHT+IEgsXbDoolH8oLFMalWBy0djT9uJM60zMy+Lo0ErgHawFZLEGOSZUiE5P0d6bxzOZZfpK4Vh92Jd6K16A==
X-Received: from wmrn43.prod.google.com ([2002:a05:600c:502b:b0:434:a9bd:e68c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f81:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-436e2531ec8mr120237105e9.0.1736534506703;
 Fri, 10 Jan 2025 10:41:46 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:53 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-27-8419288bc805@google.com>
Subject: [PATCH RFC v2 27/29] mm: asi: Add some mitigations on address space transitions
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Here we ASI actually starts becoming a real exploit mitigation,

On CPUs with L1TF, flush L1D when the ASI data taints say so.

On all CPUs, do some general branch predictor clearing
whenever the control taints say so.

This policy is very much just a starting point for discussion.
Primarily it's a vague gesture at the fact that there is leeway
in how ASI is used: it can be used to target CPU-specific issues (as
is the case for L1TF here), or it can be used as a fairly broad
mitigation (asi_maybe_flush_control() mitigates several known
Spectre-style attacks and very likely also some unknown ones).

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/nospec-branch.h |  2 ++
 arch/x86/kvm/vmx/vmx.c               |  1 +
 arch/x86/lib/l1tf.c                  |  2 ++
 arch/x86/lib/retpoline.S             | 10 ++++++++++
 arch/x86/mm/asi.c                    | 29 +++++++++++++++++++++--------
 5 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index 96b410b1d4e841eb02f53a4691ee794ceee4ad2c..4582fb1fb42f6fd226534012d969ed13085e943a 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -614,6 +614,8 @@ static __always_inline void mds_idle_clear_cpu_buffers(void)
 		mds_clear_cpu_buffers();
 }
 
+extern void fill_return_buffer(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_NOSPEC_BRANCH_H_ */
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b1a02f27b3abce0ef6ac448b66bef2c653a52eef..a532783caaea97291cd92a2e2cac617f74f76c7e 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6635,6 +6635,7 @@ int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
 	return ret;
 }
 
+/* Must be reentrant, for use by vmx_post_asi_enter. */
 static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 {
 	/*
diff --git a/arch/x86/lib/l1tf.c b/arch/x86/lib/l1tf.c
index c474f18ae331c8dfa7a029c457dd3cf75bebf808..ffe1c3d0ef43ff8f1781f2e446aed041f4ce3179 100644
--- a/arch/x86/lib/l1tf.c
+++ b/arch/x86/lib/l1tf.c
@@ -46,6 +46,8 @@ EXPORT_SYMBOL(l1tf_flush_setup);
  *  - may or may not work on other CPUs.
  *
  * Don't call unless l1tf_flush_setup() has returned successfully.
+ *
+ * Must be reentrant, for use by ASI.
  */
 noinstr void l1tf_flush(void)
 {
diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index 391059b2c6fbc4a571f0582c7c4654147a930cef..6d126fff6bf839889086fe21464d8af07316d7e5 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -396,3 +396,13 @@ SYM_CODE_END(__x86_return_thunk)
 EXPORT_SYMBOL(__x86_return_thunk)
 
 #endif /* CONFIG_MITIGATION_RETHUNK */
+
+.pushsection .noinstr.text, "ax"
+SYM_CODE_START(fill_return_buffer)
+	UNWIND_HINT_FUNC
+	ENDBR
+	__FILL_RETURN_BUFFER(%_ASM_AX,RSB_CLEAR_LOOPS)
+	RET
+SYM_CODE_END(fill_return_buffer)
+__EXPORT_THUNK(fill_return_buffer)
+.popsection
diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index 1e9dc568e79e8686a4dbf47f765f2c2535d025ec..f10f6614b26148e5ba423d8a44f640674573ee40 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -10,6 +10,7 @@
 
 #include <asm/cmdline.h>
 #include <asm/cpufeature.h>
+#include <asm/l1tf.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -38,6 +39,8 @@ struct asi __asi_global_nonsensitive = {
 	.mm = &init_mm,
 };
 
+static bool do_l1tf_flush __ro_after_init;
+
 static inline bool asi_class_id_valid(enum asi_class_id class_id)
 {
 	return class_id >= 0 && class_id < ASI_MAX_NUM_CLASSES;
@@ -361,6 +364,15 @@ static int __init asi_global_init(void)
 	asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
 		      VMEMMAP_START + (1UL << PGDIR_SHIFT));
 
+	if (boot_cpu_has_bug(X86_BUG_L1TF)) {
+		int err = l1tf_flush_setup();
+
+		if (err)
+			pr_warn("Failed to setup L1TF flushing for ASI (%pe)", ERR_PTR(err));
+		else
+			do_l1tf_flush = true;
+	}
+
 #ifdef CONFIG_PM_SLEEP
 	register_syscore_ops(&asi_syscore_ops);
 #endif
@@ -512,10 +524,12 @@ static __always_inline void maybe_flush_control(struct asi *next_asi)
 	if (!taints)
 		return;
 
-	/*
-	 * This is where we'll do the actual dirty work of clearing uarch state.
-	 * For now we just pretend, clear the taints.
-	 */
+	/* Clear normal indirect branch predictions, if we haven't */
+	if (cpu_feature_enabled(X86_FEATURE_IBPB))
+		__wrmsr(MSR_IA32_PRED_CMD, PRED_CMD_IBPB, 0);
+
+	fill_return_buffer();
+
 	this_cpu_and(asi_taints, ~ASI_TAINTS_CONTROL_MASK);
 }
 
@@ -536,10 +550,9 @@ static __always_inline void maybe_flush_data(struct asi *next_asi)
 	if (!taints)
 		return;
 
-	/*
-	 * This is where we'll do the actual dirty work of clearing uarch state.
-	 * For now we just pretend, clear the taints.
-	 */
+	if (do_l1tf_flush)
+		l1tf_flush();
+
 	this_cpu_and(asi_taints, ~ASI_TAINTS_DATA_MASK);
 }
 

-- 
2.47.1.613.gc27f4b7a9f-goog


