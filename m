Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE49FBB24
	for <lists+sparclinux@lfdr.de>; Wed, 13 Nov 2019 22:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKMV45 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 13 Nov 2019 16:56:57 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39226 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMV44 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 13 Nov 2019 16:56:56 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iV0ch-00077n-F2; Wed, 13 Nov 2019 22:56:23 +0100
Date:   Wed, 13 Nov 2019 22:56:22 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     y2038@lists.linaro.org, Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: Re: [PATCH 03/23] y2038: vdso: change timeval to
 __kernel_old_timeval
In-Reply-To: <20191108210824.1534248-3-arnd@arndb.de>
Message-ID: <alpine.DEB.2.21.1911132256110.2507@nanos.tec.linutronix.de>
References: <20191108210236.1296047-1-arnd@arndb.de> <20191108210824.1534248-3-arnd@arndb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, 8 Nov 2019, Arnd Bergmann wrote:

> The gettimeofday() function in vdso uses the traditional 'timeval'
> structure layout, which will be incompatible with future versions of
> glibc on 32-bit architectures that use a 64-bit time_t.
> 
> This interface is problematic for y2038, when time_t overflows on 32-bit
> architectures, but the plan so far is that a libc with 64-bit time_t
> will not call into the gettimeofday() vdso helper at all, and only
> have a method for entering clock_gettime().  This means we don't have
> to fix it here, though we probably want to add a new clock_gettime()
> entry point using a 64-bit version of 'struct timespec' at some point.
> 
> Changing the vdso code to use __kernel_old_timeval helps isolate
> this usage from the other ones that still need to be fixed properly,
> and it gets us closer to removing the 'timeval' definition from the
> kernel sources.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
