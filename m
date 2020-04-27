Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0DB1BAB3C
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgD0R3B (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 13:29:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:44502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbgD0R3B (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 13:29:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B9A420728;
        Mon, 27 Apr 2020 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588008539;
        bh=1xQZkjcEAVsaFBPLaveIerNAZXeH2sWjTuCvgjS/l3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=msvDjvCdoR4dYCAukwjzzynfBRMjJriIU27uSqUibuwQXyk5luNJK6dZYLH5vg4bH
         VBnb5rgMU2t6L195/BTKKPpN1GalcspkAd0PAHxs5knZC1FucEMHzyKgenxoPhlqrJ
         iWYDzw/V8VCL7FSFUCt9MwSYcaMBvuaf0ZMYWq50=
Date:   Mon, 27 Apr 2020 19:28:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Miller <davem@davemloft.net>
Cc:     weiyongjun1@huawei.com, jslaby@suse.com,
        sparclinux@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] sparc64: vcc: Fix error return code in vcc_probe()
Message-ID: <20200427172856.GA3936841@kroah.com>
References: <20200427122415.47416-1-weiyongjun1@huawei.com>
 <20200427122747.GA2781212@kroah.com>
 <20200427.091438.1070286832296952889.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427.091438.1070286832296952889.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Apr 27, 2020 at 09:14:38AM -0700, David Miller wrote:
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Date: Mon, 27 Apr 2020 14:27:47 +0200
> 
> > On Mon, Apr 27, 2020 at 12:24:15PM +0000, Wei Yongjun wrote:
> >> Fix to return negative error code -ENOMEM from the error handling
> >> case instead of 0, as done elsewhere in this function.
> >> 
> >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >> ---
> >>  drivers/tty/vcc.c | 1 +
> >>  1 file changed, 1 insertion(+)
> > 
> > Why is sparc64 in your subject line?
> 
> It's a sparc64 hypervisor console driver.

Ah, that wasn't very obvious, sorry about that.

greg k-h
