Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939FD40A682
	for <lists+sparclinux@lfdr.de>; Tue, 14 Sep 2021 08:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239748AbhINGNl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 14 Sep 2021 02:13:41 -0400
Received: from verein.lst.de ([213.95.11.211]:58595 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237875AbhINGNl (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 14 Sep 2021 02:13:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 751A167357; Tue, 14 Sep 2021 08:12:22 +0200 (CEST)
Date:   Tue, 14 Sep 2021 08:12:22 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Andreas Larsson <andreas@gaisler.com>,
        David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        software@gaisler.com
Subject: Re: [PATCH] sparc32: Page align size in arch_dma_alloc
Message-ID: <20210914061222.GA26679@lst.de>
References: <20210908074822.16793-1-andreas@gaisler.com> <YTjfJl6YmBCdZ8XB@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTjfJl6YmBCdZ8XB@ravnborg.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Sep 08, 2021 at 06:04:54PM +0200, Sam Ravnborg wrote:
> Hi Andreas,
> 
> On Wed, Sep 08, 2021 at 09:48:22AM +0200, Andreas Larsson wrote:
> > Commit 53b7670e5735 ("sparc: factor the dma coherent mapping into
> > helper") lost the page align for the calls to dma_make_coherent and
> > srmmu_unmapiorange. The latter cannot handle a non page aligned len
> > argument.
> 
> I wonder how you managed to track this down - well done.
> > 
> > Signed-off-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I assume David or Christoph picks it up.

I'll happily pick it up if that is ok.  Dave?
