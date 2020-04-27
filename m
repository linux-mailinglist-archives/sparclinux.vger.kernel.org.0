Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0471BA38C
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgD0M1u (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 08:27:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgD0M1t (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 08:27:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AA84206B6;
        Mon, 27 Apr 2020 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587990469;
        bh=hcb1JO8Ep8sCS7gBSqM3kpVwV7XNwxPBwJscPl1jCSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v/pThTl8ibMsxao7qXhaISTjtNNqY2JETPLuCM2be6IlmYN2aVHEI1Sff/+IzfnrP
         eIRZb28LuoawnLUkDSLRuErJLkyIc+ulH0ZDaQG4OJYsSs0N1Cn0loRu7BDdSCdCpp
         nmNJpzQG7gat6PJOni+Aq2cDJAJtPZVOgvcG3eNU=
Date:   Mon, 27 Apr 2020 14:27:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Jiri Slaby <jslaby@suse.com>, sparclinux@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] sparc64: vcc: Fix error return code in vcc_probe()
Message-ID: <20200427122747.GA2781212@kroah.com>
References: <20200427122415.47416-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427122415.47416-1-weiyongjun1@huawei.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Apr 27, 2020 at 12:24:15PM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/tty/vcc.c | 1 +
>  1 file changed, 1 insertion(+)

Why is sparc64 in your subject line?

confused,

greg k-h
