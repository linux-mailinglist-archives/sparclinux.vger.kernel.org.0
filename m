Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58A5269A15
	for <lists+sparclinux@lfdr.de>; Tue, 15 Sep 2020 02:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgIOAFB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 14 Sep 2020 20:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgIOAFB (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 14 Sep 2020 20:05:01 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AAFC06174A
        for <sparclinux@vger.kernel.org>; Mon, 14 Sep 2020 17:05:01 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 0856B128F0087;
        Mon, 14 Sep 2020 16:48:13 -0700 (PDT)
Date:   Mon, 14 Sep 2020 17:05:00 -0700 (PDT)
Message-Id: <20200914.170500.369431843066947461.davem@davemloft.net>
To:     pcc@google.com
Cc:     sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc: remove SA_STATIC_ALLOC macro definition
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200818031745.393056-1-pcc@google.com>
References: <20200818031745.393056-1-pcc@google.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Mon, 14 Sep 2020 16:48:14 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Peter Collingbourne <pcc@google.com>
Date: Mon, 17 Aug 2020 20:17:45 -0700

> This macro is not exposed to uapi and is unreferenced in the
> kernel. The last reference to it was removed in commit 4c6773c3954c
> ("sparc32,leon: add support for extended interrupt controller"),
> so remove the definition.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>

Applied.
