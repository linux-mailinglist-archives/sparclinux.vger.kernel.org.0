Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719A6225558
	for <lists+sparclinux@lfdr.de>; Mon, 20 Jul 2020 03:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGTBV4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 19 Jul 2020 21:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgGTBVz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 19 Jul 2020 21:21:55 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A97C0619D2;
        Sun, 19 Jul 2020 18:21:55 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jxKV5-00GF4A-6v; Mon, 20 Jul 2020 01:21:51 +0000
Date:   Mon, 20 Jul 2020 02:21:51 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Miller <davem@davemloft.net>
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sparc32: fix a user-triggerable oops in clear_user()
Message-ID: <20200720012151.GM2786714@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Back in 2.1.29 the clear_user() guts (__bzero()) had been merged
with memset().  Unfortunately, while all exception handlers had been
copied, one of the exception table entries got lost.  As the result,
clear_user() starting at 128*n bytes before the end of page and
spanning between 8 and 127 bytes into the next page would oops when
the second page is unmapped.  It's trivial to reproduce - all
it takes is

main()
{
	int fd = open("/dev/zero", O_RDONLY);
	char *p = mmap(NULL, 16384, PROT_READ|PROT_WRITE,
			MAP_PRIVATE|MAP_ANON, -1, 0);
	munmap(p + 8192, 8192);
	read(fd, p + 8192 - 128, 192);
}

which had been oopsing since March 1997.  Says something about
the quality of test coverage... ;-/  And while today sparc32 port
is nearly dead, back in '97 it had been very much alive; in fact,
sparc64 had only been in mainline for 3 months by that point...

Cc: stable@kernel.org
Fixes: v2.1.29
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/sparc/lib/memset.S b/arch/sparc/lib/memset.S
index b89d42b29e34..f427f34b8b79 100644
--- a/arch/sparc/lib/memset.S
+++ b/arch/sparc/lib/memset.S
@@ -142,6 +142,7 @@ __bzero:
 	ZERO_LAST_BLOCKS(%o0, 0x48, %g2)
 	ZERO_LAST_BLOCKS(%o0, 0x08, %g2)
 13:
+	EXT(12b, 13b, 21f)
 	be	8f
 	 andcc	%o1, 4, %g0
 
