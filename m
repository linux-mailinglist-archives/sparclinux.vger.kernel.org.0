Return-Path: <sparclinux+bounces-5301-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6515BBE2A4
	for <lists+sparclinux@lfdr.de>; Mon, 06 Oct 2025 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9E83BBD3C
	for <lists+sparclinux@lfdr.de>; Mon,  6 Oct 2025 13:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F89818872A;
	Mon,  6 Oct 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="i7dn/dme"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C526D4E8
	for <sparclinux@vger.kernel.org>; Mon,  6 Oct 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759756787; cv=none; b=sLOnLZMD2QUVuBUURPQgU9HlE4GPTvAAfdVr7DJQ9hFcEDHk7CC5LQee5RCf2CwFBCkIjwQ/vJJVvrxR0f+iPy8I14vSLsHLo7Dp3bp1ppW4YfygNg7OHjT1tVkeLcO5bVK5oPd3Ljuae5uZeuDJt0nKYgKWnuFo0vW/imoxQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759756787; c=relaxed/simple;
	bh=MZ18A4gLjl2ofNFo8pVu+q9KoC0G2BHWLpsbcUhn5RQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dF6WeXU0cu4ByvTC8cczNVQdlVEzNsp8YkEh2qM9Ju2Fyd7iVS4uDmdhsS0ijRLB9Fg1UUVVoSppbtCpIl1hjTQpa2jDTWnmoBEFbcotSvfT43n2VN4ZWl3/m6CL1GeWDlSMefXvYsnRs18XQQ/SWRr1tI1HMfl60oWw2rn8ZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=i7dn/dme; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42e7b22e007so14702545ab.3
        for <sparclinux@vger.kernel.org>; Mon, 06 Oct 2025 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1759756783; x=1760361583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yjlfu6wP14JG2qLbK/JxxY/6QM3hGKhTMIqs+UYsEc=;
        b=i7dn/dmeT+rbWjgi+kowpqT3H6eZYZRPRznyuwDZ9NNrIWQky0W3N8mRMiaBR3Xmd8
         39Gc7GeV1CTUQ70gZabBdDaDymvkPzKPR+ACH4DyHJmzGwLs84sOz2UjtJXcuNvICRFo
         sj5K7MySvId4hvx2qGHUufRgdqCZR0fqIA+gKlyEKbtMcbPx9KdvvTauul/UeLClRW9D
         ZeIjHTx867rg1MXji+jVZx9VeGZz9J85TpvXKti1iU2kM1Q0Lp9pGfjVoYzZzCr7wKhr
         /+UmWgHHOMs09XMIqbW5NZs6BweQywcsUyhuiJPWzrh5FQEBOdMbJpJblInYW0eHBMr9
         +yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756783; x=1760361583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yjlfu6wP14JG2qLbK/JxxY/6QM3hGKhTMIqs+UYsEc=;
        b=mroweEVgUlCKTFno/sjGnffmiqJr1N8rrRNUZcbn7IY+z9iU38xDlc83QDMTv70ktI
         Fy12XlJr8KLnE1c0BCwDRyVJnq6IyYaFntohGeVY1+C+VSCv79MccVRDfinko5kVcIXo
         s8F/HC//FkH6K6J5wsSxEK0CTGkCp39hPESD/VdJ4UGQq/m3xzMBGTSH9mgRR3tdazZ8
         FNEr1zCZFdGBWOT0BzQK1yfmTBDHiFWDjXS71bw0rRGU49u0KQjWWm6wFqMIZ4p1vvTh
         WSuSrTUqrqg+sCsj8b+r2Bd9RtjjtJbN02SaA6BjeEx5Ph+mOnZ6AXnFIdCpLQv+7SkX
         0eoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcm8WH7YK/91epFVFHTtr2raH+Qv1GPGze/aOG+3hH1NTgTH5IEYR2jyiaD3L2qDezhfoiVJoetAvU@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGc+KZvgqmHpZtVNokDM/il3ldSqVagxupTa6an/jRKrSNAjh
	/jR2ISSPiYOWT9CUQfeRkrP22nMH+WFKGg3K+K+ub5F+xXIIsirAZtMnr3WRiVHxEAA=
X-Gm-Gg: ASbGncsZGDPI2mNjL2n+anFkcCgaQsMLKjDQiI3NxNI38O1l5SYwfC6LSEY+Tl+aBCX
	FktnB8OI5oSe0x47H10riMi4Ams8vscwvHViEOIuJ4VIkEoH7cjjfwGXlStj3NvlCAuvP51Dg3W
	QoHYxyGmKZhZcUzfsbLjgjG6Aol+RIGPj2ItZK5EaClnrAofzE5EgNoKzTmHjP47s9sgjzqEXW7
	uioWWOgpjI298/3pi3eSIJA2I9WOvtdhsT5TBd71pNkqqSyu6HlUoz7+f3XBNb/9cVebooblGcO
	wy+DdmzmLdqVNtlGLFKKGx/YiYoVlq8mPVuN+rpwNRtBf0ECwm0G1fug6/Jn5Td4+Jj0M8USMK2
	P2OIWe1yBvbDOHr2AYVG50BgnkVUQVxhXMTN9u4YjESFK
X-Google-Smtp-Source: AGHT+IHKeVryFAtYSIbEs3E1K0UFPxxx3iI1l+x8ykYI9cmgWxrUy0Vw2vbSc5wuuCkxsB1Ih5am5g==
X-Received: by 2002:a05:6e02:1c0c:b0:427:70e7:ea09 with SMTP id e9e14a558f8ab-42e7ad400aemr178502065ab.14.1759756782742;
        Mon, 06 Oct 2025 06:19:42 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42e7bd2f139sm41896385ab.8.2025.10.06.06.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:19:41 -0700 (PDT)
Message-ID: <a80a1c5f-da21-4437-b956-a9f659c355a4@kernel.dk>
Date: Mon, 6 Oct 2025 07:19:40 -0600
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <4e45e3182c4718cafad1166e9ef8dcca1c301651.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/25 7:00 AM, John Paul Adrian Glaubitz wrote:
> Hi Jens,
> 
> On Mon, 2025-10-06 at 06:48 -0600, Jens Axboe wrote:
>> When you apply this patch and things work, how many times does it
>> generally spin where it would've failed before? It's a bit unnerving to
>> have a never ending spin loop for this, with udelay spinning in between
>> as well. Looking at vio_ldc_send() as well, that spins for potentially
>> 1000 loops of 1usec each, which would be 1ms. With the current limit of
>> 10 retries, the driver would end up doing udelays of:
>>
>> 1
>> 2
>> 4
>> 8
>> 16
>> 32
>> 64
>> 128
>> 128
>> 128
>>
>> which is 511 usec on top, for 10.5ms in total spinning time before
>> giving up. That is kind of mind boggling, that's an eternity.
> 
> The problem is that giving up can lead to filesystem corruption which
> is problem that was never observed before the change from what I know.

Yes, I get that.

> We have deployed a kernel with the change reverted on several LDOMs that
> are seeing heavy use such as cfarm202.cfarm.net and we have seen any system
> lock ups or similar.

I believe you. I'm just wondering how long you generally need to spin,
as per the question above: how many times does it generally spin where
it would've failed before?

>> Not that it's _really_ that important as this is a pretty niche driver,
>> but still pretty ugly... Does it work reliably with a limit of 100
>> spins? If things get truly stuck, spinning forever in that loop is not
>> going to help. In any case, your patch should have
> 
> Isn't it possible that the call to vio_ldc_send() will eventually succeed
> which is why there is no need to abort in __vdc_tx_trigger()?

Of course. Is it also possible that some conditions will lead it to
never succeed?

The nicer approach would be to have sunvdc punt retries back up to the
block stack, which would at least avoid a busy spin for the condition.
Rather than return BLK_STS_IOERR which terminates the request and
bubbles back the -EIO as per your log. IOW, if we've already spent
10.5ms in that busy loop as per the above rough calculation, perhaps
we'd be better off restarting the queue and hence this operation after a
small sleeping delay instead. That would seem a lot saner than hammering
on it.

> And unlike the change in adddc32d6fde ("sunvnet: Do not spin in an infinite
> loop when vio_ldc_send() returns EAGAIN"), we can't just drop data as this
> driver concerns a block device while the other driver concerns a network
> device. Dropping network packages is expected, dropping bytes from a block
> device driver is not.

Right, but we can sanely retry it rather than sit in a tight loop.
Something like the entirely untested below diff.

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index db1fe9772a4d..aa49dffb1b53 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -539,6 +539,7 @@ static blk_status_t vdc_queue_rq(struct blk_mq_hw_ctx *hctx,
 	struct vdc_port *port = hctx->queue->queuedata;
 	struct vio_dring_state *dr;
 	unsigned long flags;
+	int ret;
 
 	dr = &port->vio.drings[VIO_DRIVER_TX_RING];
 
@@ -560,7 +561,13 @@ static blk_status_t vdc_queue_rq(struct blk_mq_hw_ctx *hctx,
 		return BLK_STS_DEV_RESOURCE;
 	}
 
-	if (__send_request(bd->rq) < 0) {
+	ret = __send_request(bd->rq);
+	if (ret == -EAGAIN) {
+		spin_unlock_irqrestore(&port->vio.lock, flags);
+		/* already spun for 10msec, defer 10msec and retry */
+		blk_mq_delay_kick_requeue_list(hctx->queue, 10);
+		return BLK_STS_DEV_RESOURCE;
+	} else if (ret < 0) {
 		spin_unlock_irqrestore(&port->vio.lock, flags);
 		return BLK_STS_IOERR;
 	}

-- 
Jens Axboe

