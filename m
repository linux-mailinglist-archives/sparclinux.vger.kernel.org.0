Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B00C11DAB1
	for <lists+sparclinux@lfdr.de>; Fri, 13 Dec 2019 01:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbfLMAJd (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 12 Dec 2019 19:09:33 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34107 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731847AbfLMAJb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 12 Dec 2019 19:09:31 -0500
Received: by mail-pj1-f68.google.com with SMTP id j11so355410pjs.1
        for <sparclinux@vger.kernel.org>; Thu, 12 Dec 2019 16:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MM87Orb9mjoqPJJZ7fE6T1iLGpS8nu1v2BHGmFgBN28=;
        b=V4YsKDvxBQsNKupfvhOfCfEI8IiASsLkz5MHqSGEz3X2YFcI6e6Q7YFTivbVaKyxOO
         XMKPJx6pdyCvZYSG2GNcdyOxiR9eoLqkHkJNI3Ko9C0D0iuYjYr4jRPHHvJThVCongTR
         FYE3RB/6pIHEW3Q4HoVKAQ7N3fI1wvf24nA7XA3bqEnCOjqNrVb7JvZotCOTn2VZOy5U
         yKKU2bVfaIEX6Acw/4tNwRBp4mVbT5J4xyGMlZIo7T5GpnsNohkbV/BaIoPnLekeHUj6
         HVmEfHegNn4PzAof1YbxnGeIHHzCC/ikG11wkFr2KRcu06CTsw/QVxQrfolNi9Vqfhky
         J7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MM87Orb9mjoqPJJZ7fE6T1iLGpS8nu1v2BHGmFgBN28=;
        b=ReYZy73MC+XfH6+h2yH9xbb7QjVYxdzNBHYd/xG4zINLyqLgz0ZTjmnC/SMfHW5LjI
         id1chyA3kksmkHg/nIb+oST4clpDdcn56mqlsoE+OHP/vPIOkvyPb0G4cfb2UOwzDnPX
         Os202kB9L21WqUczr/t5yRdN96CrZQ3XS65R7TXKcKArzOT5jj85+oXyMinN5hKM888E
         HslzukUKE+R0MqO98MUpD2CJXoj0JSGsRz06f1m2vFLcCNOdIrcurA9p7m5BN+o/h7xk
         wn0uJ3clrtvDcXHbb8cxPlgZcWqeGrA0ld5ASnvDRMjE9Fm+Qfla2M740hB/hIIA+fD5
         RkOw==
X-Gm-Message-State: APjAAAXJybotVcD926biTGbMO71HFZRGE8nuaE6CsqAA15kuCxmUSDz/
        f1jKqhQa59LBg5zNFc7sncFScQ==
X-Google-Smtp-Source: APXvYqw9osG5+ClV6+xwyklwL7TpqMWpbcYwH/Gy/NWXNMzoUezcaMFROo7bqxHl7IZQepVB1w8N9g==
X-Received: by 2002:a17:902:ba8e:: with SMTP id k14mr12924092pls.335.1576195770978;
        Thu, 12 Dec 2019 16:09:30 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 16:09:30 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Vasiliy Khoruzhick <vasilykh@arista.com>,
        linux-serial@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH 46/58] tty/serial: Migrate sunsab to use has_sysrq
Date:   Fri, 13 Dec 2019 00:06:45 +0000
Message-Id: <20191213000657.931618-47-dima@arista.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
References: <20191213000657.931618-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The SUPPORT_SYSRQ ifdeffery is not nice as:
- May create misunderstanding about sizeof(struct uart_port) between
  different objects
- Prevents moving functions from serial_core.h
- Reduces readability (well, it's ifdeffery - it's hard to follow)

In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
Initialise it in driver's probe and remove ifdeffery.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/tty/serial/sunsab.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sunsab.c b/drivers/tty/serial/sunsab.c
index 72131b5e132e..1eb703c980e0 100644
--- a/drivers/tty/serial/sunsab.c
+++ b/drivers/tty/serial/sunsab.c
@@ -40,10 +40,6 @@
 #include <asm/prom.h>
 #include <asm/setup.h>
 
-#if defined(CONFIG_SERIAL_SUNSAB_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/serial_core.h>
 #include <linux/sunserialcore.h>
 
@@ -985,6 +981,7 @@ static int sunsab_init_one(struct uart_sunsab_port *up,
 
 	up->port.fifosize = SAB82532_XMIT_FIFO_SIZE;
 	up->port.iotype = UPIO_MEM;
+	up->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_SUNSAB_CONSOLE);
 
 	writeb(SAB82532_IPC_IC_ACT_LOW, &up->regs->w.ipc);
 
-- 
2.24.0

