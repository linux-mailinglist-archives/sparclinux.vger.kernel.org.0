Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4FF19C2EA
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 15:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgDBNpi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 09:45:38 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:46844 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgDBNpi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Apr 2020 09:45:38 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 846DC128A0344;
        Thu,  2 Apr 2020 06:45:37 -0700 (PDT)
Date:   Thu, 02 Apr 2020 06:45:34 -0700 (PDT)
Message-Id: <20200402.064534.2214710089963468576.davem@davemloft.net>
To:     andriy.shevchenko@linux.intel.com
Cc:     matorola@gmail.com, sparclinux@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [sparc64] OOPS after 'serial: core: Allow detach and attach
 serial device for console'
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200402112459.GY1922688@smile.fi.intel.com>
References: <CADxRZqwHdRd=3fzr=-9hdR7_cW2VXXHwoySzbSpWx+aZ1S=ysA@mail.gmail.com>
        <20200402112459.GY1922688@smile.fi.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 02 Apr 2020 06:45:37 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 2 Apr 2020 14:24:59 +0300

>> [    2.505276] f029b788: ttyHV0 at I/O 0x0 (irq = 1, base_baud =
>> 115200) is a SUN4V HCONS
> 
> Also, this is funny address. Can you elaborate how is this working?

There are no "addresses" for this device as it is implemented via hypervisor
calls.
