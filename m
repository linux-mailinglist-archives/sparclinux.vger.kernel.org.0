Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2242859C4
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 09:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgJGHo7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 03:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgJGHo7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 03:44:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE9BC061755;
        Wed,  7 Oct 2020 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=nUzdg6EBOFs75IzxYvaApbQqq9LEbN8BYuBqFspH8s0=; b=pYS6blYPm/Z3/sce8eRQdBW5t5
        zjS+6jYeuToHLG9mzJ04LmwegGvPXS+5vVur8IlGqpP7yUcdbM8UiDIQsK85JVUrrNUgX8+msHwxs
        N2+jnu8ojljX2VGLK3z+CyRNAYdpoMJzcnOgr/H7uEvO/TiS0O+LAVNVKGTZyI/8mHa1mOt/mR+1V
        2yI/0dZIxahwvFqIDruzgBIdSUwgj8mqGrsoBIp8ZN9WQF4y7zDTHkPePb+rEa4sgKi/jTIU5sDlJ
        6yqGLwy2dP/72gbKU4QQIhyvJk/eq5lJ2TcZGcZ75XY92EcGu/4rU0PDdug86mBBvGtkTYMN0gqHf
        2IdSB32g==;
Received: from [2001:4bb8:184:92a2:f749:31f9:6664:a99d] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQ485-000330-L3; Wed, 07 Oct 2020 07:44:53 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 3/3] fbdev/sbuslib: avoid compat_alloc_user_space in fbiogetputcmap
Date:   Wed,  7 Oct 2020 09:44:47 +0200
Message-Id: <20201007074447.797968-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007074447.797968-1-hch@lst.de>
References: <20201007074447.797968-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Rewrite fbiogetputcmap to call the low-level sbusfb_ioctl_{put,get}cmap
helpers directly and thus avoid usage of the deprecated
compat_alloc_user_space API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/video/fbdev/sbuslib.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 1c3bf1cb8dccd7..ef74e3e6326a06 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -188,23 +188,23 @@ EXPORT_SYMBOL(sbusfb_ioctl_helper);
 static int fbiogetputcmap(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	struct fbcmap32 __user *argp = (void __user *)arg;
-	struct fbcmap __user *p = compat_alloc_user_space(sizeof(*p));
+	struct fbcmap kc;
 	u32 addr;
 	int ret;
 
-	ret = copy_in_user(p, argp, 2 * sizeof(int));
+	ret = get_user(kc.index, &argp->index);
+	ret |= get_user(kc.count, &argp->count);
 	ret |= get_user(addr, &argp->red);
-	ret |= put_user(compat_ptr(addr), &p->red);
+	kc.red = compat_ptr(addr);
 	ret |= get_user(addr, &argp->green);
-	ret |= put_user(compat_ptr(addr), &p->green);
+	kc.green = compat_ptr(addr);
 	ret |= get_user(addr, &argp->blue);
-	ret |= put_user(compat_ptr(addr), &p->blue);
+	kc.blue = compat_ptr(addr);
 	if (ret)
 		return -EFAULT;
-	return info->fbops->fb_ioctl(info,
-			(cmd == FBIOPUTCMAP32) ?
-			FBIOPUTCMAP_SPARC : FBIOGETCMAP_SPARC,
-			(unsigned long)p);
+	if (cmd == FBIOPUTCMAP32)
+		return sbusfb_ioctl_putcmap(&kc, info);
+	return sbusfb_ioctl_getcmap(&kc, info);
 }
 
 int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
-- 
2.28.0

