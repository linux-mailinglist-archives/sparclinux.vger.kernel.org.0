Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C0824C8EB
	for <lists+sparclinux@lfdr.de>; Fri, 21 Aug 2020 02:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgHUAAN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 20 Aug 2020 20:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgHUAAJ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 20 Aug 2020 20:00:09 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6091C061386
        for <sparclinux@vger.kernel.org>; Thu, 20 Aug 2020 17:00:07 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8uTS-001jjz-Q7; Fri, 21 Aug 2020 00:00:02 +0000
Date:   Fri, 21 Aug 2020 01:00:02 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Miller <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org
Subject: Re: [sparc32] userland unaligned access
Message-ID: <20200821000002.GI1236603@ZenIV.linux.org.uk>
References: <20200820193612.GG1236603@ZenIV.linux.org.uk>
 <20200820.155122.2263405333608231817.davem@davemloft.net>
 <20200820233730.GH1236603@ZenIV.linux.org.uk>
 <20200820.164708.2016059081784711542.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820.164708.2016059081784711542.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Aug 20, 2020 at 04:47:08PM -0700, David Miller wrote:

> > I don't have sunos toolchain to try and build such a binary and test it on
> > a 2.2 kernel, but I would be rather surprised if that had been it.
> > 
> > Anyway, it really looks like that's dead code these days...
> 
> %100 it is dead code.

	Could you check if you are OK with
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.sparc?
