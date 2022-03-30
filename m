Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6C74EC1E5
	for <lists+sparclinux@lfdr.de>; Wed, 30 Mar 2022 13:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345097AbiC3L5T (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 30 Mar 2022 07:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344823AbiC3Lxk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 30 Mar 2022 07:53:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C7627AD7A;
        Wed, 30 Mar 2022 04:49:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CE413B81ACC;
        Wed, 30 Mar 2022 11:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229C3C340F2;
        Wed, 30 Mar 2022 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648640975;
        bh=RjSZNy3L3dYQ/G9dL1KwuL4Jezy9ccoFqvzKxe/+VfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DOxj07y+dHMGmUCH59RlkUkRcxMYQHdWJg+4mT7ZFg1lu9af/aWMKqDxn7N05Gbz+
         r0daUnwsMDa1xCF4qSkfHfucf1HlJK7ApFkSn0m1SmMkCqDuxqwNjhAl7+Xbd0INl2
         ynuaNN9l0fDq7F4CXRONRj1Zq5ybKTVWjsMdtux0VaY5A4K9T+ibU5cAg5qlLK+SII
         IZX7qBdnsw6QznUhqr7vGGOoINEBKz/LW9eiQb29nrd+O/52t1POUbhvrMalrqXNqt
         u/DTFiNGmTLeDLfYDhmTXdeXs2Ns4Nf7o0JLwzV5+NIm+g2EWC80qVDozKUElQHF1y
         Zkg81ttFVugeg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Sasha Levin <sashal@kernel.org>, vgupta@synopsys.com,
        linux@armlinux.org.uk, peterz@infradead.org, mingo@redhat.com,
        acme@kernel.org, lftan@altera.com, benh@kernel.crashing.org,
        paulus@samba.org, mpe@ellerman.id.au, davem@davemloft.net,
        catalin.marinas@arm.com, gregkh@linuxfoundation.org,
        rmk+kernel@armlinux.org.uk, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 40/59] uaccess: fix type mismatch warnings from access_ok()
Date:   Wed, 30 Mar 2022 07:48:12 -0400
Message-Id: <20220330114831.1670235-40-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 23fc539e81295b14b50c6ccc5baeb4f3d59d822d ]

On some architectures, access_ok() does not do any argument type
checking, so replacing the definition with a generic one causes
a few warnings for harmless issues that were never caught before.

Fix the ones that I found either through my own test builds or
that were reported by the 0-day bot.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/process.c          |  2 +-
 arch/arm/kernel/swp_emulate.c      |  2 +-
 arch/arm/kernel/traps.c            |  2 +-
 arch/csky/kernel/perf_callchain.c  |  2 +-
 arch/csky/kernel/signal.c          |  2 +-
 arch/nios2/kernel/signal.c         | 20 +++++++++++---------
 arch/powerpc/lib/sstep.c           |  4 ++--
 arch/riscv/kernel/perf_callchain.c |  4 ++--
 arch/sparc/kernel/signal_32.c      |  2 +-
 lib/test_lockup.c                  |  4 ++--
 10 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 8e90052f6f05..5f7f5aab361f 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -43,7 +43,7 @@ SYSCALL_DEFINE0(arc_gettls)
 	return task_thread_info(current)->thr_ptr;
 }
 
-SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
+SYSCALL_DEFINE3(arc_usr_cmpxchg, int __user *, uaddr, int, expected, int, new)
 {
 	struct pt_regs *regs = current_pt_regs();
 	u32 uval;
diff --git a/arch/arm/kernel/swp_emulate.c b/arch/arm/kernel/swp_emulate.c
index 6166ba38bf99..b74bfcf94fb1 100644
--- a/arch/arm/kernel/swp_emulate.c
+++ b/arch/arm/kernel/swp_emulate.c
@@ -195,7 +195,7 @@ static int swp_handler(struct pt_regs *regs, unsigned int instr)
 		 destreg, EXTRACT_REG_NUM(instr, RT2_OFFSET), data);
 
 	/* Check access in reasonable access range for both SWP and SWPB */
-	if (!access_ok((address & ~3), 4)) {
+	if (!access_ok((void __user *)(address & ~3), 4)) {
 		pr_debug("SWP{B} emulation: access to %p not allowed!\n",
 			 (void *)address);
 		res = -EFAULT;
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 90c887aa67a4..f74460d3bef5 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -575,7 +575,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
 	if (end < start || flags)
 		return -EINVAL;
 
-	if (!access_ok(start, end - start))
+	if (!access_ok((void __user *)start, end - start))
 		return -EFAULT;
 
 	return __do_cache_op(start, end);
diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
index 35318a635a5f..75e1f9df5f60 100644
--- a/arch/csky/kernel/perf_callchain.c
+++ b/arch/csky/kernel/perf_callchain.c
@@ -49,7 +49,7 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe buftail;
 	unsigned long lr = 0;
-	unsigned long *user_frame_tail = (unsigned long *)fp;
+	unsigned long __user *user_frame_tail = (unsigned long __user *)fp;
 
 	/* Check accessibility of one struct frame_tail beyond */
 	if (!access_ok(user_frame_tail, sizeof(buftail)))
diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
index c7b763d2f526..8867ddf3e6c7 100644
--- a/arch/csky/kernel/signal.c
+++ b/arch/csky/kernel/signal.c
@@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
 static int
 setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 {
-	struct rt_sigframe *frame;
+	struct rt_sigframe __user *frame;
 	int err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
diff --git a/arch/nios2/kernel/signal.c b/arch/nios2/kernel/signal.c
index 2009ae2d3c3b..386e46443b60 100644
--- a/arch/nios2/kernel/signal.c
+++ b/arch/nios2/kernel/signal.c
@@ -36,10 +36,10 @@ struct rt_sigframe {
 
 static inline int rt_restore_ucontext(struct pt_regs *regs,
 					struct switch_stack *sw,
-					struct ucontext *uc, int *pr2)
+					struct ucontext __user *uc, int *pr2)
 {
 	int temp;
-	unsigned long *gregs = uc->uc_mcontext.gregs;
+	unsigned long __user *gregs = uc->uc_mcontext.gregs;
 	int err;
 
 	/* Always make any pending restarted system calls return -EINTR */
@@ -102,10 +102,11 @@ asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
 {
 	struct pt_regs *regs = (struct pt_regs *)(sw + 1);
 	/* Verify, can we follow the stack back */
-	struct rt_sigframe *frame = (struct rt_sigframe *) regs->sp;
+	struct rt_sigframe __user *frame;
 	sigset_t set;
 	int rval;
 
+	frame = (struct rt_sigframe __user *) regs->sp;
 	if (!access_ok(frame, sizeof(*frame)))
 		goto badframe;
 
@@ -124,10 +125,10 @@ asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
 	return 0;
 }
 
-static inline int rt_setup_ucontext(struct ucontext *uc, struct pt_regs *regs)
+static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *regs)
 {
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
-	unsigned long *gregs = uc->uc_mcontext.gregs;
+	unsigned long __user *gregs = uc->uc_mcontext.gregs;
 	int err = 0;
 
 	err |= __put_user(MCONTEXT_VERSION, &uc->uc_mcontext.version);
@@ -162,8 +163,9 @@ static inline int rt_setup_ucontext(struct ucontext *uc, struct pt_regs *regs)
 	return err;
 }
 
-static inline void *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
-				 size_t frame_size)
+static inline void __user *get_sigframe(struct ksignal *ksig,
+					struct pt_regs *regs,
+					size_t frame_size)
 {
 	unsigned long usp;
 
@@ -174,13 +176,13 @@ static inline void *get_sigframe(struct ksignal *ksig, struct pt_regs *regs,
 	usp = sigsp(usp, ksig);
 
 	/* Verify, is it 32 or 64 bit aligned */
-	return (void *)((usp - frame_size) & -8UL);
+	return (void __user *)((usp - frame_size) & -8UL);
 }
 
 static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 			  struct pt_regs *regs)
 {
-	struct rt_sigframe *frame;
+	struct rt_sigframe __user *frame;
 	int err = 0;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index b042fcae3913..66d6f7003b18 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -112,9 +112,9 @@ static nokprobe_inline long address_ok(struct pt_regs *regs,
 {
 	if (!user_mode(regs))
 		return 1;
-	if (__access_ok(ea, nb))
+	if (access_ok((void __user *)ea, nb))
 		return 1;
-	if (__access_ok(ea, 1))
+	if (access_ok((void __user *)ea, 1))
 		/* Access overlaps the end of the user region */
 		regs->dar = TASK_SIZE_MAX - 1;
 	else
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 8ecfc4c128bc..7052a59c418f 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -15,8 +15,8 @@ static unsigned long user_backtrace(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe buftail;
 	unsigned long ra = 0;
-	unsigned long *user_frame_tail =
-			(unsigned long *)(fp - sizeof(struct stackframe));
+	unsigned long __user *user_frame_tail =
+		(unsigned long __user *)(fp - sizeof(struct stackframe));
 
 	/* Check accessibility of one struct frame_tail beyond */
 	if (!access_ok(user_frame_tail, sizeof(buftail)))
diff --git a/arch/sparc/kernel/signal_32.c b/arch/sparc/kernel/signal_32.c
index ffab16369bea..74f80443b195 100644
--- a/arch/sparc/kernel/signal_32.c
+++ b/arch/sparc/kernel/signal_32.c
@@ -65,7 +65,7 @@ struct rt_signal_frame {
  */
 static inline bool invalid_frame_pointer(void __user *fp, int fplen)
 {
-	if ((((unsigned long) fp) & 15) || !__access_ok((unsigned long)fp, fplen))
+	if ((((unsigned long) fp) & 15) || !access_ok(fp, fplen))
 		return true;
 
 	return false;
diff --git a/lib/test_lockup.c b/lib/test_lockup.c
index 906b598740a7..6a0f329a794a 100644
--- a/lib/test_lockup.c
+++ b/lib/test_lockup.c
@@ -417,8 +417,8 @@ static bool test_kernel_ptr(unsigned long addr, int size)
 		return false;
 
 	/* should be at least readable kernel address */
-	if (access_ok(ptr, 1) ||
-	    access_ok(ptr + size - 1, 1) ||
+	if (access_ok((void __user *)ptr, 1) ||
+	    access_ok((void __user *)ptr + size - 1, 1) ||
 	    get_kernel_nofault(buf, ptr) ||
 	    get_kernel_nofault(buf, ptr + size - 1)) {
 		pr_err("invalid kernel ptr: %#lx\n", addr);
-- 
2.34.1

