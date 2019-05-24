Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D2E29C00
	for <lists+sparclinux@lfdr.de>; Fri, 24 May 2019 18:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390413AbfEXQUF (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 May 2019 12:20:05 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:39098 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389588AbfEXQUF (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 24 May 2019 12:20:05 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8F75714CB6CAC;
        Fri, 24 May 2019 09:20:04 -0700 (PDT)
Date:   Fri, 24 May 2019 09:20:02 -0700 (PDT)
Message-Id: <20190524.092002.806233524692651218.davem@davemloft.net>
To:     glaubitz@physik.fu-berlin.de
Cc:     sparclinux@vger.kernel.org, debian-sparc@lists.debian.org,
        jrtc27@debian.org
Subject: Re: Making MAX_PHYS_ADDRESS_BITS configurable
From:   David Miller <davem@davemloft.net>
In-Reply-To: <2be3335c-1870-9867-0f25-01cf798ca84b@physik.fu-berlin.de>
References: <2be3335c-1870-9867-0f25-01cf798ca84b@physik.fu-berlin.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 24 May 2019 09:20:04 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Date: Fri, 24 May 2019 12:24:53 +0200

> On the other hand, arm64 currently allows the virtual address size
> to be configurable, currently defaulting to 48 bits [2, 3]. I was
> therefore wondering whether we could make MAX_PHYS_ADDRESS_BITS [4]
> configurable as well to be able to support these JITs on
> Debian/sparc64 for the foreseeable future by limiting the virtual
> address space to 47 or 48 bits.

You can't just do this.

It is possible that all physical memory is mapped to the top of the
mappable physical address range, therefore we really need to use the
full maximum setting supported by the CPU.
