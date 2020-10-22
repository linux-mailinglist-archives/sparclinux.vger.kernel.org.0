Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8398D295BA1
	for <lists+sparclinux@lfdr.de>; Thu, 22 Oct 2020 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508500AbgJVJWI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 22 Oct 2020 05:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505914AbgJVJWH (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 22 Oct 2020 05:22:07 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC827C0613CE;
        Thu, 22 Oct 2020 02:22:06 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id f140so1039356ybg.3;
        Thu, 22 Oct 2020 02:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=E8c47w+BTD/T6AZbbILmA4WSN2gc0a6jc0dOWJ60pEc=;
        b=jBjGRU6eMUtUPEONUsaRqBnxbITyG8DG7fym8FfNe+FIFEoSjHGzmF6p2H+5SEF0+F
         C+2BZ2lB6K51P79WEW6yncr07vhR8gLkGXlqeaoWwnuUEbMDHWGhDmRuG9WhCLV5I/Cg
         DZ3woNYWo11pbTEVGzwwRWzgJfipLSrSNdBN1OBK07WSWH2U8mFnQ6hsyYKHohjMo9nV
         VRPZbVqaH5VXMxMjcPtbeaf1Vm4U3npYgMGLNAZTiqRvQGKro+SiTtAoWLM+kWEanuhl
         suIekCp71Sq5nTyGLtAwSc9DIBaIDUMYYZJ1l5y7P7lG1la9+XnZON+ugocB2o9qH0xO
         hgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=E8c47w+BTD/T6AZbbILmA4WSN2gc0a6jc0dOWJ60pEc=;
        b=McT5HcwCiSDnmk5/m9c/6w0OQ31VwEI9ZMufk5nYFOYC4WgaR8qMWhxJKV5siPtBhb
         gds8usli3o7WO5Edx7VXvBjc8O5owfKXupTYA579JfJdUDLhq0J4gobVW9je+uSkrq0D
         a4Ce5HRUxGVpbBrUdaQvvw4UpQhzr74KONHjGiILk5ijjx8KnFZjQu1ouRYc9Kcup2CW
         XGUi7aWutcfOjCAJorx5fMcVd1gTop2VdPJz7o4L77pBc/Hc9PnF0FwyX6LfG9/YLjzb
         mAkhZwXQmnWUmDseaHPdjIyvIF+Q3VzJ+U6pkQoUheGL88fWp7AVpo39wNHMwJ3HflGT
         u08A==
X-Gm-Message-State: AOAM533FETglCOMYURYtxtDR/0jdSSI9n0dWMQDeCmlh2lDteC+Pr8Te
        /jIfTRG7g1CU2l88m67CVg5xbsjS5aBqNvVLFOODHpOt0VwjtA==
X-Google-Smtp-Source: ABdhPJx6GGrTETCHK5BDEmYNn56hjNf+uYCQaeRk9iyWHPMnpZzhClrr8XczxBcAVCpUC/TdEjSorGyoTX0dXUUlJug=
X-Received: by 2002:a25:344d:: with SMTP id b74mr1936426yba.500.1603358525956;
 Thu, 22 Oct 2020 02:22:05 -0700 (PDT)
MIME-Version: 1.0
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Thu, 22 Oct 2020 12:21:55 +0300
Message-ID: <CADxRZqwQ_nvbGrzDzOjzt=R5x6yvsU4AujhpxXYs8cHFwoCjmA@mail.gmail.com>
Subject: [sparc64] lockdep: Fix lockdep recursion - call trace
To:     Linux Kernel list <linux-kernel@vger.kernel.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello!

Bisected the following linux calltrace after v5.9 :

[    8.650198] systemd[1]: Started Journal Service.
[    9.028125] ------------[ cut here ]------------
[    9.028171] WARNING: CPU: 11 PID: 499 at
net/netfilter/nf_tables_api.c:622 nft_chain_parse_hook+0x7c/0x360
[nf_tables]
[    9.028185] Modules linked in: nf_tables nfnetlink sunrpc ip_tables
x_tables ipv6 crc_ccitt autofs4 ext4 crc16 mbcache jbd2 raid10 raid456
async_raid6_recov async_mem
cpy async_pq async_xor xor async_tx raid6_pq raid1 raid0 multipath
linear md_mod crc32c_sparc64
[    9.028243] CPU: 11 PID: 499 Comm: nft Tainted: G        W
5.9.0-rc8-00209-gbaffd723e44d #111
[    9.028255] Call Trace:
[    9.028269] [<00000000004727e8>] __warn+0xa8/0x120
[    9.028278] [<0000000000472c20>] warn_slowpath_fmt+0x34/0x74
[    9.028291] [<00000000100c19fc>] nft_chain_parse_hook+0x7c/0x360 [nf_tables]
[    9.028305] [<00000000100c4ca8>]
nf_tables_addchain.constprop.0+0x48/0x5a0 [nf_tables]
[    9.028320] [<00000000100c5908>] nf_tables_newchain+0x708/0x820 [nf_tables]
[    9.028331] [<00000000100ae9c4>] nfnetlink_rcv_batch+0x4a4/0x780 [nfnetlink]
[    9.028341] [<00000000100aedb0>] nfnetlink_rcv+0x110/0x140 [nfnetlink]
[    9.028353] [<0000000000b2acb0>] netlink_unicast+0x150/0x2a0
[    9.028362] [<0000000000b2bc1c>] netlink_sendmsg+0x3dc/0x460
[    9.028374] [<0000000000a96f14>] sock_sendmsg+0x34/0x80
[    9.028382] [<0000000000a985ec>] ____sys_sendmsg+0x1ac/0x220
[    9.028392] [<0000000000a9a688>] ___sys_sendmsg+0x48/0x80
[    9.028400] [<0000000000a9a768>] __sys_sendmsg+0x48/0x80
[    9.028409] [<0000000000a9a7b8>] sys_sendmsg+0x18/0x40
[    9.028419] [<00000000004062b4>] linux_sparc_syscall+0x34/0x44
[    9.028428] irq event stamp: 0
[    9.028437] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    9.028447] hardirqs last disabled at (0): [<00000000004703f8>]
copy_process+0x738/0x1840
[    9.028459] softirqs last  enabled at (0): [<00000000004703f8>]
copy_process+0x738/0x1840
[    9.028470] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    9.028479] ---[ end trace 87e5247a47db0aa8 ]---
[   10.691838] sha1_sparc64: Using sparc64 sha1 opcode optimized SHA-1
implementation


git commit id:

$ git bisect good
4d004099a668c41522242aa146a38cc4eb59cb1e is the first bad commit
commit 4d004099a668c41522242aa146a38cc4eb59cb1e
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Fri Oct 2 11:04:21 2020 +0200

    lockdep: Fix lockdep recursion

    Steve reported that lockdep_assert*irq*(), when nested inside lockdep
    itself, will trigger a false-positive.

    One example is the stack-trace code, as called from inside lockdep,
    triggering tracing, which in turn calls RCU, which then uses
    lockdep_assert_irqs_disabled().

    Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context}
to per-cpu variables")
    Reported-by: Steven Rostedt <rostedt@goodmis.org>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

 include/linux/lockdep.h  | 13 ++++---
 kernel/locking/lockdep.c | 99 +++++++++++++++++++++++++++++-------------------
 2 files changed, 67 insertions(+), 45 deletions(-)



full bisect log:


$ git bisect log
git bisect start
# bad: [7cf726a59435301046250c42131554d9ccc566b8] Merge tag
'linux-kselftest-kunit-5.10-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
git bisect bad 7cf726a59435301046250c42131554d9ccc566b8
# good: [bbf5c979011a099af5dc76498918ed7df445635b] Linux 5.9
git bisect good bbf5c979011a099af5dc76498918ed7df445635b
# bad: [726eb70e0d34dc4bc4dada71f52bba8ed638431e] Merge tag
'char-misc-5.10-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect bad 726eb70e0d34dc4bc4dada71f52bba8ed638431e
# bad: [527f6750d92beb9c787d8aba48477b1e834d64e5] kasan: remove
mentions of unsupported Clang versions
git bisect bad 527f6750d92beb9c787d8aba48477b1e834d64e5
# bad: [647412daeb454b6dad12a6c6961ab90aac9e5d29] Merge tag
'mmc-v5.10' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
git bisect bad 647412daeb454b6dad12a6c6961ab90aac9e5d29
# bad: [3bff6112c80cecb76af5fe485506f96e8adb6122] Merge tag
'perf-core-2020-10-12' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 3bff6112c80cecb76af5fe485506f96e8adb6122
# good: [f5f59336a9ae8f683772d6b8cb2d6732b5e567ea] Merge tag
'timers-core-2020-10-12' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good f5f59336a9ae8f683772d6b8cb2d6732b5e567ea
# good: [edaa5ddf3833669a25654d42c0fb653dfdd906df] Merge tag
'sched-core-2020-10-12' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good edaa5ddf3833669a25654d42c0fb653dfdd906df
# bad: [e6412f9833db23740ee848ab3d6e7af18dff82a6] Merge tag
'efi-core-2020-10-12' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad e6412f9833db23740ee848ab3d6e7af18dff82a6
# bad: [e705d397965811ac528d7213b42d74ffe43caf38] Merge branch
'locking/urgent' into locking/core, to pick up fixes
git bisect bad e705d397965811ac528d7213b42d74ffe43caf38
# good: [ad56450db86413ff911eb527b5a49e04a4345e61] locking/selftest:
Add test cases for queued_read_lock()
git bisect good ad56450db86413ff911eb527b5a49e04a4345e61
# good: [5cdd25572a29e46f932d3e6eedbd07429de66431] seqlock: Use unique
prefix for seqcount_t property accessors
git bisect good 5cdd25572a29e46f932d3e6eedbd07429de66431
# good: [6d1823ccc480866e571ab1206665d693aeb600cf] lockdep: Optimize
the memory usage of circular queue
git bisect good 6d1823ccc480866e571ab1206665d693aeb600cf
# bad: [baffd723e44dc3d7f84f0b8f1fe1ece00ddd2710] lockdep: Revert
"lockdep: Use raw_cpu_*() for per-cpu variables"
git bisect bad baffd723e44dc3d7f84f0b8f1fe1ece00ddd2710
# bad: [4d004099a668c41522242aa146a38cc4eb59cb1e] lockdep: Fix lockdep recursion
git bisect bad 4d004099a668c41522242aa146a38cc4eb59cb1e
# good: [2bb8945bcc1a768f2bc402a16c9610bba8d5187d] lockdep: Fix
usage_traceoverflow
git bisect good 2bb8945bcc1a768f2bc402a16c9610bba8d5187d
# first bad commit: [4d004099a668c41522242aa146a38cc4eb59cb1e]
lockdep: Fix lockdep recursion
