Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24781CBFB2
	for <lists+sparclinux@lfdr.de>; Sat,  9 May 2020 11:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgEIJPQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 9 May 2020 05:15:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4315 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727951AbgEIJPO (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 9 May 2020 05:15:14 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5FE4CD6C5CCEE7F7E696;
        Sat,  9 May 2020 17:15:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 17:15:02 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <davem@davemloft.net>
CC:     <sparclinux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>
Subject: [PATCH -next 1/2] sparc: use snprintf() in show_pciobppath_attr() in pci.c
Date:   Sat, 9 May 2020 17:18:48 +0800
Message-ID: <20200509091849.116954-2-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509091849.116954-1-chenzhou10@huawei.com>
References: <20200509091849.116954-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

snprintf() returns the number of bytes that would be written,
which may be greater than the the actual length to be written.

show_pciobppath_attr() should return the number of bytes printed
into the buffer. This is the return value of scnprintf().

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 arch/sparc/kernel/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 5ed43828e078..a41ad562ed4e 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -593,7 +593,7 @@ show_pciobppath_attr(struct device * dev, struct device_attribute * attr, char *
 	pdev = to_pci_dev(dev);
 	dp = pdev->dev.of_node;
 
-	return snprintf (buf, PAGE_SIZE, "%pOF\n", dp);
+	return scnprintf(buf, PAGE_SIZE, "%pOF\n", dp);
 }
 
 static DEVICE_ATTR(obppath, S_IRUSR | S_IRGRP | S_IROTH, show_pciobppath_attr, NULL);
-- 
2.20.1

