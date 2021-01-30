Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9F83097C9
	for <lists+sparclinux@lfdr.de>; Sat, 30 Jan 2021 20:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhA3TGf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 30 Jan 2021 14:06:35 -0500
Received: from smtprelay0228.hostedemail.com ([216.40.44.228]:46868 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229990AbhA3TGe (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Sat, 30 Jan 2021 14:06:34 -0500
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Jan 2021 14:06:34 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id B9EEE8124C82
        for <sparclinux@vger.kernel.org>; Sat, 30 Jan 2021 18:57:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 5A37E837F24C;
        Sat, 30 Jan 2021 18:56:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3868:4321:5007:7652:7875:10004:10400:10848:11232:11658:11914:12296:12297:12555:12740:12895:13069:13311:13357:13439:13894:14181:14659:14721:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: rice07_1e13932275b3
X-Filterd-Recvd-Size: 1721
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Sat, 30 Jan 2021 18:56:18 +0000 (UTC)
Message-ID: <537f6b211185eec4e511bc146d1863f448e7d6c7.camel@perches.com>
Subject: Re: [PATCH 04/29] sparc: Avoid comma separated statements
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Date:   Sat, 30 Jan 2021 10:56:17 -0800
In-Reply-To: <9dade53620b9532ff76a726320a497c67138264c.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <9dade53620b9532ff76a726320a497c67138264c.1598331148.git.joe@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> �arch/sparc/kernel/smp_64.c | 7 +++++--
> �1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index e286e2badc8a..28c11f7871cd 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -186,8 +186,11 @@ static inline long get_delta (long *rt, long *master)
> �		wmb();
> �		t1 = tick_ops->get_tick();
> �
> 
> -		if (t1 - t0 < best_t1 - best_t0)
> -			best_t0 = t0, best_t1 = t1, best_tm = tm;
> +		if (t1 - t0 < best_t1 - best_t0) {
> +			best_t0 = t0;
> +			best_t1 = t1;
> +			best_tm = tm;
> +		}
> �	}
> �
> 
> �	*rt = best_t1 - best_t0;


