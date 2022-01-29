Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFAB4A2EE9
	for <lists+sparclinux@lfdr.de>; Sat, 29 Jan 2022 13:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344472AbiA2MSR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 29 Jan 2022 07:18:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47708 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344556AbiA2MSP (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 29 Jan 2022 07:18:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8E48AB827B3;
        Sat, 29 Jan 2022 12:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F728C340F7;
        Sat, 29 Jan 2022 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643458692;
        bh=+ZSwjBDg5xL5gQ62/b1ZJaRA8ekyLRJoBOu+qchGA50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KLPWnlGtXV4lGjuOC8QhEjaQuGi12f9Cg8WBiTrKtFhnx/gzJXrx+/Yx6KVCGLEtg
         GiNGsqCzBe8lvfCk+dJJgpYCZ7e5XaT5I3P6d6dTdG71f8k3lNLD4dmaANlDe4DxEh
         4Ve4gWE5K8VLoaA1ev3Bh3wn53sbAfYu7COpj87OUnJLJnmVJynHWXbNwSJHNGg8nH
         hxTDFdBxT88EpnOMDsePoaFxc5yCCNLyUjmrdVnWg3dOT2DCxpNjuY/rQbBkjZuTcQ
         UMw7okyI5RmHE2S/vLo3urFn8qJ5wJEzREi9HTrgKks0zqJtc4fSpra5tBuATvbfXn
         DHuKCEJytKIRg==
From:   guoren@kernel.org
To:     guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
        anup@brainfault.org, gregkh@linuxfoundation.org,
        liush@allwinnertech.com, wefu@redhat.com, drew@beagleboard.org,
        wangjunqiang@iscas.ac.cn, hch@lst.de, hch@infradead.org
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 04/17] syscalls: compat: Fix the missing part for __SYSCALL_COMPAT
Date:   Sat, 29 Jan 2022 20:17:15 +0800
Message-Id: <20220129121728.1079364-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

Make "uapi asm unistd.h" could be used for architectures' COMPAT
mode. The __SYSCALL_COMPAT is first used in riscv.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/asm-generic/unistd.h       | 4 ++--
 tools/include/uapi/asm-generic/unistd.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 1c48b0ae3ba3..45fa180cc56a 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
 
 /* kernel/ptrace.c */
 #define __NR_ptrace 117
-__SYSCALL(__NR_ptrace, sys_ptrace)
+__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
 
 /* kernel/sched/core.c */
 #define __NR_sched_setparam 118
@@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
 #define __NR_kexec_file_load 294
 __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
-#if __BITS_PER_LONG == 32
+#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
 __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
-- 
2.25.1

