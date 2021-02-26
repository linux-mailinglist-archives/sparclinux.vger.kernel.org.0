Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C95E3269D1
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 23:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBZWLE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Feb 2021 17:11:04 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:56945 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229698AbhBZWLD (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Fri, 26 Feb 2021 17:11:03 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lFlJU-002Ray-Ta; Fri, 26 Feb 2021 23:10:20 +0100
Received: from p5b13a4bd.dip0.t-ipconnect.de ([91.19.164.189] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lFlJU-002EFr-N8; Fri, 26 Feb 2021 23:10:20 +0100
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
 <be2123ec-017a-36f3-2baf-47f527380ead@linux.ee>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <46b6860d-507e-6999-3190-302623266d48@physik.fu-berlin.de>
Date:   Fri, 26 Feb 2021 23:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be2123ec-017a-36f3-2baf-47f527380ead@linux.ee>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.189
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi!

On 2/26/21 10:50 PM, Meelis Roos wrote:
> This works too without any hang or warnings.

Can you try the latest patch that Rob posted? [1]

Adrian

> [1] https://marc.info/?l=linux-sparc&m=161437485015735&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

