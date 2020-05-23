Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664A41DFAF7
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbgEWUWn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387843AbgEWUWn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:22:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21BAC061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y18so6811849pfl.9
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B2U8XrjFqctuRiCj+quaPAZnwhPaqSGWLey9BRw2yPU=;
        b=VlnfRGOFUvYuT85HEVOqrW3e4kdXpO+hBqcFGVnumkowGTYPZoPsYdkBy4tMxGuS3o
         xgnqgt8ke+rpXI+QWa+XiciXP7H5toorvxe5tmsq2s1VQiB40xRlBoMaH0BpDzrJCnwn
         /JfaoniK87l/+H+0wIxa5KzQL7yQJGotxawgyeY2ndg2H1TVtkWgpaD+dYijHhMkX11b
         81YcX36Unmp3LruT2mLeYVGTNanse37YPyhe6AYlMjBiq7iXVNBhVuwJwY141zeKHWeJ
         sSor23OTbjk99F5fXkek5DB5xU9p9yhjra2o3y8jsThh3wMLrKHD8eWIMJf4iGa4XdgK
         EzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B2U8XrjFqctuRiCj+quaPAZnwhPaqSGWLey9BRw2yPU=;
        b=gaLNDtgnj63YzgzgSLntmeMuGASv45VWyIrdwAbJ2EH2nkUmB4aCaQDqNnhq7eJHcM
         jcf2c5uoLwQEho7x6ANpPYbKRNNAO846xjY3F8mDgHilD7mkNXg7maLqqCtQOK7kKY7P
         V3N/y+iDNVd6183xzzlZiHz7lS5c5mC+GbwsgoP1T25OQQHAWallIF/YXq6qIesMlp4s
         j93EShCQMYmXXi4F2+Om5yOmsSkVc6srCw9JFOs9/S1fllmrzkqUA7A7Y1mwhyfOVjdG
         UgLdl66sloxcVzXW3KFElF4J2DEbRfkQf4GILvne7OgMNwdw8HOLyDzLwAfmB/FdmJh+
         Ymkw==
X-Gm-Message-State: AOAM532rOvxTebvU8ctPfsXKm4wFMKaSnW0ZFSupXnp5K1ETcFTuB7TM
        m9iUw4LLAsDjWrxJiOTFccI0tiHF
X-Google-Smtp-Source: ABdhPJwbspDL1Nfm/Q9iBTbN+a3V/VsebHwmrBq/pRpI8Ixur5QQVLTCRZA7WgHYnS9DuuxbwEXtxg==
X-Received: by 2002:a62:c145:: with SMTP id i66mr9632321pfg.23.1590265361102;
        Sat, 23 May 2020 13:22:41 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id 62sm9741348pfc.204.2020.05.23.13.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:22:40 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/5] silo: Fix misleading indentation
Date:   Sat, 23 May 2020 13:22:31 -0700
Message-Id: <20200523202233.3063074-3-mattst88@gmail.com>
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
 common/stringops1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/stringops1.c b/common/stringops1.c
index 08ed4be..6edac96 100644
--- a/common/stringops1.c
+++ b/common/stringops1.c
@@ -74,7 +74,7 @@ int strlen(const char *s)
 {
 	const char *sc;
 	for (sc = s; *sc != '\0'; ++sc);
-		return sc - s;
+	return sc - s;
 }
 
 int strncmp(const char *cs, const char *ct, size_t count)
-- 
2.26.2

