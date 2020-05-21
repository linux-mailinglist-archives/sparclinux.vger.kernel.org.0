Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8FC1DD836
	for <lists+sparclinux@lfdr.de>; Thu, 21 May 2020 22:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgEUUYC (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 21 May 2020 16:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgEUUYC (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 21 May 2020 16:24:02 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597F6C061A0E
        for <sparclinux@vger.kernel.org>; Thu, 21 May 2020 13:24:02 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jbrjK-00D7e8-Kc; Thu, 21 May 2020 20:23:50 +0000
Date:   Thu, 21 May 2020 21:23:50 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        David Miller <davem@davemloft.net>, arnd@arndb.de,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 0/3] sparc: port to copy_thread_tls() and struct
 kernel_clone_args
Message-ID: <20200521202350.GI23230@ZenIV.linux.org.uk>
References: <20200512.130633.293867428547074800.davem@davemloft.net>
 <20200517150123.sl36ug27gwnyz6gf@wittgenstein>
 <cfc07b63-29e6-cda9-c611-235e37970763@ilande.co.uk>
 <20200517221346.GL23230@ZenIV.linux.org.uk>
 <20200518181825.GM23230@ZenIV.linux.org.uk>
 <cf84ad0e-11a8-1066-5b7b-edb7cf482f76@ilande.co.uk>
 <20200518230840.GN23230@ZenIV.linux.org.uk>
 <20200519002438.GA2726018@ZenIV.linux.org.uk>
 <3301bd45-d3b0-512a-c00b-53b3d9f76ff9@ilande.co.uk>
 <2ec71021-df8e-f267-faa7-c5f57fcf3f77@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ec71021-df8e-f267-faa7-c5f57fcf3f77@ilande.co.uk>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, May 21, 2020 at 08:42:34PM +0100, Mark Cave-Ayland wrote:

> > Can you tell me a bit more about the host in terms of CPU and disk to help figure out
> > what's going on?

phenom II X6 1100T (6-way 3.3GHz), 8Gb RAM (4Gb given to guest), WDC WD10EACS-00D
disk (hdparm -tT gives
 Timing cached reads:   6988 MB in  2.00 seconds = 3494.96 MB/sec
 Timing buffered disk reads: 280 MB in  3.02 seconds =  92.75 MB/sec
)

> One other thought I had is that somehow the IVEC IRQs are managing to be overwritten
> on a faster host before being read by the guest. Does the following patch display the
> FATAL message at the point where things hang?

> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
> index fae20ee97c..618ebd1300 100644
> --- a/hw/pci-host/sabre.c
> +++ b/hw/pci-host/sabre.c
> @@ -63,6 +63,9 @@
>  static inline void sabre_set_request(SabreState *s, unsigned int irq_num)
>  {
>      trace_sabre_set_request(irq_num);
> +    if (s->irq_request != 0 && s->irq_request != NO_IRQ_REQUEST) {
> +        fprintf(stderr, "FATAL: still waiting for IRQ %x, now %x\n", s->irq_request,
> irq_num);
> +    }
>      s->irq_request = irq_num;
>      qemu_set_irq(s->ivec_irqs[irq_num], 1);
>  }

I have to go AFK right now, will test when I get back (should be about an
hour or two)
