Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BD323F84
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 16:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbhBXOGh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 09:06:37 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:52691 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233844AbhBXNAu (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Wed, 24 Feb 2021 08:00:50 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lEtlo-003Y3K-GJ; Wed, 24 Feb 2021 14:00:00 +0100
Received: from p57bd9049.dip0.t-ipconnect.de ([87.189.144.73] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lEtlo-0045AT-9u; Wed, 24 Feb 2021 14:00:00 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     Frank Scheiner <frank.scheiner@web.de>
Cc:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <9e66c20d-ad1c-3fd3-221a-bb17e9623b64@physik.fu-berlin.de>
 <9508f25c-11a3-8601-aff3-cde3738ed884@web.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <32382ebd-e4d6-106c-76d9-24b8a90ab89e@physik.fu-berlin.de>
Date:   Wed, 24 Feb 2021 13:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9508f25c-11a3-8601-aff3-cde3738ed884@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.73
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Frank!

On 2/24/21 1:43 PM, Frank Scheiner wrote:
>> There is a stability issue on newer kernels on older hardware that is currently
>> being debugged though [1].
> 
> Didn't know of that thread. I wonder if this could be the reason for the
> crashes on my v480 and v490, though they happened already during kernel
> boot.

I think this particular issue concerns mainly stability issues under high load.

I have observed that the UltraSPARC IIIi we have in Debian will crash under
high load with the newer kernels but runs very stable on older kernels.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

