Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A201CBFB0
	for <lists+sparclinux@lfdr.de>; Sat,  9 May 2020 11:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgEIJPQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 9 May 2020 05:15:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52820 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbgEIJPP (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 9 May 2020 05:15:15 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2FCA7C76B01BEB517820;
        Sat,  9 May 2020 17:15:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 17:15:03 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <davem@davemloft.net>
CC:     <sparclinux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>
Subject: [PATCH -next 2/2] sparc: use snprintf() in show_pciobppath_attr() in vio.c
Date:   Sat, 9 May 2020 17:18:49 +0800
Message-ID: <20200509091849.116954-3-chenzhou10@huawei.com>
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
 arch/sparc/kernel/vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
index c7cad9b7bba7..4f57056ed463 100644
--- a/arch/sparc/kernel/vio.c
+++ b/arch/sparc/kernel/vio.c
@@ -193,7 +193,7 @@ show_pciobppath_attr(struct device *dev, struct device_attribute *attr,
 	vdev = to_vio_dev(dev);
 	dp = vdev->dp;
 
-	return snprintf (buf, PAGE_SIZE, "%pOF\n", dp);
+	return scnprintf(buf, PAGE_SIZE, "%pOF\n", dp);
 }
 
 static DEVICE_ATTR(obppath, S_IRUSR | S_IRGRP | S_IROTH,
-- 
2.20.1

