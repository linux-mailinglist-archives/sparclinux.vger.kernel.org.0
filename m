Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA54D326CCD
	for <lists+sparclinux@lfdr.de>; Sat, 27 Feb 2021 11:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhB0KrX (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 27 Feb 2021 05:47:23 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37813 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229990AbhB0KrW (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Sat, 27 Feb 2021 05:47:22 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lFx7Q-000f0n-KE; Sat, 27 Feb 2021 11:46:40 +0100
Received: from p57bd9fdc.dip0.t-ipconnect.de ([87.189.159.220] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lFx7Q-003hra-Dl; Sat, 27 Feb 2021 11:46:40 +0100
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Meelis Roos <mroos@linux.ee>, Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
 <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
 <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
 <3d42713e-bff6-63d9-2c0e-781e829d78f8@linux.ee>
 <584994e3-09b6-de8c-f08a-9962075711f9@oracle.com>
 <ede51bdb-6746-93d8-7f4b-8620c2105d81@linux.ee>
 <6cd974c1-4727-8245-f149-7f971a3965d5@oracle.com>
 <8a2e371d-a8d6-9520-5428-602b5361ea74@linux.ee>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <2e9d0fe6-43ed-17ed-5bc1-00dd57bc4856@physik.fu-berlin.de>
Date:   Sat, 27 Feb 2021 11:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8a2e371d-a8d6-9520-5428-602b5361ea74@linux.ee>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.159.220
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/27/21 11:31 AM, Meelis Roos wrote:
> 26.02.21 23:26 Rob Gardner wrote:
> 
>> Here is a single patch that does everything, and is cleaned up and more concise. If this all works
>> then I can send it as an official patch (though with the printk removed of course.)
> 
> Hand-applied it (whitespace damage or did my Thunderbird expand the tabs?) and tested with the same
> 2 opcodes as before + random opcodes. Works stable, nothing particular in dmesg - only these but these
> are frequent in tty code on sparcs:
> 
> [   53.514956] CPU[0]: Cheetah+ D-cache parity error at TPC[000000000076888c]
> [   53.621019] TPC<n_tty_set_termios+0x2c/0x3c0>
> 
> So it seems good, thanks!

Great news. I'm glad this issue finally gets fixed!

Thanks to both you and Rob for your efforts, much appreciated!

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

