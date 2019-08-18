Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66E6A91952
	for <lists+sparclinux@lfdr.de>; Sun, 18 Aug 2019 21:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfHRTjq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 18 Aug 2019 15:39:46 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46096 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfHRTjq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 18 Aug 2019 15:39:46 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A29FF1264E2C7;
        Sun, 18 Aug 2019 12:39:45 -0700 (PDT)
Date:   Sun, 18 Aug 2019 12:39:43 -0700 (PDT)
Message-Id: <20190818.123943.1491620523133670968.davem@davemloft.net>
To:     hch@infradead.org
Cc:     mroos@linux.ee, sparclinux@vger.kernel.org
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190818070137.GA22731@infradead.org>
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
        <20190818070137.GA22731@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 18 Aug 2019 12:39:45 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 18 Aug 2019 00:01:37 -0700

> I think for now we'll simply have to disable HAVE_FAST_GUP for sparc,
> until someone who really knows low-level sparc page table handling
> finds some time to audit the generic fast gup code and arch hooks.

It's a regression, we don't disable features in those circumstances
usually right?
