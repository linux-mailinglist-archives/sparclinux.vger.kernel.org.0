Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DA7618F47
	for <lists+sparclinux@lfdr.de>; Fri,  4 Nov 2022 04:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKDDxB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 3 Nov 2022 23:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiKDDxA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 3 Nov 2022 23:53:00 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEB917598
        for <sparclinux@vger.kernel.org>; Thu,  3 Nov 2022 20:52:58 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N3RSy2JKSzpWB7;
        Fri,  4 Nov 2022 11:49:22 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 11:52:57 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 11:52:56 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <sparclinux@vger.kernel.org>
CC:     <davem@davemloft.net>, <yangyingliang@huawei.com>
Subject: [PATCH v2 2/2] sparc64/of: fix possible memory leak in scan_one_device()
Date:   Fri, 4 Nov 2022 11:51:45 +0800
Message-ID: <20221104035145.1147754-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104035145.1147754-1-yangyingliang@huawei.com>
References: <20221104035145.1147754-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
bus_id string array"), the name of device is allocated dynamically,
it need be freed when of_device_register() fails, call put_device()
to give up the reference that hold in device_initialize(), so that
it can be freed in kobject_cleanup() when the refcount hit to 0.
And add op_dev_release() to free platform device.

Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
Cc: "David S. Miller" <davem@davemloft.net>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 arch/sparc/kernel/of_device_64.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/of_device_64.c b/arch/sparc/kernel/of_device_64.c
index 5a9f86b1d4e7..7496c8af12a6 100644
--- a/arch/sparc/kernel/of_device_64.c
+++ b/arch/sparc/kernel/of_device_64.c
@@ -239,6 +239,11 @@ static struct of_bus *of_match_bus(struct device_node *np)
 	return NULL;
 }
 
+static void op_dev_release(struct device *dev)
+{
+	kfree(to_platform_device(dev));
+}
+
 static int __init build_one_resource(struct device_node *parent,
 				     struct of_bus *bus,
 				     struct of_bus *pbus,
@@ -677,10 +682,11 @@ static struct platform_device * __init scan_one_device(struct device_node *dp,
 		dev_set_name(&op->dev, "%08x", dp->phandle);
 	op->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 	op->dev.dma_mask = &op->dev.coherent_dma_mask;
+	op->dev.release = op_dev_release;
 
 	if (of_device_register(op)) {
 		printk("%pOF: Could not register of device.\n", dp);
-		kfree(op);
+		put_device(&op->dev);
 		op = NULL;
 	}
 
-- 
2.25.1

