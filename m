Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E006D646
	for <lists+sparclinux@lfdr.de>; Thu, 18 Jul 2019 23:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfGRVOH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 18 Jul 2019 17:14:07 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:55874 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfGRVOH (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 18 Jul 2019 17:14:07 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 29B831528342B;
        Thu, 18 Jul 2019 14:14:06 -0700 (PDT)
Date:   Thu, 18 Jul 2019 14:14:05 -0700 (PDT)
Message-Id: <20190718.141405.1070121094691581998.davem@davemloft.net>
To:     ldv@altlinux.org
Cc:     hch@lst.de, khalid.aziz@oracle.com, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, matorola@gmail.com,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] sparc64: use the generic get_user_pages_fast code
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190717215956.GA30369@altlinux.org>
References: <20190625143715.1689-1-hch@lst.de>
        <20190625143715.1689-10-hch@lst.de>
        <20190717215956.GA30369@altlinux.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 18 Jul 2019 14:14:06 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: "Dmitry V. Levin" <ldv@altlinux.org>
Date: Thu, 18 Jul 2019 00:59:56 +0300

> So this ended up as commit 7b9afb86b6328f10dc2cad9223d7def12d60e505
> (thanks to Anatoly for bisecting) and introduced a regression: 
> futex.test from the strace test suite now causes an Oops on sparc64
> in futex syscall.
> 
> Here is a heavily stripped down reproducer:

Does not reproduce for me on a T4-2 machine.

So this problem might depend on the type of system you are on,
I suspect it's one of those "pre-Niagara vs. Niagara and later"
situations because that's the dividing line between two set of
wildly different TLB and cache management methods.

What kind of machine are you on?
