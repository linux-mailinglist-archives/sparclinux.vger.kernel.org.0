Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D381324C64F
	for <lists+sparclinux@lfdr.de>; Thu, 20 Aug 2020 21:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgHTTg1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Aug 2020 15:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgHTTgX (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Aug 2020 15:36:23 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229A2C061385
        for <sparclinux@vger.kernel.org>; Thu, 20 Aug 2020 12:36:23 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8qM8-001dmW-AN
        for sparclinux@vger.kernel.org; Thu, 20 Aug 2020 19:36:12 +0000
Date:   Thu, 20 Aug 2020 20:36:12 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     sparclinux@vger.kernel.org
Subject: [sparc32] userland unaligned access
Message-ID: <20200820193612.GG1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

	We have
asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn)
{
        enum direction dir;

        if(!(current->thread.flags & SPARC_FLAG_UNALIGNED) ||
           (((insn >> 30) & 3) != 3))
                goto kill_user;

there, followed by some work on emulating the insn.  So while the default
behaviour is to hit the process with SIGBUS, it can overridden by setting
SPARC_FLAG_UNALIGNED in current->thread.flags.  Fair enough, but...  Just
what could possibly set that flag?

That stuff had been introduced back in 2.1.9 and even there (or through
the 2.2, etc.) I don't see anything that would ever set it.

Am I missing something, or had it really been dead code all along?
