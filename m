Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A952144B3
	for <lists+sparclinux@lfdr.de>; Sat,  4 Jul 2020 11:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgGDJs7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 4 Jul 2020 05:48:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:46834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgGDJs7 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 4 Jul 2020 05:48:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D248C20870;
        Sat,  4 Jul 2020 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593856139;
        bh=Cu67IPYD8RGEy878FxUK/SlxsdI9o47oKHu0OuTWDJU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NUSyLQj0oxeyBoZDZ5xlHGihuxvitaQoZltFvZPuadY+wBTWL1BLg6d7Fu1AGTUnk
         e7GdxYUNAFBHSa0Pc0e0IQg/2HqEhIl8muhG8lyQRo9I/UQ5ugpiL/c7GQHQaMbEau
         zE+AKSNGiUwBk7PP5RMRPhuJf6nOlhopUbhDCehI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jren3-008vYO-6m; Sat, 04 Jul 2020 10:48:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 04 Jul 2020 10:48:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 0/2] genirq: Kill preflow handlers
In-Reply-To: <20200703155645.29703-1-valentin.schneider@arm.com>
References: <20200703155645.29703-1-valentin.schneider@arm.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <6d902159f1819b6f3a0af5e982d11868@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: valentin.schneider@arm.com, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, davem@davemloft.net, tglx@linutronix.de, jason@lakedaemon.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Valentin,

On 2020-07-03 16:56, Valentin Schneider wrote:
> Hi,
> 
> while strolling around the different flow handlers, I tried to make 
> sense of
> what preflow_handler() was about. Turns out no one uses those anymore, 
> but the
> genirq support has remained in place.

If we needed to reintroduce some form of preflow handler, we'd try and
do it using hierarchical irqchips, if at all possible.

> 
> Unless we can see another user of those in the near future, this seems 
> like as
> good a time as any for a little housecleaning.
> 
> - Patch 1 simply deselects the (unexploited) preflow Kconfig for 
> sparc64
> - Patch 2 is the actual cleanup
> 
> Cheers,
> Valentin
> 
> Valentin Schneider (2):
>   sparc64: Deselect IRQ_PREFLOW_FASTEOI
>   genirq: Remove preflow handler support
> 
>  arch/sparc/Kconfig         |  1 -
>  include/linux/irqdesc.h    | 15 ---------------
>  include/linux/irqhandler.h |  1 -
>  kernel/irq/Kconfig         |  4 ----
>  kernel/irq/chip.c          | 13 -------------
>  5 files changed, 34 deletions(-)

For the whole series, and assuming that there is no regression
(can't imagine any for unused code):

Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
