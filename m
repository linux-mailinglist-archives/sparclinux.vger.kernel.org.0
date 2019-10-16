Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92668D8873
	for <lists+sparclinux@lfdr.de>; Wed, 16 Oct 2019 08:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfJPGF7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 16 Oct 2019 02:05:59 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:56619 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfJPGF7 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 16 Oct 2019 02:05:59 -0400
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
 <20190818070137.GA22731@infradead.org>
 <20190818.123943.1491620523133670968.davem@davemloft.net>
 <20190819051055.GA32118@infradead.org>
 <CAHk-=wiCJf2beZwW6E37mnovd860m15Ety+ucgDNK1aPAZme_A@mail.gmail.com>
 <25cbdd65-484e-7e50-ee8c-dc8745ece5fe@linux.ee>
 <CAHk-=wiW0xwg4ETaMovbmDug7Cf-gUrxH7FX7EnucktJF_Sj=g@mail.gmail.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <d936b304-4808-6a6b-9641-fe8e30345fe2@linux.ee>
Date:   Wed, 16 Oct 2019 09:04:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiW0xwg4ETaMovbmDug7Cf-gUrxH7FX7EnucktJF_Sj=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

> Ok, I'll just remove that HAVE_FAST_GUP - I was expecting it to come
> through David, but I was also really hoping we'd have a guess as to
> why it happens on some hardware and configurations but not others.

It works, thank you - the mutex hang regression in util-linux test suite no longer triggers and we can move forward with sparc64 kernels in debian-ports and also re-check any other regressions found meanwhile. I will recheck my sparc64's and report any surviving regressions if any.

-- 
Meelis Roos <mroos@linux.ee>
