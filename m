Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39635F44E9
	for <lists+sparclinux@lfdr.de>; Tue,  4 Oct 2022 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiJDN5p (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Oct 2022 09:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiJDN5o (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Oct 2022 09:57:44 -0400
Received: from vsp-unauthed02.binero.net (vsp-unauthed02.binero.net [195.74.38.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FCE5A8A1
        for <sparclinux@vger.kernel.org>; Tue,  4 Oct 2022 06:57:42 -0700 (PDT)
X-Halon-ID: 806f4620-43ec-11ed-a6f7-fd6d048ed7e0
Authorized-sender: andreas@gaisler.com
Received: from [192.168.10.94] (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 806f4620-43ec-11ed-a6f7-fd6d048ed7e0;
        Tue, 04 Oct 2022 15:57:37 +0200 (CEST)
Message-ID: <c96920b5-2d49-1946-4a4e-6a67fd8e5772@gaisler.com>
Date:   Tue, 4 Oct 2022 15:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [linux-next:pending-fixes] BUILD REGRESSION
 37b3c1c31342cdb8ee57f80a3a78cfe651a3f2ae
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     sparclinux@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>
References: <633c0193.srGRSlP3TyZ9yamz%lkp@intel.com>
From:   Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <633c0193.srGRSlP3TyZ9yamz%lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2022-10-04 11:49, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
> branch HEAD: 37b3c1c31342cdb8ee57f80a3a78cfe651a3f2ae  Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-mm/202210041036.f84z3tBl-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> arch/sparc/mm/srmmu.c:1662:25: error: too few arguments to function 'xc1'
> arch/sparc/mm/srmmu.c:1662:30: error: 'smpfunc_t' undeclared (first use in this function); did you mean 'cmp_func_t'?
> arch/sparc/mm/srmmu.c:1662:40: error: expected ')' before 'local_ops'
> arch/sparc/mm/srmmu.c:1694:25: error: too few arguments to function 'xc3'
> arch/sparc/mm/srmmu.c:1726:25: error: too few arguments to function 'xc2'
> 

Commit 2d2b17d08bfc ("sparc: Unbreak the build") in 
linux-next/pending-fixes is missing a number of changes to 
arch/sparc/mm/srmmu.c that was done in commit 17006e86a764 ("sparc: 
Unbreak the build") in the master branch.

-- 
Andreas Larsson

