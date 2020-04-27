Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A6B1BA47D
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 15:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgD0NVO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 09:21:14 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57514 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727040AbgD0NVN (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 09:21:13 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id DF6824AAED82E4CD3C08;
        Mon, 27 Apr 2020 21:21:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Apr 2020 21:21:01 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <sparclinux@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next v2] tty: vcc: Fix error return code in vcc_probe()
Date:   Mon, 27 Apr 2020 13:22:20 +0000
Message-ID: <20200427132220.22028-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427122415.47416-1-weiyongjun1@huawei.com>
References: <20200427122415.47416-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: fix module name in subject
---
 drivers/tty/vcc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index d2a1e1228c82..9ffd42e333b8 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -605,6 +605,7 @@ static int vcc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	port->index = vcc_table_add(port);
 	if (port->index == -1) {
 		pr_err("VCC: no more TTY indices left for allocation\n");
+		rv = -ENOMEM;
 		goto free_ldc;
 	}



