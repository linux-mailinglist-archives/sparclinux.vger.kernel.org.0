Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FD1323BC3
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 13:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhBXMEu (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 07:04:50 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:39089 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232564AbhBXMEu (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Wed, 24 Feb 2021 07:04:50 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lEsth-0037e6-6d; Wed, 24 Feb 2021 13:04:05 +0100
Received: from p57bd9049.dip0.t-ipconnect.de ([87.189.144.73] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lEstg-003xhc-VB; Wed, 24 Feb 2021 13:04:05 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <9e66c20d-ad1c-3fd3-221a-bb17e9623b64@physik.fu-berlin.de>
Date:   Wed, 24 Feb 2021 13:04:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.73
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Mark!

On 2/24/21 12:14 PM, Mark Cave-Ayland wrote:
> Do people still run newer kernels on older hardware? If there is interest,
> I may be able to get some more diagnostic information. In particular I'd be
> curious to know if Oracle do any routine testing of newer kernels on machines
> such as the U450 and whether anyone there can reproduce the problem.

I think this must be an issue specific to this machine or this model as I haven't
seen such issues myself when testing on older machines.

There is a stability issue on newer kernels on older hardware that is currently
being debugged though [1].

Adrian

> [1] https://marc.info/?l=linux-sparc&m=161399891728083&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

