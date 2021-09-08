Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED27F403379
	for <lists+sparclinux@lfdr.de>; Wed,  8 Sep 2021 06:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhIHExh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 8 Sep 2021 00:53:37 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:40224 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhIHExh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 8 Sep 2021 00:53:37 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNpVA-002DI1-Tc; Wed, 08 Sep 2021 04:48:00 +0000
Date:   Wed, 8 Sep 2021 04:48:00 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-sparc <sparclinux@vger.kernel.org>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
Message-ID: <YThAgIhKPQZq5UZn@zeniv-ca.linux.org.uk>
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <c3790fb9-b83f-9596-18a1-21ace987c850@roeck-us.net>
 <CAHk-=wi4NW3NC0xWykkw=6LnjQD6D_rtRtxY9g8gQAJXtQMi8A@mail.gmail.com>
 <20210906234921.GA1394069@roeck-us.net>
 <20210908042838.GA2585993@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908042838.GA2585993@roeck-us.net>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Sep 07, 2021 at 09:28:38PM -0700, Guenter Roeck wrote:

> 	memcpy(eth_addr, sanitize_address((void *) 0xfffc1f2c), ETH_ALEN);
> 
> but that just seems weird. Is there a better solution ?

(char (*)[ETH_ALEN])?  Said that, shouldn't that be doing something like
ioremap(), rather than casting explicit constants?
