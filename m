Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D2325BDDD
	for <lists+sparclinux@lfdr.de>; Thu,  3 Sep 2020 10:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgICIvF (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 3 Sep 2020 04:51:05 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:36265 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbgICIvE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 3 Sep 2020 04:51:04 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0U7nVX.Y_1599123058;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0U7nVX.Y_1599123058)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 03 Sep 2020 16:50:58 +0800
Subject: Re: [PATCH v4 3/4] mm/pageblock: work around multiple arch's cmpxchg
 support issue
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Alexander Duyck <alexander.duyck@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux Memory Management List <linux-mm@kvack.org>
References: <1599116482-7410-1-git-send-email-alex.shi@linux.alibaba.com>
 <1599116482-7410-3-git-send-email-alex.shi@linux.alibaba.com>
 <CAMo8BfJT7JJfwT1-X3vfqKGD-E3-Dbf2xyWs-RiRyUUHmbetVA@mail.gmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <21144022-cf75-5b4f-4645-a7f0746b025d@linux.alibaba.com>
Date:   Thu, 3 Sep 2020 16:50:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfJT7JJfwT1-X3vfqKGD-E3-Dbf2xyWs-RiRyUUHmbetVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



在 2020/9/3 下午3:29, Max Filippov 写道:
>> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
>> index e997e0119c02..862b008ab09e 100644
>> --- a/arch/xtensa/Kconfig
>> +++ b/arch/xtensa/Kconfig
>> @@ -42,6 +42,7 @@ config XTENSA
>>         select MODULES_USE_ELF_RELA
>>         select PERF_USE_VMALLOC
>>         select VIRT_TO_BUS
>> +       select NO_CMPXCHG_BYTE
> Please keep the lists of select statements in Kconfig files above
> alphabetically sorted.

Hi Max,

Thanks for the reminder, Let's comments from Mel Gorman.

Thanks!
