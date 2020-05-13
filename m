Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78D41D2202
	for <lists+sparclinux@lfdr.de>; Thu, 14 May 2020 00:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbgEMW0o (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 13 May 2020 18:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730064AbgEMW0o (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Wed, 13 May 2020 18:26:44 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFB5C061A0C
        for <sparclinux@vger.kernel.org>; Wed, 13 May 2020 15:26:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4117312118550;
        Wed, 13 May 2020 15:26:44 -0700 (PDT)
Date:   Wed, 13 May 2020 15:26:43 -0700 (PDT)
Message-Id: <20200513.152643.1516227645836020449.davem@davemloft.net>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCH] silo: Allow building tilo only
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200406202716.4008090-1-mattst88@gmail.com>
References: <20200406202716.4008090-1-mattst88@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 13 May 2020 15:26:44 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Mon,  6 Apr 2020 13:27:16 -0700

> The bootloader bits are built as 32-bit, which can be difficult to do on
> a system with a 64-bit userland since they include system headers.
> 
> Specifically, the inclusion of <gnu/stubs-32.h> is problematic since
> this header is not provided on a non-multilib build of glibc.
> 
> 	<gnu/stubs-32.h>, included by
> 	<gnu/stubs.h>, included by
> 	<features.h>, included by
> 	<elf.h> and <setjmp.h>
> 
> tilo is built for the host machine and doesn't have this problem.
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied, thanks Matt.
