Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D090867FC4F
	for <lists+sparclinux@lfdr.de>; Sun, 29 Jan 2023 03:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjA2CRi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 28 Jan 2023 21:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjA2CRh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 28 Jan 2023 21:17:37 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F85C2310D
        for <sparclinux@vger.kernel.org>; Sat, 28 Jan 2023 18:17:33 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id i188so9120846vsi.8
        for <sparclinux@vger.kernel.org>; Sat, 28 Jan 2023 18:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CqUkrj8PHX+LFqPLuqpniwW9pHO+zUoKSvlGNgXdRpQ=;
        b=AUCiyAaOAEzNvGGuPpreMC/9xLYE0S3cPh5UGxJ970JY9cio41paghbZZpvrYUgj33
         EtQ/v3jd6W14OS3yd1Zgjo8svgWfkxKQLV+nHOoecsAetUTo7Cq0zQbteW+BmfffNMzV
         OXpCnvqD2ZA8pkDrNP1Zh8TsSXLA00QV+14nqbW/JLWKvs69eXx5iAkwkAEuTJeEkSyU
         8Wwr65sEL6S09amNZS2kd7aWLDt18IiGmEF5Ld/oPgJrj0ogOvJbz6aDKP1mEsRvglHY
         M32NXMyYCTrj/Vk68OG2caXKA3BqhaMt1TxwqtpIow1m0BIoiFoR3LBHc2TTqoGhbrmI
         44ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqUkrj8PHX+LFqPLuqpniwW9pHO+zUoKSvlGNgXdRpQ=;
        b=En9Iy8whzdMUJFfwmwqr2CPMQXQmW6NB9QCykZ4EODyQLzYnCHSmXAsPU4CaHmdD3J
         vtD3/6WL/TtPsXc1SPp5LBPWgkieCdRFZ+l42SEY7j2V7eD5XZHcSU+FSmDrwYN3JzTZ
         fFlV62BVnJcfzhHZUdXPica+8p3O53cf2vYkVTlPvSVgkq5ocWKhby+1DYf/Y58U6cNG
         iftMvBNkMBsUQfZZNe0F+O4H8fP3IGFFTw9P8jXuE6zFB2sCQqvEKji4VWmmWcxATtpz
         9ILiU42HHa/wD8ME8Qs+nsveeoTUOuFtjgUfqJsmHh4qLAeAbqXCBNFefJVXE6ynwXJ3
         cjjA==
X-Gm-Message-State: AFqh2kroQG6uDL3n/82z3zpQYHWKKB7fWapSA0Ho2oz3k2ZB9ezKnd8o
        65cegR09OHttp/0zFKMHXRAwNLS3vpZf/AbP7F5vp3RBcN80Qb1K
X-Google-Smtp-Source: AMrXdXviHzhrbdKhdyGotEDUarg0RWbtMp2NCzRPwnh2r/CyZEpvs6jZZx4PLx295m/fi0lov7w8YP33xdctPtYbT8o=
X-Received: by 2002:a67:2245:0:b0:3ce:c8fd:ddf0 with SMTP id
 i66-20020a672245000000b003cec8fdddf0mr7110711vsi.18.1674958652331; Sat, 28
 Jan 2023 18:17:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6130:1015:b0:559:9619:d862 with HTTP; Sat, 28 Jan 2023
 18:17:31 -0800 (PST)
X-Originating-IP: [24.53.241.20]
From:   Nick Bowler <nbowler@draconx.ca>
Date:   Sat, 28 Jan 2023 21:17:31 -0500
Message-ID: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
Subject: PROBLEM: sparc64 random crashes starting w/ Linux 6.1 (regression)
To:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        regressions@lists.linux.dev
Cc:     Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi,

Starting with Linux 6.1.y, my sparc64 (Sun Ultra 60) system is very
unstable, with userspace processes randomly crashing with all kinds of
different weird errors.  The same problem occurs on 6.2-rc5.  Linux
6.0.y is OK.

Usually, it manifests with ssh connections just suddenly dropping out
like this:

  malloc(): unaligned tcache chunk detected
  Connection to alectrona closed.

but other kinds of failures (random segfaults, bus errors, etc.) are
seen too.

I have not ever seen the kernel itself oops or anything like that, there
are no abnormal kernel log messages of any kind; except for the normal
ones that get printed when processes segfault, like this one:

  [  563.085851] zsh[2073]: segfault at 10 ip 00000000f7a7c09c (rpc
00000000f7a7c0a0) sp 00000000ff8f5e08 error 1 in
libc.so.6[f7960000+1b2000]

I was able to reproduce this fairly reliably by using GNU ddrescue to
dump a disk from the dvd drive -- things usually go awry after a minute
or two.  So I was able to bisect to this commit:

  2e3468778dbe3ec389a10c21a703bb8e5be5cfbc is the first bad commit
  commit 2e3468778dbe3ec389a10c21a703bb8e5be5cfbc
  Author: Peter Xu <peterx@redhat.com>
  Date:   Thu Aug 11 12:13:29 2022 -0400

      mm: remember young/dirty bit for page migrations

This does not revert cleanly on master, but I ran my test on the
immediately preceding commit (0ccf7f168e17: "mm/thp: carry over dirty
bit when thp splits on pmd") extra times and I am unable to get this
one to crash, so reasonably confident in this bisection result...

Let me know if you need any more info!

Thanks,
  Nick
