Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB0877D34
	for <lists+sparclinux@lfdr.de>; Sun, 28 Jul 2019 04:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbfG1CJb (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 27 Jul 2019 22:09:31 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:42474 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfG1CJb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 27 Jul 2019 22:09:31 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 21B09126598C3;
        Sat, 27 Jul 2019 19:09:30 -0700 (PDT)
Date:   Sat, 27 Jul 2019 19:09:29 -0700 (PDT)
Message-Id: <20190727.190929.2229738632787796180.davem@davemloft.net>
To:     matorola@gmail.com
Cc:     ldv@altlinux.org, hch@lst.de, khalid.aziz@oracle.com,
        torvalds@linux-foundation.org, akpm@linux-foundation.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] sparc64: use the generic get_user_pages_fast code
From:   David Miller <davem@davemloft.net>
In-Reply-To: <CADxRZqw0oCpw=wKUrFTOJF1dUKrCU6k5MQXj3tVGachu4zPcgw@mail.gmail.com>
References: <CADxRZqx-jEnm4U8oe=tJf5apbvcMuw5OYZUN8h4G68sXFvDsmQ@mail.gmail.com>
        <20190724.131324.1545677795217357026.davem@davemloft.net>
        <CADxRZqw0oCpw=wKUrFTOJF1dUKrCU6k5MQXj3tVGachu4zPcgw@mail.gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 27 Jul 2019 19:09:30 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Anatoly Pugachev <matorola@gmail.com>
Date: Thu, 25 Jul 2019 21:33:24 +0300

> http://u164.east.ru/kernel/
> 
> there's vmlinuz-5.3.0-rc1 kernel and archive 5.3.0-rc1-modules.tar.gz
> of /lib/modules/5.3.0-rc1/
> this is from oracle sparclinux LDOM , compiled with 7.4.0 gcc

Please, I really really need the unstripped kernel image with all the
symbols.  This vmlinuz file is stripped already.  The System.map does
not serve as a replacement.

Thank you.
