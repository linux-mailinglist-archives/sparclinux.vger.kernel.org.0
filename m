Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42BED19C7D2
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 19:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389042AbgDBRUf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 13:20:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:31870 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388412AbgDBRUf (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 2 Apr 2020 13:20:35 -0400
IronPort-SDR: jzw9WhFO0g60SZ8dMMHnidpotfbd+D960Jik1xfAZgcQ6hyF9KirtUg76KM2Ocq83Go0SUoMVn
 cQyv5Xksa9JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 10:20:30 -0700
IronPort-SDR: 29mEYMr6VwrlWuIUN0xx5ZcnaKLimtEKCOq0h9olxbeuQ7L237tTrLgRt6O2+Zn6fWj0vR+G18
 vh7i5AeFkM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; 
   d="scan'208";a="268089338"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2020 10:20:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 42B74149; Thu,  2 Apr 2020 20:20:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, sparclinux@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anatoly Pugachev <matorola@gmail.com>,
        David Miller <davem@davemloft.net>
Subject: [PATCH v1] serial: sunhv: Initialize lock for non-registered console
Date:   Thu,  2 Apr 2020 20:20:26 +0300
Message-Id: <20200402172026.79478-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The commit a3cb39d258ef
("serial: core: Allow detach and attach serial device for console")
changed a bit logic behind lock initialization since for most of the console
driver it's supposed to have lock already initialized even if console is not
enabled. However, it's not the case for Sparc HV console.

Initialize lock explicitly in the ->probe().

Note, there is still an open question should or shouldn't not this driver
register console properly.

Fixes: a3cb39d258ef ("serial: core: Allow detach and attach serial device for console")
Reported-by: Anatoly Pugachev <matorola@gmail.com>
Cc: David Miller <davem@davemloft.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/sunhv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index eafada8fb6fa..e35073e93a5b 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -567,6 +567,9 @@ static int hv_probe(struct platform_device *op)
 	sunserial_console_match(&sunhv_console, op->dev.of_node,
 				&sunhv_reg, port->line, false);
 
+	/* We need to initialize lock even for non-registered console */
+	spin_lock_init(&port->lock);
+
 	err = uart_add_one_port(&sunhv_reg, port);
 	if (err)
 		goto out_unregister_driver;
-- 
2.25.1

