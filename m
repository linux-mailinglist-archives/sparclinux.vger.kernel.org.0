Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67FF24C8A7
	for <lists+sparclinux@lfdr.de>; Fri, 21 Aug 2020 01:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgHTXhc (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Aug 2020 19:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbgHTXhc (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Aug 2020 19:37:32 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B00C061385
        for <sparclinux@vger.kernel.org>; Thu, 20 Aug 2020 16:37:32 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8u7e-001jFx-I6; Thu, 20 Aug 2020 23:37:30 +0000
Date:   Fri, 21 Aug 2020 00:37:30 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Miller <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org
Subject: Re: [sparc32] userland unaligned access
Message-ID: <20200820233730.GH1236603@ZenIV.linux.org.uk>
References: <20200820193612.GG1236603@ZenIV.linux.org.uk>
 <20200820.155122.2263405333608231817.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820.155122.2263405333608231817.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Aug 20, 2020 at 03:51:22PM -0700, David Miller wrote:
> From: Al Viro <viro@zeniv.linux.org.uk>
> Date: Thu, 20 Aug 2020 20:36:12 +0100
> 
> > 	We have
> > asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn)
> > {
> >         enum direction dir;
> > 
> >         if(!(current->thread.flags & SPARC_FLAG_UNALIGNED) ||
> >            (((insn >> 30) & 3) != 3))
> >                 goto kill_user;
> > 
> > there, followed by some work on emulating the insn.  So while the default
> > behaviour is to hit the process with SIGBUS, it can overridden by setting
> > SPARC_FLAG_UNALIGNED in current->thread.flags.  Fair enough, but...  Just
> > what could possibly set that flag?
> > 
> > That stuff had been introduced back in 2.1.9 and even there (or through
> > the 2.2, etc.) I don't see anything that would ever set it.
> > 
> > Am I missing something, or had it really been dead code all along?
> 
> Relic from the SunOS and/or Solaris syscall emulation probably.

Thought so, but...  no such thing in either.  And it's not done from assembler -
arch/sparc64 used to access ->tss.flags that way (and that was only for
SPARC_FLAG_NEWCHILD), but arch/sparc never did...

I don't have sunos toolchain to try and build such a binary and test it on
a 2.2 kernel, but I would be rather surprised if that had been it.

Anyway, it really looks like that's dead code these days...
