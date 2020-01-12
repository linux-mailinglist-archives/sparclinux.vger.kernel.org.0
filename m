Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78A0F1386FF
	for <lists+sparclinux@lfdr.de>; Sun, 12 Jan 2020 17:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733067AbgALQLm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 12 Jan 2020 11:11:42 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48492 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733064AbgALQLm (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 12 Jan 2020 11:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1+A5yMx/hadKl2P1tm/QfUD0t0TCrjMPGCQ0JxklxbA=; b=owWI3AU82rKPTDPSZXEWTdn45
        04sl03a2ZMcTByAhW4aV9m02yEexy+wHcEpjuNMFXzCZDEUJied3xK3tqdtX6wQFunl0byBTaw3Hz
        odbdFb1auhHpyFLzbGa63JST0wrGRB4SRD1qnFaXDa6yC7+P/W7Prz2gYAAL8zUsLLMszMzu/uiDk
        4qmG2xXqwbk0uZA7d/8va9Z/Ba0l/kjS0HvbEOU4Wd///cOfYvn1BAVsR3LfiwCQd3QcDasUqoQyd
        O4ZGeUqJb/SYlzYeg52EnSLCpM98D+I9asNH3YV2A5s0SSsAEwV0fnoroKXzk369YgwaHbI6omxNO
        IdSX4E2sw==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iqfpx-0000d8-T9; Sun, 12 Jan 2020 16:11:37 +0000
Subject: Re: [PATCH] tty: n_hdlc: fix build on SPARC
To:     David Miller <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        akpm@linux-foundation.org, gregkh@linuxfoundation.org,
        keescook@chromium.org, lkp@intel.com
References: <675e7bd9-955b-3ff3-1101-a973b58b5b75@infradead.org>
 <20200112.000504.1994757840298424991.davem@davemloft.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <19f684bb-42ad-6c79-f6b8-102f6e036570@infradead.org>
Date:   Sun, 12 Jan 2020 08:11:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200112.000504.1994757840298424991.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 1/12/20 12:05 AM, David Miller wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> Date: Mon, 30 Sep 2019 19:15:12 -0700
> 
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix tty driver build on SPARC by not using __exitdata.
>> It appears that SPARC does not support section .exit.data.
>>
>> Fixes these build errors:
>>
>> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
>> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
>> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
>> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
>>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Fixes: 063246641d4a ("format-security: move static strings to const")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> I'll add an .exit.data to arch/sparc/kernel/vmlinux.lds.S to fix this.
> 

Thanks.

-- 
~Randy

