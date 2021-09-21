Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4966D412F94
	for <lists+sparclinux@lfdr.de>; Tue, 21 Sep 2021 09:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhIUHiX (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 21 Sep 2021 03:38:23 -0400
Received: from verein.lst.de ([213.95.11.211]:55353 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230168AbhIUHiW (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 21 Sep 2021 03:38:22 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C8F8567373; Tue, 21 Sep 2021 09:36:52 +0200 (CEST)
Date:   Tue, 21 Sep 2021 09:36:52 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     David Miller <davem@davemloft.net>
Cc:     hch@lst.de, andreas@gaisler.com, sparclinux@vger.kernel.org
Subject: Re: use the generic DMA remap allocator for sparc32
Message-ID: <20210921073652.GA25677@lst.de>
References: <20210920113108.1299996-1-hch@lst.de> <20210920.123432.51038656274894609.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920.123432.51038656274894609.davem@davemloft.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Sep 20, 2021 at 12:34:32PM +0100, David Miller wrote:
> From: Christoph Hellwig <hch@lst.de>
> Date: Mon, 20 Sep 2021 13:31:06 +0200
> 
> > Hi Dave,
> > 
> > this series switches sparc32 to use the generic dma remap allocator
> > instead of its own version.
> 
> For series:
> 
> Acked-by: David S. Miller <davem@davemloft.net>

Does this mean you'd prefer them to go through the dma-mapping tree
and not the sparc tree?
