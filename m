Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FBE73D48F
	for <lists+sparclinux@lfdr.de>; Sun, 25 Jun 2023 23:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFYVaW (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 25 Jun 2023 17:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjFYVaV (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 25 Jun 2023 17:30:21 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A211318D
        for <sparclinux@vger.kernel.org>; Sun, 25 Jun 2023 14:30:19 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-313e34ab99fso1760250f8f.1
        for <sparclinux@vger.kernel.org>; Sun, 25 Jun 2023 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728618; x=1690320618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcnTTGBAqpAm5D3Elr1glpOYMiW+4bgHgvzEAQrmcQY=;
        b=fAXrLNrfnyoOPjnEvjXEI+OjJmCyRiEgVoG1odNdEMY6GoGvJ7PL9XVhhyOcZ1eBac
         tTGoi+N0UGZ4xwTx3j9A+UvlpHt+fp/AxSyMgGt6uXe5kA1AhgiFo+0EzAf3yU0EC/by
         jy0I7FmHOyV/fs5+WcmJC1mm5E1jrpHroEVV0qM7OMkVEKa8C+3PRicpu326Wu2gkTRn
         IrIWaerX03psSILBHhjYq36x7Wkt7s8eb/XFuQUtWxJEsLzrMSJLittJBom1wOVwTaen
         f9QrVhy1PriMh9OEW01TLhdSEWU118Ku0aoWey63Ad2JFKRIa8uC5uyjdOB3el1sqtpl
         b36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728618; x=1690320618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcnTTGBAqpAm5D3Elr1glpOYMiW+4bgHgvzEAQrmcQY=;
        b=aZ9LvcwFFnWXdNdZmf43sIJoeSc3H3swdKOU/j+reOplw3QtH1LMe4G6OnrU+kpE2h
         EfR2vEe/P9h3mgoREBjPx26aiZL+j2uOnPVbHtTkKBs7Y28fgn7Pi3MV1RF2SGENJc89
         SLIX5TWV8DECB/zYlz+VDz8+UxCKkKwGeDgjuqBFyqfVUpSlPW/GL1BJx68/4YMtu1X5
         lgb99CcDUwFwvfR9E/dlimbkj8xsQYQ+arIGuE+zVrwHzbk+5TxwTOep9KooD0xuI4ok
         WPY55ZZ8MLjQrD8SOYBGtaHDgJb3gfxrLaI/0DPiZtcp6RTxZeIFO7P++XOCoHksyCuy
         kvSg==
X-Gm-Message-State: AC+VfDwAZTlGIYEX1b4KC4e/o0AOiaxJbRaO/XJLORHaJiBf7iebIu/k
        JMe1wSmq8YQh2TR95nyMDo7A2A==
X-Google-Smtp-Source: ACHHUZ6KQEEqDFyuJxGetBpNk+eqM4UhYKbGbc60Xr1JjWZq7aigGHgry/VOh6CEh38+Iofl/XWbJw==
X-Received: by 2002:a5d:630a:0:b0:313:ece6:834a with SMTP id i10-20020a5d630a000000b00313ece6834amr2532958wru.30.1687728618151;
        Sun, 25 Jun 2023 14:30:18 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id d3-20020adfe843000000b00311334c7fabsm5452892wrn.16.2023.06.25.14.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:30:17 -0700 (PDT)
Message-ID: <8365a865-c9d0-43bc-2de6-91c43aaaa3fb@linaro.org>
Date:   Sun, 25 Jun 2023 23:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 09/17] sparc/cpu: Switch to arch_cpu_finalize_init()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.431995857@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.431995857@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 14/6/23 01:39, Thomas Gleixner wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> ---
>   arch/sparc/Kconfig            |    1 +
>   arch/sparc/include/asm/bugs.h |   18 ------------------
>   arch/sparc/kernel/setup_32.c  |    7 +++++++
>   3 files changed, 8 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

