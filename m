Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E263F23D4E8
	for <lists+sparclinux@lfdr.de>; Thu,  6 Aug 2020 02:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgHFAwc (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 Aug 2020 20:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgHFAwb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 5 Aug 2020 20:52:31 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6697C061574;
        Wed,  5 Aug 2020 17:52:31 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 3CBC1156879F2;
        Wed,  5 Aug 2020 17:35:45 -0700 (PDT)
Date:   Wed, 05 Aug 2020 17:52:30 -0700 (PDT)
Message-Id: <20200805.175230.2137269428264156531.davem@davemloft.net>
To:     miaoqinglang@huawei.com
Cc:     gregkh@linuxfoundation.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] sparc: use for_each_child_of_node() macro
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200728022817.87957-1-miaoqinglang@huawei.com>
References: <20200728022817.87957-1-miaoqinglang@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 05 Aug 2020 17:35:45 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

aFrom: Qinglang Miao <miaoqinglang@huawei.com>
Date: Tue, 28 Jul 2020 10:28:17 +0800

> Use for_each_child_of_node() macro instead of open coding it.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Applied, thank you.
