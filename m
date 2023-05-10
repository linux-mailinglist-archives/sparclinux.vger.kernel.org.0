Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B04FF6FDC3F
	for <lists+sparclinux@lfdr.de>; Wed, 10 May 2023 13:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbjEJLGk (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 10 May 2023 07:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbjEJLGN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 10 May 2023 07:06:13 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661273C1D;
        Wed, 10 May 2023 04:06:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C81E92196E;
        Wed, 10 May 2023 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683716767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L3Z0W/8h/vzm79+MFZ3S+00cayEi6igqIR5fXFpBq98=;
        b=vxnH5X2epzw0GEgW2Th0zcikyNVDCDZcF3b/xv9HeWxPIxhMwJf4VdvdYJbJ8Bkm6HyGy8
        HQwveyIcjQrLx44KyFMVEtSBBF/YteRQNWlceBiEa3tW+WhWsKJx25bwtF8qP6KxAViYY/
        vvu3/e4dW4GcvCRiTuETY2l7q7LZyyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683716767;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L3Z0W/8h/vzm79+MFZ3S+00cayEi6igqIR5fXFpBq98=;
        b=cXtsAI3CYi2pf0bI1FxwhR3TfdPo1UFimMrnyArtt15PCOV5ipZGEHLHa6wCd6YaXvlmny
        NffQ8x297/5H2gBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67E9F138F0;
        Wed, 10 May 2023 11:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0LKMGJ96W2QfRAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 10 May 2023 11:06:07 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
        daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, davem@davemloft.net,
        James.Bottomley@HansenPartnership.com, arnd@arndb.de,
        sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Date:   Wed, 10 May 2023 13:05:56 +0200
Message-Id: <20230510110557.14343-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510110557.14343-1-tzimmermann@suse.de>
References: <20230510110557.14343-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
in the architecture's <asm/fb.h> header file or the generic one.

The common case has been the use of regular I/O functions, such as
__raw_readb() or memset_io(). A few architectures used plain system-
memory reads and writes. Sparc used helpers for its SBus.

The architectures that used special cases provide the same code in
their __raw_*() I/O helpers. So the patch replaces this code with the
__raw_*() functions and moves it to <asm-generic/fb.h> for all
architectures.

v6:
	* fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robot)
v5:
	* include <linux/io.h> in <asm-generic/fb>; fix s390 build
v4:
	* ia64, loongarch, sparc64: add fb_mem*() to arch headers
	  to keep current semantics (Arnd)
v3:
	* implement all architectures with generic helpers
	* support reordering and native byte order (Geert, Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

add mips fb_q()
---
 arch/ia64/include/asm/fb.h      |  20 +++++++
 arch/loongarch/include/asm/fb.h |  21 +++++++
 arch/mips/include/asm/fb.h      |  22 +++++++
 arch/sparc/include/asm/fb.h     |  20 +++++++
 include/asm-generic/fb.h        | 102 ++++++++++++++++++++++++++++++++
 include/linux/fb.h              |  53 -----------------
 6 files changed, 185 insertions(+), 53 deletions(-)

diff --git a/arch/ia64/include/asm/fb.h b/arch/ia64/include/asm/fb.h
index 0208f64a0da0..bcf982043a5c 100644
--- a/arch/ia64/include/asm/fb.h
+++ b/arch/ia64/include/asm/fb.h
@@ -2,7 +2,9 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
 #include <linux/efi.h>
+#include <linux/string.h>
 
 #include <asm/page.h>
 
@@ -18,6 +20,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 }
 #define fb_pgprotect fb_pgprotect
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
index ff82f20685c8..c6fc7ef374a4 100644
--- a/arch/loongarch/include/asm/fb.h
+++ b/arch/loongarch/include/asm/fb.h
@@ -5,6 +5,27 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
+#include <linux/string.h>
+
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/mips/include/asm/fb.h b/arch/mips/include/asm/fb.h
index 6bda0a81d8ca..18b7226403ba 100644
--- a/arch/mips/include/asm/fb.h
+++ b/arch/mips/include/asm/fb.h
@@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 }
 #define fb_pgprotect fb_pgprotect
 
+/*
+ * MIPS doesn't define __raw_ I/O macros, so the helpers
+ * in <asm-generic/fb.h> don't generate fb_readq() and
+ * fb_write(). We have to provide them here.
+ *
+ * TODO: Convert MIPS to generic I/O. The helpers below can
+ *       then be removed.
+ */
+#ifdef CONFIG_64BIT
+static inline u64 fb_readq(const volatile void __iomem *addr)
+{
+	return __raw_readq(addr);
+}
+#define fb_readq fb_readq
+
+static inline void fb_writeq(u64 b, volatile void __iomem *addr)
+{
+	__raw_writeq(b, addr);
+}
+#define fb_writeq fb_writeq
+#endif
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 689ee5c60054..077da91aeba1 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
 
+#include <linux/io.h>
+
 struct fb_info;
 struct file;
 struct vm_area_struct;
@@ -16,6 +18,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 int fb_is_primary_device(struct fb_info *info);
 #define fb_is_primary_device fb_is_primary_device
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	sbus_memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	sbus_memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	sbus_memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _SPARC_FB_H_ */
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index c8af99f5a535..0540eccdbeca 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -7,6 +7,7 @@
  * Only include this header file from your architecture's <asm/fb.h>.
  */
 
+#include <linux/io.h>
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
 
@@ -30,4 +31,105 @@ static inline int fb_is_primary_device(struct fb_info *info)
 }
 #endif
 
+/*
+ * I/O helpers for the framebuffer. Prefer these functions over their
+ * regular counterparts. The regular I/O functions provide in-order
+ * access and swap bytes to/from little-endian ordering. Neither is
+ * required for framebuffers. Instead, the helpers read and write
+ * raw framebuffer data. Independent operations can be reordered for
+ * improved performance.
+ */
+
+#ifndef fb_readb
+static inline u8 fb_readb(const volatile void __iomem *addr)
+{
+	return __raw_readb(addr);
+}
+#define fb_readb fb_readb
+#endif
+
+#ifndef fb_readw
+static inline u16 fb_readw(const volatile void __iomem *addr)
+{
+	return __raw_readw(addr);
+}
+#define fb_readw fb_readw
+#endif
+
+#ifndef fb_readl
+static inline u32 fb_readl(const volatile void __iomem *addr)
+{
+	return __raw_readl(addr);
+}
+#define fb_readl fb_readl
+#endif
+
+#ifndef fb_readq
+#if defined(__raw_readq)
+static inline u64 fb_readq(const volatile void __iomem *addr)
+{
+	return __raw_readq(addr);
+}
+#define fb_readq fb_readq
+#endif
+#endif
+
+#ifndef fb_writeb
+static inline void fb_writeb(u8 b, volatile void __iomem *addr)
+{
+	__raw_writeb(b, addr);
+}
+#define fb_writeb fb_writeb
+#endif
+
+#ifndef fb_writew
+static inline void fb_writew(u16 b, volatile void __iomem *addr)
+{
+	__raw_writew(b, addr);
+}
+#define fb_writew fb_writew
+#endif
+
+#ifndef fb_writel
+static inline void fb_writel(u32 b, volatile void __iomem *addr)
+{
+	__raw_writel(b, addr);
+}
+#define fb_writel fb_writel
+#endif
+
+#ifndef fb_writeq
+#if defined(__raw_writeq)
+static inline void fb_writeq(u64 b, volatile void __iomem *addr)
+{
+	__raw_writeq(b, addr);
+}
+#define fb_writeq fb_writeq
+#endif
+#endif
+
+#ifndef fb_memcpy_fromfb
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+#endif
+
+#ifndef fb_memcpy_tofb
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+#endif
+
+#ifndef fb_memset
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+#endif
+
 #endif /* __ASM_GENERIC_FB_H_ */
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 4b4d9a5d200a..2cf8efcb9e32 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 
 #include <asm/fb.h>
-#include <asm/io.h>
 
 struct vm_area_struct;
 struct fb_info;
@@ -513,58 +512,6 @@ struct fb_info {
  */
 #define STUPID_ACCELF_TEXT_SHIT
 
-// This will go away
-#if defined(__sparc__)
-
-/* We map all of our framebuffers such that big-endian accesses
- * are what we want, so the following is sufficient.
- */
-
-// This will go away
-#define fb_readb sbus_readb
-#define fb_readw sbus_readw
-#define fb_readl sbus_readl
-#define fb_readq sbus_readq
-#define fb_writeb sbus_writeb
-#define fb_writew sbus_writew
-#define fb_writel sbus_writel
-#define fb_writeq sbus_writeq
-#define fb_memset sbus_memset_io
-#define fb_memcpy_fromfb sbus_memcpy_fromio
-#define fb_memcpy_tofb sbus_memcpy_toio
-
-#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||	\
-	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
-	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
-
-#define fb_readb __raw_readb
-#define fb_readw __raw_readw
-#define fb_readl __raw_readl
-#define fb_readq __raw_readq
-#define fb_writeb __raw_writeb
-#define fb_writew __raw_writew
-#define fb_writel __raw_writel
-#define fb_writeq __raw_writeq
-#define fb_memset memset_io
-#define fb_memcpy_fromfb memcpy_fromio
-#define fb_memcpy_tofb memcpy_toio
-
-#else
-
-#define fb_readb(addr) (*(volatile u8 *) (addr))
-#define fb_readw(addr) (*(volatile u16 *) (addr))
-#define fb_readl(addr) (*(volatile u32 *) (addr))
-#define fb_readq(addr) (*(volatile u64 *) (addr))
-#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
-#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
-#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
-#define fb_writeq(b,addr) (*(volatile u64 *) (addr) = (b))
-#define fb_memset memset
-#define fb_memcpy_fromfb memcpy
-#define fb_memcpy_tofb memcpy
-
-#endif
-
 #define FB_LEFT_POS(p, bpp)          (fb_be_math(p) ? (32 - (bpp)) : 0)
 #define FB_SHIFT_HIGH(p, val, bits)  (fb_be_math(p) ? (val) >> (bits) : \
 						      (val) << (bits))
-- 
2.40.1

