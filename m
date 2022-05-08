Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F80951EBF5
	for <lists+sparclinux@lfdr.de>; Sun,  8 May 2022 08:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiEHGMO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 8 May 2022 02:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiEHGMK (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 8 May 2022 02:12:10 -0400
X-Greylist: delayed 1188 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 07 May 2022 23:08:20 PDT
Received: from relay3.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92806DEB5
        for <sparclinux@vger.kernel.org>; Sat,  7 May 2022 23:08:20 -0700 (PDT)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay02.hostedemail.com (Postfix) with ESMTP id 604F42D789;
        Sun,  8 May 2022 05:48:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 786503E;
        Sun,  8 May 2022 05:48:30 +0000 (UTC)
Message-ID: <79155ff180bd6705a77e4e7df98fdb8afa0188a2.camel@perches.com>
Subject: Re: [PATCH] sparc32: srmmu: Fix typo in a comment
From:   Joe Perches <joe@perches.com>
To:     Jason Wang <wangborong@cdjrlc.com>, davem@davemloft.net
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 07 May 2022 22:48:28 -0700
In-Reply-To: <20220508024351.110391-1-wangborong@cdjrlc.com>
References: <20220508024351.110391-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 786503E
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Stat-Signature: reg3mfucgcya6wgoz6h8rj81ershp4dh
X-Rspamd-Server: rspamout05
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/JOh0NbiaImnNvpVEL+KUPmRo3J5LSwVQ=
X-HE-Tag: 1651988910-7320
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, 2022-05-08 at 10:43 +0800, Jason Wang wrote:
> The double `hush' in the comment in line 1186 is repeated. Remove one
> of them from the comment.
[]
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
[]
> @@ -1183,7 +1183,7 @@ static void __init init_swift(void)
>  		srmmu_modtype = Swift_lots_o_bugs;
>  		hwbug_bitmask |= (HWBUG_KERN_ACCBROKEN | HWBUG_KERN_CBITBROKEN);
>  		/*
> -		 * Gee george, I wonder why Sun is so hush hush about
> +		 * Gee george, I wonder why Sun is so hush about

This is not really a repeated word.

do a google search on "hush hush"

It _might_ sometimes use a dash, like 'hush-hush'


