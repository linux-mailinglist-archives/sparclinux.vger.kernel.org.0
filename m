Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95071153680
	for <lists+sparclinux@lfdr.de>; Wed,  5 Feb 2020 18:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgBERaq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 5 Feb 2020 12:30:46 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44990 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBERaq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 5 Feb 2020 12:30:46 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so3725201wrx.11
        for <sparclinux@vger.kernel.org>; Wed, 05 Feb 2020 09:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=;
        b=UpL5Z4PGv5IbifOCXJmA3EvKU8pwWTuibgFkCYerfZ0RWYMWJsc8jdRFKSdHulhrWW
         0q5QFjVXGqO8N3azYMUT6BuQ70iIsYooSH0EN3NCB1U+uAl0UOubOv/x84pOWUnwZOfz
         nqLUdyrNpbx9UQKrlex68a8wL6FXpMdsVOp2ImierJGNMKjy/XyENBdZuZ87OyOllEPm
         3OBBBIUFzK0S2Bmis4vn5z0G3ksW8K0PQM62ik+UqemshCq2wrtaGg6nGM95ryq0m1oV
         bjtOm73AnLl8o+WYQlLgbQBG72NiEnexJulDQcDQhqCPvLnUWDJPV8Z2q1LLoi5XlXbF
         6avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=;
        b=l7BD34UCp3JFvT8N9zt9IhOOql3i7qyLnke+7rm/4CElWTmEAU7gvyQ0wJMM8OhS93
         FDKfSGik/Q0mnKUgIDYEHdARPwMRen2YkAHXI6yzZ2KBu37P/OZkT5TAgxAUHJl8rGWJ
         Aeb6YoQ+dmNO6ZXlbG/JF+6sZGkyksLFkRoDveWpOTD+HaOIhUEzWXpPCy6gHdynBcX2
         zvmGHJUfzj7Nqug9nNLqcYcrwPbuee/tKKQZQlQQY8n7OoF6ISx01sCIYypQKtUpNUt8
         iqclFNG3xOrFgp+03ziz1PDhOHvzYhM/jujSqQ+27XqWWd+u/fBJotmKBT7QjF/+eXuf
         wcZg==
X-Gm-Message-State: APjAAAWJx7bSmZwbkS36CVY4dhB1CMUvT5qU7JVVLm2yOU4QDMaxwts5
        rtgYseqcWJugNs2YTOkw/H1Eh114JV5vRg==
X-Google-Smtp-Source: APXvYqye1mYri+CUv+WS55ZmHdq9oGdILOb6XRaB+Cltp8xHrBe9SWrvZi+EHPv63nSK5VzAySrxaw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr31507302wrn.254.1580923844315;
        Wed, 05 Feb 2020 09:30:44 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id d13sm651699wrc.3.2020.02.05.09.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 09:30:43 -0800 (PST)
Date:   Wed, 5 Feb 2020 17:30:42 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Anatoly Pugachev <matorola@gmail.com>, sparclinux@vger.kernel.org,
        Jason Wessel <jason.wessel@windriver.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] kdb: Fix compiling on architectures w/out
 DBG_MAX_REG_NUM defined
Message-ID: <20200205173042.chqij5i53mncfzar@holly.lan>
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> if current task has no regs") I tried to clean things up by using "if"
> instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> architectures define some of the structures that the code is referring
> to.
> 
> Let's switch to #ifdef again, but at least avoid using it inside of
> the function.
> 
> Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> Reported-by: Anatoly Pugachev <matorola@gmail.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for being so quick with this (especially when if I had been less
delinquent with linux-next it might have been spotted sooner).


> ---
> I don't have a sparc64 compiler but I'm pretty sure this should work.
> Testing appreciated.

I've just add sparc64 into my pre-release testing (although I have had to
turn off a bunch of additional compiler warnings in order to do so).


>  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index b22292b649c4..c84e61747267 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
>  /*
>   * kdb_rd - This function implements the 'rd' command.
>   */
> +
> +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> +#if DBG_MAX_REG_NUM <= 0
> +static int kdb_rd(int argc, const char **argv)
> +{
> +	if (!kdb_check_regs())
> +		kdb_dumpregs(kdb_current_regs);
> +	return 0;
> +}
> +#else

The original kdb_rd (and kdb_rm which still exists in this file) place
the #if inside the function and users > 0 so the common case was
covered at the top and the fallback at the bottom.

Why change style when re-introducing this code?


Daniel.
