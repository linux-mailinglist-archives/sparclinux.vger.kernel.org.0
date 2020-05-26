Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A671C7BD2
	for <lists+sparclinux@lfdr.de>; Wed,  6 May 2020 23:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgEFVB7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 6 May 2020 17:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728853AbgEFVB6 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 6 May 2020 17:01:58 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECAEC061A0F;
        Wed,  6 May 2020 14:01:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id E14BC1210BB6C;
        Wed,  6 May 2020 14:01:57 -0700 (PDT)
Date:   Wed, 06 May 2020 14:01:56 -0700 (PDT)
Message-Id: <20200506.140156.2160110657988374613.davem@davemloft.net>
To:     yanaijie@huawei.com
Cc:     akpm@linux-foundation.org, rppt@linux.ibm.com,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc: mm: return true,false in kern_addr_valid()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200506061659.19128-1-yanaijie@huawei.com>
References: <20200506061659.19128-1-yanaijie@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 06 May 2020 14:01:58 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Jason Yan <yanaijie@huawei.com>
Date: Wed, 6 May 2020 14:16:59 +0800

> This function's return type is bool and returns both true/false and 0/1.
> This fixes the following coccicheck warning:
> 
> arch/sparc/mm/init_64.c:1652:9-10: WARNING: return of 0/1 in function
> 'kern_addr_valid' with return type bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied, thanks.
