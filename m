Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9997714BA
	for <lists+sparclinux@lfdr.de>; Sun,  6 Aug 2023 14:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjHFMJl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 6 Aug 2023 08:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHFMJk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 6 Aug 2023 08:09:40 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259E218F;
        Sun,  6 Aug 2023 05:09:31 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B69311F750;
        Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1691323769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N7IKY9hnnQyoLKQh0f9lTV2sjo40MkOr/lhxzEGm/2s=;
        b=PQtMJO0YZaTm44KCcHEkminDbZQHhD45feDwgZrq5BdooYIr8fh+8XJLmWFwTO258Vc59T
        kwcfGArEPtmoOg9Z8lNBPm7EV3/bM1VZTK7JklVgoGn60+uecuYaRcDL+SONFibvE1Nw6D
        UOtb8KQCsbDqNsU+drN4C6c2kFwhBhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1691323769;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N7IKY9hnnQyoLKQh0f9lTV2sjo40MkOr/lhxzEGm/2s=;
        b=ujNySunVLwHFZYC3DXlPyTBaQFBCY8rb6wdi+lDG2omVacFggzQVz+AWg8f60IknZ8Plx4
        Axy1YgvTfCaGn3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CC32139C4;
        Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kLdoHXmNz2QvSwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:29 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, sam@ravnborg.org, javierm@redhat.com,
        davem@davemloft.net
Cc:     sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/11] fbdev/bw2: Use initializer macro for struct fb_ops
Date:   Sun,  6 Aug 2023 13:58:55 +0200
Message-ID: <20230806120926.5368-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806120926.5368-1-tzimmermann@suse.de>
References: <20230806120926.5368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,SPF_PASS,T_SPF_HELO_TEMPERROR
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Initialize struct fb_ops to the correct default values with the
macro FB_DEFAULT_SBUS_OPS(). Rename the ioctl and mmap callbacks
to use the infix _sbusfb_. This makes them fit the SBUS helpers'
naming pattern. Also make the driver depend on FB_SBUS_HELPERS,
which selects the correct modules.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig |  4 +---
 drivers/video/fbdev/bw2.c   | 17 +++++------------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index fd5bd284c0f8..7e4710defc32 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -527,9 +527,7 @@ config FB_SBUS_HELPERS
 config FB_BW2
 	bool "BWtwo support"
 	depends on (FB = y) && (SPARC && FB_SBUS)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the BWtwo frame buffer.
 
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index de34f1f333e2..eaab51be74f8 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -31,8 +31,8 @@
 
 static int bw2_blank(int, struct fb_info *);
 
-static int bw2_mmap(struct fb_info *, struct vm_area_struct *);
-static int bw2_ioctl(struct fb_info *, unsigned int, unsigned long);
+static int bw2_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int bw2_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
 
 /*
  *  Frame buffer operations
@@ -40,15 +40,8 @@ static int bw2_ioctl(struct fb_info *, unsigned int, unsigned long);
 
 static const struct fb_ops bw2_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(bw2),
 	.fb_blank		= bw2_blank,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= bw2_mmap,
-	.fb_ioctl		= bw2_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 /* OBio addresses for the bwtwo registers */
@@ -161,7 +154,7 @@ static struct sbus_mmap_map bw2_mmap_map[] = {
 	{ .size = 0 }
 };
 
-static int bw2_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int bw2_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct bw2_par *par = (struct bw2_par *)info->par;
 
@@ -171,7 +164,7 @@ static int bw2_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  vma);
 }
 
-static int bw2_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int bw2_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	return sbusfb_ioctl_helper(cmd, arg, info,
 				   FBTYPE_SUN2BW, 1, info->fix.smem_len);
-- 
2.41.0

