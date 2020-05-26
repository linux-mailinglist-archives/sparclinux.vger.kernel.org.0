Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B43F19C01D
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 13:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388070AbgDBLY6 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 07:24:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:18251 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388012AbgDBLY6 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 2 Apr 2020 07:24:58 -0400
IronPort-SDR: lHpI9zu8JEA8vcFhDMqgf+EupcHbnWhjWgDftXOat73eeYTy/8oaLi8ZECumlKBcfbj7xcqGD8
 wZol5B6ECXbg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 04:24:57 -0700
IronPort-SDR: NExpZMTnsFmvznt/QpQaFz1M5Y2Osy2upIifAwKHqgdk3x8KRip4f86PjKZEn4eDWBIJIlGj4p
 U/iUyaf49Eyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="360168249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2020 04:24:56 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJxxz-00F9V1-7E; Thu, 02 Apr 2020 14:24:59 +0300
Date:   Thu, 2 Apr 2020 14:24:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Anatoly Pugachev <matorola@gmail.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [sparc64] OOPS after 'serial: core: Allow detach and attach
 serial device for console'
Message-ID: <20200402112459.GY1922688@smile.fi.intel.com>
References: <CADxRZqwHdRd=3fzr=-9hdR7_cW2VXXHwoySzbSpWx+aZ1S=ysA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADxRZqwHdRd=3fzr=-9hdR7_cW2VXXHwoySzbSpWx+aZ1S=ysA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Apr 02, 2020 at 02:00:51PM +0300, Anatoly Pugachev wrote:
> Hello!
> 
> Bisected the following call trace on kernel boot with linux sparc64
> debian sid LDOM:
> 

Thank you, I'm on it.

Briefly looking it among these lines

static inline void uart_port_spin_lock_init(struct uart_port *port)
{
	- if (uart_console_enabled(port))
	+ if (uart_console(port))

which reveals an issue in the sparc code.

I'm going to look further into it...
One question below, though.

> ...
> [    1.722396] des_sparc64: Using sparc64 des opcodes optimized DES
> implementation
> [    2.256609] camellia_sparc64: Using sparc64 camellia opcodes
> optimized CAMELLIA implementation
> [    2.460130] workingset: timestamp_bits=46 max_order=23 bucket_order=0
> [    2.478401] zbud: loaded
> [    2.480698] SGI XFS with ACLs, security attributes, quota, fatal
> assert, debug enabled
> [    2.486675] *** VALIDATE xfs ***
> [    2.501604] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 252)
> [    2.502560] io scheduler mq-deadline registered
> [    2.505276] f029b788: ttyHV0 at I/O 0x0 (irq = 1, base_baud =
> 115200) is a SUN4V HCONS

Also, this is funny address. Can you elaborate how is this working?

> [    2.505359] INFO: trying to register non-static key.
> [    2.505365] the code is fine but needs lockdep annotation.
> [    2.505371] turning off the locking correctness validator.
> [    2.505380] CPU: 16 PID: 1 Comm: swapper/0 Not tainted
> 5.6.0-rc5-00128-ga3cb39d258ef #55
> [    2.505388] Call Trace:
> [    2.505402]  [00000000004dbbd8] register_lock_class+0x278/0x720
> [    2.505410]  [00000000004d8930] __lock_acquire+0x90/0x2520
> [    2.505416]  [00000000004db74c] lock_acquire+0x1ac/0x1e0
> [    2.505426]  [0000000000b86404] _raw_spin_lock_irqsave+0x44/0x60
> [    2.505439]  [000000000097245c] uart_add_one_port+0x35c/0x500
> [    2.505447]  [0000000000977ee4] hv_probe+0x144/0x200
> [    2.505455]  [00000000009888f4] platform_drv_probe+0x34/0xa0
> [    2.505462]  [0000000000986414] really_probe+0x214/0x460
> [    2.505468]  [0000000000986b7c] driver_probe_device+0xfc/0x140
> [    2.505475]  [0000000000986e5c] device_driver_attach+0x3c/0x60
> [    2.505481]  [0000000000986fc8] __driver_attach+0x148/0x160
> [    2.505488]  [0000000000984b04] bus_for_each_dev+0x44/0xa0
> [    2.505495]  [0000000000986ffc] driver_attach+0x1c/0x40
> [    2.505501]  [0000000000985184] bus_add_driver+0x124/0x220
> [    2.505507]  [00000000009877a4] driver_register+0xc4/0x120
> [    2.505514]  [0000000000988860] __platform_driver_register+0x40/0x60
> [    2.506081] printk: console [ttyHV0] enabled
> [    2.507815] sunvdc.c:v1.2 (November 24, 2014)
> [    2.509338] sunvdc: Virtual Hard disk vdiskc
> ...
> 
> 
> Can someone look why it is started to print stack trace?
> 
> Thanks.
> 
> Full boot log files are at https://github.com/mator/sparc64-dmesg/
> 
> Full bisect log:
> 
> mator@ttip:~/linux-2.6$ git bisect bad
> a3cb39d258efef830181606134cfb0f7babe8c8e is the first bad commit
> commit a3cb39d258efef830181606134cfb0f7babe8c8e
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Mon Feb 17 13:40:12 2020 +0200
> 
>     serial: core: Allow detach and attach serial device for console
> 
>     In the future we would like to disable power management on the
> serial devices
>     used as kernel consoles to avoid weird behaviour in some cases. However,
>     disabling PM may prevent system to go to deep sleep states, which
> in its turn
>     leads to the higher power consumption.
> 
>     Tony Lindgren proposed a work around, i.e. allow user to detach
> such consoles
>     to make PM working again. In case user wants to see what's going on, it also
>     provides a mechanism to attach console back.
> 
>     Link: https://lists.openwall.net/linux-kernel/2018/09/29/65
>     Suggested-by: Tony Lindgren <tony@atomide.com>
>     Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>     Link: https://lore.kernel.org/r/20200217114016.49856-3-andriy.shevchenko@linux.intel.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  Documentation/ABI/testing/sysfs-tty |  7 +++++
>  drivers/tty/serial/serial_core.c    | 60 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 63 insertions(+), 4 deletions(-)
> mator@ttip:~/linux-2.6$
> 
> 
> mator@ttip:~/linux-2.6$ git bisect log
> git bisect start
> # bad: [1a323ea5356edbb3073dc59d51b9e6b86908857d] x86: get rid of
> 'errret' argument to __get_user_xyz() macross
> git bisect bad 1a323ea5356edbb3073dc59d51b9e6b86908857d
> # good: [458ef2a25e0cbdc216012aa2b9cf549d64133b08] Merge tag
> 'x86-timers-2020-03-30' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 458ef2a25e0cbdc216012aa2b9cf549d64133b08
> # good: [2efefb56f92689b2e216857834df69dd3ea47d2b] ice: use __le16
> types for explicitly Little Endian values
> git bisect good 2efefb56f92689b2e216857834df69dd3ea47d2b
> # bad: [1f944f976d7ef8a29d1ad296253d3a9387c58e62] Merge tag
> 'tty-5.7-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
> git bisect bad 1f944f976d7ef8a29d1ad296253d3a9387c58e62
> # good: [15c981d16d70e8a5be297fa4af07a64ab7e080ed] Merge tag
> 'for-5.7-tag' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> git bisect good 15c981d16d70e8a5be297fa4af07a64ab7e080ed
> # good: [dfabb077d62552797ca0ae7756cb30d3e195ead5] Merge tag
> 'mmc-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
> git bisect good dfabb077d62552797ca0ae7756cb30d3e195ead5
> # good: [058bc104f7ca5c83d81695ee96f03dbd93bae518] serial: 8250:
> Generalize rs485 software emulation
> git bisect good 058bc104f7ca5c83d81695ee96f03dbd93bae518
> # good: [5f3a48132412123135595fcbb2a760cfe626f592] Merge branch
> 'for-5.7-console-exit' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pmladek/printk into
> tty-next
> git bisect good 5f3a48132412123135595fcbb2a760cfe626f592
> # bad: [4bcf59a5dea0f4e768e2b84fc78ce13a7fb27863] serial: 8250:
> 8250_omap: Account for data in flight during DMA teardown
> git bisect bad 4bcf59a5dea0f4e768e2b84fc78ce13a7fb27863
> # bad: [caa47cc639470485ee0ae3c76d56ccf4cfda2045] tty: nozomi: Use
> scnprintf() for avoiding potential buffer overflow
> git bisect bad caa47cc639470485ee0ae3c76d56ccf4cfda2045
> # bad: [630db5cbc7b444bf47cd717906abb092a2ab5724] tty: serial: Add
> CONSOLE_POLL support to SiFive UART
> git bisect bad 630db5cbc7b444bf47cd717906abb092a2ab5724
> # bad: [bedb404e91bb2908d9921fc736a518a9d89525fc] serial: 8250_port:
> Don't use power management for kernel console
> git bisect bad bedb404e91bb2908d9921fc736a518a9d89525fc
> # bad: [a3cb39d258efef830181606134cfb0f7babe8c8e] serial: core: Allow
> detach and attach serial device for console
> git bisect bad a3cb39d258efef830181606134cfb0f7babe8c8e
> # first bad commit: [a3cb39d258efef830181606134cfb0f7babe8c8e] serial:
> core: Allow detach and attach serial device for console

-- 
With Best Regards,
Andy Shevchenko


