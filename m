Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6261E94D8
	for <lists+sparclinux@lfdr.de>; Sun, 31 May 2020 03:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgEaBET (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 30 May 2020 21:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgEaBET (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 30 May 2020 21:04:19 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FCFC03E969;
        Sat, 30 May 2020 18:04:19 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jfCOc-000ge8-Rx; Sun, 31 May 2020 01:04:14 +0000
Date:   Sun, 31 May 2020 02:04:14 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Miller <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [git pull] a couple of sparc ptrace fixes
Message-ID: <20200531010414.GW23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-davem

for you to fetch changes up to cf51e129b96847f969bfb8af1ee1516a01a70b39:

  sparc32: fix register window handling in genregs32_[gs]et() (2020-05-20 13:29:37 -0400)

----------------------------------------------------------------
Al Viro (2):
      sparc64: fix misuses of access_process_vm() in genregs32_[sg]et()
      sparc32: fix register window handling in genregs32_[gs]et()

 arch/sparc/kernel/ptrace_32.c | 228 ++++++++++++++++++------------------------
 arch/sparc/kernel/ptrace_64.c |  17 +---
 2 files changed, 101 insertions(+), 144 deletions(-)
