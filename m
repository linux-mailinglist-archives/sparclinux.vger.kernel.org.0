Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79C13993F2
	for <lists+sparclinux@lfdr.de>; Wed,  2 Jun 2021 21:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFBTxV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 2 Jun 2021 15:53:21 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53004 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhFBTxO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 2 Jun 2021 15:53:14 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id 8331E4D2522DF;
        Wed,  2 Jun 2021 12:51:27 -0700 (PDT)
Date:   Wed, 02 Jun 2021 12:51:17 -0700 (PDT)
Message-Id: <20210602.125117.1391130087317485842.davem@davemloft.net>
To:     thunder.leizhen@huawei.com
Cc:     gregkh@linuxfoundation.org, jirislaby@kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] sparc64: vcc: use DEVICE_ATTR_*() macro
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20210602014839.10587-1-thunder.leizhen@huawei.com>
References: <20210602014839.10587-1-thunder.leizhen@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Wed, 02 Jun 2021 12:51:27 -0700 (PDT)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Zhen Lei <thunder.leizhen@huawei.com>
Date: Wed, 2 Jun 2021 09:48:39 +0800

> Use DEVICE_ATTR_*() macro helper instead of plain DEVICE_ATTR, which makes
> the code a bit shorter and easier to read.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Acked-by: David S. Miller <davem@davemloft.net>
