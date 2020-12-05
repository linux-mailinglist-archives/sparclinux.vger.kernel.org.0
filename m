Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E45B2CFB57
	for <lists+sparclinux@lfdr.de>; Sat,  5 Dec 2020 13:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgLEKbE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 5 Dec 2020 05:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbgLEK2k (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 5 Dec 2020 05:28:40 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08F3C0613D1
        for <sparclinux@vger.kernel.org>; Sat,  5 Dec 2020 02:16:44 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id x2so7937690ybt.11
        for <sparclinux@vger.kernel.org>; Sat, 05 Dec 2020 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=S/6NQ7Dtx6Mr8hdnJ0ejyk3lsdEVMLDbZ2PzXQ2414A=;
        b=o32H/Fovc48V9Cly8LD2i2noBPONmLKQEhL6mJgMW5bKNAkgW6ry32aHULYWgj1q+h
         W7MLUwXrvaF03gvnoDnxaBcjdi2e6mm2PnQKqujEp7xyoj4Fm++S1ivp4VYRL9cklg4N
         WTgppwsWWvlE+mshAQ0JTqsfmLhgkX6dY6KR7gxEK8HNLUYIVHRMGmdsc3xaokvmTOI+
         7mgW63eE1mLY/M000lx1QpdhVfZWUPTs3S26yESDz7kXXMHuNyAniIHyiT5UKg+ib0/1
         QTszlzzUX6KhyWvujShR3lEs69N+e+OVcGmfv5mEoZpXTekadYOoZmVD2s1yRF1VrEX+
         REHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=S/6NQ7Dtx6Mr8hdnJ0ejyk3lsdEVMLDbZ2PzXQ2414A=;
        b=k5PMtLhutt3u6tkS4X1tMNossLEMs4QD14JoJ3AkKc1rKZSGq88i6mSE93W0Xkka1O
         xkJtDfxGA6pkRA2xNed1Phge+ESlxIjX4c/qZwjmRMKGDwKQcJdTmXtvZKFD0NEBJHqa
         mcyj+hyKjgvSqXBffz6gtIdBeyjhZmMk/fz01hYtwzonuiqAGtqgiEieDZu8jx1wAeTi
         5S/2u8IN/X+YM1KyoJ/CqcqA9pdBpZRQT4+M2eGgQXey/uJV81xrDS0BCWnl8DPM+L5C
         T1/xlyTeyFcSYRg03YagLiYPQSZiTjNmrEjSLElBS5AAYcH58+k8ARM1GRuQtfPx7k1c
         5LKg==
X-Gm-Message-State: AOAM532aSrsfCS1yMGt7dkoTQiL2LHYGQflyYpXhl36/TpTolOaeqfU5
        I2bViNZ0lsSkJH+ixKX60NXPy2ngkVy8lJu6dzOzubtSekA=
X-Google-Smtp-Source: ABdhPJxa+2Upg1YeSZKSfuFs0YKNMDZ3U/GZZqoPbXaPONCRGj3ym5J1lm2X+1Uz3Fgr/ffQJl0O/9fi8k33DPFWMyc=
X-Received: by 2002:a25:d92:: with SMTP id 140mr2925699ybn.101.1607163403885;
 Sat, 05 Dec 2020 02:16:43 -0800 (PST)
MIME-Version: 1.0
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Sat, 5 Dec 2020 13:16:33 +0300
Message-ID: <CADxRZqwUfOq_GoPjcHHkZhcy5k_WOz0NMGO3tjsBJRJNeYu5uQ@mail.gmail.com>
Subject: "No support for PMU type" or early "NMI appears to be stuck (0->0)"
To:     Sparc kernel list <sparclinux@vger.kernel.org>,
        debian-sparc <debian-sparc@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello!

Just to share my current experience with updated solaris being used as
a hypervisor for linux LDOMs.

Using sparc T5-2 server as a hypervisor (solaris 11.4 for primary
domain) for various LDOMs, with ones being used under linux OS (debian
sid unstable).

Recently, updated solaris on primary domain to latest version and some
of my linux domains started to report the following logs on kernel
boot (full log at [1]):

$ dmesg
...
[    0.401140] smp: Brought up 1 node, 8 CPUs
[    0.403154] devtmpfs: initialized
[    0.403758] Performance events:
[    0.403771] Testing NMI watchdog ...
[    0.483850] WARNING: CPU#0: NMI appears to be stuck (0->0)!
[    0.483861] Please report this to bugzilla.kernel.org,
[    0.483872] and attach the output of the 'dmesg' command.
[    0.483885] WARNING: CPU#1: NMI appears to be stuck (0->0)!
[    0.483896] Please report this to bugzilla.kernel.org,
[    0.483907] and attach the output of the 'dmesg' command.
[    0.483925] WARNING: CPU#2: NMI appears to be stuck (0->0)!
[    0.483940] Please report this to bugzilla.kernel.org,
[    0.483954] and attach the output of the 'dmesg' command.
[    0.483972] WARNING: CPU#3: NMI appears to be stuck (0->0)!
[    0.483986] Please report this to bugzilla.kernel.org,
[    0.484001] and attach the output of the 'dmesg' command.
[    0.484018] WARNING: CPU#4: NMI appears to be stuck (0->0)!
[    0.484032] Please report this to bugzilla.kernel.org,
[    0.484047] and attach the output of the 'dmesg' command.
[    0.484064] WARNING: CPU#5: NMI appears to be stuck (0->0)!
[    0.484078] Please report this to bugzilla.kernel.org,
[    0.484093] and attach the output of the 'dmesg' command.
[    0.484110] WARNING: CPU#6: NMI appears to be stuck (0->0)!
[    0.484124] Please report this to bugzilla.kernel.org,
[    0.484138] and attach the output of the 'dmesg' command.
[    0.484154] WARNING: CPU#7: NMI appears to be stuck (0->0)!
[    0.484169] Please report this to bugzilla.kernel.org,
[    0.484183] and attach the output of the 'dmesg' command.
[    0.484207] No support for PMU type 'niagara5'
[    0.484409] ldc.c:v1.1 (July 22, 2008)
[    0.484766] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns

versus old behavior on the same domain :
$ journalctl -k -b -2 -o short-monotonic --no-hostname
...
[    0.427406] kernel: smp: Brought up 1 node, 24 CPUs
[    0.429746] kernel: devtmpfs: initialized
[    0.430558] kernel: Performance events:
[    0.430577] kernel: Testing NMI watchdog ...
[    0.510652] kernel: OK.
[    0.510669] kernel: Supported PMU type is 'niagara5'
[    0.511025] kernel: ldc.c:v1.1 (July 22, 2008)
[    0.511485] kernel: clocksource: jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns


while checking what has changed , found that domains which report "NMI
appears to be stuck" being a bit different in a LDOM configuration for
the domain, they have empty perf-counters [2]:

$ ldm list -l ldg0 | grep perf
    perf-counters=

setting "perf-counters" to any value [ "strand" or "htstrand" ] ,
removes this error messages and gets back to the older behaviour.

Not sure if this info will be useful to anyone, but posting anyway....

Thanks.

1. https://gist.github.com/mator/19769bf36625bdd1d27cecf38591ea75
2. https://docs.oracle.com/cd/E93612_01/html/E93617/useperfcounterprops.html

PS: I didn't found perf-counter being used (declared) in a ldom
configuration on older machines, like T3-2 or T5240
