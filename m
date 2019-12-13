Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7A711DAD8
	for <lists+sparclinux@lfdr.de>; Fri, 13 Dec 2019 01:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731496AbfLMAK1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 12 Dec 2019 19:10:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37683 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbfLMAJ2 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 12 Dec 2019 19:09:28 -0500
Received: by mail-pl1-f194.google.com with SMTP id c23so392823plz.4
        for <sparclinux@vger.kernel.org>; Thu, 12 Dec 2019 16:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5WLqTQP9VT3Wj9H/IDghikmP99MJJRtTWNwh4knJ1g=;
        b=P8Xa9IyOFvUhnq1qV0qnqNFEDzFCnyBVvEhf15NcXH/cTRxIvFsnDeJh431tEL7Bho
         vdUjPUjtRf7DXpmoLJ4OgEeMus6y8d+uGvBU3rBIastCi+YaDl7eBBH1PPp+J8z/8v1b
         OAK7+gFw8kV3SQdJZu0ik5pf6c4aVoyS+z5NAOJ0ENZ7s40qEPP7yAuuSHjBLl9qHISY
         pzuxIWw/vGVhkuP91JKD4QoZjBzpnqxee8Xfx92EgK55JdIiTx0rg3wcqTMThvBtjYJs
         d/3tWF946bZdAjgsjrIflpPX6sGopVBo1A3BGFh0K4Sdr/Z+A6g0ZWtd4/unAg8p8CnU
         TBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5WLqTQP9VT3Wj9H/IDghikmP99MJJRtTWNwh4knJ1g=;
        b=Wg9vOg1efzsWLiNCHNGw9YJ/1chpVEVD4wrf8WaqsEjB4RDXivWU65REApiXl5KA+G
         Y9SNRVJFgPaHhhpJKtvrLvHdhipKc8jR8YEwst8CpdoTNjcDXXMVUg0P//q/xrmFLrKA
         17EWUbfdbaZ/AEHK2m4s9WP79EcvkTL8fVGulGH3xaQj1bbnw8YNFfgRTJe98ijQ7WVO
         fWhSh7VcjwTVNDZuhcmgVTNHz9aFYlGSrbPyKVlbyil8VTWCa9Iaaw2SKbRNgyzSifqC
         PMfcW9LOYz0MaUigr6uKEi79P1BM4yzh4szpsH4C9z/R6HwFeDhSAixq/XQ2SxZsYRAk
         Ykbg==
X-Gm-Message-State: APjAAAX/TZhb9Fjoois2I1sw4Vpn51m4BWc0OJx1TDzQqHHSGriKcDch
        hrJCTZVaLvL2IxDjKdfeBZo/+g==
X-Google-Smtp-Source: APXvYqy3wIN8nnc/UL9s/cxQrhBLjGU7KJitO7vCE6oaWq78Eq4QrQYcUGPCAaWotsrH9/5FfOuNkg==
X-Received: by 2002:a17:902:6b45:: with SMTP id g5mr12477341plt.159.1576195767792;
        Thu, 12 Dec 2019 16:09:27 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 16:09:27 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Vasiliy Khoruzhick <vasilykh@arista.com>,
        linux-serial@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH 45/58] tty/serial: Migrate sunhv to use has_sysrq
Date:   Fri, 13 Dec 2019 00:06:44 +0000
Message-Id: <20191213000657.931618-46-dima@arista.com>
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
 drivers/tty/serial/sunhv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index f8503f8fc44e..eafada8fb6fa 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -25,10 +25,6 @@
 #include <asm/irq.h>
 #include <asm/setup.h>
 
-#if defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/serial_core.h>
 #include <linux/sunserialcore.h>
 
@@ -552,6 +548,7 @@ static int hv_probe(struct platform_device *op)
 
 	sunhv_port = port;
 
+	port->has_sysrq = 1;
 	port->line = 0;
 	port->ops = &sunhv_pops;
 	port->type = PORT_SUNHV;
-- 
2.24.0

