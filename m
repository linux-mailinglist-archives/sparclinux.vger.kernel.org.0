Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1619FF06
	for <lists+sparclinux@lfdr.de>; Mon,  6 Apr 2020 22:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgDFU1c (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 6 Apr 2020 16:27:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42040 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFU1b (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 6 Apr 2020 16:27:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id g6so554211pgs.9
        for <sparclinux@vger.kernel.org>; Mon, 06 Apr 2020 13:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DEPcTm86//X2Om8saNr3/SUD6u964CzL8gOl5kUMx1k=;
        b=UrVib5G9ZJ+LPlgDKwpjezOuGTjqG4r7v3omn1SxAHAmPDPdISpEZx98VY/gtRHjAK
         2n5PaSNaEzMLDU34yoDbHpLK4v1xVxYsYDggbE6oDxleAV/r6P8I7t/m8Ck3ZnbOziq9
         yOAyWxKWnpna7vtOvq68LwlFMRT8M43xRLCckbgT5V35qPOQ8AvLNDgP36qhwVa2B+Kl
         Zrt+VkHl7QzXbuZOsgcknT8g49qo5sL1j2OVDV3TybeEfnDWpGI2rfpdPyl8CoaUXd+5
         wofUi8sXDNW3rbE8UH9wcaUITgwkhVYw0Uc3KuK0XqjZsyIpz3/Qt2EMJbHlj8LDoyes
         v6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DEPcTm86//X2Om8saNr3/SUD6u964CzL8gOl5kUMx1k=;
        b=Mzem6C4jEK0qiZFNk2fk191kY0SR8X+oYAz/+99i1lKdImUmIcaW+t+buVoPW1F9qH
         TQ6Iwx6sKvRogfeN6cIYQ9S9WuZbLMoi8kLc6XSRX4LemoBkE/dMgOJzo9QxZuHqrtVm
         aA6+1y3h777CMawnkmbOdHS2KKT5cde7ac7F1tLTcOIT7IXjxyrtT6f/MxKZW6M1Rjrw
         Kq3jYKFbAGbEM1JAGb3NyvZzcNC0a8oG5O5utEmQgc9nNiXMwuThZFCQ/fBJ5O1uvoi3
         Z0tad0sHSsm+Bici0eWszN7ExxCzx6P6vZxnwuqTq+ohBx6NCh/noBh6JCLibPPbHj1i
         e4IQ==
X-Gm-Message-State: AGi0PuY1Q1LxKc9dNXAjTVHN7ZW/rkdPZTMM6gK28XQjn4XtdCJO6inn
        xR/a5f1NKPEuOTDQB6WBLEEau1IB
X-Google-Smtp-Source: APiQypICNsIkmbWDMu6La1D/AOBhug9j97jau2Vzq8K9iXdmaN0n9rE2y8pXd8zxF/+zwBQ3Nl+fWQ==
X-Received: by 2002:a62:1bd6:: with SMTP id b205mr1303969pfb.242.1586204850258;
        Mon, 06 Apr 2020 13:27:30 -0700 (PDT)
Received: from localhost ([134.134.137.77])
        by smtp.gmail.com with ESMTPSA id p1sm12327261pfq.114.2020.04.06.13.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 13:27:29 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCH] silo: Allow building tilo only
Date:   Mon,  6 Apr 2020 13:27:16 -0700
Message-Id: <20200406202716.4008090-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The bootloader bits are built as 32-bit, which can be difficult to do on
a system with a 64-bit userland since they include system headers.

Specifically, the inclusion of <gnu/stubs-32.h> is problematic since
this header is not provided on a non-multilib build of glibc.

	<gnu/stubs-32.h>, included by
	<gnu/stubs.h>, included by
	<features.h>, included by
	<elf.h> and <setjmp.h>

tilo is built for the host machine and doesn't have this problem.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Makefile | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 15a0de1..b411020 100644
--- a/Makefile
+++ b/Makefile
@@ -3,27 +3,37 @@ include Rules.make
 
 # These only get built on Linux
 ifeq ($(OPSYS),Linux)
-  SUBDIRS  = common first second first-isofs tilo
+ifneq ($(TILO_ONLY),yes)
+  SUBDIRS  = common first second first-isofs
+endif
+  SUBDIRS += tilo
   MANPAGES = maketilo.1 tilo.1
 endif
 
+ifneq ($(TILO_ONLY),yes)
 # These get built on Linux and Solaris
 MANPAGES += silo.8 silo.conf.5
 SUBDIRS  += silo
+endif
 
 all dep depend clean:
 	@for I in $(SUBDIRS); do $(MAKE) -C $$I $@ || exit 1; done
 
 ifeq ($(OPSYS),$(findstring $(OPSYS),Linux Solaris))
 install:
+ifneq ($(TILO_ONLY),yes)
 	install -d -m755 $(DESTDIR)/etc $(DESTDIR)/sbin $(DESTDIR)/usr/sbin
 	install -m755 silo/silo $(DESTDIR)/sbin
 	install -m755 silo/silocheck $(DESTDIR)/usr/sbin
 	[ -f $(DESTDIR)/etc/silo.conf ] || \
 		install -m644 etc/silo.conf $(DESTDIR)/etc/
+endif
 ifeq ($(OPSYS),Linux)
-	install -d -m755 $(DESTDIR)/boot $(DESTDIR)/usr/bin
+ifneq ($(TILO_ONLY),yes)
+	install -d -m755 $(DESTDIR)/boot
 	install -m644 first/*.b second/*.b first-isofs/*.b $(DESTDIR)/boot/
+endif
+	install -d -m755 $(DESTDIR)/usr/bin
 	install -m755 tilo/maketilo $(DESTDIR)/usr/bin/
 	install -m755 tilo/tilo.sh $(DESTDIR)/usr/bin/tilo
 endif
-- 
2.24.1

