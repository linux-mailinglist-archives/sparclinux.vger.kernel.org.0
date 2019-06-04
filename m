Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9D2341FF
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 10:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfFDIif (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 04:38:35 -0400
Received: from condef-08.nifty.com ([202.248.20.73]:57206 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfFDIif (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 04:38:35 -0400
X-Greylist: delayed 668 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 04:38:34 EDT
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-08.nifty.com with ESMTP id x548NYoJ016751
        for <sparclinux@vger.kernel.org>; Tue, 4 Jun 2019 17:23:34 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x548NH4T009152;
        Tue, 4 Jun 2019 17:23:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x548NH4T009152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559636597;
        bh=M6kP2JJWJN6+Cw/8ivHLeDg4B72lgCfdxWOW3CJx+Ec=;
        h=From:To:Cc:Subject:Date:From;
        b=1Id8E9BGmf6HHkYRz3wNnDpcyQfhlIkWKVGRcxhuWdKgJ3h1PWA+WMgqrV8ZrN33Y
         n1vZ+7cmz2azh/weNi9+rqV3wNIcC6qvkA9C145NnjaiDH+seKsQtu6ye0v3+rUv4i
         DLLP6LQjBFBH0L29NMx6paXxphYn5G6+eMKbK+jLl4wZdl0xQlNTFBEnz4KVflaCPP
         2HHKKXP7dcFnXxXkr/nxytCn1E2qNHV3uS8TyWlRK0rWD/pDfkOorjdgdqWw12kt1k
         +jtZB9GsbROuw1WD1j551BEiksHAJPECO+wfzciLFxls7UGyYwczybEe9shPyE5syU
         WS/HJpdbU1cpQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] sparc: fix unknown type name u_int in uapi header
Date:   Tue,  4 Jun 2019 17:23:14 +0900
Message-Id: <20190604082314.25939-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

'u_int' is a shorthand that is only available in the kernel space
because it is defined in include/linux/types.h, which is not exported
to the user space.

You cannot use it in uapi headers even if you include <linux/types.h>

Detected by compile-testing exported headers.

./usr/include/asm/openpromio.h:16:2: error: unknown type name ‘u_int’
  u_int oprom_size;  /* Actual size of the oprom_array. */
  ^~~~~

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/sparc/include/uapi/asm/openpromio.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sparc/include/uapi/asm/openpromio.h b/arch/sparc/include/uapi/asm/openpromio.h
index 8817f7d1a70c..d4494b679e99 100644
--- a/arch/sparc/include/uapi/asm/openpromio.h
+++ b/arch/sparc/include/uapi/asm/openpromio.h
@@ -4,7 +4,6 @@
 
 #include <linux/compiler.h>
 #include <linux/ioctl.h>
-#include <linux/types.h>
 
 /*
  * SunOS and Solaris /dev/openprom definitions. The ioctl values
@@ -13,7 +12,7 @@
 
 struct openpromio
 {
-	u_int	oprom_size;		/* Actual size of the oprom_array. */
+	unsigned int oprom_size;	/* Actual size of the oprom_array. */
 	char	oprom_array[1];		/* Holds property names and values. */
 };
 
-- 
2.17.1

