Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B532E1DFAF5
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387911AbgEWUWj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387843AbgEWUWj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:22:39 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED29C061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:39 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x18so4698397pll.6
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tw2SI5eI3GnLPvhS4dMdY5vBReuLJIERj55e1GVD/ZU=;
        b=H9GiuJDSJ5p7OypWtLUfHRIv0CqYf34U8qZPBsJ+5nkzWYOREbsoJPqUx4TAUoFj56
         0/f6B4FCibQuZJ6lAIj/GqcYMqUzAh3H1PSanOtGKEaPKsuHHw9kUGxOe4PYV4gRGtNR
         EiaE9SXqAMN4MY2dJGqwvjIfKUtOsrqsMLCJG2TgP1G941/MVylfcXKICkZu9ZfmWMHL
         7tL4Sbqa3cs08a0vGovuXHaZjiyEy/wBKv7Hm/SZyf0Vada9PkHlJ40ZzSHf8BCwE6Jf
         ncvu0uU+1uPzTL7YoAsrQN+vl8dn1wilPtVPQQz2EWotJpdTAc2TV70jhnVPQLUxtsIy
         bOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tw2SI5eI3GnLPvhS4dMdY5vBReuLJIERj55e1GVD/ZU=;
        b=PsDdd4dP1bhSEntb4c3mP1FrPmzsXreQKHc30NSO9QnVKY6duUhHBjMTKZXksu/B7O
         jOtCO6euyP5Al0qDqx5f7+l3rILKIjM1zQS75Z3Tg6V4Lm7ppaGxfm6sI0KGT51gA8+S
         GdnnVhbaAL82RI89joVcLr/gB8b6KugqcVQEtp2G2eMhfSKJ/eLAtIX4dvOeCoo/VDIB
         NvCqGJ29rMe1iNd1y8wzUHkXt+DtRtG8Zn96fSAJQOH1p+3a/yL4VsCLvp9CckgVxHze
         SdVY2nWwKrLCbOhlo459AwriRlj+viKCAg9E4lkGNFMOzvbjLmpwT/oQBGmpTZD8hqq/
         2EXA==
X-Gm-Message-State: AOAM531n7pa2Hi6EoAA5PN9hTbz7Q1gRVrODFMBsR1NbzsF6NnJxhDkb
        PxAHmXg3gKASJ7G1Yl310YS1bm/C
X-Google-Smtp-Source: ABdhPJySUZS5O/gJ1TYlQi4yctNNaAxm16PfNfq2NtR2rM9ksHF2tR9xV5v5ikK1egpxGV7BCsB1Zg==
X-Received: by 2002:a17:902:8b88:: with SMTP id ay8mr21059469plb.235.1590265358348;
        Sat, 23 May 2020 13:22:38 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id h17sm9791483pfr.25.2020.05.23.13.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:22:37 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/5] silo: Build with -fno-PIC to reduce size
Date:   Sat, 23 May 2020 13:22:29 -0700
Message-Id: <20200523202233.3063074-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Otherwise the resulting image will be too large:

| ./util second.map second.aout second2.aout second.b second.b2
| Distance between two changes larger than 63K 3 84553 0

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 0f176db..3d0efe7 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,7 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.26.2

