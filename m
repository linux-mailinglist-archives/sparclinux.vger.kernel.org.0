Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C00C13464F
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jan 2020 16:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgAHPek (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 8 Jan 2020 10:34:40 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:50432 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgAHPej (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 8 Jan 2020 10:34:39 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1ipDLt-0001th-CA; Wed, 08 Jan 2020 16:34:33 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id CC2F51060B2; Wed,  8 Jan 2020 16:34:32 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Julian Calaby <julian.calaby@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] y2038: sparc: remove use of struct timex
In-Reply-To: <20191216144907.1931511-1-arnd@arndb.de>
References: <20191216144907.1931511-1-arnd@arndb.de>
Date:   Wed, 08 Jan 2020 16:34:32 +0100
Message-ID: <871rsaezcn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> 'struct timex' is one of the last users of 'struct timeval' and is
> only referenced in one place in the kernel any more, to convert the
> user space timex into the kernel-internal version on sparc64, with a
> different tv_usec member type.
>
> As a preparation for hiding the time_t definition and everything
> using that in the kernel, change the implementation once more
> to only convert the timeval member, and then enclose the
> struct definition in an #ifdef.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
