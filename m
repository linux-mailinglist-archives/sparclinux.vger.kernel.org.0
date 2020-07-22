Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC92C228D89
	for <lists+sparclinux@lfdr.de>; Wed, 22 Jul 2020 03:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgGVB0T (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 21 Jul 2020 21:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGVB0T (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 21 Jul 2020 21:26:19 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80A9C061794;
        Tue, 21 Jul 2020 18:26:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6882311DB315F;
        Tue, 21 Jul 2020 18:09:33 -0700 (PDT)
Date:   Tue, 21 Jul 2020 18:26:17 -0700 (PDT)
Message-Id: <20200721.182617.1769882891819370159.davem@davemloft.net>
To:     rppt@kernel.org
Cc:     sparclinux@vger.kernel.org, torvalds@linux-foundation.org,
        linux-kernel@vger.kernel.org, rppt@linux.ibm.com
Subject: Re: [PATCH v2 0/2] sparc32: srmmu: improve type safety of
 __nocache_fix()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200627081653.25311-1-rppt@kernel.org>
References: <20200627081653.25311-1-rppt@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 21 Jul 2020 18:09:33 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Mike Rapoport <rppt@kernel.org>
Date: Sat, 27 Jun 2020 11:16:51 +0300

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> As discussed at [1] the __nocache_fix() macro in sparc's SRMMU can be made
> type safe and so the compiler will yell anout misuse of pXd pointers for
> which the __nocache_fix() is primarily used.
> 
> The first patch is an fix of such misuse that I've discovered after adding
> type cast to __nocache_fix(), but to avoid breaking bisection I've made it
> the first commit.
> 
> v2: rebased on v5.8-rc2+

Series applied, thanks Mike.
