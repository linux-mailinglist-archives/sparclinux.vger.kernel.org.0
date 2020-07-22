Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEF3228E4E
	for <lists+sparclinux@lfdr.de>; Wed, 22 Jul 2020 04:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731859AbgGVC4c (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 21 Jul 2020 22:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731858AbgGVC4c (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 21 Jul 2020 22:56:32 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE82FC061794;
        Tue, 21 Jul 2020 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=5BAsLx0MoplaRxT7uSCXsw0muust90Jo4hf2HhCbF9g=; b=dIgnR5zTf3J0UqwNiiaU+nkb/n
        YUukwTi8eHqmrMOKsTYRbiFMcS2/nxXvMlfJNi1tlYT713JZJutWAxgzjXIGbutBrYqHrmf4+0Tp/
        rVKPLR1LN/kJi+kEfkzgIUiSqlXPduB33Jpwu5VDQ7Y7eenxbhGgQYl5QyLxFMTmyDvxHypcAponY
        aCQuTKu+K21jihcai3Ft9RgUx0/FaLxOmnuxSDYzzthc/7F3KDcukTfOrUeU62ZSQBGrXPWv9KPB/
        M/O0DNjYcEw5ft6j3/N7ECu9KFZ2tnNwtWJfVc60h0RROGdDc6treUBN3HY/0M9EOrXdZ2rcBNkMY
        0y+D1ViA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jy4vh-0002T5-FA; Wed, 22 Jul 2020 02:56:25 +0000
Subject: Re: [PATCH] SPARC: backoff.h: delete a duplicated word
To:     David Miller <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org
References: <20200721210033.15408-1-rdunlap@infradead.org>
 <20200721.182248.277146641003054082.davem@davemloft.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f397992d-f2e8-76aa-79c9-158350914369@infradead.org>
Date:   Tue, 21 Jul 2020 19:56:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721.182248.277146641003054082.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 7/21/20 6:22 PM, David Miller wrote:

>> @David:
>> In arch/sparc/include/asm/cpu_type.h, line 12,
>> is that duplicated "ploos" correct?
>>   sun4u       = 0x03, /* V8 ploos ploos */
> 
> Yes, it's a funny way of saying "++" :-)

I see. Thanks for the explanation.

-- 
~Randy

