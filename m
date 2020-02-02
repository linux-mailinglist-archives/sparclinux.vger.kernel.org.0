Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3416414FCB7
	for <lists+sparclinux@lfdr.de>; Sun,  2 Feb 2020 11:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgBBKzW (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 2 Feb 2020 05:55:22 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:52100 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBBKzW (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 2 Feb 2020 05:55:22 -0500
Received: from localhost (dhcp-077-249-119-090.chello.nl [77.249.119.90])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6E6FB15A047FD;
        Sun,  2 Feb 2020 02:55:18 -0800 (PST)
Date:   Sun, 02 Feb 2020 11:55:14 +0100 (CET)
Message-Id: <20200202.115514.196916055025174984.davem@davemloft.net>
To:     arnd@arndb.de
Cc:     akpm@linux-foundation.org, matorola@gmail.com,
        ebiederm@xmission.com, deepa.kernel@gmail.com,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc64: fix adjtimex regression
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200201212104.575657-1-arnd@arndb.de>
References: <20200201212104.575657-1-arnd@arndb.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 02 Feb 2020 02:55:19 -0800 (PST)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Sat,  1 Feb 2020 22:20:52 +0100

> Anatoly Pugachev reported one of the y2038 patches to introduce
> a fatal bug from a stupid typo:
> 
> [   96.384129] watchdog: BUG: soft lockup - CPU#8 stuck for 22s!
> ...
> [   96.385624]  [0000000000652ca4] handle_mm_fault+0x84/0x320
> [   96.385668]  [0000000000b6f2bc] do_sparc64_fault+0x43c/0x820
> [   96.385720]  [0000000000407754] sparc64_realfault_common+0x10/0x20
> [   96.385769]  [000000000042fa28] __do_sys_sparc_clock_adjtime+0x28/0x80
> [   96.385819]  [00000000004307f0] sys_sparc_clock_adjtime+0x10/0x20
> [   96.385866]  [0000000000406294] linux_sparc_syscall+0x34/0x44
> 
> Fix the code to dereference the correct pointer again.
> 
> Reported-by: Anatoly Pugachev <matorola@gmail.com>
> Tested-by: Anatoly Pugachev <matorola@gmail.com>
> Fixes: 251ec1c159e4 ("y2038: sparc: remove use of struct timex")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> The bug was introduced through my y2038 branch and is now in
> mainline, but not in v5.5. Who should pick up the fix to
> get it into v5.6-rc1?

I'll pick it up.

Applied, thanks.
