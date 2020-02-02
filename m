Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F0F14FCBA
	for <lists+sparclinux@lfdr.de>; Sun,  2 Feb 2020 11:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgBBK6A (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 2 Feb 2020 05:58:00 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:52116 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgBBK6A (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 2 Feb 2020 05:58:00 -0500
Received: from localhost (dhcp-077-249-119-090.chello.nl [77.249.119.90])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6F48615A069CE;
        Sun,  2 Feb 2020 02:57:59 -0800 (PST)
Date:   Sun, 02 Feb 2020 11:57:57 +0100 (CET)
Message-Id: <20200202.115757.1806399388803712136.davem@davemloft.net>
To:     torvalds@linux-foundation.org
CC:     akpm@linux-foundation.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [GIT] Sparc
From:   David Miller <davem@davemloft.net>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 02 Feb 2020 02:58:00 -0800 (PST)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


Please pull to get this adjtimex regression fix from Arnd.

Thank you!

The following changes since commit 94f2630b18975bb56eee5d1a36371db967643479:

  Merge tag '5.6-rc-small-smb3-fix-for-stable' of git://git.samba.org/sfrench/cifs-2.6 (2020-02-01 11:22:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git 

for you to fetch changes up to 11648b8339f840d4b1f4c54a1abec8025d9e077d:

  sparc64: fix adjtimex regression (2020-02-02 11:54:41 +0100)

----------------------------------------------------------------
Arnd Bergmann (1):
      sparc64: fix adjtimex regression

 arch/sparc/kernel/sys_sparc_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
