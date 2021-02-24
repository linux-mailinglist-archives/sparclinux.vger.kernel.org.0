Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55D332437E
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 19:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhBXSFV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 13:05:21 -0500
Received: from mout.web.de ([212.227.17.12]:52223 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhBXSFV (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 24 Feb 2021 13:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1614189801;
        bh=brA08jd38xvbf3oc7joMJr2hS6HhBMB6QkenNnCq+xY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=H+bHiVZVbhjH1LSaWFrT9v8MFiX1r7fKSDRhPbwi+3p22ruKZsT1jU08luachlaim
         88xzFCBqwM7XtPElsP6/xgxDtSb9b7UE9C4ACnRzlEiY62xA9wPuIhBWdlvCJ8qetj
         ZSj0JWDISCwnXY2N3Rl1qj5GO7ordUo9hn0AFGzk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.36] ([217.247.33.56]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LtWsC-1lvpgC3cMG-010ugE; Wed, 24
 Feb 2021 19:03:20 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc:     debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <69171194-4f65-f355-7fc4-4cf9b519c059@web.de>
 <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <36fae360-339b-b250-a2cd-5defa9b81fad@web.de>
Date:   Wed, 24 Feb 2021 19:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <edd947e8-7e27-c002-018d-f3070d47fef1@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SpkAKW2aQNS9WDeXBXKdYLsCcEjBuXQf2eQvY01rcSVH9SmFhrH
 /GRwG6E7BgxqwSTT0K2FAuh/cg1jvzcvDDl87HDBZPzs7MDvh4YXyydnH1HkJVdDQYgsznS
 LYTQ9dRiwLk+mG0gzvOz31zd4/PdzaknujJtxzckB01gqqRScbRlMToXSoYEnAM5KffcoKQ
 1y2xp7QGruRxNFijaPhxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tBQxrjFmEfk=:jJ1hLhZcTCzOfdv6AquHpt
 gHAxA5ufsE5tvTGu7sGTMkQKcgWegxbrPdcfRaqVk3aE2V3v0rwAr876Y0LF4ysl0mS/h2YLc
 DiPyUn34bwmoP9T16xWAz9VthroVM8/3lQez1VOrmo/9hQIyS+5VarRyzm29TUdm9SLcPj98J
 yF92Qata46eK0TsIZzgdsEvzoCIN9naPdJfvc0FuYWwe1x8/3+P1rydS972XLawtYFu4mzoBF
 8mCidTOmBxCwLmduCV/Nag3zhPsiioeEUs4L1MajONR1ZAxpUoQhbaC6HAHLiu+cCtUAYlKgX
 tyqZoJfG2kc6fyeg9iB2kzMnrez7rupPQ9DJ1UzNT5EkPHwEf3bg0X1yYrGsjukqKYjbhL7Va
 nDpBmOgOIK/ghiZCBjtYqFNH99QY2Lkiy+YX5c+2cVPHJizclSGY9oywuyGBLsRFYP/dh5SXr
 owQDVwgKFuOnDwwOFAy3WEtgr0IL+JYlkV5uErmXD33Z3PZJzXLKYf5KutSxhr4XAETnkF36z
 bXOpjP/gK3GXxg720vK1gJQclJjEb+fiKh8fV86MvDXSSTR/kNkJv/H6/Hqpzo3Ejkw0C9tAn
 arPUwZBuafYn821wgkLm2I6lZEoPXEshbvfVTdfDg++sTXHxUDMhGX4o47zDKay/8j8FVEozn
 tv/QBNZLe0hq5VSrJsRWXGgZ7Pn21ZVTSUMkv53Wsw8b0kyT4zjqti9VFbQDxrWEwoNdWQi4Y
 mLB6ipachUSoL5+4UaXuL7EF9AiOuBagZqelm0XhQmlW0p+0/WTWEDFivaIcZfF5JPCSbYc+9
 pBzvWb098QEL+fxlcJO8o0NoBl8IvX69EGwbL8xtN94M97KYi5Z4uTXTQ5xHNAOEXrkT6Jsu1
 dytPOuM34pdFi7U/6x8w==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Mark,

On 24.02.21 14:01, Mark Cave-Ayland wrote:
> On 24/02/2021 12:29, Frank Scheiner wrote:
>> On 24.02.21 12:14, Mark Cave-Ayland wrote:
> Thanks for the information! Do you have a display on your U450 at all?

No, access was/is via serial console.

> The U450 we were trying to rescue was headless (i.e. connect via serial
> only) so the only differences I can see might either be the display or
> the fact that the boot was occurring from the CDROM rather than a local
> disk installation.

I'd agree to no display and serial console except that my machine had no
local disk and was netbooted - so netboot instead of boot from CDROM.

Other idea, can you be sure that the used disc was w/o errors and the
used disc drive was OK, too?

> Next time you have the U450 fired up, I'd be interested to find out if
> it is possible to boot directly from the latest debian ports CDROM for
> comparison.

I can give that a try end of the week and report back.

Cheers,
Frank
