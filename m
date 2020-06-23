Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EAE204C94
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jun 2020 10:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbgFWIjZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 23 Jun 2020 04:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731579AbgFWIjY (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 23 Jun 2020 04:39:24 -0400
Received: from merlin.infradead.org (unknown [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E40DC061795;
        Tue, 23 Jun 2020 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
        Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:In-Reply-To;
        bh=r7kYVRvusVdUwun3DZAVv4nSToA3uL0FY5bqOSQAeOo=; b=RppIjQJbnhKw6hv4uYphrIxc3+
        N0EqWgLyPJZLdgxpHClB24tvJGF+wtFFQHMl5PWRy6kV9RavSp1CMYmLJBGGGRZi4sw8vp32XPkv7
        SHubqehf0RRZ8DDDZuaD8Dz8W+eHTE+67r7+h613fADQaP21NcMP0y1Nk2LtkocaW0OeIJnQuU8+I
        aANs9jyYApe+FGYwAyZVwIZZAo039AUU2PwWSvikadXycLGCwPAJcBJH0zIKc+ey4CR2PWufiTCTp
        luP7l3MPzS3YUCkYZdRrM87oUIP/GgrZDUg52VGyCuYIgEciaghWmzd66F8BqWJ5okm7seM6DOavi
        /kzuUF5g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jneS5-0005Rl-Dq; Tue, 23 Jun 2020 08:38:45 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 149733074EB;
        Tue, 23 Jun 2020 10:38:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
        id E325B237095FA; Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Message-ID: <20200623083721.277992771@infradead.org>
User-Agent: quilt/0.66
Date:   Tue, 23 Jun 2020 10:36:48 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     mingo@kernel.org, will@kernel.org, tglx@linutronix.de
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        a.darwish@linutronix.de, rostedt@goodmis.org,
        bigeasy@linutronix.de, peterz@infradead.org, davem@davemloft.net,
        sparclinux@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, heiko.carstens@de.ibm.com,
        linux-s390@vger.kernel.org, linux@armlinux.org.uk
Subject: [PATCH v4 3/8] sparc64: Fix asm/percpu.h build error
References: <20200623083645.277342609@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

In order to break a header dependency between lockdep and task_struct,
I need per-cpu stuff from lockdep.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/sparc/include/asm/percpu_64.h  |    2 ++
 arch/sparc/include/asm/trap_block.h |    2 ++
 2 files changed, 4 insertions(+)

--- a/arch/sparc/include/asm/percpu_64.h
+++ b/arch/sparc/include/asm/percpu_64.h
@@ -4,7 +4,9 @@
 
 #include <linux/compiler.h>
 
+#ifndef BUILD_VDSO
 register unsigned long __local_per_cpu_offset asm("g5");
+#endif
 
 #ifdef CONFIG_SMP
 
--- a/arch/sparc/include/asm/trap_block.h
+++ b/arch/sparc/include/asm/trap_block.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_TRAP_BLOCK_H
 #define _SPARC_TRAP_BLOCK_H
 
+#include <linux/threads.h>
+
 #include <asm/hypervisor.h>
 #include <asm/asi.h>
 


