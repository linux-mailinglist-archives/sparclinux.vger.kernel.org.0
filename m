Return-Path: <sparclinux+bounces-4982-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BFB5653B
	for <lists+sparclinux@lfdr.de>; Sun, 14 Sep 2025 05:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0CF12006A4
	for <lists+sparclinux@lfdr.de>; Sun, 14 Sep 2025 03:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FF12701CC;
	Sun, 14 Sep 2025 03:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPFPn18s"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F3263F32
	for <sparclinux@vger.kernel.org>; Sun, 14 Sep 2025 03:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822125; cv=none; b=W5EeXadRPhY5dg71Qpiz+bFuin524NYOGgvKCNDR9hlkkSwvpEfMrH8wAk5IXMPh7Kf/LdfoEpyZ75oYpeXBOoN++xxw26iHjSNe2f/4zmjJMT2qkVjwNzZ1zHKvrXDoup6miGtUF6uADkdv/TVDk92oH16NTyNHlb23syCf6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822125; c=relaxed/simple;
	bh=+xt36CXvj6oCs9wyUV3RsDXHuKnSILTg1/3pffdBhfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewoVVcEifS/fbdo5mTMPlf3wDfVbBBNggJqmZsNSCN0qkOVcjGwUwNWAsnN+3LzbEunMnrVvZpJgS0OmUPmKtY5CykpR6n1kCfxV1lDpK6Xy0/j9GVRrYV1AdintFquzXWg1r43h3jYBYo4ymFA0ifbuRIzfFF1jMxX9nKzClrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPFPn18s; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so5037228a12.2
        for <sparclinux@vger.kernel.org>; Sat, 13 Sep 2025 20:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822120; x=1758426920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOmwD5NF6m1DAFdekL887975d4wKOOnVQzHmGUBheo0=;
        b=jPFPn18s2gjVSyHwPhLo3Hw5+gngEAz77U7bYOsxXpnhqlO6dm9hCQtJSMX8AIFYXJ
         RfK51aiUPV0Co2tI6hQZg49zYvuLYiyNALtmcRbik2Cf+kCMDG6jlGDojbmuCFp3lICl
         WCkA+bSusMihD5McoP0rZW+4D6s5K0Dq4Mz67DLIY40p7v8J93R4x9EQzY19SZ2iv2ev
         Zz05FoZbdT8UN6h1hnJaoA5iN1OIudmtdbJdpiBnENnZkhJFFD034ha8cG2VHEW3Te0q
         ov23KCx1e/nle+jvq59518DZS7sJjivQxrQ+TaW0GVNJfeJGVFJyWjkHf1t6RQBZXjo2
         ddzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822120; x=1758426920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOmwD5NF6m1DAFdekL887975d4wKOOnVQzHmGUBheo0=;
        b=kSvF6ASZZJB1k4dpoLKnsZ2/xra9eelOZOf5RS+dwmEdzBkOVH2dKbHodxfyWBIUnh
         xA+K40tDDJjCSDywLPVJbYx6mko32eISWC53WRY4DnbzrOptd2yW5bW6Mg+pTdGQB+XK
         cIEwhr2JPgWerg7PzoL+T23XakSKQJkQH5+v5RYwh6FyKuL81kjQ8I7sWLOcZeaLFW0b
         qSPSGRgOY5y+r8slWBoTRR3nHsblQaX1Hb9e+pa9/9HH0inT5NJRccc/UjfsdGrs/n6X
         y9iajEoqQs1kp3MYzX5mYdk3Vc5QKtHPSnz0Tq4q377JzIrlvTGuxJLWzt7/euBS6P3P
         miWg==
X-Forwarded-Encrypted: i=1; AJvYcCXL0lkmaIRk/NWuwiznovAuTU4FOXhgruWYSxIZy9yQh/UcZZbp2vwO9VtRDXbjV5XzEYopwWwwYk54@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1I6MAvkEzFU6Pa4up65cBb9NseNhOVP90PSdf2wApQGK+GMhA
	mBaphaT7c4mq5HsDF0AOOCCcGfxBFhTz3bToRG+4mAP0HKFdomcXvFyP
X-Gm-Gg: ASbGncsUjTXYV7APco+HBvWcKSB4fedZAxA+uHhgdEnjBWW12r89qv8arLS6WSFB7i7
	CtwIZLXEDqlvC8rQwqp6t4ksqLtQh9P6UxtZC+BTM75wKW9YZKGCTreM+MHEB63fvzIMAmtUORu
	DiSR5oOWXy13YszR/vPe223ffw32NBc+xPt6/1gg5GhKVrZaCFhg9QZULHWFFu09AEA3U9ayw22
	At6EtrAqTrIdCkbKG0ASUM44Axk3t6wuea7i4dguru5NeZLXVGiLTOSj1WxdmeFibuIfzxWmohR
	cCz/QjFdkvtYUafsL9H4zKoVh+E42bcXPrZwch9wUwZh/FcYLSEDpZEaWb0pewscsfU341qVgkt
	zpvHvG1gTtatDxAunQaE=
X-Google-Smtp-Source: AGHT+IFVXahsOiekrkN9a/Uz4eTnqleIeXBA7XQN4UsGQJ/USlX1vtxhVK0N6asLg1FonCbVUR1qZQ==
X-Received: by 2002:a05:6402:44d2:b0:61b:ff85:398b with SMTP id 4fb4d7f45d1cf-62ed80ee786mr6900890a12.14.1757822119812;
        Sat, 13 Sep 2025 20:55:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec2e661a5sm6313404a12.0.2025.09.13.20.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:18 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 46/62] init: edit docs for initramfs-related configs
Date: Sun, 14 Sep 2025 06:55:13 +0300
Message-ID: <20250914035513.3694090-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 drivers/block/Kconfig |  7 ++-----
 init/Kconfig          | 18 +++++++-----------
 usr/Kconfig           | 42 +++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 8cf06e40f61c..a268ac3dd304 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -225,9 +225,7 @@ config BLK_DEV_RAM
 	  Saying Y here will allow you to use a portion of your RAM memory as
 	  a block device, so that you can make file systems on it, read and
 	  write to it and do all the other things that you can do with normal
-	  block devices (such as hard drives). It is usually used to load and
-	  store a copy of a minimal root file system off of a floppy into RAM
-	  during the initial install of Linux.
+	  block devices (such as hard drives).
 
 	  For details, read <file:Documentation/admin-guide/blockdev/ramdisk.rst>.
 
@@ -244,8 +242,7 @@ config BLK_DEV_RAM_COUNT
 	depends on BLK_DEV_RAM
 	help
 	  The default value is 16 RAM disks. Change this if you know what you
-	  are doing. If you boot from a filesystem that needs to be extracted
-	  in memory, you will need at least one RAM disk (e.g. root on cramfs).
+	  are doing.
 
 config BLK_DEV_RAM_SIZE
 	int "Default RAM disk size (kbytes)"
diff --git a/init/Kconfig b/init/Kconfig
index 0263c08960bc..1c371dca7fd4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1435,18 +1435,14 @@ config RELAY
 	  If unsure, say N.
 
 config BLK_DEV_INITRD
-	bool "Initial RAM filesystem and RAM disk (initramfs/initrd) support"
+	bool "Initial RAM filesystem (initramfs) support"
 	help
-	  The initial RAM filesystem is a ramfs which is loaded by the
-	  boot loader (loadlin or lilo) and that is mounted as root
+	  The initial RAM filesystem is a ramfs or tmpfs which is loaded by the
+	  boot loader and that is mounted as root
 	  before the normal boot procedure. It is typically used to
 	  load modules needed to mount the "real" root file system,
 	  etc. See <file:Documentation/filesystems/ramfs-rootfs-initramfs.rst> for details.
 
-	  If RAM disk support (BLK_DEV_RAM) is also included, this
-	  also enables initial RAM disk (initrd) support and adds
-	  15 Kbytes (more on some other architectures) to the kernel size.
-
 	  If unsure say Y.
 
 if BLK_DEV_INITRD
@@ -1485,8 +1481,8 @@ config BOOT_CONFIG_EMBED
 	depends on BOOT_CONFIG
 	help
 	  Embed a bootconfig file given by BOOT_CONFIG_EMBED_FILE in the
-	  kernel. Usually, the bootconfig file is loaded with the initrd
-	  image. But if the system doesn't support initrd, this option will
+	  kernel. Usually, the bootconfig file is loaded with the initramfs.
+	  But if the system doesn't support initramfs, this option will
 	  help you by embedding a bootconfig file while building the kernel.
 
 	  If unsure, say N.
@@ -1496,8 +1492,8 @@ config BOOT_CONFIG_EMBED_FILE
 	depends on BOOT_CONFIG_EMBED
 	help
 	  Specify a bootconfig file which will be embedded to the kernel.
-	  This bootconfig will be used if there is no initrd or no other
-	  bootconfig in the initrd.
+	  This bootconfig will be used if there is no initramfs or no other
+	  bootconfig in the initramfs.
 
 config INITRAMFS_PRESERVE_MTIME
 	bool "Preserve cpio archive mtimes in initramfs"
diff --git a/usr/Kconfig b/usr/Kconfig
index 9279a2893ab0..8899353bd7d5 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -27,7 +27,7 @@ config INITRAMFS_FORCE
 	depends on CMDLINE_EXTEND || CMDLINE_FORCE
 	help
 	  This option causes the kernel to ignore the initramfs image
-	  (or initrd image) passed to it by the bootloader. This is
+	  passed to it by the bootloader. This is
 	  analogous to CMDLINE_FORCE, which is found on some architectures,
 	  and is useful if you cannot or don't want to change the image
 	  your bootloader passes to the kernel.
@@ -53,59 +53,59 @@ config INITRAMFS_ROOT_GID
 	  If you are not sure, leave it set to "0".
 
 config RD_GZIP
-	bool "Support initial ramdisk/ramfs compressed using gzip"
+	bool "Support initial ramfs compressed using gzip"
 	default y
 	select DECOMPRESS_GZIP
 	help
-	  Support loading of a gzip encoded initial ramdisk or cpio buffer.
+	  Support loading of a gzip encoded initial ramfs.
 	  If unsure, say Y.
 
 config RD_BZIP2
-	bool "Support initial ramdisk/ramfs compressed using bzip2"
+	bool "Support initial ramfs compressed using bzip2"
 	default y
 	select DECOMPRESS_BZIP2
 	help
-	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
+	  Support loading of a bzip2 encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZMA
-	bool "Support initial ramdisk/ramfs compressed using LZMA"
+	bool "Support initial ramfs compressed using LZMA"
 	default y
 	select DECOMPRESS_LZMA
 	help
-	  Support loading of a LZMA encoded initial ramdisk or cpio buffer
+	  Support loading of a LZMA encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_XZ
-	bool "Support initial ramdisk/ramfs compressed using XZ"
+	bool "Support initial ramfs compressed using XZ"
 	default y
 	select DECOMPRESS_XZ
 	help
-	  Support loading of a XZ encoded initial ramdisk or cpio buffer.
+	  Support loading of a XZ encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZO
-	bool "Support initial ramdisk/ramfs compressed using LZO"
+	bool "Support initial ramfs compressed using LZO"
 	default y
 	select DECOMPRESS_LZO
 	help
-	  Support loading of a LZO encoded initial ramdisk or cpio buffer
+	  Support loading of a LZO encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_LZ4
-	bool "Support initial ramdisk/ramfs compressed using LZ4"
+	bool "Support initial ramfs compressed using LZ4"
 	default y
 	select DECOMPRESS_LZ4
 	help
-	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
+	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
 config RD_ZSTD
-	bool "Support initial ramdisk/ramfs compressed using ZSTD"
+	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
 	help
-	  Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
+	  Support loading of a ZSTD encoded initial ramfs.
 	  If unsure, say N.
 
 choice
@@ -127,7 +127,7 @@ choice
 	  boot.
 
 	  Keep in mind that your build system needs to provide the appropriate
-	  compression tool to compress the generated initram cpio file for
+	  compression tool to compress the generated initramfs cpio file for
 	  embedding.
 
 	  If in doubt, select 'None'
@@ -153,7 +153,7 @@ config INITRAMFS_COMPRESSION_BZIP2
 	  booting.
 
 	  If you choose this, keep in mind that you need to have the bzip2 tool
-	  available to be able to compress the initram.
+	  available to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZMA
 	bool "LZMA"
@@ -166,7 +166,7 @@ config INITRAMFS_COMPRESSION_LZMA
 	  comparison to gzip.
 
 	  If you choose this, keep in mind that you may need to install the xz
-	  or lzma tools to be able to compress the initram.
+	  or lzma tools to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_XZ
 	bool "XZ"
@@ -179,7 +179,7 @@ config INITRAMFS_COMPRESSION_XZ
 	  slow.
 
 	  If you choose this, keep in mind that you may need to install the xz
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZO
 	bool "LZO"
@@ -191,7 +191,7 @@ config INITRAMFS_COMPRESSION_LZO
 	  is quite fast too.
 
 	  If you choose this, keep in mind that you may need to install the lzop
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_LZ4
 	bool "LZ4"
@@ -213,7 +213,7 @@ config INITRAMFS_COMPRESSION_ZSTD
 	  decompress around the same speed as LZO, but slower than LZ4.
 
 	  If you choose this, keep in mind that you may need to install the zstd
-	  tool to be able to compress the initram.
+	  tool to be able to compress the initramfs.
 
 config INITRAMFS_COMPRESSION_NONE
 	bool "None"
-- 
2.47.2


