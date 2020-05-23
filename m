Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EC41DFAF6
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387922AbgEWUWl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387843AbgEWUWk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:22:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADAFC061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b12so5796070plz.13
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUtNqmlk08u/ECc+cKLG0voSwrR/9TBNyr+TF0/JaqY=;
        b=VoHx0OiH561Cs9S/hJRoKjscoVpVcaszelhYUjcpin12vYQPHBTroksjVX9T35yVMR
         mHc5fnp92kXB24IiUVfkI6BRxdPvF3GEDNxSFPbxU4sffrRqXL3+Ojjw4YtlJ1xVPIz3
         VgmejHref9BL/4vP7LY7t2HS2SwZVPFLvo58gO2bpqQD6oOH0do+2vhBtg2iLItnvpLf
         rXgT5I3c2ZFpOEcMNMONYLk2+FYv12CPKi0laVmJblh/z7x1wJ0trrSIf/opPrX28DDA
         AkbNFDLQJpB3Lr/OOv+MzHn8P4AVd0yOkAHcdqTF5tYr5hy56zNHIbDkC3im5wrNkRNw
         FjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUtNqmlk08u/ECc+cKLG0voSwrR/9TBNyr+TF0/JaqY=;
        b=EEUBeTuhIbIefcisPkS2F8b9ynNeVIVjEEL+W+G7hWrk2+PuVy3ESI5xu3x0+4gRFa
         AYWinXfrbCKrmzImkOCdLJoTqeIvmcAUsZ+v2e133sf8VNocRNT5Rt8vGp8DGZO7mRfr
         3iSCXOpsdNjKhkoUU2YXtVOP0+b7DpMpxpHlBJ6zqT1EB3URkX9ZVS+sJWE0ImJDXxG9
         +sN3RKxGEaYx/5WxmeMIeNYtMjsSpJjGtILuWfpGFjuLjM2VuHExPV1i4s7YZgzQUB+w
         fQy8gakCS9JI+jac6DLPfTxY8PtEyYxKc0BZawg14xGz1IHAUvfdqbRuwxPUPWAoXNaP
         dtkA==
X-Gm-Message-State: AOAM531T9BwNHyzMii7+XJCUKZym2QhgrDoRwpPZ+FpHSjXpYVZgBhmV
        t6nKfuOlAa6w9k6uikFkG69Lv4Yk
X-Google-Smtp-Source: ABdhPJwgufmM6yvSEMMy82GJw+r7YNVlXzk3LiqQRamfppbNQ0tBO9tVkVmrrSfPt+zSKvyS6Uhp4A==
X-Received: by 2002:a17:90b:4390:: with SMTP id in16mr12205691pjb.78.1590265359826;
        Sat, 23 May 2020 13:22:39 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id z190sm9430960pfb.1.2020.05.23.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:22:39 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/5] silo: Build with -U_FORTIFY_SOURCE
Date:   Sat, 23 May 2020 13:22:30 -0700
Message-Id: <20200523202233.3063074-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200523202233.3063074-1-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Otherwise the build will fail:

| ld: decompnet.o: in function `error':
| decomp.c:(.text+0x4dc): undefined reference to `__longjmp_chk'

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Rules.make | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Rules.make b/Rules.make
index 3d0efe7..9739f7a 100644
--- a/Rules.make
+++ b/Rules.make
@@ -19,7 +19,8 @@ cc-option-yn = $(shell if $(CC) $(CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 		> /dev/null 2>&1; then echo "y"; else echo "n"; fi;)
 
 CFLAGS = -Os -Wall -I. -I../include -fomit-frame-pointer \
-	-fno-strict-aliasing -fno-PIC -DSMALL_RELOC=$(SMALL_RELOC) \
+	-fno-strict-aliasing -fno-PIC -U_FORTIFY_SOURCE \
+	-DSMALL_RELOC=$(SMALL_RELOC) \
 	-DLARGE_RELOC=$(LARGE_RELOC)
 HOSTCFLAGS = -O2 -Wall
 
-- 
2.26.2

