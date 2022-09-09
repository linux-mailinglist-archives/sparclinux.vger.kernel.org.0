Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC75B3C02
	for <lists+sparclinux@lfdr.de>; Fri,  9 Sep 2022 17:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiIIPdN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Sep 2022 11:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbiIIPcs (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 9 Sep 2022 11:32:48 -0400
X-Greylist: delayed 152 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Sep 2022 08:32:33 PDT
Received: from bin-mail-out-05.binero.net (bin-mail-out-05.binero.net [195.74.38.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7E8146D20
        for <sparclinux@vger.kernel.org>; Fri,  9 Sep 2022 08:32:33 -0700 (PDT)
X-Halon-ID: 0345523b-3054-11ed-a6f7-fd6d048ed7e0
Authorized-sender: andreas@gaisler.com
Received: from [192.168.10.6] (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0345523b-3054-11ed-a6f7-fd6d048ed7e0;
        Fri, 09 Sep 2022 17:28:11 +0200 (CEST)
Message-ID: <22d99fab-bfa2-5001-8ef1-a4900056f0c4@gaisler.com>
Date:   Fri, 9 Sep 2022 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] sparc: Unbreak the build
Content-Language: en-US
To:     Bart Van Assche <bvanassche@acm.org>,
        "David S . Miller" <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>
References: <20220830205854.1918026-1-bvanassche@acm.org>
From:   Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20220830205854.1918026-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2022-08-30 22:58, Bart Van Assche wrote:
> Fix the following build errors:
> 
> arch/sparc/mm/srmmu.c: In function ‘smp_flush_page_for_dma’:
> arch/sparc/mm/srmmu.c:1639:13: error: cast between incompatible function types from ‘void (*)(long unsigned int)’ to ‘void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)’ [-Werror=cast-function-type]
>   1639 |         xc1((smpfunc_t) local_ops->page_for_dma, page);
>        |             ^
> arch/sparc/mm/srmmu.c: In function ‘smp_flush_cache_mm’:
> arch/sparc/mm/srmmu.c:1662:29: error: cast between incompatible function types from ‘void (*)(struct mm_struct *)’ to ‘void (*)(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)’ [-Werror=cast-function-type]
>   1662 |                         xc1((smpfunc_t) local_ops->cache_mm, (unsigned long) mm);
>        |
> [ ... ]
> 
> Compile-tested only.
> 
> Fixes: 552a23a0e5d0 ("Makefile: Enable -Wcast-function-type")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Tested-by: Andreas Larsson <andreas@gaisler.com>

-- 
Andreas Larsson

