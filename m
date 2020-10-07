Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB01D28628F
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 17:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgJGPse (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 11:48:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38368 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgJGPsd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 11:48:33 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 39A32806C5;
        Wed,  7 Oct 2020 17:41:43 +0200 (CEST)
Date:   Wed, 7 Oct 2020 17:41:41 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR
 leftovers
Message-ID: <20201007154141.GA862107@ravnborg.org>
References: <20201007074447.797968-1-hch@lst.de>
 <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=9jrUWy9R0_lckN2VWKQA:9
        a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Arnd.

On Wed, Oct 07, 2020 at 10:54:19AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> > don't bother with a compat handler for it, and remove the remaining
> > definitions as well.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
> drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
> what the state is.
> 
> My version only removed the compat handling, not the data structures,
> so I'm happy to see your version used instead if mine got lost.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

I think the patches got applied to drm-misc-next *after* the final push
to -next for the current merge window.
So the patches are lingering in drm-misc-next waiting for the upcoming
merge window to comple before they are pushed to linux-next.
So for now the patches are only visible if one pulls drm-misc and checks
out drm-misc-next branch.

Pulling a fresh drm-misc tree just to be 100% sure .......

Yep, patches are there when I pull a fresh tree and mripard just
confirmed on irc that he sees them in his drm-misc-next repo.

I am working with git.freedesktop.org/git/drm/drm-misc.

	Sam

