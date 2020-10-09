Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A11A288BA7
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 16:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387988AbgJIOk2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 10:40:28 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55357 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388736AbgJIOk2 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 9 Oct 2020 10:40:28 -0400
X-Greylist: delayed 584 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Oct 2020 10:40:27 EDT
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kQtPu-002Nnn-DL; Fri, 09 Oct 2020 16:30:42 +0200
Received: from p5b13af0b.dip0.t-ipconnect.de ([91.19.175.11] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kQtPn-002IbQ-Pf; Fri, 09 Oct 2020 16:30:42 +0200
Subject: Re: SMP is broken on sparc64 with kernel 4.x/5.x
To:     Wolf Ruediger Spielmann <RSpielmann@gmx.de>
References: <20201009161924.c8f031c079dd852941307870@gmx.de>
Cc:     sparclinux@vger.kernel.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
Date:   Fri, 9 Oct 2020 16:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009161924.c8f031c079dd852941307870@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.175.11
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Wolf!

On 10/9/20 4:19 PM, Wolf Ruediger Spielmann wrote:
> I freshly installed linux on my SUN Ultra 60 /w 2x 450MHz CPUs.
> 
> First I tested kernel 5.8.x and couldn't get SMP to work on both CPUs - just the first CPU will be activated.
> Same results with kernel 4.19.146 .
> Kernel 3.18.140 runs perfectly on both CPUs.
> 
> Might be the problem that the CPUs numbering scheme is not linear:
> CPU1 is #0 and CPU2 is #2 (NOT #1)

It mostly affects older machines, the newer machines such as T5220, T5240 and T5 that
we have in Debian have no issues with the latest kernel versions.

We do have an UltraSPARC IIIi machine that we need to keep at 4.19 as the machine otherwise
becomes unstable.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

