Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ABE269A25
	for <lists+sparclinux@lfdr.de>; Tue, 15 Sep 2020 02:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgIOAFm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 14 Sep 2020 20:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgIOAFl (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 14 Sep 2020 20:05:41 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2D3C06174A;
        Mon, 14 Sep 2020 17:05:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 167F4128F13ED;
        Mon, 14 Sep 2020 16:48:52 -0700 (PDT)
Date:   Mon, 14 Sep 2020 17:05:38 -0700 (PDT)
Message-Id: <20200914.170538.2141404011708907680.davem@davemloft.net>
To:     jingxiangfeng@huawei.com
Cc:     dan.j.williams@intel.com, dvhart@infradead.org,
        mchehab+samsung@kernel.org, gregkh@linuxfoundation.org,
        dsterba@suse.com, arnd@arndb.de, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sbus: char: Remove meaningless jump label out_free
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200911071341.101397-1-jingxiangfeng@huawei.com>
References: <20200911071341.101397-1-jingxiangfeng@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Mon, 14 Sep 2020 16:48:52 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Fri, 11 Sep 2020 15:13:41 +0800

> After commit 57a4a3d7f756 ("display7seg: Introduce the use of the managed
> version of kzalloc"), The out_free jump label has nothing to do but goto
> out. So remove it.
> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Applied, thank you.
