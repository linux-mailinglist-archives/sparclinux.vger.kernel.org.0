Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5E32859C8
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 09:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgJGHpC (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 03:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgJGHpA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 03:45:00 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05DEC0613D2;
        Wed,  7 Oct 2020 00:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=sLFvFLWxDaRiExnyyuyxvDCXRwPtTlHG1zCajGi9ISQ=; b=Bukf1VpGQwXcKk1Ome8boxFh5t
        6oNdSdbhfuBwfesri0P94FF2CjEFlRGinfQ+VH0K0I7x32KO7XJBBQbh53jnfFb8Q43rxjc6dJVhk
        GLh3azinAKtyYCAV1WGmSL4cDnKruj+vUQTGeyCzDDeYgoIWIS4MTjCFXhrjeqQ99PG6NlkwBi46z
        Rtwmj1NvODZTwUUy9m6XQXECovdYwmM1GD0PMOq194Qg1JH/pDP4Zq2wXiH+HBoAxONCsoHU16ouv
        F+HG3flvPjRdihr8umRECyvfMHPwdDLVrHk+fCYFpHtvDbQrB/v++f/LcywZjOIM4m9DIIGrYKrKh
        /k48epxQ==;
Received: from [2001:4bb8:184:92a2:f749:31f9:6664:a99d] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQ484-00032x-A7; Wed, 07 Oct 2020 07:44:52 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/3] fbdev/sbuslib: refactor sbusfb_ioctl_helper
Date:   Wed,  7 Oct 2020 09:44:46 +0200
Message-Id: <20201007074447.797968-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007074447.797968-1-hch@lst.de>
References: <20201007074447.797968-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Refactor sbusfb_ioctl_helper into a bunch of self-contained helpers,
to prepare for improvements to the compat ioctl handler.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/video/fbdev/sbuslib.c | 157 ++++++++++++++++------------------
 1 file changed, 75 insertions(+), 82 deletions(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 176dbfb5d3efca..1c3bf1cb8dccd7 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -97,94 +97,87 @@ int sbusfb_mmap_helper(struct sbus_mmap_map *map,
 }
 EXPORT_SYMBOL(sbusfb_mmap_helper);
 
-int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
-			struct fb_info *info,
-			int type, int fb_depth, unsigned long fb_size)
+static int sbufsfb_ioctl_gtype(struct fbtype __user *f, struct fb_info *info,
+		int type, int fb_depth, unsigned long fb_size)
 {
-	switch(cmd) {
-	case FBIOGTYPE: {
-		struct fbtype __user *f = (struct fbtype __user *) arg;
-
-		if (put_user(type, &f->fb_type) ||
-		    put_user(info->var.yres, &f->fb_height) ||
-		    put_user(info->var.xres, &f->fb_width) ||
-		    put_user(fb_depth, &f->fb_depth) ||
-		    put_user(0, &f->fb_cmsize) ||
-		    put_user(fb_size, &f->fb_cmsize))
-			return -EFAULT;
-		return 0;
-	}
-	case FBIOPUTCMAP_SPARC: {
-		struct fbcmap __user *c = (struct fbcmap __user *) arg;
-		struct fb_cmap cmap;
-		u16 red, green, blue;
-		u8 red8, green8, blue8;
-		unsigned char __user *ured;
-		unsigned char __user *ugreen;
-		unsigned char __user *ublue;
-		unsigned int index, count, i;
-
-		if (get_user(index, &c->index) ||
-		    get_user(count, &c->count) ||
-		    get_user(ured, &c->red) ||
-		    get_user(ugreen, &c->green) ||
-		    get_user(ublue, &c->blue))
+	if (put_user(type, &f->fb_type) ||
+	    put_user(info->var.yres, &f->fb_height) ||
+	    put_user(info->var.xres, &f->fb_width) ||
+	    put_user(fb_depth, &f->fb_depth) ||
+	    put_user(fb_size, &f->fb_cmsize))
+		return -EFAULT;
+	return 0;
+}
+
+static int sbusfb_ioctl_putcmap(struct fbcmap *c, struct fb_info *info)
+{
+	u8 red8, green8, blue8;
+	u16 red, green, blue;
+	struct fb_cmap cmap;
+	unsigned int i;
+	int err;
+
+	cmap.len = 1;
+	cmap.red = &red;
+	cmap.green = &green;
+	cmap.blue = &blue;
+	cmap.transp = NULL;
+	for (i = 0; i < c->count; i++) {
+		if (get_user(red8, c->red + i) ||
+		    get_user(green8, c->green + i) ||
+		    get_user(blue8, c->blue + i))
 			return -EFAULT;
 
-		cmap.len = 1;
-		cmap.red = &red;
-		cmap.green = &green;
-		cmap.blue = &blue;
-		cmap.transp = NULL;
-		for (i = 0; i < count; i++) {
-			int err;
-
-			if (get_user(red8, &ured[i]) ||
-			    get_user(green8, &ugreen[i]) ||
-			    get_user(blue8, &ublue[i]))
-				return -EFAULT;
-
-			red = red8 << 8;
-			green = green8 << 8;
-			blue = blue8 << 8;
-
-			cmap.start = index + i;
-			err = fb_set_cmap(&cmap, info);
-			if (err)
-				return err;
-		}
-		return 0;
+		red = red8 << 8;
+		green = green8 << 8;
+		blue = blue8 << 8;
+
+		cmap.start = c->index + i;
+		err = fb_set_cmap(&cmap, info);
+		if (err)
+			return err;
 	}
-	case FBIOGETCMAP_SPARC: {
-		struct fbcmap __user *c = (struct fbcmap __user *) arg;
-		unsigned char __user *ured;
-		unsigned char __user *ugreen;
-		unsigned char __user *ublue;
-		struct fb_cmap *cmap = &info->cmap;
-		unsigned int index, count, i;
-		u8 red, green, blue;
-
-		if (get_user(index, &c->index) ||
-		    get_user(count, &c->count) ||
-		    get_user(ured, &c->red) ||
-		    get_user(ugreen, &c->green) ||
-		    get_user(ublue, &c->blue))
-			return -EFAULT;
+	return 0;
+}
 
-		if (index > cmap->len || count > cmap->len - index)
-			return -EINVAL;
-
-		for (i = 0; i < count; i++) {
-			red = cmap->red[index + i] >> 8;
-			green = cmap->green[index + i] >> 8;
-			blue = cmap->blue[index + i] >> 8;
-			if (put_user(red, &ured[i]) ||
-			    put_user(green, &ugreen[i]) ||
-			    put_user(blue, &ublue[i]))
-				return -EFAULT;
-		}
-		return 0;
+static int sbusfb_ioctl_getcmap(struct fbcmap *c, struct fb_info *info)
+{
+	unsigned int i;
+
+	if (c->index > info->cmap.len || c->count > info->cmap.len - c->index)
+		return -EINVAL;
+
+	for (i = 0; i < c->count; i++) {
+		u8 red = info->cmap.red[c->index + i] >> 8;
+		u8 green = info->cmap.green[c->index + i] >> 8;
+		u8 blue = info->cmap.blue[c->index + i] >> 8;
+
+		if (put_user(red, c->red + i) ||
+		    put_user(green, c->green + i) ||
+		    put_user(blue, c->blue + i))
+			return -EFAULT;
 	}
+	return 0;
+}
+
+int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
+			struct fb_info *info,
+			int type, int fb_depth, unsigned long fb_size)
+{
+	void __user *argp = (void __user *)arg;
+	struct fbcmap kc;
+
+	switch (cmd) {
+	case FBIOGTYPE:
+		return sbufsfb_ioctl_gtype(argp, info, type, fb_depth, fb_size);
+	case FBIOPUTCMAP_SPARC:
+		if (copy_from_user(&kc, argp, sizeof(kc)))
+			return -EFAULT;
+		return sbusfb_ioctl_putcmap(&kc, info);
+	case FBIOGETCMAP_SPARC:
+		if (copy_from_user(&kc, argp, sizeof(kc)))
+			return -EFAULT;
+		return sbusfb_ioctl_getcmap(&kc, info);
 	default:
 		return -EINVAL;
 	}
-- 
2.28.0

