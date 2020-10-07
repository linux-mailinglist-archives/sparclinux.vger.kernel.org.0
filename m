Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A344B285D0F
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 12:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgJGKkw (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 06:40:52 -0400
Received: from verein.lst.de ([213.95.11.211]:36924 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727767AbgJGKkt (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 7 Oct 2020 06:40:49 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E47C86736F; Wed,  7 Oct 2020 12:40:46 +0200 (CEST)
Date:   Wed, 7 Oct 2020 12:40:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR
 leftovers
Message-ID: <20201007104046.GB24327@lst.de>
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de> <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com> <20201007085911.GA17356@lst.de> <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 07, 2020 at 11:28:58AM +0200, Arnd Bergmann wrote:
> The only one I have actually given up on is the atomisp staging driver,
> which uses an awful hack, copying the x86 implementation of
> copy_in_user()/compat_alloc_user_space() into the driver.

That is gross.  Just mark the driver as broken for now.  Linus agreed
years ago that we don't need to work around staging drivers.  But
it would still be nice to ping the mainainers, as they often have
better ideas how to solve the problem.
