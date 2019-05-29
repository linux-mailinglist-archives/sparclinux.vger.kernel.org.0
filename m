Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD572E600
	for <lists+sparclinux@lfdr.de>; Wed, 29 May 2019 22:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfE2UXn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 29 May 2019 16:23:43 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:41202 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2UXn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 29 May 2019 16:23:43 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 56459149D1445;
        Wed, 29 May 2019 13:23:43 -0700 (PDT)
Date:   Wed, 29 May 2019 13:23:40 -0700 (PDT)
Message-Id: <20190529.132340.1951054150778994386.davem@davemloft.net>
To:     mroos@linux.ee
Cc:     rick.p.edgecombe@intel.com, sparclinux@vger.kernel.org,
        jrtc27@jrtc27.com
Subject: Re: [bisected] DEBUG_PAGEALLOC hangs on sparc64
From:   David Miller <davem@davemloft.net>
In-Reply-To: <86e9d84e-cffa-0bae-f575-7cf6789f5fb8@linux.ee>
References: <86e9d84e-cffa-0bae-f575-7cf6789f5fb8@linux.ee>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 29 May 2019 13:23:43 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Meelis Roos <mroos@linux.ee>
Date: Wed, 29 May 2019 22:08:26 +0300

> Bisecting led me to 4.9 merge window and this patch that broke it:
> 
> a74ad5e660a9ee1d071665e7e8ad822784a2dc7f is the first bad commit
> commit a74ad5e660a9ee1d071665e7e8ad822784a2dc7f
> Author: David S. Miller <davem@davemloft.net>
> Date:   Thu Oct 27 09:04:54 2016 -0700
> 
>     sparc64: Handle extremely large kernel TLB range flushes more
>     gracefully.

Thank you, I will take a close look at this ASAP.
