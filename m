Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254311DFAF9
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgEWUWp (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387944AbgEWUWo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:22:44 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC37AC061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:44 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id m7so5809765plt.5
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7kbmzc62FdKgleHB8qkvf+DZh30Ajr8aPl0hM+OJO0=;
        b=qHDzOAc0ZTbvopBaWmQGGx26oTDHcvSBevisU1UOx0sWN8JEOLPBhZsGjPoKC+EPem
         UgUkmkVsFj0rAh6syhHB7aut3Pr7tkF572mbWlePZEebhvc+eyNJjXbiDDig9nK446BU
         qPNc4BwlWC0ZLCDbl6+hbizXAgRotHpAPOGbnJm6+m/ps105fOsPtX+CDrgm100cvLaP
         uxo4cCt4UqYsSvN2z5xYr7t6MlkSk0b7H8HK+P8Nlmb+y27gSrGpXsJYKONGw7GEO+r4
         SD3VUEndRTHRPYmgjYAngyKjWXPtd+xcDGh74JIlo3RztTpGipOm2sT4CnpHl+Bgnl0+
         So+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7kbmzc62FdKgleHB8qkvf+DZh30Ajr8aPl0hM+OJO0=;
        b=uWGZfn0lHlpe5MqxhG2MCpPwWKpyZo5zWfuYehVozSzc4E91pcL0h9inKJlk1eFNkh
         fYimN378PabKzh4kKZKhIo+WU1EbaBeppRO9R9K6yu4oICOB+CSSxCHB5WwPirzS7ze+
         j2JVVkbDjgQNCG0k57R+LFX3Sj7nUotvh9DYG64FWI1vvpF3djrznc2JbWyo0Vu9nMeI
         PHqlFduuoYYTRvZmeISNerpKNDueGBNUfwN1rYX0HZhk+y7LNtB9lYdvZK3Blkt8Vz0E
         YG0QPF1zyHEEmiOesM/J6xeP62EhjxwfnfhhWqO69gEj9g62I8UiK6OOcmhBt/jCvFrl
         IAnw==
X-Gm-Message-State: AOAM533YNVvCWKqx/1f6Vxzrw9IByA9rBkeum4VbRxtqmpZUCIal6by3
        7H9M0EwyKWSQzUGfkdWfbfSt4TL5
X-Google-Smtp-Source: ABdhPJx3jcsv832s78miT1kr+A1HP5hNW+/xHNZb3f9YLybmwh84MP/Jw3zWUt0amDyRvcpQEqDZ5Q==
X-Received: by 2002:a17:902:bf47:: with SMTP id u7mr20665057pls.159.1590265363897;
        Sat, 23 May 2020 13:22:43 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id t25sm8871966pgo.7.2020.05.23.13.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:22:43 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH 5/5] second/util: Remove unused shadowed variables
Date:   Sat, 23 May 2020 13:22:33 -0700
Message-Id: <20200523202233.3063074-5-mattst88@gmail.com>
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
 second/util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/second/util.c b/second/util.c
index 3346823..3469c34 100644
--- a/second/util.c
+++ b/second/util.c
@@ -120,8 +120,6 @@ int main(int argc, char **argv)
     int end, rodata_start, rodata_end;
     int net = 0;
     int i = 1;
-    char sym[256];
-    unsigned int addr;
 
     if (!strcmp (argv[i], "-a")) {
 	net = 1;
-- 
2.26.2

