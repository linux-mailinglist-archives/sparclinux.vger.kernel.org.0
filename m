Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073F71BA9E1
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 18:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgD0QOm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 12:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725919AbgD0QOm (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 12:14:42 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256E1C0610D5;
        Mon, 27 Apr 2020 09:14:42 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 336BE15D45B90;
        Mon, 27 Apr 2020 09:14:39 -0700 (PDT)
Date:   Mon, 27 Apr 2020 09:14:38 -0700 (PDT)
Message-Id: <20200427.091438.1070286832296952889.davem@davemloft.net>
To:     gregkh@linuxfoundation.org
Cc:     weiyongjun1@huawei.com, jslaby@suse.com,
        sparclinux@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] sparc64: vcc: Fix error return code in
 vcc_probe()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200427122747.GA2781212@kroah.com>
References: <20200427122415.47416-1-weiyongjun1@huawei.com>
        <20200427122747.GA2781212@kroah.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 27 Apr 2020 09:14:39 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 27 Apr 2020 14:27:47 +0200

> On Mon, Apr 27, 2020 at 12:24:15PM +0000, Wei Yongjun wrote:
>> Fix to return negative error code -ENOMEM from the error handling
>> case instead of 0, as done elsewhere in this function.
>> 
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/tty/vcc.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Why is sparc64 in your subject line?

It's a sparc64 hypervisor console driver.
