Return-Path: <sparclinux+bounces-92-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C581931A
	for <lists+sparclinux@lfdr.de>; Tue, 19 Dec 2023 23:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AAC71C24CB4
	for <lists+sparclinux@lfdr.de>; Tue, 19 Dec 2023 22:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF0741862;
	Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8fickSy"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE241209;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6119C116CB;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703023396;
	bh=+Beebx9gfnLAs0pJuWOQEcNAx7I2nncuMk7Ra3DGun4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L8fickSy6u96Be9sQJspXpPb56FKoD0S4i5jLfrPPcsl6TTLwv7Tq5O893li6Hypb
	 UZISRFNeQvm7YHmldvqP+mid9tEHOh2kLcRJxle5z+zEKYjZtYgf3OItXiIXp/bejK
	 0Ai1BsMQ80n/UE8VtxQyxDewQxSExtLPtyDojbJsnR1u7gfBmH/CKnrYx25s2iK6eE
	 u+L9EO6ICbYr+h6EnoM/qk/ahrelnR69YFVEnUauvJPIYDEZlFB+2QyG0BwaJZLuH6
	 d2k1QeUxa8rBXXIa2cewb4ZciWiy4ZvhX5Xxyqv8J8GjxsABu+YFqY+lltoc4YuL3h
	 BKK2zv6IqZJTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9511FC41535;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:30 +0100
Subject: [PATCH 25/27] sparc32: Drop sbus support
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-25-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=8434;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=noFWwB2355JcJw34vZTjvjPZYxXfFOJ+ZxyTkfyT2mI=; =?utf-8?q?b=3De82fXd+odSNL?=
 =?utf-8?q?BQG5iBX6UXvJFUrU3yTayR5X1rsd79iibtwClLcKPPTffy2mjGn5mm6zqBvofsMi?=
 VNVMYAp+C/vLDPhIqt9t7cbV649lfDaS3ATBb7q+ZXuZUo4m+yzW
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
Reply-To: <sam@ravnborg.org>

From: Sam Ravnborg <sam@ravnborg.org>

LEON do not have an sbus - so drop support for that for sparc32.
Fix a few Kconfig expressions to use CONFIG_SBUS rather than SPARC
as only SPARC64 has an sbus now.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig               |  4 +-
 arch/sparc/include/asm/fb.h      |  8 ++--
 arch/sparc/include/asm/io_32.h   | 83 ----------------------------------------
 arch/sparc/kernel/ioport.c       | 49 ------------------------
 arch/sparc/kernel/of_device_32.c | 14 -------
 drivers/video/fbdev/Kconfig      |  2 +-
 sound/sparc/Kconfig              |  1 +
 7 files changed, 9 insertions(+), 152 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0fc52c3c7487..1b9cf7f3c500 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -392,11 +392,11 @@ endmenu
 menu "Bus options (PCI etc.)"
 config SBUS
 	bool
-	default y
+	default y if SPARC64
 
 config SBUSCHAR
 	bool
-	default y
+	default y if SPARC64
 
 config SUN_LDOMS
 	bool "Sun Logical Domains support"
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 24440c0fda49..15b007875457 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -8,6 +8,9 @@
 
 struct fb_info;
 
+int fb_is_primary_device(struct fb_info *info);
+#define fb_is_primary_device fb_is_primary_device
+
 #ifdef CONFIG_SPARC32
 static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 					  unsigned long vm_start, unsigned long vm_end,
@@ -18,9 +21,7 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 #define pgprot_framebuffer pgprot_framebuffer
 #endif
 
-int fb_is_primary_device(struct fb_info *info);
-#define fb_is_primary_device fb_is_primary_device
-
+#ifdef CONFIG_SPARC64
 static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
 	sbus_memcpy_fromio(to, from, n);
@@ -38,6 +39,7 @@ static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
 	sbus_memset_io(addr, c, n);
 }
 #define fb_memset fb_memset_io
+#endif
 
 #include <asm-generic/fb.h>
 
diff --git a/arch/sparc/include/asm/io_32.h b/arch/sparc/include/asm/io_32.h
index 83abe709d120..b9f280ee1b11 100644
--- a/arch/sparc/include/asm/io_32.h
+++ b/arch/sparc/include/asm/io_32.h
@@ -56,78 +56,6 @@ static inline void _memcpy_toio(volatile void __iomem *dst, const void *src,
 	}
 }
 
-/*
- * SBus accessors.
- *
- * SBus has only one, memory mapped, I/O space.
- * We do not need to flip bytes for SBus of course.
- */
-static inline u8 sbus_readb(const volatile void __iomem *addr)
-{
-	return *(__force volatile u8 *)addr;
-}
-
-static inline u16 sbus_readw(const volatile void __iomem *addr)
-{
-	return *(__force volatile u16 *)addr;
-}
-
-static inline u32 sbus_readl(const volatile void __iomem *addr)
-{
-	return *(__force volatile u32 *)addr;
-}
-
-static inline void sbus_writeb(u8 b, volatile void __iomem *addr)
-{
-	*(__force volatile u8 *)addr = b;
-}
-
-static inline void sbus_writew(u16 w, volatile void __iomem *addr)
-{
-	*(__force volatile u16 *)addr = w;
-}
-
-static inline void sbus_writel(u32 l, volatile void __iomem *addr)
-{
-	*(__force volatile u32 *)addr = l;
-}
-
-static inline void sbus_memset_io(volatile void __iomem *__dst, int c,
-                                  __kernel_size_t n)
-{
-	while(n--) {
-		sbus_writeb(c, __dst);
-		__dst++;
-	}
-}
-
-static inline void sbus_memcpy_fromio(void *dst,
-                                      const volatile void __iomem *src,
-                                      __kernel_size_t n)
-{
-	char *d = dst;
-
-	while (n--) {
-		char tmp = sbus_readb(src);
-		*d++ = tmp;
-		src++;
-	}
-}
-
-static inline void sbus_memcpy_toio(volatile void __iomem *dst,
-                                    const void *src,
-                                    __kernel_size_t n)
-{
-	const char *s = src;
-	volatile void __iomem *d = dst;
-
-	while (n--) {
-		char tmp = *s++;
-		sbus_writeb(tmp, d);
-		d++;
-	}
-}
-
 /* Create a virtual mapping cookie for an IO port range */
 void __iomem *ioport_map(unsigned long port, unsigned int nr);
 void ioport_unmap(void __iomem *);
@@ -136,17 +64,6 @@ void ioport_unmap(void __iomem *);
 struct pci_dev;
 void pci_iounmap(struct pci_dev *dev, void __iomem *);
 
-static inline int sbus_can_dma_64bit(void)
-{
-	return 0;
-}
-static inline int sbus_can_burst64(void)
-{
-	return 0;
-}
-struct device;
-void sbus_set_sbus64(struct device *, int);
-
 #define __ARCH_HAS_NO_PAGE_ZERO_MAPPED		1
 
 
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 9c4c72775274..97b836f3be25 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -55,8 +55,6 @@ static void __iomem *_sparc_alloc_io(unsigned int busno, unsigned long phys,
     unsigned long size, char *name);
 static void _sparc_free_io(struct resource *res);
 
-static void register_proc_sparc_ioport(void);
-
 /* This points to the next to use virtual memory for DVMA mappings */
 static struct resource _sparc_dvma = {
 	.name = "sparc_dvma", .start = DVMA_VADDR, .end = DVMA_END - 1
@@ -279,25 +277,6 @@ bool sparc_dma_free_resource(void *cpu_addr, size_t size)
 	return true;
 }
 
-#ifdef CONFIG_SBUS
-
-void sbus_set_sbus64(struct device *dev, int x)
-{
-	printk("sbus_set_sbus64: unsupported\n");
-}
-EXPORT_SYMBOL(sbus_set_sbus64);
-
-static int __init sparc_register_ioport(void)
-{
-	register_proc_sparc_ioport();
-
-	return 0;
-}
-
-arch_initcall(sparc_register_ioport);
-
-#endif /* CONFIG_SBUS */
-
 /*
  * IIep is write-through, not flushing on cpu to device transfer.
  *
@@ -310,31 +289,3 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	if (dir != DMA_TO_DEVICE && !sparc_leon3_snooping_enabled())
 		leon_flush_dcache_all();
 }
-
-#ifdef CONFIG_PROC_FS
-
-static int sparc_io_proc_show(struct seq_file *m, void *v)
-{
-	struct resource *root = m->private, *r;
-	const char *nm;
-
-	for (r = root->child; r != NULL; r = r->sibling) {
-		if ((nm = r->name) == NULL) nm = "???";
-		seq_printf(m, "%016llx-%016llx: %s\n",
-				(unsigned long long)r->start,
-				(unsigned long long)r->end, nm);
-	}
-
-	return 0;
-}
-#endif /* CONFIG_PROC_FS */
-
-static void register_proc_sparc_ioport(void)
-{
-#ifdef CONFIG_PROC_FS
-	proc_create_single_data("io_map", 0, NULL, sparc_io_proc_show,
-			&sparc_iomap);
-	proc_create_single_data("dvma_map", 0, NULL, sparc_io_proc_show,
-			&_sparc_dvma);
-#endif
-}
diff --git a/arch/sparc/kernel/of_device_32.c b/arch/sparc/kernel/of_device_32.c
index ddb3b197d5e4..99ec26782bcc 100644
--- a/arch/sparc/kernel/of_device_32.c
+++ b/arch/sparc/kernel/of_device_32.c
@@ -96,11 +96,6 @@ static unsigned long of_bus_pci_get_flags(const u32 *addr, unsigned long flags)
 	return flags;
 }
 
-static unsigned long of_bus_sbus_get_flags(const u32 *addr, unsigned long flags)
-{
-	return IORESOURCE_MEM;
-}
-
  /*
  * AMBAPP bus specific translator
  */
@@ -145,15 +140,6 @@ static struct of_bus of_busses[] = {
 		.map = of_bus_pci_map,
 		.get_flags = of_bus_pci_get_flags,
 	},
-	/* SBUS */
-	{
-		.name = "sbus",
-		.addr_prop_name = "reg",
-		.match = of_bus_sbus_match,
-		.count_cells = of_bus_sbus_count_cells,
-		.map = of_bus_default_map,
-		.get_flags = of_bus_sbus_get_flags,
-	},
 	/* AMBA */
 	{
 		.name = "ambapp",
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 53693c826ebd..94f6dca5856f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -518,7 +518,7 @@ config FB_GBE_MEM
 
 config FB_SBUS
 	bool "SBUS and UPA framebuffers"
-	depends on (FB = y) && SPARC
+	depends on (FB = y) && SBUS
 	help
 	  Say Y if you want support for SBUS or UPA based frame buffer device.
 
diff --git a/sound/sparc/Kconfig b/sound/sparc/Kconfig
index 59b9f16e8dea..af2fb963a455 100644
--- a/sound/sparc/Kconfig
+++ b/sound/sparc/Kconfig
@@ -4,6 +4,7 @@
 menuconfig SND_SPARC
 	bool "Sparc sound devices"
 	depends on SPARC
+	depends on SBUS
 	default y
 	help
 	  Support for sound devices specific to Sun SPARC architectures.

-- 
2.34.1


