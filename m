Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C31A2FE4A8
	for <lists+sparclinux@lfdr.de>; Thu, 21 Jan 2021 09:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbhAUIJd (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 21 Jan 2021 03:09:33 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:52275 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727383AbhAUIES (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Thu, 21 Jan 2021 03:04:18 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l2UwK-002G91-Ty; Thu, 21 Jan 2021 09:03:36 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l2UwK-000NVz-Ah; Thu, 21 Jan 2021 09:03:36 +0100
Subject: Re: soft lockups on T5120
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
References: <65a62b7c6e752dfb1b46624aa579d5e2@sf-tec.de>
 <d9e79cfa4b80373e2c54e1358d110335@sf-tec.de>
Cc:     sparclinux@vger.kernel.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <63c23957-cfb0-ecdb-babf-31fe19c0661f@physik.fu-berlin.de>
Date:   Thu, 21 Jan 2021 09:03:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d9e79cfa4b80373e2c54e1358d110335@sf-tec.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Rolf!

On 1/21/21 8:23 AM, Rolf Eike Beer wrote:
>> The kernel currently is 5.10.3, but I hit this for quite a while
>>
>> Here is what came out of dmesg today. I found no signs of trouble
>> earlier than this:
> 
> And here it is again:
> (...)

Anatoly found a reproducer for this bug [1]. So it might be an idea to bisect
the issue with the help of the reproducer.

Adrian

> [1] https://marc.info/?l=linux-sparc&m=160967865029609&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

