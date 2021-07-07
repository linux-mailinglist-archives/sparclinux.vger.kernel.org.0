Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B77A3BF11B
	for <lists+sparclinux@lfdr.de>; Wed,  7 Jul 2021 22:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhGGU7h (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Jul 2021 16:59:37 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47504 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhGGU7h (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Jul 2021 16:59:37 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id 3B2284D0F688B;
        Wed,  7 Jul 2021 13:56:55 -0700 (PDT)
Date:   Wed, 07 Jul 2021 13:56:51 -0700 (PDT)
Message-Id: <20210707.135651.420878063579280953.davem@davemloft.net>
To:     mark.rutland@arm.com
Cc:     linux-kernel@vger.kernel.org, peterz@lists.infradead.org,
        mingo@kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH] locking/atomic: sparc: fix arch_cmpxchg64_local()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20210707083032.567-1-mark.rutland@arm.com>
References: <20210707083032.567-1-mark.rutland@arm.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Wed, 07 Jul 2021 13:56:55 -0700 (PDT)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Mark Rutland <mark.rutland@arm.com>
Date: Wed,  7 Jul 2021 09:30:32 +0100

> Peter, David, could one of you please apply this? It's an urgent fix for
> fallout from the ARCH_ATOMIC conversion, and it'd be good to fix before -rc1.

Peter please take this as I am backlogged.

Thank you.
