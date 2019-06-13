Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1A144E1B
	for <lists+sparclinux@lfdr.de>; Thu, 13 Jun 2019 23:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfFMVHB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 13 Jun 2019 17:07:01 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:60342 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVHB (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 13 Jun 2019 17:07:01 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 489C8149CD303;
        Thu, 13 Jun 2019 14:07:01 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:07:00 -0700 (PDT)
Message-Id: <20190613.140700.1064902587962557055.davem@davemloft.net>
To:     aaro.koskinen@iki.fi
Cc:     sparclinux@vger.kernel.org
Subject: Re: [PATCH silo] tilo: fix rootfs size check
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190604214748.25377-1-aaro.koskinen@iki.fi>
References: <20190604214748.25377-1-aaro.koskinen@iki.fi>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 13 Jun 2019 14:07:01 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Aaro Koskinen <aaro.koskinen@iki.fi>
Date: Wed,  5 Jun 2019 00:47:48 +0300

> When checking the rootfs size we use the kernel image size instead of the
> rootfs image. Fix that.
> 
> Fixes: 9f151df0eecf ("tilo: sanity check image sizes")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Applied, thank you.
