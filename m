Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81F31BA381
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 14:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgD0MXG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 08:23:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3353 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726260AbgD0MXG (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 08:23:06 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BBD5E509380F9F68EA05;
        Mon, 27 Apr 2020 20:23:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Apr 2020 20:22:55 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <sparclinux@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] sparc64: vcc: Fix error return code in vcc_probe()
Date:   Mon, 27 Apr 2020 12:24:15 +0000
Message-ID: <20200427122415.47416-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
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



