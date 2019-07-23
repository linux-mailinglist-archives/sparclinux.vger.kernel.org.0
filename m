Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0362D71F92
	for <lists+sparclinux@lfdr.de>; Tue, 23 Jul 2019 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403847AbfGWStY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 23 Jul 2019 14:49:24 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:35036 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbfGWStY (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 23 Jul 2019 14:49:24 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 92661153B91F7;
        Tue, 23 Jul 2019 11:49:23 -0700 (PDT)
Date:   Tue, 23 Jul 2019 11:49:23 -0700 (PDT)
Message-Id: <20190723.114923.2114077126939672208.davem@davemloft.net>
To:     yamada.masahiro@socionext.com
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc: remove unneeded uapi/asm/statfs.h
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190723113149.14776-1-yamada.masahiro@socionext.com>
References: <20190723113149.14776-1-yamada.masahiro@socionext.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 23 Jul 2019 11:49:23 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 23 Jul 2019 20:31:49 +0900

> statfs.h is listed in include/uapi/asm-generic/Kbuild, so Kbuild will
> automatically generate it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thank you.
