Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930EC1A1641
	for <lists+sparclinux@lfdr.de>; Tue,  7 Apr 2020 21:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgDGTzZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 7 Apr 2020 15:55:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgDGTzY (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 7 Apr 2020 15:55:24 -0400
Subject: Re: [GIT] Sparc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586289324;
        bh=7YL7XPotzRGCWzzchqO5OTCahGneC+7ehXGVZsikb0Q=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=YegKSEKXGKQDH/ANtEDy3qOcj6a9EQ/Ht5XTidZzD+cBFeakk1KA5lDo2Wt4zs3SO
         z76MlW92rSMbwh+HBmnPU1lxFtNqpjYg5vMSL1cWxiaup45YTgEQS7yFcqDGEWe7Rn
         suA7tJfqTUwEGVmqAYQHBBE2QRniRRGwqD24fWYU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200406.112528.895031681027517472.davem@davemloft.net>
References: <20200406.112528.895031681027517472.davem@davemloft.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200406.112528.895031681027517472.davem@davemloft.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
 refs/heads/master
X-PR-Tracked-Commit-Id: 255a69a94b8cbbcfef142137b5e7f99b5d168771
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12782fbe0f77dcc36c48de8b0ab36d336620a3e7
Message-Id: <158628932413.3792.18059030227180244818.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Apr 2020 19:55:24 +0000
To:     David Miller <davem@davemloft.net>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The pull request you sent on Mon, 06 Apr 2020 11:25:28 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git refs/heads/master

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12782fbe0f77dcc36c48de8b0ab36d336620a3e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
