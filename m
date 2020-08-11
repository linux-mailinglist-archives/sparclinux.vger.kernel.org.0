Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0122422DF
	for <lists+sparclinux@lfdr.de>; Wed, 12 Aug 2020 01:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgHKXmV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 11 Aug 2020 19:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgHKXmU (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 11 Aug 2020 19:42:20 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA557C06174A
        for <sparclinux@vger.kernel.org>; Tue, 11 Aug 2020 16:42:20 -0700 (PDT)
Received: from localhost (50-47-103-195.evrt.wa.frontiernet.net [50.47.103.195])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 29B7E128BE7F9;
        Tue, 11 Aug 2020 16:25:34 -0700 (PDT)
Date:   Tue, 11 Aug 2020 16:42:18 -0700 (PDT)
Message-Id: <20200811.164218.846363035312807388.davem@davemloft.net>
To:     slyfox@gentoo.org
Cc:     sparclinux@vger.kernel.org, libc-alpha@sourceware.org,
        sparc@gentoo.org, toolchain@gentoo.org, mgorny@gentoo.org
Subject: Re: sparc vs sparc64: O_NDELAY and O_NONBLOCK mismatch in kernel
 and in glibc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200529104019.72983ef9@sf>
References: <20200529104019.72983ef9@sf>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 11 Aug 2020 16:25:34 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Sergei Trofimovich <slyfox@gentoo.org>
Date: Fri, 29 May 2020 10:40:19 +0100

> Question time:
> 
> 1. Why is sparc32 special? Does it have something to do with
>    compatibility to other OSes of that time? (Solaris? BSD?)
> 
>    fs/fcntl.c has kernel handling:
>         /* required for strict SunOS emulation */
>         if (O_NONBLOCK != O_NDELAY)
>                if (arg & O_NDELAY)
>                    arg |= O_NONBLOCK;
>    but why does it leak to to userspace header definition?
> 
>    I think it should not.

The original sparc value was meant to match the SunOS value
exactly in order to make the SunOS emulation support easier.

The current situation is a mess and I don't doubt that it accounts
for various kinds of weird behavior we've seen over the years :-/
