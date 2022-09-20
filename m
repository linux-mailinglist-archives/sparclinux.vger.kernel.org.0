Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7039F5BDA68
	for <lists+sparclinux@lfdr.de>; Tue, 20 Sep 2022 04:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiITCtg (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 19 Sep 2022 22:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiITCtd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 19 Sep 2022 22:49:33 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95276B25
        for <sparclinux@vger.kernel.org>; Mon, 19 Sep 2022 19:49:27 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c24so1050296plo.3
        for <sparclinux@vger.kernel.org>; Mon, 19 Sep 2022 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rI0IpfDVb05suW6mssP/QFC86Iigix9NLenW3JQ6Phs=;
        b=lnIljFKp1ED3j5wPYTN7mdVUfk7FiKkjAkcUsYSYUMCZpdQ5U8vkDdIo4K0hiw1RH3
         +GFslTzjK43l0+rnV0YItKzr73eqf7dBzWl3BzQNkwS39xy9TTbRZE0df01R7//5oEJr
         gCiIxE6Vh5vvSGpkucOrRiDvI3G32scMCweV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rI0IpfDVb05suW6mssP/QFC86Iigix9NLenW3JQ6Phs=;
        b=H+Ns72Qifn/Ylv78J3gQvG46wop9ILBCnXngKUc5OUze1FmQbU78pIZNRVWXBN5vs/
         ZuVJ3ckLS3HOGkNxgeNPlhs+ZwFPxu5Hn3Nhp7RUzB94x9A8JWwa6A1GWE5t/2M3hnY+
         YSrIOvnv0Kpp3nWUsYh1NVFLs5paqZXr4Dwlu3CPJbQy48nDply+XVSQl/ueoF8SKcAO
         KF72oqBkWJXM3JaP1IgofSxL9K/q/c0/+z27b9C2Vm/WBnQv3Y0ic322OefZUSaHKdd9
         vbMeziapegw3rkDFw2VykcFNQMtXx/924KsFrfjYncjLQ1SPNitaJM60z/e1Yf8q/3QN
         GZzA==
X-Gm-Message-State: ACrzQf1mxcfHA+azOpoYLTpO0PCbVcDTmGGHWn7aNhnXzrMvbINVQGTN
        r6YGDwQ0G8Upra7I5VLC6bDQyA==
X-Google-Smtp-Source: AMsMyM7S+Aze7xjQjfeMxV1IycjxiN9uStAZCOz26LYAWGHUeF519ICUTt9w2zkpb7un7hJ/v+di5Q==
X-Received: by 2002:a17:902:8e84:b0:178:57e4:805b with SMTP id bg4-20020a1709028e8400b0017857e4805bmr2741327plb.144.1663642166279;
        Mon, 19 Sep 2022 19:49:26 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:5744:3726:1f8b:92ad])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b00178a9b193cfsm119779plh.140.2022.09.19.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 19:49:25 -0700 (PDT)
Date:   Tue, 20 Sep 2022 11:49:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux@armlinux.org.uk, linux-imx@nxp.com, tglx@linutronix.de,
        mingo@redhat.com, x86@kernel.org, rostedt@goodmis.org,
        pmladek@suse.com, senozhatsky@chromium.org,
        john.ogness@linutronix.de,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-perf-users@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 25/44] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YykqKm5j5q9DEKk7@google.com>
References: <20220919095939.761690562@infradead.org>
 <20220919101522.021681292@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919101522.021681292@infradead.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On (22/09/19 12:00), Peter Zijlstra wrote:
> The problem, per commit fc98c3c8c9dc ("printk: use rcuidle console
> tracepoint"), was printk usage from the cpuidle path where RCU was
> already disabled.
> 
> Per the patches earlier in this series, this is no longer the case.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Petr Mladek <pmladek@suse.com>

Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org>
