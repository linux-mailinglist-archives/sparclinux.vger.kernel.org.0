Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB3214935
	for <lists+sparclinux@lfdr.de>; Sun,  5 Jul 2020 01:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgGDXve (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 4 Jul 2020 19:51:34 -0400
Received: from foss.arm.com ([217.140.110.172]:40214 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728004AbgGDXve (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 4 Jul 2020 19:51:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C466330E;
        Sat,  4 Jul 2020 16:51:33 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1043F73C;
        Sat,  4 Jul 2020 16:51:32 -0700 (PDT)
References: <20200703155645.29703-1-valentin.schneider@arm.com> <6d902159f1819b6f3a0af5e982d11868@kernel.org>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 0/2] genirq: Kill preflow handlers
In-reply-to: <6d902159f1819b6f3a0af5e982d11868@kernel.org>
Date:   Sun, 05 Jul 2020 00:51:26 +0100
Message-ID: <jhjo8oug7pd.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


Hi Marc,

On 04/07/20 10:48, Marc Zyngier wrote:
> Hi Valentin,
>
> On 2020-07-03 16:56, Valentin Schneider wrote:
>> Hi,
>>
>> while strolling around the different flow handlers, I tried to make
>> sense of
>> what preflow_handler() was about. Turns out no one uses those anymore,
>> but the
>> genirq support has remained in place.
>
> If we needed to reintroduce some form of preflow handler, we'd try and
> do it using hierarchical irqchips, if at all possible.

Right, that does sound like the most sensible approach. If I got my history
right, the preflow handlers saw the light of day before hierarchical
domains did, which I suppose is a reason why it wasn't done that way back
then.

>
>>
>> Unless we can see another user of those in the near future, this seems
>> like as
>> good a time as any for a little housecleaning.
>>
>> - Patch 1 simply deselects the (unexploited) preflow Kconfig for
>> sparc64
>> - Patch 2 is the actual cleanup
>>
>> Cheers,
>> Valentin
>>
>> Valentin Schneider (2):
>>   sparc64: Deselect IRQ_PREFLOW_FASTEOI
>>   genirq: Remove preflow handler support
>>
>>  arch/sparc/Kconfig         |  1 -
>>  include/linux/irqdesc.h    | 15 ---------------
>>  include/linux/irqhandler.h |  1 -
>>  kernel/irq/Kconfig         |  4 ----
>>  kernel/irq/chip.c          | 13 -------------
>>  5 files changed, 34 deletions(-)
>
> For the whole series, and assuming that there is no regression
> (can't imagine any for unused code):
>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
>

Thanks!

> Thanks,
>
>          M.
