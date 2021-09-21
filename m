Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA45F413292
	for <lists+sparclinux@lfdr.de>; Tue, 21 Sep 2021 13:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhIULeL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 21 Sep 2021 07:34:11 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:22725 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231743AbhIULeL (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Tue, 21 Sep 2021 07:34:11 -0400
X-Halon-ID: a092008c-1acf-11ec-ac84-005056917a89
Authorized-sender: andreas@gaisler.com
Received: from [192.168.10.22] (h-98-128-223-123.na.cust.bahnhof.se [98.128.223.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id a092008c-1acf-11ec-ac84-005056917a89;
        Tue, 21 Sep 2021 13:32:40 +0200 (CEST)
Subject: Re: [PATCH 1/2] sparc32: remove dma_make_coherent
To:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>
Cc:     "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
References: <20210920113108.1299996-1-hch@lst.de>
 <20210920113108.1299996-2-hch@lst.de> <YUixtMGPMLWvv8S9@ravnborg.org>
 <20210921074151.GA26525@lst.de>
From:   Andreas Larsson <andreas@gaisler.com>
Message-ID: <7732120c-0165-5fb6-1c80-3a14f1d6f9c4@gaisler.com>
Date:   Tue, 21 Sep 2021 13:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921074151.GA26525@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2021-09-21 09:41, Christoph Hellwig wrote:
> Ok.  I'll respin with a more detailed commit log.

These two patches works fine for me, so you can add a

Tested-by: Andreas Larsson <andreas@gaisler.com>

as well.

-- 
Andreas Larsson

