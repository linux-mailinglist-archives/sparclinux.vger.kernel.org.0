Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0759E435FFE
	for <lists+sparclinux@lfdr.de>; Thu, 21 Oct 2021 13:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhJULLb (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 21 Oct 2021 07:11:31 -0400
Received: from verein.lst.de ([213.95.11.211]:46032 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbhJULLa (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 21 Oct 2021 07:11:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id AD76268BEB; Thu, 21 Oct 2021 13:09:12 +0200 (CEST)
Date:   Thu, 21 Oct 2021 13:09:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 1/2] sparc32: remove dma_make_coherent
Message-ID: <20211021110912.GA12643@lst.de>
References: <20210920113108.1299996-1-hch@lst.de> <20210920113108.1299996-2-hch@lst.de> <YUixtMGPMLWvv8S9@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUixtMGPMLWvv8S9@ravnborg.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I've now commited this series to the dma-mapping tree, with the first
patch split into two so that is more obvious:

http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/for-next
