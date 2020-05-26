Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D891D218C
	for <lists+sparclinux@lfdr.de>; Wed, 13 May 2020 23:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbgEMV6Y (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 13 May 2020 17:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729487AbgEMV6Y (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Wed, 13 May 2020 17:58:24 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEA1C061A0C;
        Wed, 13 May 2020 14:58:24 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 2503D12118547;
        Wed, 13 May 2020 14:58:23 -0700 (PDT)
Date:   Wed, 13 May 2020 14:58:20 -0700 (PDT)
Message-Id: <20200513.145820.686713273456115128.davem@davemloft.net>
To:     emil.l.velikov@gmail.com
Cc:     dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
        jslaby@suse.com, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 07/11] sparc64: constify sysrq_key_op
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200513214351.2138580-7-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
        <20200513214351.2138580-7-emil.l.velikov@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 13 May 2020 14:58:23 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 22:43:47 +0100

> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Acked-by: David S. Miller <davem@davemloft.net>
