Return-Path: <sparclinux+bounces-316-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981485167C
	for <lists+sparclinux@lfdr.de>; Mon, 12 Feb 2024 15:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C71E1F242BA
	for <lists+sparclinux@lfdr.de>; Mon, 12 Feb 2024 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD023CF52;
	Mon, 12 Feb 2024 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PggsZpAW"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B063CF4C
	for <sparclinux@vger.kernel.org>; Mon, 12 Feb 2024 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746522; cv=none; b=tvRTx2Caft7gLatTcmrsuKuEA1Clcksr1elo9X+/Finfh+Vsw7piYv/zuOutTq/Fmavrwjr/7gvcKoLqhR2XDbvWWAnSIsPoV9ahqBxMW++48nCJ8ouHWXeDDGBND6ec04CDHEHkjer835iDtZoQkArkBx7BA/jAXFTkMvYqIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746522; c=relaxed/simple;
	bh=CF8+wKKT7ApH+Bv3oF0b9bPg1ui9XhpP9cH7yZ5bZKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtR1phbmkJJWyFNwk3Gc4IKfq9ffPDvcixCnuahPd8KU74kMfmwUk8JTPhpqXZ0DTtK+gwXOwvcVp9MUujeLbvPFmEV/nqG40LimyQ4G6y/i25fVw67GULrMLuhTC2ek74CTZhOseWIAkqQ09QBzasAVXi44uWzcR/RIZsdimPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PggsZpAW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2098311b3a.1
        for <sparclinux@vger.kernel.org>; Mon, 12 Feb 2024 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707746520; x=1708351320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWsv9F3b1KyOGT1s6FL7sfI5fVEFfEPWdbK2meb3loM=;
        b=PggsZpAWFVYAnphv4FWRPmFe0QCI+I+w/Yc+hlMxw3ff++xhqMYLavdRp17NEY/Q0O
         7liqT+H5aCHNkwBIUDEPg96qHkO5smxVGOfItihq7hVYL1hJzc9e/Z1yDWxULtpFBPBs
         pYZtQuahmTTU1uBIJB7UELQVyou7JjHTG5buOiVa3dJLkDguxvt8Rw4+e4hR/yFTrZTw
         tjhCJ+ol/sM25MPXW8ecDF/o7sK28TV+YQ6EuQ82tj0jrR3MzxQFPI4NvVT80YjHCkDE
         Z6QJFloAykkH8q1QneHwolL8Coj/6d9URMRrbri/E3ifgQrRpX2H/T7Nj4yPt6a4p7cg
         LXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746520; x=1708351320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWsv9F3b1KyOGT1s6FL7sfI5fVEFfEPWdbK2meb3loM=;
        b=GDfUSmF6aAR18rhhFcVjU/ytf6Ce8kJlcRYD3wqMNMxGUyYteLgX4Pj2IMJ+mEdtoP
         kPVum/wAX2K+NYn05TCmQ73PMqWIg0y6CFUrMMTAPBSOzT+A0X0m5DMedBJ8DRHDstT6
         TMuiJR9yeOiHL2tKIw9NtKYQ4CJAb5VEAeDTSUBRp8nrU6j7orRhPslDXitjjtw8XQnP
         aQWrQEplbVBL71S2VuyjXmmwPDWkbVebPNY+7f8J9H0Xu297kSegJinUacvTPBl8yHDW
         Uc1yCqDGDIJjD+cR6ow15uwsOwVJQh224kvKu90Pe3NPmOIpGBLeLPjfT/AqV0eL9548
         CE+A==
X-Gm-Message-State: AOJu0YyczcXpceFCcySMUpA2LAoEM7gLn1fEA6TWR+njXD+RuHAlqCS/
	uCzy8jCrsZ9WgJaZB2lyNNsutc/07reGDDHn8xOanRuRIsJ6tuhp
X-Google-Smtp-Source: AGHT+IFI/6xf6nbYBQgDbPU/xO8T7Qum85mAvWYGxmHRjKGcJ84ZWA9cOFRs3FP8eaSF7UlFJScpfw==
X-Received: by 2002:a05:6a20:7214:b0:19e:cbe9:643 with SMTP id y20-20020a056a20721400b0019ecbe90643mr2983456pzb.17.1707746519808;
        Mon, 12 Feb 2024 06:01:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXG4yKFj5QZl2OVEpmjXCmif7t6dxCLSMYiW8Uel+a/LCIdg3vCI5k0+kXWcPQskmpAXbaMJZTEJsTDvccSR5upOLEGJWhlAjX2Yf4PC3BkBtjJ7sd2Zqv1TME0YwMmO2oKEzX7zUqe+c86UivyjqcHd29e9Oj6pnwZbNAWKt4MSr3TkbXCLOQ/J6YibkbgWEpQrGo1tcmHiApc+rXpQo86lojihp+wDX2YA54+t3B6sJ7x99QVSvAP+Q1a5Dk=
Received: from ?IPV6:2804:1b3:a7c0:378:8ce8:2e09:3517:29cf? ([2804:1b3:a7c0:378:8ce8:2e09:3517:29cf])
        by smtp.gmail.com with ESMTPSA id e25-20020a633719000000b005d5445349edsm455327pga.19.2024.02.12.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 06:01:59 -0800 (PST)
Message-ID: <e44d6030-b7dd-4caa-99b6-87409988a76a@gmail.com>
Date: Mon, 12 Feb 2024 11:01:55 -0300
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reproducer for the posix_spawn() bug on sparc64
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 sparclinux <sparclinux@vger.kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S. Miller" <davem@davemloft.net>, Sam James <sam@gentoo.org>,
 jrtc27 <jrtc27@debian.org>
References: <fe5cc47167430007560501aabb28ba154985b661.camel@physik.fu-berlin.de>
 <3ae4130c-c5aa-428e-b819-44cf2daf2af1@mkarcher.dialup.fu-berlin.de>
 <ec6254ce82d8ea5d9d3e73680c98b42f06d0930a.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Adhemerval Zanella Netto <zatrazz@gmail.com>
Autocrypt: addr=zatrazz@gmail.com; keydata=
 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
 C+trQg==
In-Reply-To: <ec6254ce82d8ea5d9d3e73680c98b42f06d0930a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/02/24 18:29, John Paul Adrian Glaubitz wrote:
> On Sun, 2024-02-11 at 14:05 +0100, Michael Karcher wrote:
>> That reproducer did not work reliably under all circumstances, because 
>> the stack limit was guessed to be 8K to 12K from the current stack 
>> pointer, which is not always correct. The size of the stack at the start 
>> of main depends on the size of the environment. Please find attached a 
>> more robust reproducer.
> I can also reproduce it on kernel 3.2.0 with glibc 2.13 on both 32-bit and
> 64-bit SPARC:
>
> root@debian:~# gcc -m64 more_clone_attack.c -o more_clone_attack
> root@debian:~# file more_clone_attack
> more_clone_attack: ELF 64-bit MSB executable, SPARC V9, relaxed memory ordering, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.26,
> BuildID[sha1]=0xb85b22284c93e15dc5ce002c332748d831b50b33, not stripped
> root@debian:~# ./more_clone_attack 
> effective FP in clone() with waste 0 = 7feff9d1800
> this is 768 64-bit words above the next page boundary
> clone: Bad address
> Problem detected at 0 pages distance
> root@debian:~# uname -a
> Linux debian 3.2.0-4-sparc64 #1 Debian 3.2.78-1 sparc64 GNU/Linux
> root@debian:~# dpkg -l libc6
> Desired=Unknown/Install/Remove/Purge/Hold
> | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
> ||/ Name           Version      Architecture Description
> +++-==============-============-============-=================================
> ii  libc6:sparc    2.13-38+deb7 sparc        Embedded GNU C Library: Shared li
> root@debian:~#
>
> root@debian:~# gcc more_clone_attack.c -o more_clone_attack
> root@debian:~# 
> root@debian:~# ./more_clone_attack 
> effective FP in clone() with waste 0 = ff991c4000010e57
> this is 458 64-bit words above the next page boundary
> clone: Bad address
> Problem detected at 2 pages distance
> root@debian:~# uname -a
> Linux debian 3.2.0-4-sparc64 #1 Debian 3.2.78-1 sparc64 GNU/Linux
> root@debian:~# dpkg -l libc6
> Desired=Unknown/Install/Remove/Purge/Hold
> | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
> ||/ Name           Version      Architecture Description
> +++-==============-============-============-=================================
> ii  libc6:sparc    2.13-38+deb7 sparc        Embedded GNU C Library: Shared li
> root@debian:~#
>
> Adrian
>
It fails on the two different sparc64 machines I usually use for glibc testing as well:

azanella@catbus ~ $ /lib64/libc.so.6 | head -n 1
GNU C Library (Gentoo 2.38-r9 (patchset 9)) stable release version 2.38.
azanella@catbus ~ $ uname -a
Linux catbus.sparc.dev.gentoo.org 6.1.72 #1 SMP Fri Jan 12 15:00:51 PST 2024 sparc64 sun4v UltraSparc T5 (Niagara5) GNU/Linux
azanella@catbus ~ $ ./more_clone_attack
effective FP in clone() with waste 0 = 7feffee09f0
this is 318 64-bit words above the next page boundary
clone: Bad address
Problem detected at 1 pages distance


azanella@ravirin:~$ /lib/sparc64-linux-gnu/libc.so.6 | head -n 1
GNU C Library (Debian GLIBC 2.37-15) stable release version 2.37.
azanella@ravirin:~$ uname -a
Linux ravirin 4.19.0-5-sparc64 #1 Debian 4.19.37-6 (2019-07-18) sparc64 GNU/Linux
azanella@ravirin:~$ ./more_clone_attack
effective FP in clone() with waste 0 = 7feffa3ae50
this is 458 64-bit words above the next page boundary
clone: Bad address
Problem detected at 1 pages distance


And I see similar failures on qemu as well.


