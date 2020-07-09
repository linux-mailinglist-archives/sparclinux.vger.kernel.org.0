Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF7321A7CD
	for <lists+sparclinux@lfdr.de>; Thu,  9 Jul 2020 21:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgGITaj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 9 Jul 2020 15:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGITaj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 9 Jul 2020 15:30:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A60C08C5CE
        for <sparclinux@vger.kernel.org>; Thu,  9 Jul 2020 12:30:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f5so3706025ljj.10
        for <sparclinux@vger.kernel.org>; Thu, 09 Jul 2020 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jq4E/3rvV7KMO7dnkDeaICQG0J18bgcJJkGEr8cliCQ=;
        b=nUPBsopJi4SQMI1HOnfAi03AqeWpHc982j5ijzne1TK6J9vIRsfZN6uXs5pUoI6KKs
         H4p2jFGTksvLw6PH/l3Lsux03jz+rykq8ktkFTZAL6UAVx8xSvgErpImqcamD1wu4XGz
         qGWIFYbKRxw9HBbuHjZVgyMWV6DYufSwtOStjHerqoIzId+Xo8SK5IGps4JCBZPvO0VC
         S6W92i+IdBxnX8R5vFj8LzA5X0EkQWPl3rVOsKEbtNxFiTDjW96i4DEjehrkXtb7SpAI
         hHJaem0VmRjhhdGMLtcTKIn59MEo6VsCja2kPwsLoEgxCWmb9WDf9OkKA0heaQS2CFmk
         pRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Jq4E/3rvV7KMO7dnkDeaICQG0J18bgcJJkGEr8cliCQ=;
        b=WnCb/9oxS6GSSXqjc9un5TDGZwp5H8ryfiEtEmVIyJCz9DhsNGpPhEVdKYntizzBnk
         X4xLcRM5+4QLBBm7GY/eQ3xUoB/jViHefq8k0QLpr+tBw9u92xQwqnAwWzrhypFQ+UJ0
         5lTyGnDsuoeilSWTsN82S6SWMbHlX0SPZ8dhUms6R7dwHFJ/ErJ9QOwtF5WOnwYKMRoE
         sbMIPGViKi6sa0R9nJZi353zQQPEcPKxTc7ViFWppGGRkz8ImvKoEZ0/B7ptyb6UJhR1
         QV566PDUqr0067SKzUnuY7ff3tm/lqql36Em0AVYk+Zu1kj9VmuZi80wP4odkV0LUz8M
         6klw==
X-Gm-Message-State: AOAM532GlQVDAuAA6TsMPt7CfULSuYZmmnIQv461Ld6TTCQx56XP5Y+P
        TPujDf1f3Z/Y8/wTvSGl91GDQFw4GlA=
X-Google-Smtp-Source: ABdhPJwu68v/orHpVsAMsxR03Yip4FCqvb0vHr1in/xp8Df72HTrHOY0JidOMSr+sJoY8WZ291/kiw==
X-Received: by 2002:a2e:730c:: with SMTP id o12mr31664193ljc.165.1594323037518;
        Thu, 09 Jul 2020 12:30:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:69d0:5d3c:ff19:c08c])
        by smtp.gmail.com with ESMTPSA id q3sm791771ljm.22.2020.07.09.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:30:36 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Date:   Thu,  9 Jul 2020 21:30:16 +0200
Message-Id: <20200709193016.291267-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Mark reported that sparc64 would panic while booting using qemu.
Mark bisected this to a patch that introduced generic fbdev emulation to
the bochs DRM driver.
Mark pointed out that a similar bug was fixed before where
the sys helpers was replaced by cfb helpers.

The culprint here is that the framebuffer reside in IO memory which
requires SPARC ASI_PHYS (physical) loads and stores.

The current bohcs DRM driver uses a shadow buffer.
So all copying to the framebuffer happens in
drm_fb_helper_dirty_blit_real().

The fix is to replace the memcpy with memcpy_toio() from io.h.

memcpy_toio() uses writeb() where the original fbdev code
used sbus_memcpy_toio(). The latter uses sbus_writeb().

The difference between writeb() and sbus_memcpy_toio() is
that writeb() writes bytes in little-endian, where sbus_writeb() writes
bytes in big-endian. As endian does not matter for byte writes they are
the same. So we can safely use memcpy_toio() here.

For many architectures memcpy_toio() is a simple memcpy().
One sideeffect that is unknow is if this has any impact on other
architectures.
So far the analysis tells that this change is OK for other arch's.
but testing would be good.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5609e164805f..4d05b0ab1592 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	unsigned int y;
 
 	for (y = clip->y1; y < clip->y2; y++) {
-		memcpy(dst, src, len);
+		memcpy_toio(dst, src, len);
 		src += fb->pitches[0];
 		dst += fb->pitches[0];
 	}
-- 
2.25.1

