Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB5D24C809
	for <lists+sparclinux@lfdr.de>; Fri, 21 Aug 2020 00:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgHTWvY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Aug 2020 18:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgHTWvY (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Aug 2020 18:51:24 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F013C061385
        for <sparclinux@vger.kernel.org>; Thu, 20 Aug 2020 15:51:24 -0700 (PDT)
Received: from localhost (c-76-104-128-192.hsd1.wa.comcast.net [76.104.128.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5DA181286B32B;
        Thu, 20 Aug 2020 15:34:37 -0700 (PDT)
Date:   Thu, 20 Aug 2020 15:51:22 -0700 (PDT)
Message-Id: <20200820.155122.2263405333608231817.davem@davemloft.net>
To:     viro@zeniv.linux.org.uk
Cc:     sparclinux@vger.kernel.org
Subject: Re: [sparc32] userland unaligned access
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200820193612.GG1236603@ZenIV.linux.org.uk>
References: <20200820193612.GG1236603@ZenIV.linux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 20 Aug 2020 15:34:37 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>
Date: Thu, 20 Aug 2020 20:36:12 +0100

> 	We have
> asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn)
> {
>         enum direction dir;
> 
>         if(!(current->thread.flags & SPARC_FLAG_UNALIGNED) ||
>            (((insn >> 30) & 3) != 3))
>                 goto kill_user;
> 
> there, followed by some work on emulating the insn.  So while the default
> behaviour is to hit the process with SIGBUS, it can overridden by setting
> SPARC_FLAG_UNALIGNED in current->thread.flags.  Fair enough, but...  Just
> what could possibly set that flag?
> 
> That stuff had been introduced back in 2.1.9 and even there (or through
> the 2.2, etc.) I don't see anything that would ever set it.
> 
> Am I missing something, or had it really been dead code all along?

Relic from the SunOS and/or Solaris syscall emulation probably.
