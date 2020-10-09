Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0350288BD5
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388885AbgJIOtf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 10:49:35 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57515 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732056AbgJIOtf (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 9 Oct 2020 10:49:35 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kQti9-002T9m-Jd; Fri, 09 Oct 2020 16:49:33 +0200
Received: from p5b13af0b.dip0.t-ipconnect.de ([91.19.175.11] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kQti9-002LMC-Cn; Fri, 09 Oct 2020 16:49:33 +0200
Subject: Re: SMP is broken on sparc64 with kernel 4.x/5.x
To:     Wolf Ruediger Spielmann <RSpielmann@gmx.de>
Cc:     sparclinux@vger.kernel.org
References: <20201009161924.c8f031c079dd852941307870@gmx.de>
 <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
 <20201009164026.1c811fa50ae5f71551717fef@gmx.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <d4dc8448-fa89-6da7-e499-c4f18e6800fa@physik.fu-berlin.de>
Date:   Fri, 9 Oct 2020 16:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009164026.1c811fa50ae5f71551717fef@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.175.11
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello Ruediger!

On 10/9/20 4:40 PM, Wolf Ruediger Spielmann wrote:
> On Fri, 9 Oct 2020 16:30:35 +0200
> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> 
>> It mostly affects older machines, the newer machines such as T5220, T5240 and T5 that
>> we have in Debian have no issues with the latest kernel versions.
>>
>> We do have an UltraSPARC IIIi machine that we need to keep at 4.19 as the machine otherwise
>> becomes unstable.
> 
> I have absolute no stability issues.
> It's (in my opinion) pcpu-alloc:
> kernel 4.x/5.x: pcpu-alloc: [0] 0 1 
> kernel 3.x: pcpu-alloc: [0] 0 2 

Interesting. I have not yet seen this issue on any of our Debian development
machines. What distribution are you running? Is this Gentoo?

Our of curiosity, could you give it a go with Debian?

> https://cdimage.debian.org/cdimage/ports/2020-08-19/debian-10.0.0-sparc64-NETINST-1.iso

> Is it fixable? Or will it stay in state "broken" ?

Of course, it would be fixed we know what's wrong.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
