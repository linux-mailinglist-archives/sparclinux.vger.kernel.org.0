Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0ABB327EA
	for <lists+sparclinux@lfdr.de>; Mon,  3 Jun 2019 07:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfFCFQ1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 3 Jun 2019 01:16:27 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:52574 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfFCFQ0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 3 Jun 2019 01:16:26 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A4F681340AD5A;
        Sun,  2 Jun 2019 22:16:25 -0700 (PDT)
Date:   Sun, 02 Jun 2019 22:15:50 -0700 (PDT)
Message-Id: <20190602.221550.1371676212285136500.davem@davemloft.net>
To:     blackgod016574@gmail.com
Cc:     rppt@linux.vnet.ibm.com, mhocko@suse.com,
        akpm@linux-foundation.org, sfr@canb.auug.org.au,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mdesc: fix a missing-check bug in
 get_vdev_port_node_info()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190531012418.GA4473@zhanggen-UX430UQ>
References: <20190531012418.GA4473@zhanggen-UX430UQ>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 02 Jun 2019 22:16:26 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Gen Zhang <blackgod016574@gmail.com>
Date: Fri, 31 May 2019 09:24:18 +0800

> In get_vdev_port_node_info(), 'node_info->vdev_port.name' is allcoated
> by kstrdup_const(), and it returns NULL when fails. So 
> 'node_info->vdev_port.name' should be checked.
> 
> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>

Applied, thanks.
