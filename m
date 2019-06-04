Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4695B35264
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 23:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfFDV55 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 17:57:57 -0400
Received: from emh02.mail.saunalahti.fi ([62.142.5.108]:59676 "EHLO
        emh02.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfFDV55 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 17:57:57 -0400
X-Greylist: delayed 555 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 17:57:56 EDT
Received: from localhost.localdomain (85-76-64-161-nat.elisa-mobile.fi [85.76.64.161])
        by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 95CC5200E8;
        Wed,  5 Jun 2019 00:48:40 +0300 (EEST)
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH silo] tilo: fix rootfs size check
Date:   Wed,  5 Jun 2019 00:47:48 +0300
Message-Id: <20190604214748.25377-1-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.17.0
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

When checking the rootfs size we use the kernel image size instead of the
rootfs image. Fix that.

Fixes: 9f151df0eecf ("tilo: sanity check image sizes")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 tilo/maketilo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tilo/maketilo.c b/tilo/maketilo.c
index e698c92..2292bfd 100644
--- a/tilo/maketilo.c
+++ b/tilo/maketilo.c
@@ -244,8 +244,8 @@ int main (int argc, char **argv)
 	root_image_start = sun4u_kernel_start + len;
 	
 	if (root_image) {
-		check_size (root_image, root_image_start - output_buffer, len,
-			    MAX_BOOT_LEN);
+		check_size (root_image, root_image_start - output_buffer,
+			    rootlen, MAX_BOOT_LEN);
 		fread (root_image_start, 1, rootlen, g);
 		fclose (g);
 	}
-- 
2.17.0

