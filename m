Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DC1DB460
	for <lists+sparclinux@lfdr.de>; Thu, 17 Oct 2019 19:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441149AbfJQRrr (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 17 Oct 2019 13:47:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55734 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440986AbfJQRqz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 17 Oct 2019 13:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lil/5cEkB/ZCAm17l4nkkVLk0wR2AVyhy52WWrhy+jc=; b=e5TYkKb8TKQ86VtxMAAfZrxnEY
        1nR4wimv7MGtJvO4QB0YRtOroc5lWUfUuZI/jZiSFbpZJNUmCZo7BAYfsjWHDD1+prVxSZzVI9j0g
        HsG4aRrYVneNgrpTfwQAm2Jctu/9WcZRWPlSreHabW3XWDDHJ+4p2w5WB07zEjTbUMSYlVCtbcTEY
        ypZt4aF3qCkfKmRhWjHLPFWQIWBAoDtdgJwr7nRsRkonYg4zQdQ1rqM0FyqYfsivPIcn9dlWDA4tz
        GTNviHBXFUr46oqTZLeigDImm07yETspiLBM3qTJq6XTbiYhPnEescdIyM1SQjyGM4hf9pj4kghDu
        YukJuOnQ==;
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iL9rD-0006BL-8t; Thu, 17 Oct 2019 17:46:39 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
Cc:     linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-mtd@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/21] nios2: remove __iounmap
Date:   Thu, 17 Oct 2019 19:45:48 +0200
Message-Id: <20191017174554.29840-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017174554.29840-1-hch@lst.de>
References: <20191017174554.29840-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

No need to indirect iounmap for nios2.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nios2/include/asm/io.h | 7 +------
 arch/nios2/mm/ioremap.c     | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/nios2/include/asm/io.h b/arch/nios2/include/asm/io.h
index d108937c321e..746853ac7d8d 100644
--- a/arch/nios2/include/asm/io.h
+++ b/arch/nios2/include/asm/io.h
@@ -26,12 +26,7 @@
 #define writel_relaxed(x, addr)	writel(x, addr)
 
 void __iomem *ioremap(unsigned long physaddr, unsigned long size);
-extern void __iounmap(void __iomem *addr);
-
-static inline void iounmap(void __iomem *addr)
-{
-	__iounmap(addr);
-}
+void iounmap(void __iomem *addr);
 
 /* Pages to physical address... */
 #define page_to_phys(page)	virt_to_phys(page_to_virt(page))
diff --git a/arch/nios2/mm/ioremap.c b/arch/nios2/mm/ioremap.c
index 7a1a27f3daa3..b56af759dcdf 100644
--- a/arch/nios2/mm/ioremap.c
+++ b/arch/nios2/mm/ioremap.c
@@ -157,11 +157,11 @@ void __iomem *ioremap(unsigned long phys_addr, unsigned long size)
 EXPORT_SYMBOL(ioremap);
 
 /*
- * __iounmap unmaps nearly everything, so be careful
+ * iounmap unmaps nearly everything, so be careful
  * it doesn't free currently pointer/page tables anymore but it
  * wasn't used anyway and might be added later.
  */
-void __iounmap(void __iomem *addr)
+void iounmap(void __iomem *addr)
 {
 	struct vm_struct *p;
 
@@ -173,4 +173,4 @@ void __iounmap(void __iomem *addr)
 		pr_err("iounmap: bad address %p\n", addr);
 	kfree(p);
 }
-EXPORT_SYMBOL(__iounmap);
+EXPORT_SYMBOL(iounmap);
-- 
2.20.1

