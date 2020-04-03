Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFB819CE13
	for <lists+sparclinux@lfdr.de>; Fri,  3 Apr 2020 03:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389422AbgDCBMS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 21:12:18 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53862 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbgDCBMS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Apr 2020 21:12:18 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 0AB6812758C91;
        Thu,  2 Apr 2020 18:12:18 -0700 (PDT)
Date:   Thu, 02 Apr 2020 18:12:17 -0700 (PDT)
Message-Id: <20200402.181217.1913032342905680599.davem@davemloft.net>
To:     hch@lst.de
Cc:     sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc32: use per-device dma_ops
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200323084342.27880-1-hch@lst.de>
References: <20200323084342.27880-1-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 02 Apr 2020 18:12:18 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>
Date: Mon, 23 Mar 2020 09:43:42 +0100

> sparc32 is the last platform making dynamic decisions in
> get_arch_dma_ops based on the bus passed in.  Instead set the
> iommu dma_ops at iommu probing and propagate them in
> of_propagate_archdata, falling back to the NULL ops for the
> direct mapping in the Leon or PCI case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied, thanks.
