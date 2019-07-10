Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD44163D92
	for <lists+sparclinux@lfdr.de>; Tue,  9 Jul 2019 23:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbfGIVy3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Jul 2019 17:54:29 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46274 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGIVy3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 9 Jul 2019 17:54:29 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id C0C4C142495DE;
        Tue,  9 Jul 2019 14:54:28 -0700 (PDT)
Date:   Tue, 09 Jul 2019 14:54:28 -0700 (PDT)
Message-Id: <20190709.145428.675722523823847220.davem@davemloft.net>
To:     geert+renesas@glider.be
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc64: Add missing newline at end of file
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190617143612.4810-1-geert+renesas@glider.be>
References: <20190617143612.4810-1-geert+renesas@glider.be>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 09 Jul 2019 14:54:28 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 17 Jun 2019 16:36:12 +0200

> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the file.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.
