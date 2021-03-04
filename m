Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942A432CE0A
	for <lists+sparclinux@lfdr.de>; Thu,  4 Mar 2021 09:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhCDIEN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 4 Mar 2021 03:04:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:39772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235363AbhCDIEA (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 4 Mar 2021 03:04:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9240264F02;
        Thu,  4 Mar 2021 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614845000;
        bh=hZALMAtKZJewpwnIUiDR9f4db5AlyUVH++NCN8asZyw=;
        h=Subject:To:From:Date:From;
        b=uFgNifYieJkhC0HY34NAW3c5uTL97Ilap7yrADQwOOMwajhAH1IvDVZKE4AZ+jOtY
         Q1xpBLrG7agPV5NcI1wUtYBxRZz54gIp1SmqgtH7e35C1LgCFOxYHQJBI3rYOF9F/C
         6o7OWrxIdR23Z/UsexoPXzeoLJT9QbceIPNGcqD8=
Subject: patch "tty: vcc, drop version dump" added to tty-next
To:     jslaby@suse.cz, davem@davemloft.net, gregkh@linuxfoundation.org,
        sparclinux@vger.kernel.org
From:   <gregkh@linuxfoundation.org>
Date:   Thu, 04 Mar 2021 09:02:14 +0100
Message-ID: <1614844934106250@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    tty: vcc, drop version dump

to my tty git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
in the tty-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From 43b849968559a1671fb313e271b0176d741d3a4c Mon Sep 17 00:00:00 2001
From: Jiri Slaby <jslaby@suse.cz>
Date: Tue, 2 Mar 2021 07:21:56 +0100
Subject: tty: vcc, drop version dump

The version number is artificial, no need to dump it to logs during
initialization.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: <sparclinux@vger.kernel.org>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Link: https://lore.kernel.org/r/20210302062214.29627-26-jslaby@suse.cz
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/vcc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index 50bf9011a0c4..31b8a9a77375 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -14,16 +14,9 @@
 #include <asm/vio.h>
 #include <asm/ldc.h>
 
-#define DRV_MODULE_NAME		"vcc"
-#define DRV_MODULE_VERSION	"1.1"
-#define DRV_MODULE_RELDATE	"July 1, 2017"
-
-static char version[] =
-	DRV_MODULE_NAME ".c:v" DRV_MODULE_VERSION " (" DRV_MODULE_RELDATE ")";
-
 MODULE_DESCRIPTION("Sun LDOM virtual console concentrator driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(DRV_MODULE_VERSION);
+MODULE_VERSION("1.1");
 
 struct vcc_port {
 	struct vio_driver_state vio;
@@ -1066,8 +1059,6 @@ static int vcc_tty_init(void)
 {
 	int rv;
 
-	pr_info("VCC: %s\n", version);
-
 	vcc_tty_driver = tty_alloc_driver(VCC_MAX_PORTS, VCC_TTY_FLAGS);
 	if (IS_ERR(vcc_tty_driver)) {
 		pr_err("VCC: TTY driver alloc failed\n");
-- 
2.30.1


