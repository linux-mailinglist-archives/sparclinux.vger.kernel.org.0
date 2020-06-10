Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1291F4FB2
	for <lists+sparclinux@lfdr.de>; Wed, 10 Jun 2020 09:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgFJHza (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 Jun 2020 03:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJHza (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 Jun 2020 03:55:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6453C03E96B
        for <sparclinux@vger.kernel.org>; Wed, 10 Jun 2020 00:55:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j198so4009769wmj.0
        for <sparclinux@vger.kernel.org>; Wed, 10 Jun 2020 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=EnIrIGj03Y4Bw7tljoWmg+qr0vZ8tq42skzZqInftnc=;
        b=jwy2W0tb37SqP+WwCJTfsgps4wsHjgbA1/9/PhiM1buumDf/rLO0m3mEcOlp6aStgk
         m6E5PDh3ObL/D5EmvOP9cLJNkMeQY4RTyYpBSY4BJmFquRZxnWK52rzPA2OlpCDuqVLx
         MZY8EVyUH8aW8Ppn8g7xR+PzwdGolsyOU4rgt8F9WREHAXxgHB6JScKugxpfEhmMjgJe
         cJaTaavF4oCH+CCiNtSLD+4UE0PRchlbHNwtTS7T9poiKReJs396mn9TWqu4wo8oCYpT
         OuqUGWMW0a0PmYzn/7xD4otdO3qu95HUaOExLZ9l94fmXM87Un1VXq5pcwk2qgvMjvB2
         c6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EnIrIGj03Y4Bw7tljoWmg+qr0vZ8tq42skzZqInftnc=;
        b=Z8vM626sjt9Lv+65NCa153kxnz72lUpZ2IWV7tvmGGUL8SSP78JdrzN5hrzxfWrmuj
         hA3li6LPYob4Ve91B/X9ZmtqXL4KEfXA45tcgwe9q6wbpxiTUIdjGbW2DjfSPqkmAmUT
         TIH9fu9GBoj7xeIUmU1ORDTNfNwU1qjrzlhAzgXea4poAXdAXx3SSQC2xnJkkJJhvt8Y
         WG8NH2vTMJUFsfMUqIFCLKmqhGfMdhiI2DZQjZ0Ix46cplHoNXoxhD3vEBXrZqomQqNb
         IXjQvi+9dkTaM3fpnzuqUwEod+AU4WTrnFgggLwMVvCD/zi9PFmz6ZC3pSK8hDELAYmz
         0l1w==
X-Gm-Message-State: AOAM533zokWVSt9pkF5V+HWtkzLqXnFQpXZgL6KO0HAmpTg1xban1WxJ
        rQ5n/OoN/zw6Wmvj7Vw950liTw==
X-Google-Smtp-Source: ABdhPJzT49tgR9+60rfN4830eLLMnTGAHQQvKlJEI8DFusTTWcDAw3O1Rr7NzXEWdzQdZL/5s+h6KA==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr1841091wmj.35.1591775728269;
        Wed, 10 Jun 2020 00:55:28 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k14sm6849615wrq.97.2020.06.10.00.55.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 00:55:27 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] sparc: piggyback: handle invalid image
Date:   Wed, 10 Jun 2020 07:55:19 +0000
Message-Id: <1591775719-28390-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

With an old elftoaout, the generation of tftpboot.img fail with "lseek:
invalid argument".
This is due to offset being negative.

Instead of printing this error message, let's print a better one.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/sparc/boot/piggyback.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/sparc/boot/piggyback.c b/arch/sparc/boot/piggyback.c
index a7a38fb4ece0..613e23a1016e 100644
--- a/arch/sparc/boot/piggyback.c
+++ b/arch/sparc/boot/piggyback.c
@@ -154,6 +154,10 @@ static off_t get_hdrs_offset(int kernelfd, const char *filename)
 		offset -= LOOKBACK;
 		/* skip a.out header */
 		offset += AOUT_TEXT_OFFSET;
+		if (offset < 0) {
+			errno = -EINVAL;
+			die("Calculated a negative offset, probably elftoaout generated an invalid image. Did you use a recent elftoaout ?");
+		}
 		if (lseek(kernelfd, offset, SEEK_SET) < 0)
 			die("lseek");
 		if (read(kernelfd, buffer, BUFSIZE) != BUFSIZE)
-- 
2.26.2

