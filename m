Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068A4E7CBA
	for <lists+sparclinux@lfdr.de>; Tue, 29 Oct 2019 00:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfJ1XJP (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 28 Oct 2019 19:09:15 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46344 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbfJ1XJP (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 28 Oct 2019 19:09:15 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8FAC614BE81CF;
        Mon, 28 Oct 2019 16:09:14 -0700 (PDT)
Date:   Mon, 28 Oct 2019 16:09:11 -0700 (PDT)
Message-Id: <20191028.160911.1021429466798996209.davem@davemloft.net>
To:     ztuowen@gmail.com
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, acelan.kao@canonical.com,
        mcgrof@kernel.org
Subject: Re: [PATCH v5 1/4] sparc64: implement ioremap_uc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <5c5b9dec7ea401fffa13446af2a528cbaf6e1046.camel@gmail.com>
References: <20191016210629.1005086-2-ztuowen@gmail.com>
        <5c5b9dec7ea401fffa13446af2a528cbaf6e1046.camel@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 28 Oct 2019 16:09:14 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Tuowen Zhao <ztuowen@gmail.com>
Date: Mon, 28 Oct 2019 14:46:00 -0600

> Adding sparc list. Sorry, first time missed the list.
> 
> Looking for some reviews.
> 
> Patch set: Fix MTRR bug for intel-lpss-pci
> https://lkml.org/lkml/2019/10/16/1230
> 
> Tuowen
> 
> -------- Forwarded Message --------
> From: Tuowen Zhao <ztuowen@gmail.com>
> To: lee.jones@linaro.org, linux-kernel@vger.kernel.org
> Cc: andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
> acelan.kao@canonical.com, mcgrof@kernel.org, davem@davemloft.net, 
> Tuowen Zhao <ztuowen@gmail.com>, kbuild test robot <lkp@intel.com>
> Subject: [PATCH v5 1/4] sparc64: implement ioremap_uc
> Date: Wed, 16 Oct 2019 15:06:27 -0600
> 
> On sparc64, the whole physical IO address space is accessible using
> physically addressed loads and stores. *_uc does nothing like the
> others.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Tuowen Zhao <ztuowen@gmail.com>

Acked-by: David S. Miller <davem@davemloft.net>
