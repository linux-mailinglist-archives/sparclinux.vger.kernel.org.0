Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D331DFAF8
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbgEWUWn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387944AbgEWUWn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:22:43 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BADBC061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:43 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q9so6563428pjm.2
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8W3rZD3iLZ87bib5DmU6eWHqdhTxNr4xESmTGvY1Ebc=;
        b=RB6rddcMx8J18/H9slBZoFYCayoh3EoOq8H4aQYPhibTcWdP8SL4nJQ361b18mTLku
         KV+N0Ln1teIV0MeXy4UvNX4PYqn+Z51Rr452sAtmUPZWok/qB1odza1PMpW8rdKlJfzV
         SFtmIqARYjgNQW2XUx2aWB/n2N/aFQ/RVZ8kjWwmosYnRJlcLYneHKX8wcOBY77SDhxV
         An8lchEpg/y6exQXo4+wgTYV0vdHAMSpbx3eCtzfqh8VrzHI8S6/NwHudI9JqKsjsLgq
         LDZ/rgQyCterSxUyUnsDGU2yBRvHUHkPutXrFcKR+dydnGd4Jz1QpQmawAx+M+YpILZe
         pJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8W3rZD3iLZ87bib5DmU6eWHqdhTxNr4xESmTGvY1Ebc=;
        b=Zk3/p7vjl9Xedz3KNe3hASm+qySYiFdVCe+sSNl8PYL3HBvvg78Y7Jr2NFCgc2SH2H
         f7MEsjh9BG/fRz4h846YtixcCad3HEh+WvaKKiUjclnEY2uFdp4ECxi5P/aBqi/wgw2r
         MDA0SU7xAafY+sS80jkmMex+GbhrpTALKnZFiGRVwyFOg2kACvDCSgYVx2NYcW3ffN65
         IiJaWc955XzHEdUFTUmK3owhTSljCIykbJGjv4oTx/Sw3X47jKuzH6fDfKKeSaOIrB8H
         WStMT4j53Nr/ShZeYJ00wHp7j72BcssvDDNXeSywfQ5NOjO9QOC5MYRyMyyb0RDWTFzG
         MnlA==
X-Gm-Message-State: AOAM531rlXZNiG6+6CvzAZL5DcyQ9d8WVyt1N8fIVVXffwzn2tNdK6Nv
        R+WLEPssY7Xagx3ePHLCTM4lXOUg
X-Google-Smtp-Source: ABdhPJwGwOFWd00mCVMp7v5zjcirB7kH7OBEQFOz+CTvADvDrNjFvsFyZK5Mx/Ktw0sUODgScxvpRQ==
X-Received: by 2002:a17:902:209:: with SMTP id 9mr20364357plc.22.1590265362483;
        Sat, 23 May 2020 13:22:42 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id e13sm9906653pfm.103.2020.05.23.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:22:41 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/5] second: Fix typo'd operator
Date:   Sat, 23 May 2020 13:22:32 -0700
Message-Id: <20200523202233.3063074-4-mattst88@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200523202233.3063074-1-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 second/disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/second/disk.c b/second/disk.c
index 40234b3..b81a465 100644
--- a/second/disk.c
+++ b/second/disk.c
@@ -293,7 +293,7 @@ int silo_disk_read(char *buff, int size, unsigned long long offset)
 	if (!net) {
 	    if (prom_vers != PROM_P1275) {
 		    if (((romvec->pv_printrev >> 16) < 2 || 
-		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev && 0xffff) < 6)) 
+		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev & 0xffff) < 6))
 		        && offset >= 0x40000000) {
 		    	printf ("Buggy old PROMs don't allow reading past 1GB from start of the disk. Send complaints to SMCC\n");
 	    		return -1;
-- 
2.26.2

