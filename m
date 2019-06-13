Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F227E44E13
	for <lists+sparclinux@lfdr.de>; Thu, 13 Jun 2019 23:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbfFMVF2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 13 Jun 2019 17:05:28 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:60296 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbfFMVF2 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 13 Jun 2019 17:05:28 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id ABD8B149CACF5;
        Thu, 13 Jun 2019 14:05:27 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:05:27 -0700 (PDT)
Message-Id: <20190613.140527.636416300482814151.davem@davemloft.net>
To:     glaubitz@physik.fu-berlin.de
Cc:     sparclinux@vger.kernel.org, debian-sparc@lists.debian.org
Subject: Re: [PATCH] sunhv: Fix device naming inconsistency between
 sunhv_console and sunhv_reg
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190611153836.18950-1-glaubitz@physik.fu-berlin.de>
References: <20190611153836.18950-1-glaubitz@physik.fu-berlin.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 13 Jun 2019 14:05:27 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Date: Tue, 11 Jun 2019 17:38:37 +0200

> In d5a2aa24, the name in struct console sunhv_console was changed from "ttyS"
> to "ttyHV" while the name in struct uart_ops sunhv_pops remained unchanged.
> 
> This results in the hypervisor console device to be listed as "ttyHV0" under
> /proc/consoles while the device node is still named "ttyS0":
> 
> root@osaka:~# cat /proc/consoles
> ttyHV0               -W- (EC p  )    4:64
> tty0                 -WU (E     )    4:1
> root@osaka:~# readlink /sys/dev/char/4:64
> ../../devices/root/f02836f0/f0285690/tty/ttyS0
> root@osaka:~#
> 
> This means that any userland code which tries to determine the name of the
> device file of the hypervisor console device can not rely on the information
> provided by /proc/consoles. In particular, booting current versions of debian-
> installer inside a SPARC LDOM will fail with the installer unable to determine
> the console device.
> 
> After renaming the device in struct uart_ops sunhv_pops to "ttyHV" as well,
> the inconsistency is fixed and it is possible again to determine the name
> of the device file of the hypervisor console device by reading the contents
> of /proc/console:
> 
> root@osaka:~# cat /proc/consoles
> ttyHV0               -W- (EC p  )    4:64
> tty0                 -WU (E     )    4:1
> root@osaka:~# readlink /sys/dev/char/4:64
> ../../devices/root/f02836f0/f0285690/tty/ttyHV0
> root@osaka:~#
> 
> With this change, debian-installer works correctly when installing inside
> a SPARC LDOM.
> 
> Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Applied and queued up for -stable, thanks.
