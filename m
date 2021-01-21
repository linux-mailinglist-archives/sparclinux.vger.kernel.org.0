Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3102FE3E5
	for <lists+sparclinux@lfdr.de>; Thu, 21 Jan 2021 08:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbhAUH1R (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 21 Jan 2021 02:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbhAUHZM (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 21 Jan 2021 02:25:12 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638EDC061757
        for <sparclinux@vger.kernel.org>; Wed, 20 Jan 2021 23:24:31 -0800 (PST)
Received: (qmail 16413 invoked from network); 21 Jan 2021 07:23:45 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:42734 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <sparclinux@vger.kernel.org>; Thu, 21 Jan 2021 08:23:45 +0100
MIME-Version: 1.0
Date:   Thu, 21 Jan 2021 08:23:44 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     sparclinux@vger.kernel.org
Subject: Re: soft lockups on T5120
In-Reply-To: <65a62b7c6e752dfb1b46624aa579d5e2@sf-tec.de>
References: <65a62b7c6e752dfb1b46624aa579d5e2@sf-tec.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d9e79cfa4b80373e2c54e1358d110335@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Am 2021-01-13 09:51, schrieb Rolf Eike Beer:
> Every one ine a while my T5120 locks up, i.e. some processes get stuck 
> forever.
> Starting new screen sessions or logging in via SSH luckily still works, 
> but I
> can't get it to properly reboot. Sync via sysrq has worked today which 
> is quite
> nice, but the software RAID still needs rebuild :/
> 
> This usually happens when I torture the machine with parallel builds
> and testsuites
> when doing package stabilizations for Gentoo.
> 
> The kernel currently is 5.10.3, but I hit this for quite a while
> 
> Here is what came out of dmesg today. I found no signs of trouble
> earlier than this:

And here it is again:

[667028.274283] many-headers[40569]: segfault at 0 ip 00000000700007c0 
(rpc 000000007000073c) sp 00000000ff9eddf8 error 1 in 
many-headers[70000000+2000]
[671105.790298] rcu: INFO: rcu_sched self-detected stall on CPU
[671105.790512] rcu:    24-....: (2099 ticks this GP) 
idle=c3a/1/0x4000000000000002 softirq=12392985/12392985 fqs=1033
[671105.790709]         (t=2100 jiffies g=37879413 q=5992)
[671105.790859] * CPU[ 24]: TSTATE[0000000080001601] 
TPC[000000000040770c] TNPC[0000000000407710] TASK[ctest:50100]
[671105.791083]              TPC[sparc64_realfault_common+0x8/0x20] 
O7[sparc64_realfault_common+0x10/0x20] I7[0xf76e6e3c] 
RPC[do_signal+0x1a0/0x560]
[671168.853244] rcu: INFO: rcu_sched self-detected stall on CPU
[671168.853475] rcu:    24-....: (8402 ticks this GP) 
idle=c3a/1/0x4000000000000002 softirq=12392985/12392985 fqs=4100
[671168.853684]         (t=8403 jiffies g=37879413 q=64804)
[671168.853843] * CPU[ 24]: TSTATE[0000000080001601] 
TPC[000000000040770c] TNPC[0000000000407710] TASK[ctest:50100]
[671168.854072]              TPC[sparc64_realfault_common+0x8/0x20] 
O7[sparc64_realfault_common+0x10/0x20] I7[0xf76e6e3c] 
RPC[do_signal+0x1a0/0x560]
[671231.926163] rcu: INFO: rcu_sched self-detected stall on CPU
[671231.926395] rcu:    24-....: (14706 ticks this GP) 
idle=c3a/1/0x4000000000000002 softirq=12392985/12392985 fqs=6738
[671231.926610]         (t=14707 jiffies g=37879413 q=82515)
[671231.926781] * CPU[ 24]: TSTATE[0000000080001602] 
TPC[0000000000af61e0] TNPC[0000000000af61e4] TASK[ctest:50100]
[671231.927033]              TPC[do_sparc64_fault+0x340/0x820] 
O7[do_sparc64_fault+0x56c/0x820] I7[sparc64_realfault_common+0x10/0x20] 
RPC[0xf76e6e3c]
[671277.260094] INFO: task khugepaged:337 blocked for more than 122 
seconds.
[671277.260277]       Not tainted 5.10.3-gentoo-sparc64 #1
[671277.260399] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[671277.260528] task:khugepaged      state:D stack:    0 pid:  337 ppid: 
     2 flags:0x01000000
[671277.260666] Call Trace:
[671277.260765] [<0000000000af0ae0>] schedule+0x40/0xe0
[671277.260898] [<0000000000af4018>] schedule_timeout+0x1f8/0x380
[671277.261028] [<0000000000af1c80>] wait_for_completion+0x60/0xc0
[671277.261163] [<000000000047de70>] __flush_work.isra.0+0xf0/0x220
[671277.261234] [<0000000000597954>] lru_add_drain_all+0x1b4/0x240
[671277.261306] [<00000000006052c4>] khugepaged+0x44/0x1e40
[671277.261377] [<0000000000485a04>] kthread+0x104/0x120
[671277.261453] [<00000000004060c8>] ret_from_fork+0x1c/0x2c
[671277.261520] [<0000000000000000>] 0x0
[671277.261605] INFO: task md127_raid1:1100 blocked for more than 122 
seconds.
[671277.261673]       Not tainted 5.10.3-gentoo-sparc64 #1
[671277.261737] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[671277.261806] task:md127_raid1     state:D stack:    0 pid: 1100 ppid: 
     2 flags:0x01000000
[671277.261883] Call Trace:
[671277.261939] [<0000000000af0ae0>] schedule+0x40/0xe0
[671277.262018] [<00000000007a3694>] 
percpu_ref_switch_to_atomic_sync+0x34/0x80
[671277.262097] [<00000000009199e0>] set_in_sync+0x40/0xe0
[671277.262168] [<0000000000928280>] md_check_recovery+0x520/0x5c0
[671277.262242] [<00000000008f17f4>] raid1d+0x14/0x1380
[671277.262313] [<000000000091a54c>] md_thread+0xac/0x1a0
[671277.262382] [<0000000000485a04>] kthread+0x104/0x120
[671277.262453] [<00000000004060c8>] ret_from_fork+0x1c/0x2c
[671277.262519] [<0000000000000000>] 0x0
[671277.262601] INFO: task jbd2/dm-0-8:1208 blocked for more than 122 
seconds.
[671277.262670]       Not tainted 5.10.3-gentoo-sparc64 #1

and so on.
