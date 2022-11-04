Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22319619624
	for <lists+sparclinux@lfdr.de>; Fri,  4 Nov 2022 13:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbiKDMWJ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 4 Nov 2022 08:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbiKDMWI (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 4 Nov 2022 08:22:08 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4762D1DD
        for <sparclinux@vger.kernel.org>; Fri,  4 Nov 2022 05:22:06 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N3fn75pD5zJnTy;
        Fri,  4 Nov 2022 20:19:07 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 20:22:03 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 20:22:03 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <davem@davemloft.net>, <tglx@linutronix.de>
CC:     <sparclinux@vger.kernel.org>
Subject: [PATCH] sparc: Fix possible memleak in of_set_property
Date:   Fri, 4 Nov 2022 20:27:08 +0800
Message-ID: <20221104122708.15488-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

If we do not find the target property, this part of memory
that allocated to new_val is not referenced by anyone. It
can not be freed after of_set_property() returns, then it
will be leaked. We fix the problem by freeing it when not
found the target name of the property.

Fixes: dfa76060be85 ("sparc: Create common area for OF device layer code.")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 arch/sparc/kernel/prom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/kernel/prom_common.c b/arch/sparc/kernel/prom_common.c
index c9ec70888a39..c127a815db5e 100644
--- a/arch/sparc/kernel/prom_common.c
+++ b/arch/sparc/kernel/prom_common.c
@@ -91,6 +91,9 @@ int of_set_property(struct device_node *dp, const char *name, void *val, int len
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	mutex_unlock(&of_set_property_mutex);
 
+	if (err)
+		kfree(new_val);
+
 	/* XXX Upate procfs if necessary... */
 
 	return err;
-- 
2.25.1

