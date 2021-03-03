Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E7532C464
	for <lists+sparclinux@lfdr.de>; Thu,  4 Mar 2021 01:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354710AbhCDANi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 3 Mar 2021 19:13:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:42488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234121AbhCCTTh (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 3 Mar 2021 14:19:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78297601FB;
        Wed,  3 Mar 2021 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614799137;
        bh=O13zCMi/s5Xj2cgHel+ofxeGAn/y71wFQlbm6Txbxhg=;
        h=Subject:To:From:Date:From;
        b=QT3Mjtbp1IGYHZprafUi/cUIzSS1ZcOJa7j2P300iaFxsxq1jObNXUHYi3tp0+6eL
         2bEs+Ho0ZU4jPEPd+ursaaYD+i2zwDWxH4oR9xehI42SsCce9T85xUQfMAbcjagzm9
         7yp589jzuLNQIbJoGqYs58R814/mwIClM/khaOXc=
Subject: patch "tty: vcc, drop version dump" added to tty-testing
To:     jslaby@suse.cz, davem@davemloft.net, gregkh@linuxfoundation.org,
        sparclinux@vger.kernel.org
From:   <gregkh@linuxfoundation.org>
Date:   Wed, 03 Mar 2021 20:17:55 +0100
Message-ID: <16147990751818@kroah.com>
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
in the tty-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the tty-next branch sometime soon,
after it passes testing, and the merge window is open.

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


