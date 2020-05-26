Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3CC1E28E3
	for <lists+sparclinux@lfdr.de>; Tue, 26 May 2020 19:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgEZRdL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 26 May 2020 13:33:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgEZRdL (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 26 May 2020 13:33:11 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 639882053B;
        Tue, 26 May 2020 17:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590514390;
        bh=bI6GdF98fJuEzoeytv2sqzH0yItjG18LUOH4e7TFC5A=;
        h=From:To:Cc:Subject:Date:From;
        b=OxxMhn44dt85KH+OH95/+1jcbow83b4bf/bOYeidBRMp6VhFbko5W907xRkGn8rLW
         HK9VJRFD+gL7BqhuSnMkDnMPtns7WqEuxpvtin43cAl4ewLc45WIYLXNMFNSh32knE
         7l7aYThwmv332okouIHGSNV9HFEfMKP24Zk0YyLU=
From:   Will Deacon <will@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "David S . Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Rapoport <rppt@kernel.org>, kernel-team@android.com
Subject: [PATCH 0/3] sparc32 SRMMU fixes for SMP
Date:   Tue, 26 May 2020 18:32:59 +0100
Message-Id: <20200526173302.377-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi folks,

Enabling SMP for sparc32 uncovered some issues in the SRMMU page-table
allocation code. One of these was introduced by me, but the other two
seem to have been there a while and are probably just exposed more
easily by my recent changes.

Tested on QEMU. I'm assuming these will go via David's tree.

Cheers,

Will

--->8

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: kernel-team@android.com

Will Deacon (3):
  sparc32: mm: Don't try to free page-table pages if ctor() fails
  sparc32: mm: Disable SPLIT_PTLOCK_CPUS
  sparc32: mm: Only call ctor()/dtor() functions for first and last user

 arch/sparc/mm/srmmu.c | 15 +++++++++++----
 mm/Kconfig            |  4 ++++
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.27.0.rc0.183.gde8f92d652-goog

