Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33EE6CF9CA
	for <lists+sparclinux@lfdr.de>; Thu, 30 Mar 2023 05:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjC3DzD (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 29 Mar 2023 23:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjC3Dy4 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 29 Mar 2023 23:54:56 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49AE59FC
        for <sparclinux@vger.kernel.org>; Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x15so16078478pjk.2
        for <sparclinux@vger.kernel.org>; Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=KDkr9GukbLDb5E0cjryjb5Wh0SCZaycf/IUr90YlJNe0yf+CJFbuqVLgseHvC1XTAs
         Mj696hVP3J+/JyxeccnDx4sbyBLoQR8t6nLYlyTiLLcc21ZTbl5DObP3Sn5N4aoPtg5K
         vT05+Dy7pELaLbJ3Jtjg4yd67A4IfUXlaie5LW1NfYlipHOIwyXNtqF0se+FNlmkrAW9
         0bSdtfv+XKaMh8hj340BwSg3B4py1O/ULmxkhI+S+4sADQi7xMUd3Eyip4T50rRfAII+
         GbYAWTbGyTjtff51zxbKYOhiJVlu3d4/NXIx3s+ZSTQbkwQZhq1bYkwIvzgmP/zufxWD
         V87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORTcc1S4DbhSj9bYXgbzlVEJUmJSEuJEOt6fEFrhs3I=;
        b=AuZKIeD+NN34Czbl42Ui6u9061vKiVxD0vei0Vcj5EMRO33EnjRo5tTkv++u+OjHmT
         o6X01yMlsOdKQhXjOyZaCVpUvJxtfk4QOWxS5dq1mjbLVGUpbpMvvWjo19snZGBqFf3n
         Cxh44ezW8ITHz2gERyo4nK1CySBF4PXFurn4CaQqKpReKq+83Knx9//YnJwJCARp9tMR
         zxuKcNawoLThPp1cyYNg3oMfyBGBIxbRVAcDQ6g/HyB/qr12SkEuxJfn+xmYqlylB5yo
         de0dnFyFTDe8fo/4ddETpdQyyhghVjIKNBtbOWG8h5F+HyTYYbbsZexu9fjuyZ1ssCzE
         WMPA==
X-Gm-Message-State: AAQBX9dSWaz1q2fR2MYKXJ1BJPrt2RVMT4sDUpD6WTgifb7cWigdaF2G
        LBScQh7+31pDUtp/tI/5piIjUQ==
X-Google-Smtp-Source: AKy350Z3+wrY9ZgUHedACp4BaESa2FvIEkabhjg74d5bnPV2JCYBYbJoHjnYpjGWoPDBynyeKDWcRw==
X-Received: by 2002:a17:902:d503:b0:19d:1720:3873 with SMTP id b3-20020a170902d50300b0019d17203873mr24981326plg.57.1680148494287;
        Wed, 29 Mar 2023 20:54:54 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b002340d317f3esm2154710pju.52.2023.03.29.20.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:53 -0700 (PDT)
Date:   Thu, 30 Mar 2023 09:24:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Anup Patel <anup@brainfault.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 18/19] OPP: Adjust includes to remove of_device.h
Message-ID: <20230330035451.huc3ae2acvgoh4xs@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-18-581e2605fe47@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 29-03-23, 10:52, Rob Herring wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index e55c6095adf0..63b126c6215e 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -13,7 +13,7 @@
>  #include <linux/cpu.h>
>  #include <linux/errno.h>
>  #include <linux/device.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
>  #include <linux/export.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
