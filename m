Return-Path: <sparclinux+bounces-5297-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA2BBE166
	for <lists+sparclinux@lfdr.de>; Mon, 06 Oct 2025 14:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 593133BC397
	for <lists+sparclinux@lfdr.de>; Mon,  6 Oct 2025 12:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB2B28134C;
	Mon,  6 Oct 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="10eMyuC0"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5728136B
	for <sparclinux@vger.kernel.org>; Mon,  6 Oct 2025 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754940; cv=none; b=iNHOewv3xLBW3tyObaaJIT/HWFl5vIj3Cpy5p58afwMfrXK91Mk/XqSU/8GxW5P7uTMGTqQ0c8EOmT/74fT2dCnPDSeWpMMgN4B6yGZr/wu3Q1x3Q5tv6IEgO/JMfqdj7dSuHwQT68wpFpwi8OVwoLBesLFBSY6QotGqZXuNfbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754940; c=relaxed/simple;
	bh=eA6ted2b5wuZeFvl1iJayHFN778/ioPKDDp0Xzg4xK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Btk2pLBeg9nbpES/0s/hNss+FqwMGc9nWSySwNncLUHw5yM4vUYuX9pvGk2/ZWaCBWHLhaC3Rog008q1Pd1/vHCzdxuYfaI3dT56mwLaZRg3jHxKy/ADvz0ieeqPjJd89ywREldYBGCB2M94JOl8KWxxJIvE/Uo5JMx5UaY2cH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=10eMyuC0; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42e5d1025dcso15630825ab.2
        for <sparclinux@vger.kernel.org>; Mon, 06 Oct 2025 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1759754936; x=1760359736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/jVBv9VC9pyuaLK0KEBwu/kxxeX6tWR1dllljhnLE4=;
        b=10eMyuC0XeMu9FYCkkh20yOPDVkjFUvQuBUblvrzZTFjTwbiuDIaZ0B4lfUAGBZypn
         0OzFXC78fYqElcveasoKNVD0r646WwRoHKJsdWHzMKKg+Arbb2uJiiTOYdxqY3wYnHUP
         8wWsjoP7nkx7J12zlsBCPv8XDCGjziOvLp1NWigE3PHnyrLwb+/C/FYl9i15C5pjo34A
         O7/nIOM0wBDtqgfZX6sN+4H34iiSq2fQUw02EILzF7HtV547JiPPxd1v4pd9EEl3tGHj
         6XaSlqbIpbHeTZAM5YvyKT62gZOezNy+a8JtasHV44ZJ2zI63+lsIUJhMaKA4SV0hNg2
         SzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754936; x=1760359736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/jVBv9VC9pyuaLK0KEBwu/kxxeX6tWR1dllljhnLE4=;
        b=E8feoLcbWF1nCHflSDAvdS60VLznnezZzGELy2T3DBuubJ4k9aa52mDEK15wFKjWNF
         jU42SKSFl4xahKvojyOcJGywEtm0OmzQVOAgdIC21NkTPD8vgIS7dtSWnk8aM3fgGpCT
         CCz44HPcspnz3uug5MT8tT8bdQL7htBEJAW+PbiM6TIim3oYCs3VsHJNsIXY1QfGJ2vM
         guwUQqMv/QL4d8XVKWIMKWvE/APydtIq3IKPnFeZ8BhvVS2r7eTFT0usGYa+mQhvt2ps
         tGcdSNr9Dro5iJwF6UgG6yDKrmATCbd3wHKjVmUJYOGPA17/enYIjyPFPfprfNRWm5IB
         d8/A==
X-Forwarded-Encrypted: i=1; AJvYcCV7AieraOJ2mgva37uWnFg1GnDsJ7l1BQLla/L+iYjX+xTBbOVnKrnPlK25FzgocqDhmqbNhMXEN6R+@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgbYW7mQ3ABWxH3HUa2DFWMJ9Iznm/VT9LVFZ4EZVia/LHqsQ
	qjbOhIsd/pZkiUdq6w9SD2alEn3w4nFCy1l6gL8CMofS3Ao9LTHt6HoeQs8bowziFng=
X-Gm-Gg: ASbGncuyyEDVYu+OlCSi17AAClFWcBNwOB/N5+/OoHR25KvNELkCNPYVPSz93sQJajx
	chIVfUmNsFguK+rax4/TU5WV3i13P39NwmIjrtD/xsqPkfBknKoSJekdblan6x6tgXMRKYjETCR
	KpYgGtZQB3EUU9KS3JNcYnOs4iGkSntUyvtoIcOemnPmUXf0m/mPdnVigb4JB/PZVycRjnI9p8B
	oEs6IVlFjnLsYQpizdrg9V8J1qDZowPuwcflZ7h38oIuslixyCJF5yFDUvh+0HZrF/F+2VeUhl9
	zn+27L1XK3hkggFIz5jhqoBjhmUvRQPxsY0U82isgDRSulQ89HrM4xOslTJ1YfUCkkfSYtdZ/ff
	dHuOWVtIE9Ia0vrOt5JYDg+iJ3GnGVr1YI/OcBnk+52EVwpmqblsHOoI=
X-Google-Smtp-Source: AGHT+IGRDQnbJF4RY3+uhfgNAtJQ7O/Sam6I2lV/pe/z6UUsZTONTZb/p72A7++9T5vZHzAB4MneBw==
X-Received: by 2002:a05:6e02:148a:b0:42d:8b1c:572e with SMTP id e9e14a558f8ab-42e7ac3fa99mr162042305ab.0.1759754935832;
        Mon, 06 Oct 2025 05:48:55 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42d8b28153asm53592865ab.20.2025.10.06.05.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:48:54 -0700 (PDT)
Message-ID: <d78a1704-31dc-4eaa-8189-e3aba51d3fe2@kernel.dk>
Date: Mon, 6 Oct 2025 06:48:52 -0600
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "sunvdc: Do not spin in an infinite loop when
 vio_ldc_send() returns EAGAIN"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Larsson <andreas@gaisler.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Sam James <sam@gentoo.org>,
 "David S . Miller" <davem@davemloft.net>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 sparclinux@vger.kernel.org
References: <20251006100226.4246-2-glaubitz@physik.fu-berlin.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251006100226.4246-2-glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/25 4:02 AM, John Paul Adrian Glaubitz wrote:
> In a11f6ca9aef9 ("sunvdc: Do not spin in an infinite loop when vio_ldc_send()
> returns EAGAIN"), a maximum retry count was added to __vdc_tx_trigger().
> 
> After this change, several users reported disk I/O errors when running Linux
> inside a logical domain on Solaris 11.4:
> 
> [19095.192532] sunvdc: vdc_tx_trigger() failure, err=-11
> [19095.192605] I/O error, dev vdiskc, sector 368208928 op 0x1:(WRITE) flags 0x1000 phys_seg 2 prio class 2
> [19095.205681] XFS (vdiskc1): metadata I/O error in "xfs_buf_ioend+0x28c/0x600 [xfs]" at daddr 0x15f26420 len 32 error 5
> [19432.043471] sunvdc: vdc_tx_trigger() failure, err=-11
> [19432.043529] I/O error, dev vdiskc, sector 3732568 op 0x1:(WRITE) flags 0x1000 phys_seg 1 prio class 2
> [19432.058821] sunvdc: vdc_tx_trigger() failure, err=-11
> [19432.058843] I/O error, dev vdiskc, sector 3736256 op 0x1:(WRITE) flags 0x1000 phys_seg 4 prio class 2
> [19432.074109] sunvdc: vdc_tx_trigger() failure, err=-11
> [19432.074128] I/O error, dev vdiskc, sector 3736512 op 0x1:(WRITE) flags 0x1000 phys_seg 4 prio class 2
> [19432.089425] sunvdc: vdc_tx_trigger() failure, err=-11
> [19432.089443] I/O error, dev vdiskc, sector 3737024 op 0x1:(WRITE) flags 0x1000 phys_seg 1 prio class 2
> [19432.100964] XFS (vdiskc1): metadata I/O error in "xfs_buf_ioend+0x28c/0x600 [xfs]" at daddr 0x38ec58 len 8 error 5
> 
> Since this change seems to have only been justified by reading the code which
> becomes evident by the reference to adddc32d6fde ("sunvnet: Do not spin in an
> infinite loop when vio_ldc_send() returns EAGAIN") in the commit message, it
> can be safely assumed that the change was neither properly tested nor motivated
> by any actual bug reports.
> 
> Thus, let's revert this change to address the disk I/O errors above.
> 
> Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> ---
> Changes since v1:
> - Rephrase commit message
> ---
>  drivers/block/sunvdc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
> index 282f81616a78..f56023c2b033 100644
> --- a/drivers/block/sunvdc.c
> +++ b/drivers/block/sunvdc.c
> @@ -45,8 +45,6 @@ MODULE_VERSION(DRV_MODULE_VERSION);
>  #define WAITING_FOR_GEN_CMD	0x04
>  #define WAITING_FOR_ANY		-1
>  
> -#define	VDC_MAX_RETRIES	10
> -
>  static struct workqueue_struct *sunvdc_wq;
>  
>  struct vdc_req_entry {
> @@ -437,7 +435,6 @@ static int __vdc_tx_trigger(struct vdc_port *port)
>  		.end_idx		= dr->prod,
>  	};
>  	int err, delay;
> -	int retries = 0;
>  
>  	hdr.seq = dr->snd_nxt;
>  	delay = 1;
> @@ -450,8 +447,6 @@ static int __vdc_tx_trigger(struct vdc_port *port)
>  		udelay(delay);
>  		if ((delay <<= 1) > 128)
>  			delay = 128;
> -		if (retries++ > VDC_MAX_RETRIES)
> -			break;
>  	} while (err == -EAGAIN);
>  
>  	if (err == -ENOTCONN)

When you apply this patch and things work, how many times does it
generally spin where it would've failed before? It's a bit unnerving to
have a never ending spin loop for this, with udelay spinning in between
as well. Looking at vio_ldc_send() as well, that spins for potentially
1000 loops of 1usec each, which would be 1ms. With the current limit of
10 retries, the driver would end up doing udelays of:

1
2
4
8
16
32
64
128
128
128

which is 511 usec on top, for 10.5ms in total spinning time before
giving up. That is kind of mind boggling, that's an eternity.

Not that it's _really_ that important as this is a pretty niche driver,
but still pretty ugly... Does it work reliably with a limit of 100
spins? If things get truly stuck, spinning forever in that loop is not
going to help. In any case, your patch should have

Cc: stable@vger.kernel.org
Fixes: a11f6ca9aef9 ("sunvdc: Do not spin in an infinite loop when vio_ldc_send() returns EAGAIN")

tags added.

-- 
Jens Axboe

