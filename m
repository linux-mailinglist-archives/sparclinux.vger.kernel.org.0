Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEA22D9CB6
	for <lists+sparclinux@lfdr.de>; Mon, 14 Dec 2020 17:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgLNQ2w (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 14 Dec 2020 11:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440262AbgLNQ2s (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 14 Dec 2020 11:28:48 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D001AC061793
        for <sparclinux@vger.kernel.org>; Mon, 14 Dec 2020 08:28:07 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 3so15815164wmg.4
        for <sparclinux@vger.kernel.org>; Mon, 14 Dec 2020 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=51YsbQIYuq9kiX/Ezj5Ht0AVHuSlN5jsKWqnvhPG9kE=;
        b=iDHzsbT6UFubPP0i50ey89vA1UgdSoprtVon0iTpYV1cW+lOkGEWfqFwtngURquUz5
         B077Wh7OmIoJub+RoM+M1x6u85K6cAbUV1EjwYve6CQ9Aor5/hA0jWrFAR9CLuFrFXkz
         3C2jp8TLffbBwnwyp1NdC+MQFZvQRineyv56g4pvimfGyyIKlzCGmHTKHa4EmgyeVeiV
         mTw6lJyWtD1sScow0A6lE6kIX4apxVttPZd2oBVY/jNrebHSjsEaQOFQwg5VCtcYqqN0
         JcM99HgTBXlqpNWMFCze1PUVc0oWhq7eQUDbMfzWFsQpV5I2DugUwd6SmpwvpYAI8V9s
         ODvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=51YsbQIYuq9kiX/Ezj5Ht0AVHuSlN5jsKWqnvhPG9kE=;
        b=rBKVwNAlhHNZsZ9dhY3Q6ACbeIOrcOhOuuuRRbi/zVvZASDMnkPhP9ZWb3gi4tzE99
         be8aHy2xr8e2prAp/pyqYsVuzea1xJC5OpXOixEMFUmWDXi+TmsGhedFZdPdpB8i14b9
         UU9XKi8pDdyXQ4QJdL//O0RN6aAdalBZMyXOsVNIwxXZ/Yi+/8R2ZrmlvjLXacTibwUE
         dRd5efABFnNc1wci3SmQ3sECB8Main1+c2ypsdCeZYmTQvsffbE9I+mXkk4vbBSPNElt
         ptjpBjlJlgAQU5eZntyF3nlvi9Kca9Yd5S84tpin+iyWEx9Inf6x8O59ooMlWS9ENEWK
         kRhg==
X-Gm-Message-State: AOAM532Bx1PHE4cBrTnzVvXW75wvcgpEMDs81iGP0sVAPIQJHce8NMgW
        pI3GOfDU5IYdOpvfA8u8Md+8V8eq50TC08RA
X-Google-Smtp-Source: ABdhPJy/HD9Xc/p5LiC20sf0NJ5AuesdVQXZgve4vr1XtQmZ1M0zrGpdVf8En/HPezn6ogxD8VFYdQ==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr28187914wmj.11.1607963286539;
        Mon, 14 Dec 2020 08:28:06 -0800 (PST)
Received: from Jessicas-MacBook.local (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
        by smtp.gmail.com with ESMTPSA id v64sm30884456wme.25.2020.12.14.08.28.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 08:28:05 -0800 (PST)
Received: by Jessicas-MacBook.local (Postfix, from userid 501)
        id 53694209CCA69F; Mon, 14 Dec 2020 16:28:04 +0000 (GMT)
Date:   Mon, 14 Dec 2020 16:28:04 +0000
From:   Jessica Clarke <jrtc27@jrtc27.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Anatoly Pugachev <matorola@gmail.com>,
        Linux Kernel list <linux-kernel@vger.kernel.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [sparc64] ftrace: kernel startup-tests unaligned access
Message-ID: <20201214162804.GA27786@Jessicas-MacBook.local>
References: <CADxRZqzXQRYgKc=y-KV=S_yHL+Y8Ay2mh5ezeZUnpRvg+syWKw@mail.gmail.com>
 <20201214111512.415717ac@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214111512.415717ac@gandalf.local.home>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Dec 14, 2020 at 11:15:12AM -0500, Steven Rostedt wrote:
> On Mon, 14 Dec 2020 18:59:02 +0300
> Anatoly Pugachev <matorola@gmail.com> wrote:
> 
> > Hello!
> > 
> > Enabled ftrace startup tests on a sparc64 test VM/LDOM:
> > 
> > $ diff -u <(gzip -dc ~/dmesg/config-5.10.0.gz) <(gzip -dc /proc/config.gz)
> > --- /dev/fd/63  2020-12-14 16:19:38.239372599 +0300
> > +++ /dev/fd/62  2020-12-14 16:19:38.235372433 +0300
> > @@ -2842,7 +2842,10 @@
> >  # CONFIG_TRACEPOINT_BENCHMARK is not set
> >  # CONFIG_RING_BUFFER_BENCHMARK is not set
> >  # CONFIG_TRACE_EVAL_MAP_FILE is not set
> > -# CONFIG_FTRACE_STARTUP_TEST is not set
> > +CONFIG_FTRACE_SELFTEST=y
> > +CONFIG_FTRACE_STARTUP_TEST=y
> > +CONFIG_EVENT_TRACE_STARTUP_TEST=y
> > +# CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
> >  # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> >  # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> >  # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> > 
> > 
> > Got the following results with kernel boot logs:
> > 
> > Dec 14 13:48:15 kernel: clocksource: jiffies: mask: 0xffffffff
> > max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> > Dec 14 13:48:15 kernel: futex hash table entries: 65536 (order: 9,
> > 4194304 bytes, linear)
> > Dec 14 13:48:15 kernel: Running postponed tracer tests:
> > Dec 14 13:48:15 kernel: Testing tracer function:
> > Dec 14 13:48:15 kernel: Kernel unaligned access at TPC[552a20]
> > trace_function+0x40/0x140
> > Dec 14 13:48:15 kernel: Kernel unaligned access at TPC[552a24]
> > trace_function+0x44/0x140
> > Dec 14 13:48:15 kernel: Kernel unaligned access at TPC[552a20]
> > trace_function+0x40/0x140
> > Dec 14 13:48:15 kernel: Kernel unaligned access at TPC[552a24]
> > trace_function+0x44/0x140
> > Dec 14 13:48:15 kernel: Kernel unaligned access at TPC[552a20]
> > trace_function+0x40/0x140
> 
> Does sparc64 require 8 byte alignment for 8 byte words?

Yes, SPARC requires natural alignment for all primitive types (and that
even includes 8-byte alignment for 8-byte types on 32-bit SPARC as it
has load/store pair instructions the compiler is free to use).

Jess
