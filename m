Return-Path: <sparclinux+bounces-5305-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E3BBE456
	for <lists+sparclinux@lfdr.de>; Mon, 06 Oct 2025 16:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0DF43AB08C
	for <lists+sparclinux@lfdr.de>; Mon,  6 Oct 2025 14:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D71E275865;
	Mon,  6 Oct 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HzfwidL4"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC31F463E
	for <sparclinux@vger.kernel.org>; Mon,  6 Oct 2025 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759410; cv=none; b=DDI9X/mb4hMbHGO8i4SWTfF2NQ7MRl0ZlVNIanxuk/UgwPHAR5RyIdQvtxP0aORRd/QYYOAASK0g2z5A7jf1ygNLMmQ5+3WpaVu9Vc6Cn0E+r0Y1QTnK6mBeNyggg1zBF964yHDyjS8NutJ4WtFcymsNbO10X8Gmlv1NsvzNJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759410; c=relaxed/simple;
	bh=+yEfXF921uRRUVIU5eNoFwcMt8qXIPcVyxQRC2ripRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwAYWO1O86K9/xBWM8IzceeuHSYWeUjGP4Ed6qHlYREgjTnQaCEtyouaoO9/bk8fqC2igpBC7h2U2JooGc1LJHtfvCvEHwPZr3Ih6eH5LuL7bPdrSBWlJNWO8ScpFgz4UYLH/ZMJyhyfkFV/3nbdTUjg1wJKtnUDm/t25X/L0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=HzfwidL4; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-90926724bceso419044639f.1
        for <sparclinux@vger.kernel.org>; Mon, 06 Oct 2025 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1759759407; x=1760364207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7SQCp24RNvOTegVrAKR3/DTuZvaz1VTJ+woslYjIWw=;
        b=HzfwidL4mWqTInADCg1KVuVqzZCjBn1m898zKtkI8bKFhlQiOeHatNnzTw2UPpZ/0h
         v76Ni796NYIv9j6WkGZ+QX6nsaEXjuipqGSCdzxm/x5JYtiQsM6e94iksW9T5dkdkodK
         GttAB3R0M7S6uV0f+jc0pU5EM47Yo74dA+geiXVRnpY2nPhyMyH9qEWyfWZv1HNPq9az
         DKRR2yUSW8CcC9qwuzT0+lZmItakdh5Pk3lX3unXlrbmBYCfEWh845pRRIY3kz3QsLhN
         fb5QilCsXj3khfzY2NSEbc2hyKuB6esSTkLl1hrh4GqYPBvJjxCTDnC7zoucLEKm6U/l
         2BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759407; x=1760364207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7SQCp24RNvOTegVrAKR3/DTuZvaz1VTJ+woslYjIWw=;
        b=ryZ48P4ShRjvWrqM7jIeialSM+2XqjRMLmswoKoDFN3F+75g7ExXXdLkcknLOPNSi4
         Y/ERTpx5nfD5Vv8j8A6ZsP30C9J8556McZhA6euGWRwPMtOWMSyvjXCMK3fzPBfTPo1e
         t//gpGcUJH/vETEIIBqUnHTzSpQmHS0uUPpvmHMneXfNd7f8SDg+v/XKarz9821tJqm1
         Quecm9Rd7frsmWgkJ/ual5D8+f+V/uAWszql18EBN0M0Ys+mTYK8PeJeGPPLuZjapG1J
         xDP+g6swl7qBF/pR2eKbxzcOl7EL3sB+vilzwALHvBur+Tpsc32LCq1sTacA9/RgFHk3
         mlTw==
X-Forwarded-Encrypted: i=1; AJvYcCWwNCCSDkmT7vuVGmHgkKKtTIRkSWEnkapf+aHoQSybAHNgdvlrvbzVNclrYASZem9qyhtX5wG8bb5N@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHEaMtP0EtTk8YGu3d/9msDJ4VvJ0qqXDQbZL7opEY1/HcxBt
	6glZVQfAVw3jgrizfqziLrUtoYS4kQVVkyrMWPNs04S7Ghclsts+csCe9BhkcWH1LPI=
X-Gm-Gg: ASbGncvOb4GFC5Nnd++8/Ty5d5tZ03Cv7RX6lg+37kl+OHtdZJ1682wVtQTqWvJunbG
	ycW56q9HJHHZMF/U+4hMaP9HbeaZEqaqtws/f7ATNMbO1gBBLCF3nivGptNH7R5ZhwZbt+SlF+0
	4rokiUrj6XviOO+kdxIY8d6QeeKYOf2TpxPSIg7Bk8F6FfmVT+Uc5HrwrxS/fgInePoObZfLa9x
	65t2bEdlZ7EUsuG0qUnu3ndyt6AJHxHVsDM5kzmV+9opY6yV0dw4jOxuMkmYwECcO6DrYW7d6Jn
	TGX46J+lYkDpJHHuz8A4EMPLGg8Gzf2Kd0euPGSbCh8V3uKk0QSSpxOz/2fVujyYFy1xSH6t+vw
	67+vmU3YG6DKQ9OVdmp82IHBHUzrwU9PBnJ67ecYgZhTSokwgk/mr6Wg=
X-Google-Smtp-Source: AGHT+IFHBexVu3+mYH51hQgPiGJhkCZp9Y+80XStbABQGIysYZxyv/J7bi+a6nL+jYlUhwyLSftMxg==
X-Received: by 2002:a92:cda3:0:b0:42d:89b9:5d30 with SMTP id e9e14a558f8ab-42e7ad887d6mr177792435ab.19.1759759406381;
        Mon, 06 Oct 2025 07:03:26 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec5f51fsm4790440173.70.2025.10.06.07.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:03:24 -0700 (PDT)
Message-ID: <ecb74c6c-8de6-4774-8159-2ec118437c57@kernel.dk>
Date: Mon, 6 Oct 2025 08:03:23 -0600
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
 <d78a1704-31dc-4eaa-8189-e3aba51d3fe2@kernel.dk>
 <4e45e3182c4718cafad1166e9ef8dcca1c301651.camel@physik.fu-berlin.de>
 <a80a1c5f-da21-4437-b956-a9f659c355a4@kernel.dk>
 <e6a7e68ff9e23aee448003ee1a279a4ab13192c0.camel@physik.fu-berlin.de>
 <cef07e8f-a919-4aa1-9904-84b16dfa8fe6@kernel.dk>
 <5b3caa0e218dd473c8871c1b1f09a8dc1c356f1e.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5b3caa0e218dd473c8871c1b1f09a8dc1c356f1e.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/25 7:56 AM, John Paul Adrian Glaubitz wrote:
> On Mon, 2025-10-06 at 07:46 -0600, Jens Axboe wrote:
>>
>>>> The nicer approach would be to have sunvdc punt retries back up to the
>>>> block stack, which would at least avoid a busy spin for the condition.
>>>> Rather than return BLK_STS_IOERR which terminates the request and
>>>> bubbles back the -EIO as per your log. IOW, if we've already spent
>>>> 10.5ms in that busy loop as per the above rough calculation, perhaps
>>>> we'd be better off restarting the queue and hence this operation after a
>>>> small sleeping delay instead. That would seem a lot saner than hammering
>>>> on it.
>>>
>>> I generally agree with this remark. I just wonder whether this
>>> behavior should apply for a logical domain as well. I guess if a
>>> request doesn't succeed immediately, it's an urgent problem if the
>>> logical domain locks up, is it?
>>
>> It's just bad behavior. Honestly most of this just looks like either a
>> bad implementation of the protocol as it's all based on busy looping, or
>> a badly designed protocol. And then the sunvdc usage of it just
>> proliferates that problem, rather than utilizing the tools that exist in
>> the block stack to take a breather rather than repeatedly hammering on
>> the hardware for conditions like this.
> 
> To be fair, the sunvdc driver is fairly old and I'm not sure whether these
> tools already existed back then. FWIW, Oracle engineers did actually work
> on the Linux for SPARC code for a while and it might be possible that their
> UEK kernel tree [1] contains some improvements in this regard.

Requeueing and retry has always been available on the block side. It's
not an uncommon thing for a driver to need, in case of resource
starvation. And sometimes those resources can be unrelated to the IO, eg
iommu shortages. Or this busy condition.

But that's fine, it's not uncommon for drivers to miss things like that,
and then we fix them up when noticed. It was probably written by someone
not super familiar with the IO stack.

>>>>> And unlike the change in adddc32d6fde ("sunvnet: Do not spin in an infinite
>>>>> loop when vio_ldc_send() returns EAGAIN"), we can't just drop data as this
>>>>> driver concerns a block device while the other driver concerns a network
>>>>> device. Dropping network packages is expected, dropping bytes from a block
>>>>> device driver is not.
>>>>
>>>> Right, but we can sanely retry it rather than sit in a tight loop.
>>>> Something like the entirely untested below diff.
>>>>
>>>> diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
>>>> index db1fe9772a4d..aa49dffb1b53 100644
>>>> --- a/drivers/block/sunvdc.c
>>>> +++ b/drivers/block/sunvdc.c
>>>> @@ -539,6 +539,7 @@ static blk_status_t vdc_queue_rq(struct blk_mq_hw_ctx *hctx,
>>>>  	struct vdc_port *port = hctx->queue->queuedata;
>>>>  	struct vio_dring_state *dr;
>>>>  	unsigned long flags;
>>>> +	int ret;
>>>>  
>>>>  	dr = &port->vio.drings[VIO_DRIVER_TX_RING];
>>>>  
>>>> @@ -560,7 +561,13 @@ static blk_status_t vdc_queue_rq(struct blk_mq_hw_ctx *hctx,
>>>>  		return BLK_STS_DEV_RESOURCE;
>>>>  	}
>>>>  
>>>> -	if (__send_request(bd->rq) < 0) {
>>>> +	ret = __send_request(bd->rq);
>>>> +	if (ret == -EAGAIN) {
>>>> +		spin_unlock_irqrestore(&port->vio.lock, flags);
>>>> +		/* already spun for 10msec, defer 10msec and retry */
>>>> +		blk_mq_delay_kick_requeue_list(hctx->queue, 10);
>>>> +		return BLK_STS_DEV_RESOURCE;
>>>> +	} else if (ret < 0) {
>>>>  		spin_unlock_irqrestore(&port->vio.lock, flags);
>>>>  		return BLK_STS_IOERR;
>>>>  	}
>>>
>>> We could add this particular change on top of mine after we have
>>> extensively tested it.
>>
>> It doesn't really make sense on top of yours, as that removes the
>> limited looping that sunvdc would do...
> 
> Why not? From what I understood, you're moving the limited looping to a
> different part of the driver where it can delegate the request back up
> the stack meaning that the current place to implement the limitation is
> not correct anyway, is it?

Because your change never gives up, hence it'd never trigger the softer
retry condition. It'll just keep busy looping.

>>> For now, I would propose to pick up my patch to revert the previous
>>> change. I can then pick up your proposed change and deploy it for
>>> extensive testing and see if it has any side effects.
>>
>> Why not just test this one and see if it works? As far as I can tell,
>> it's been 6.5 years since this change went in, I can't imagine there's a
>> huge sense of urgency to fix it up that can't wait for testing a more
>> proper patch rather than a work-around?
> 
> Well, the thing is that a lot of people have been running older kernels
> on SPARC because of issues like these and I have started working on trying
> to track down all of these issues now [2] for users to be able to run a
> current kernel. So, the 6.5 years existence of this change shouldn't
> be an argument I think.

While I agree that the bug is unfortunate, it's also a chance to
properly fix it rather than just go back to busy looping. How difficult
is it to test an iteration of the patch? It'd be annoying to queue a
bandaid only to have to revert that again for a real fix. If this was a
regression from the last release or two then that'd be a different
story, but the fact that this has persisted for 6.5 years and is only
bubbling back up to mainstream now would seem to indicate that we should
spend a bit of extra time to just get it right the first time.

-- 
Jens Axboe

