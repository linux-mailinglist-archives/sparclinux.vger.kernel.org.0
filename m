Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373F52E8C51
	for <lists+sparclinux@lfdr.de>; Sun,  3 Jan 2021 14:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbhACNkt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 3 Jan 2021 08:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbhACNks (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 3 Jan 2021 08:40:48 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D38CC061573;
        Sun,  3 Jan 2021 05:40:08 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id f6so23519693ybq.13;
        Sun, 03 Jan 2021 05:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OqFx3RyXeCdVwZ8JzFgbuWfyGDN5YxTyYy25TVRpT/Q=;
        b=Vi7q+Xx5nDXVMEimDrNdo6lph7Kv2fo2ui3axn9v1ddli7Ik/hjEIw3HOEGHgJw+J6
         w0cW5cSBjkyO20fKayAeE3QW7PuAra6vgvMIh0PUcl72in8ICDNGaCEwAqpztS1t17zT
         bSvvig8cqDodbOyofgJOICtCnd5Nm79h13OzhgzaI3sU7mAbHn3+57F4j3iWN2LdpXbT
         aC43g9IAZLjeKuPU3OxQj9oW0zurfCBJhFX81SXIhVi4QqjWTBF0Dvu0UYtjXrZmXW1Z
         mj50KJ3bXx8W5GurCr3cSKYBu5aiwBuMkfhpH5C6O0efndRfboMOJTqowTv/2jxgbrOk
         WREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OqFx3RyXeCdVwZ8JzFgbuWfyGDN5YxTyYy25TVRpT/Q=;
        b=P6VBUeXyrwiHrmCfp5booH+bqggA58xM4qAUuCdp76D5oKEP1NSAZZg4wyKEJnuHwo
         b8IOAhgC64yyTEWx9vJyFprKdugbMdsmEHXJPjv+ZM2tQeuG6whansbIuF5TXevdBNE0
         VCOagricPZzHZ25iLtfpxTAv7jwM4skV0gHTDQWL5PS/qjWGrJLKBYetQj4YdOb63SbV
         6aRO/dl5S7Iw+H4U3FFyBVEjysC3RyYjzFAA+Vp7y6pIz/HBox3JkLnMHRQr3ty/rDxP
         BhHzz60+RG0F7yKEg5UjrrB3Ff2YiDQc3vQtsdGDhSmvxv0BIgsIW7DYXrntxay1JyYp
         U2xA==
X-Gm-Message-State: AOAM530kt4Invk4qrvLL+3w5HvRfCelUyot+Ioq1yUc2wMJoCzZQOjcP
        cDYSRc6oZqezEQNQDRXMtUflYv4aQXrqlhXT0+OHaRBskQcNEg==
X-Google-Smtp-Source: ABdhPJxjXgRNvSDJkRkkh9SCEaRxO9KDDs+YSVP/XbqSl8Uqbm1UtOUbJ+Bm5btMdzwM3ZBmxtHAhWpOUV1bUHxHgIo=
X-Received: by 2002:a25:e048:: with SMTP id x69mr100847194ybg.353.1609681207099;
 Sun, 03 Jan 2021 05:40:07 -0800 (PST)
MIME-Version: 1.0
References: <CADxRZqwARwrMeJZTWLeUtGyjStuz=ze2dwNqov0EyfHkRBM1fw@mail.gmail.com>
In-Reply-To: <CADxRZqwARwrMeJZTWLeUtGyjStuz=ze2dwNqov0EyfHkRBM1fw@mail.gmail.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Sun, 3 Jan 2021 16:39:56 +0300
Message-ID: <CADxRZqxLHUqf_Hj8bMgG=kMiZ75BbTgaqC+5rXjeGe5kzCQBWg@mail.gmail.com>
Subject: Re: [sparc64] running stress-ng and a sparc64 hardware / kernel woes
To:     Linux Kernel list <linux-kernel@vger.kernel.org>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

just to give you another sample:

running stress-ng in ssh session:

stress-ng --opcode 1 --timeout 60 --metrics-brief

get the following on the console:

[  813.208349] Kernel unaligned access at TPC[4cf720] lock_acquire+0x100/0x200
[  813.208378] Unable to handle kernel paging request in mna handler
[  813.208419]  at virtual address 794b00a7d6fbfb37
[  813.208460] current->{active_,}mm->context = 0000000000001774
[  813.208483] current->{active_,}mm->pgd = fff800004a6cc000
[  813.208506]               \|/ ____ \|/
[  813.208506]               "@'/ .. \`@"
[  813.208506]               /_| \__/ |_\
[  813.208506]                  \__U_/
[  813.208555] stress-ng-opcod(5955): Oops [#1]
[  813.208577] CPU: 0 PID: 5955 Comm: stress-ng-opcod Tainted: G
     E     5.11.0-rc1-00073-g3516bd729358 #173
[  813.208618] TSTATE: 0000000080e01602 TPC: 00000000004cf720 TNPC:
00000000004cf724 Y: 00000000    Tainted: G            E
[  813.208659] TPC: <lock_acquire+0x100/0x200>
[  813.208680] g0: 0000000000000000 g1: 0000000000000001 g2:
0000000000004023 g3: 0000000001502400
[  813.208712] g4: fff800004a9faf80 g5: 794b00a7d5ede977 g6:
fff800004071c000 g7: 00000000ffffffff
[  813.208744] o0: 0000000000000007 o1: 0000000000dd6070 o2:
fff800004058bb30 o3: 0000000000000000
[  813.208779] o4: 0000000000000034 o5: 000000000000000b sp:
fff800004058aaf1 ret_pc: 000000000042aa84
[  813.208812] RPC: <sun4v_do_mna+0x24/0xa0>
[  813.208836] l0: 00000000010e11c0 l1: 0000000000edbc78 l2:
000000000048f2c0 l3: 0000000000000020
[  813.208869] l4: 794b00a7d6fbfb37 l5: 00000000000e0000 l6:
fff800004071c000 l7: 0000000080001002
[  813.208901] i0: 0000000000f737a8 i1: 0000000000000000 i2:
0000000000000000 i3: 0000000000000002
[  813.208933] i4: 00000000010e11c0 i5: 0000000000000000 i6:
fff800004058abc1 i7: 000000000048f2f0
[  813.208966] I7: <atomic_notifier_call_chain+0x30/0xc0>
[  813.208993] Call Trace:
[  813.209008] Disabling lock debugging due to kernel taint
[  813.209016] Instruction DUMP:
[  813.209019]  21004384
[  813.209025]  a01421c0
[  813.209031]  b8100010
[  813.209037] <c2070005>
[  813.209043]  80a06000
[  813.209049]  1240001d
[  813.209054]  01000000
[  813.209060]  c2012874
[  813.209065]  80a06000
[  813.209071]
[  813.209142] CPU[0]: Args were cnt(1) cpulist_pa(34c4a000)
mondo_block_pa(3040d680)
[  813.209160] Kernel panic - not syncing: Unexpected SUN4V mondo error 6
[  813.210744] sun4v_cpu_stop() failed err=6
[  813.211316] Press Stop-A (L1-A) from sun keyboard or send break
[  813.211316] twice on console to return to the boot prom
[  813.211327] ---[ end Kernel panic - not syncing: Unexpected SUN4V
mondo error 6 ]---
