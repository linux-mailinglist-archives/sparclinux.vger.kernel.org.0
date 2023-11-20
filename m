Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C937F0C72
	for <lists+sparclinux@lfdr.de>; Mon, 20 Nov 2023 08:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjKTHF0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 20 Nov 2023 02:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjKTHF0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 20 Nov 2023 02:05:26 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D89DB3;
        Sun, 19 Nov 2023 23:05:21 -0800 (PST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SYdhg3CDpzsRJy;
        Mon, 20 Nov 2023 15:01:23 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 20 Nov 2023 15:04:49 +0800
Message-ID: <1f013eda-b82f-4ae0-99ad-0eec70d45146@huawei.com>
Date:   Mon, 20 Nov 2023 15:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Arch <linux-arch@vger.kernel.org>,
        <linux-alpha@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-hexagon@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
        <linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Russell King <linux@armlinux.org.uk>,
        Brian Cain <bcain@quicinc.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
 <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
 <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
 <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



On 2023/11/20 14:40, Arnd Bergmann wrote:
> On Mon, Nov 20, 2023, at 01:39, Kefeng Wang wrote:
>> On 2023/11/20 3:34, Geert Uytterhoeven wrote:
>>> On Sat, Nov 18, 2023 at 11:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>>>
>>>> -/*
>>>> - * Convert a physical pointer to a virtual kernel pointer for /dev/mem
>>>> - * access
>>>> - */
>>>> -#define xlate_dev_mem_ptr(p)   __va(p)
>>>> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>>>> -
>>>>    void __ioread64_copy(void *to, const void __iomem *from, size_t count);
>>>
>>> Missing #include <asm-generic/io.h>, according to the build bot report.
>>
>> Will check the bot report.
> 
> I had planned to pick up the series from
> 
> https://lore.kernel.org/lkml/20230921110424.215592-3-bhe@redhat.com/

Good to see it.

> 
> for v6.7 but didn't make it in the end. I'll try to do it now
> for v6.8 and apply your v1 patch with the Acks on top.

Thanks.

> 
>      Arnd
