Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4EB376700
	for <lists+sparclinux@lfdr.de>; Fri,  7 May 2021 16:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbhEGOXn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 7 May 2021 10:23:43 -0400
Received: from sss.pgh.pa.us ([66.207.139.130]:38379 "EHLO sss.pgh.pa.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237632AbhEGOXj (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 7 May 2021 10:23:39 -0400
Received: from sss1.sss.pgh.pa.us (localhost [127.0.0.1])
        by sss.pgh.pa.us (8.15.2/8.15.2) with ESMTP id 147EMMYt034249;
        Fri, 7 May 2021 10:22:22 -0400
From:   Tom Lane <tgl@sss.pgh.pa.us>
To:     Anatoly Pugachev <matorola@gmail.com>
cc:     GCC Compile Farm administrators 
        <cfarm-admins@lists.tetaneutral.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Sparc kernel list <sparclinux@vger.kernel.org>
Subject: Re: [cfarm-admins] gcc202 is occasionally returning EIO from fdatasync(2)
In-reply-to: <33336.1620396305@sss.pgh.pa.us>
References: <520.1620350498@sss.pgh.pa.us> <CADxRZqyzbEo6kiC_DD6y9sFOtVJ4z8Ss+raccv8sy-XXdjzQHw@mail.gmail.com> <33336.1620396305@sss.pgh.pa.us>
Comments: In-reply-to Tom Lane <tgl@sss.pgh.pa.us>
        message dated "Fri, 07 May 2021 10:05:05 -0400"
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34247.1620397342.1@sss.pgh.pa.us>
Date:   Fri, 07 May 2021 10:22:22 -0400
Message-ID: <34248.1620397342@sss.pgh.pa.us>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I wrote:
> Interesting.  In case it helps, I have accurate timestamps for the three
> events we've seen so far:

> 2021-04-22 20:16:43 MSK 
> 2021-05-05 20:25:52 MSK
> 2021-05-07 03:31:39 MSK

Oh, one more thing: that buildfarm instance has been running this
same test case about once a day for a good long time.  We never
saw this type of error before, but now we have two such failures
in its last ten runs.  So it seems pretty clear that the issue
started in mid-April.  If that machine had a kernel update around
then, maybe some suspicion should fall on that.

			regards, tom lane
