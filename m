Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1F87E4D69
	for <lists+sparclinux@lfdr.de>; Wed,  8 Nov 2023 00:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344664AbjKGX3g (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 7 Nov 2023 18:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344776AbjKGX3H (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 7 Nov 2023 18:29:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FEA46BA;
        Tue,  7 Nov 2023 15:25:45 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D3C433C9;
        Tue,  7 Nov 2023 23:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699399544;
        bh=FnVrPf1NR5NSUBGn+h7N8/gXSWbEaMLpj5X67A2Ywxw=;
        h=From:To:Cc:Subject:Date:From;
        b=BkzVUXvr9H/9bsbHcshxHF5S2LaLX2prSPOq/9SoZJyjR+uyELhcYKTxP8PTan1i9
         awBISt0DJ+3/gv5SJkIr0oFE6BVwVs/PTGM3C+Z3oG63QlfUgYrYw1VD7tzCM77YBz
         Q3ZPzW400pwFMj9BE4QluYXiLqJ6PeWYqOIoKx3eaYkeQPxQhdp4DAfvSIF/7Htds9
         Wdp7ZqlsMcX5+Xtqkoih0LSs/MJoAc5bvUBZwmuLu5gLd6IybA6Pt+Y8GxAmDMnRVh
         aR+9oFn8cwqRTtTb7M+4hBX6rDOlIH2KGXRTINYQfQwUKEku5u/2AoGEPsurC4zxDj
         XKNnXGNqz0nDQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yi Yang <yiyang13@huawei.com>, Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, davem@davemloft.net,
        sparclinux@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 1/2] tty: vcc: Add check for kstrdup() in vcc_probe()
Date:   Tue,  7 Nov 2023 18:25:40 -0500
Message-ID: <20231107232541.3777102-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.328
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Yi Yang <yiyang13@huawei.com>

[ Upstream commit d81ffb87aaa75f842cd7aa57091810353755b3e6 ]

Add check for the return value of kstrdup() and return the error, if it
fails in order to avoid NULL pointer dereference.

Signed-off-by: Yi Yang <yiyang13@huawei.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
Link: https://lore.kernel.org/r/20230904035220.48164-1-yiyang13@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/vcc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index 4e795353192bc..67f528cf1056d 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -594,18 +594,22 @@ static int vcc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		return -ENOMEM;
 
 	name = kstrdup(dev_name(&vdev->dev), GFP_KERNEL);
+	if (!name) {
+		rv = -ENOMEM;
+		goto free_port;
+	}
 
 	rv = vio_driver_init(&port->vio, vdev, VDEV_CONSOLE_CON, vcc_versions,
 			     ARRAY_SIZE(vcc_versions), NULL, name);
 	if (rv)
-		goto free_port;
+		goto free_name;
 
 	port->vio.debug = vcc_dbg_vio;
 	vcc_ldc_cfg.debug = vcc_dbg_ldc;
 
 	rv = vio_ldc_alloc(&port->vio, &vcc_ldc_cfg, port);
 	if (rv)
-		goto free_port;
+		goto free_name;
 
 	spin_lock_init(&port->lock);
 
@@ -639,6 +643,11 @@ static int vcc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		goto unreg_tty;
 	}
 	port->domain = kstrdup(domain, GFP_KERNEL);
+	if (!port->domain) {
+		rv = -ENOMEM;
+		goto unreg_tty;
+	}
+
 
 	mdesc_release(hp);
 
@@ -673,8 +682,9 @@ static int vcc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	vcc_table_remove(port->index);
 free_ldc:
 	vio_ldc_free(&port->vio);
-free_port:
+free_name:
 	kfree(name);
+free_port:
 	kfree(port);
 
 	return rv;
-- 
2.42.0

