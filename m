Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB9F21E417
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2020 01:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGMX7k (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 13 Jul 2020 19:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMX7k (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 13 Jul 2020 19:59:40 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA14C061755;
        Mon, 13 Jul 2020 16:59:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D2C0A1297E6E8;
        Mon, 13 Jul 2020 16:59:39 -0700 (PDT)
Date:   Mon, 13 Jul 2020 16:59:39 -0700 (PDT)
Message-Id: <20200713.165939.496808182827217356.davem@davemloft.net>
To:     grandmaster@al2klimov.de
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/sparc: Replace HTTP links with HTTPS ones
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200713095351.32997-1-grandmaster@al2klimov.de>
References: <20200713095351.32997-1-grandmaster@al2klimov.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 13 Jul 2020 16:59:40 -0700 (PDT)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Date: Mon, 13 Jul 2020 11:53:51 +0200

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Applied, thanks.
