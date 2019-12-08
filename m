Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121301162AA
	for <lists+sparclinux@lfdr.de>; Sun,  8 Dec 2019 16:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfLHO7g (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 8 Dec 2019 09:59:36 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:36850 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfLHO6v (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 8 Dec 2019 09:58:51 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1idy17-0000Sn-5T; Sun, 08 Dec 2019 15:58:37 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id C89831C2884;
        Sun,  8 Dec 2019 15:58:31 +0100 (CET)
Date:   Sun, 08 Dec 2019 14:58:31 -0000
From:   "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/rt, sparc: Use CONFIG_PREEMPTION
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        sparclinux@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191015191821.11479-20-bigeasy@linutronix.de>
References: <20191015191821.11479-20-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID: <157581711171.21853.11624347815991134047.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     85a683d0a6895026b535bf40643687c626e376f3
Gitweb:        https://git.kernel.org/tip/85a683d0a6895026b535bf40643687c626e376f3
Author:        Thomas Gleixner <tglx@linutronix.de>
AuthorDate:    Tue, 15 Oct 2019 21:18:06 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 08 Dec 2019 14:37:35 +01:00

sched/rt, sparc: Use CONFIG_PREEMPTION

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the trap code over to use CONFIG_PREEMPTION.

[bigeasy: +Kconfig]

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: David S. Miller <davem@davemloft.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: sparclinux@vger.kernel.org
Link: https://lore.kernel.org/r/20191015191821.11479-20-bigeasy@linutronix.de
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/sparc/Kconfig           | 2 +-
 arch/sparc/kernel/rtrap_64.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index eb24cb1..e8c3ea0 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -277,7 +277,7 @@ config US3_MC
 config GENERIC_LOCKBREAK
 	bool
 	default y
-	depends on SPARC64 && SMP && PREEMPT
+	depends on SPARC64 && SMP && PREEMPTION
 
 config NUMA
 	bool "NUMA support"
diff --git a/arch/sparc/kernel/rtrap_64.S b/arch/sparc/kernel/rtrap_64.S
index 29aa34f..c5fd4b4 100644
--- a/arch/sparc/kernel/rtrap_64.S
+++ b/arch/sparc/kernel/rtrap_64.S
@@ -310,7 +310,7 @@ kern_rtt_restore:
 		retry
 
 to_kernel:
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 		ldsw			[%g6 + TI_PRE_COUNT], %l5
 		brnz			%l5, kern_fpucheck
 		 ldx			[%g6 + TI_FLAGS], %l5
