Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0338B323C0B
	for <lists+sparclinux@lfdr.de>; Wed, 24 Feb 2021 13:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhBXMps (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 24 Feb 2021 07:45:48 -0500
Received: from mout.web.de ([212.227.15.3]:45185 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232761AbhBXMpr (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 24 Feb 2021 07:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1614170615;
        bh=U3St9vzkBel2F0pMzpU5+Gh2PRqo/4WNm3TF82B43zM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=JDXIZHWdcoAy6d7cpucN1rCJce+t5fB8zMtNSDu4AOkWXwcLi3mIo8XHDb95NHXkk
         zZKazxsFrR3VJAJuBKDnM5KeE13POyG4bet1EgWWvfpgxMcAiqxEAKrvUDnC8GKVBy
         QizCs1ELp5xrV2/GdurG6/F7rnjFMmUwz7bOVREM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.36] ([217.247.33.56]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lmchn-1lnxHY23tr-00aF3U; Wed, 24
 Feb 2021 13:43:35 +0100
Subject: Re: Newer kernels fail to boot on a U450?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        debian-sparc <debian-sparc@lists.debian.org>,
        sparclinux@vger.kernel.org
References: <6cb1a2ea-c228-abbf-7aa7-0046799eff1e@ilande.co.uk>
 <9e66c20d-ad1c-3fd3-221a-bb17e9623b64@physik.fu-berlin.de>
From:   Frank Scheiner <frank.scheiner@web.de>
Message-ID: <9508f25c-11a3-8601-aff3-cde3738ed884@web.de>
Date:   Wed, 24 Feb 2021 13:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9e66c20d-ad1c-3fd3-221a-bb17e9623b64@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+TBvG6e83VzqvgRmuGu36xBI/FVvxc3AD+b8G0ukdcbJ0LMZD5Y
 K2T4t+2TKLOHKJrE6Ym99t+PAmC+WM4C1r1E7SpQxm1vObkhWMA/U7aikq5ukHCjz1jDH1u
 EdthiljAaxsXgZZZhiOp/9YKLnJBwkVNA881C70+gQXtMvCJok7Om17TmP7AHEr2WVYnTpW
 lWpjk9tCgY7UV2sQaP0sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FhyHYCOY2BU=:fKHpPjOgnLu2wm/wzQE+mR
 vpYP6kQCwtWlDpqBbUtB7Lz3Vx55/cSB1SqPlXMA/CywKx8DoYZ/Ke3mgjgMzy2wTH6WOT71g
 OnYc7Soil1n6Dez2AyxuLglObk90ge2wVh38BT6pMd0oFJ4cq9M1tNgr972wbDQmrikJYPP1b
 j4mkWd9/7UYqhf22CyOSkOAFriGHbTUK5Eaww9DXLl1Nq8uHcwSN6f+AM8uDR+CiSWOUKJoou
 g2pmXPzxFgZUUjxtXdKTweNl4mwL5hKAwUsM8SaCqKIvxpfhIHVThRzNaxzTi2IGMBcvG/e8K
 KYjZP6JxyBeOJDUoDjyrwnBy7owxhFwU0/KvGYRd5xjQDpXb3rNEQx9Wv+kQlF9w/a2Hkvgis
 OOGMGZ6JMPwlfSOZA89ucw/ZnqLihpB2jwzppRfTPM6dQpBCq1CbDrihAC23J4uKkS4n20peB
 XwBwxQkiE363meq3jn/NT1uFmHDxeX/MElhI1lALNwNoQPoHxzyn1Mb5tLnlUljLPuM6kfxvH
 ZCBvXUDliWN2jCTKpqLqnEbOVqCGJDrawrxPcL2CrONqdJShM5GS1R+nFZfYXIOE8Ajd02xFL
 ubKOcW+Fs968pdaBn4C78ChHkOvcXYLWMxTq7olE5gbTwpbT+GoCfpZRy8PjsgixCZK2cfPBX
 sBbgsgN6LKkL51weMTk1wxW4ZcRdx1QWjnXvAiO8p82N6OBrWUWQ+XtmcgzZI+GnK8WXs/Tz5
 kD9UDKfN8NPO4Q4E3oPrO0MzdXSeQaSI5BJ8WgWs8M4F2dOYa1a708ZOvJ/Ptomyh1/bqtnjb
 VFcJAKLOOdHLCeFEcst/g49PV77nPRxzyWa9I+L8mlIiaKhvpieu4XFfv3OV5liWcOR7BRY9M
 jEHCWdWMrvkJ4iqf/TtA==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Adrian,

On 24.02.21 13:04, John Paul Adrian Glaubitz wrote:
> Hi Mark!
>
> On 2/24/21 12:14 PM, Mark Cave-Ayland wrote:
>> Do people still run newer kernels on older hardware? If there is intere=
st,
>> I may be able to get some more diagnostic information. In particular I'=
d be
>> curious to know if Oracle do any routine testing of newer kernels on ma=
chines
>> such as the U450 and whether anyone there can reproduce the problem.
>
> I think this must be an issue specific to this machine or this model as =
I haven't
> seen such issues myself when testing on older machines.
>
> There is a stability issue on newer kernels on older hardware that is cu=
rrently
> being debugged though [1].

Didn't know of that thread. I wonder if this could be the reason for the
crashes on my v480 and v490, though they happened already during kernel
boot.

>
> Adrian
>
>> [1] https://marc.info/?l=3Dlinux-sparc&m=3D161399891728083&w=3D2
>

Cheers,
Frank
