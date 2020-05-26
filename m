Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96D11D4236
	for <lists+sparclinux@lfdr.de>; Fri, 15 May 2020 02:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgEOAlk (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 14 May 2020 20:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726046AbgEOAlk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Thu, 14 May 2020 20:41:40 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C111C061A0C;
        Thu, 14 May 2020 17:41:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 41A2514D41E02;
        Thu, 14 May 2020 17:41:39 -0700 (PDT)
Date:   Thu, 14 May 2020 17:41:38 -0700 (PDT)
Message-Id: <20200514.174138.617083643581260276.davem@davemloft.net>
To:     will@kernel.org
Cc:     linux-kernel@vger.kernel.org, peterz@infradead.org,
        ndesaulniers@google.com, matt@codeblueprint.co.uk,
        sparclinux@vger.kernel.org, kernel-team@android.com,
        tglx@linutronix.de
Subject: Re: [RESEND PATCH 0/4] Rework sparc32 page-table layout
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200514072624.GA4280@willie-the-truck>
References: <20200414214011.2699-1-will@kernel.org>
        <20200513.153226.1639916880914538869.davem@davemloft.net>
        <20200514072624.GA4280@willie-the-truck>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 14 May 2020 17:41:39 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Will Deacon <will@kernel.org>
Date: Thu, 14 May 2020 08:26:24 +0100

> Hi David,
> 
> On Wed, May 13, 2020 at 03:32:26PM -0700, David Miller wrote:
>> From: Will Deacon <will@kernel.org>
>> Date: Tue, 14 Apr 2020 22:40:07 +0100
>> 
>> > This is a reposting of the patch series I sent previously to rework the
>> > sparc32 page-table layout so that 'pmd_t' can be used safely with
>> > READ_ONCE():
>> > 
>> > https://lore.kernel.org/lkml/20200324104005.11279-1-will@kernel.org
>> > 
>> > This is blocking the READ_ONCE() rework, which in turn allows us to
>> > bump the minimum GCC version for building the kernel up to 4.8.
>> 
>> Series applied to sparc-next, thanks Will.
> 
> Thanks, although this was picked up by -tip a couple of days ago [1] since
> the READ_ONCE() rework relies on it to avoid breaking the sparc32 build.
> 
> It's obviously harmless to go in both trees, but if you don't need it for
> anything then you may want to drop these to avoid duplicate commits in
> mainline.
 ...
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=locking/kcsan

Thanks for the heads up but I'll leave it in the sparc-next tree for now.
