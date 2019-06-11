Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 715AD3D130
	for <lists+sparclinux@lfdr.de>; Tue, 11 Jun 2019 17:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391456AbfFKPoE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 11 Jun 2019 11:44:04 -0400
Received: from outpost18.zedat.fu-berlin.de ([130.133.4.111]:56813 "EHLO
        outpost18.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391766AbfFKPoE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Tue, 11 Jun 2019 11:44:04 -0400
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jun 2019 11:44:03 EDT
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
          by outpost.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1hairR-003KEN-Lk>; Tue, 11 Jun 2019 17:38:57 +0200
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
          by relay1.zedat.fu-berlin.de (Exim 4.85)
          with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1hairR-002N80-JI>; Tue, 11 Jun 2019 17:38:57 +0200
Received: by suse-laptop.physik.fu-berlin.de (Postfix, from userid 1000)
        id 5E7A9761B92; Tue, 11 Jun 2019 17:38:54 +0200 (CEST)
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     sparclinux@vger.kernel.org
Cc:     debian-sparc@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH] sunhv: Fix device naming inconsistency between sunhv_console and sunhv_reg
Date:   Tue, 11 Jun 2019 17:38:37 +0200
Message-Id: <20190611153836.18950-1-glaubitz@physik.fu-berlin.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: 160.45.32.140
X-ZEDAT-Hint: RV
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

In d5a2aa24, the name in struct console sunhv_console was changed from "ttyS"
to "ttyHV" while the name in struct uart_ops sunhv_pops remained unchanged.

This results in the hypervisor console device to be listed as "ttyHV0" under
/proc/consoles while the device node is still named "ttyS0":

root@osaka:~# cat /proc/consoles
ttyHV0               -W- (EC p  )    4:64
tty0                 -WU (E     )    4:1
root@osaka:~# readlink /sys/dev/char/4:64
../../devices/root/f02836f0/f0285690/tty/ttyS0
root@osaka:~#

This means that any userland code which tries to determine the name of the
device file of the hypervisor console device can not rely on the information
provided by /proc/consoles. In particular, booting current versions of debian-
installer inside a SPARC LDOM will fail with the installer unable to determine
the console device.

After renaming the device in struct uart_ops sunhv_pops to "ttyHV" as well,
the inconsistency is fixed and it is possible again to determine the name
of the device file of the hypervisor console device by reading the contents
of /proc/console:

root@osaka:~# cat /proc/consoles
ttyHV0               -W- (EC p  )    4:64
tty0                 -WU (E     )    4:1
root@osaka:~# readlink /sys/dev/char/4:64
../../devices/root/f02836f0/f0285690/tty/ttyHV0
root@osaka:~#

With this change, debian-installer works correctly when installing inside
a SPARC LDOM.

Signed-off-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 drivers/tty/serial/sunhv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index 63e34d868de8..f8503f8fc44e 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -397,7 +397,7 @@ static const struct uart_ops sunhv_pops = {
 static struct uart_driver sunhv_reg = {
 	.owner			= THIS_MODULE,
 	.driver_name		= "sunhv",
-	.dev_name		= "ttyS",
+	.dev_name		= "ttyHV",
 	.major			= TTY_MAJOR,
 };
 
-- 
2.21.0

