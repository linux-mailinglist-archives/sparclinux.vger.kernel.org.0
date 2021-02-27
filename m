Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AF0326CB5
	for <lists+sparclinux@lfdr.de>; Sat, 27 Feb 2021 11:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhB0Kby (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 27 Feb 2021 05:31:54 -0500
Received: from mx2.cyber.ee ([45.144.6.23]:40297 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229795AbhB0Kby (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 27 Feb 2021 05:31:54 -0500
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Rob Gardner <rob.gardner@oracle.com>,
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
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <8a2e371d-a8d6-9520-5428-602b5361ea74@linux.ee>
Date:   Sat, 27 Feb 2021 12:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6cd974c1-4727-8245-f149-7f971a3965d5@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

26.02.21 23:26 Rob Gardner wrote:

> Here is a single patch that does everything, and is cleaned up and more concise. If this all works then I can send it as an official patch (though with the printk removed of course.)

Hand-applied it (whitespace damage or did my Thunderbird expand the tabs?) and tested with the same 2 opcodes as before + random opcodes. Works stable, nothing particular in dmesg - only these but these are frequent in tty code on sparcs:

[   53.514956] CPU[0]: Cheetah+ D-cache parity error at TPC[000000000076888c]
[   53.621019] TPC<n_tty_set_termios+0x2c/0x3c0>

So it seems good, thanks!

-- 
Meelis Roos <mroos@linux.ee>
