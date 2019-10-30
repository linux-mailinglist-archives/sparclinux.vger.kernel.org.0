Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8410FEA469
	for <lists+sparclinux@lfdr.de>; Wed, 30 Oct 2019 20:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfJ3Ttx (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 30 Oct 2019 15:49:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38597 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfJ3Ttw (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 30 Oct 2019 15:49:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id c13so2331004pfp.5
        for <sparclinux@vger.kernel.org>; Wed, 30 Oct 2019 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GsUe1Wv0asWvlULQIAeQdfJEV8oOIy0jm7AS7PH13QM=;
        b=mKFvbx8+Ur0VWbOawosp16f0+2DVQV0YaMiBp0a8ffMylctSLmNfnbktb4IDkGSSlm
         t2J8LGUIH7gRdDdCm0Pd1JHAGE7mCjissmr1rgOixyJFxYFFV2Kpvvse8G+TGH/vXgSP
         VZY4lEF/rHr1YmnbKyBkgRa7/S7xOdPtJDkNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsUe1Wv0asWvlULQIAeQdfJEV8oOIy0jm7AS7PH13QM=;
        b=hYPDN7sAl5u8eUSyhpiXGXQErRXIg6DSvRdu9ibgXt9seqX5XCveWDqO+njB1Q1Jaj
         7M82foUB/F7qSIptsXP6sAP030ePtToWpnp8ON3c3JRznt8aHGNqJuAGtA8AK3+ec4Bt
         62JbUgKWUhQYklNbBs7Io1fUbgHnJsFcrv06/eQaC3yko6yb7Rm2gOhJ40ODMZjkMufO
         +3cgFL060RGg1HSAtBhS/YGKb5hy9FLjspJyvnyX4UwsrYo29WrEf1mvRqe3o/M7kDmx
         N1SOK82gtcRcU2f3Dno6GygLpPMph1MdLJxAxrYkJ0lOZFMZoorRjHtC9O2dOTUmzqlW
         p+mA==
X-Gm-Message-State: APjAAAXVwXmOF6YgYLQbHzh+FDuh5TNXNA8z8yON84AuoC4KG6ZnSN0m
        kfKE4k6xttpfXJrGkI1Q5NGFdvl7OR0=
X-Google-Smtp-Source: APXvYqy0g3+VIM9woycIWCMOi9IxwLtAjVmxPGoyweq4MW4CXE5MTpM0ucYqlARWuMq4vSQhUGI6dg==
X-Received: by 2002:a63:3205:: with SMTP id y5mr1346198pgy.42.1572464990725;
        Wed, 30 Oct 2019 12:49:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d5sm2917654pjw.31.2019.10.30.12.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 12:49:49 -0700 (PDT)
Date:   Wed, 30 Oct 2019 12:49:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] tty: n_hdlc: fix build on SPARC
Message-ID: <201910301249.9070A9889E@keescook>
References: <675e7bd9-955b-3ff3-1101-a973b58b5b75@infradead.org>
 <201910301131.2739AA83@keescook>
 <9ef8c2a5-8510-c509-4c31-b8684b6e1c67@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef8c2a5-8510-c509-4c31-b8684b6e1c67@physik.fu-berlin.de>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 30, 2019 at 08:29:40PM +0100, John Paul Adrian Glaubitz wrote:
> On 10/30/19 7:34 PM, Kees Cook wrote:
> > On Mon, Sep 30, 2019 at 07:15:12PM -0700, Randy Dunlap wrote:
> >> From: Randy Dunlap <rdunlap@infradead.org>
> >>
> >> Fix tty driver build on SPARC by not using __exitdata.
> >> It appears that SPARC does not support section .exit.data.
> >>
> >> Fixes these build errors:
> >>
> >> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> >> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> >> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> >> `.exit.data' referenced in section `.exit.text' of drivers/tty/n_hdlc.o: defined in discarded section `.exit.data' of drivers/tty/n_hdlc.o
> >>
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >> Fixes: 063246641d4a ("format-security: move static strings to const")
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Wow. That commit is from 2.5 years ago. Is the SPARC port still alive?
> Yes, it is. No idea why we didn't run into this. I assume it affects certain
> configurations only. On Debian, we are always compiling and running the
> latest kernel versions on sparc64.

Yeah, that's what I thought. I also didn't hit it 2.5 years ago when I
did multi-architecture build validation of these changes. :P

Randy you've found a nice corner case! :)

-- 
Kees Cook
