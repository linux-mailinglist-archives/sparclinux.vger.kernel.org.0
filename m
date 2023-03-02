Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060C16A7E6C
	for <lists+sparclinux@lfdr.de>; Thu,  2 Mar 2023 10:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjCBJq1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Mar 2023 04:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjCBJqQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Mar 2023 04:46:16 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86883BD81
        for <sparclinux@vger.kernel.org>; Thu,  2 Mar 2023 01:46:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k37so10303961wms.0
        for <sparclinux@vger.kernel.org>; Thu, 02 Mar 2023 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2QJZPzpdHOLfexOQ+hmmrB7dRtnPULpm3pE6FQ2lH4=;
        b=zJ3TbjZTtquT1TamyY4HaRmdHB0ahv+Vtokv3SWblvAbuIUif4QMaBGt/xjCod2Cfm
         +dULCCTWpmrxy8mqlFVQaTuMVp87i5qtBM0ADTdCKDRLlpSCqkhOmH1QctVZ4OLps5BZ
         1s16RPbL7FRy7CIgjm2oI/TY5CELnEmY/x+InB8S3MswEOG0J0Jn9ebnzN1s60yuHonM
         XciWPuP0b1tz0kX9kJUjwCIXEVM6VQUiBKjEhalvsxJmySaJtUl/YC2Tbe8UVp+8v7Wt
         ggqHgr+btYHggfJimXifcnxxkPYeEFCejY+3RDW8YEiUMRME7ZPLzEw9+jOjdHd+RgMU
         P7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2QJZPzpdHOLfexOQ+hmmrB7dRtnPULpm3pE6FQ2lH4=;
        b=GOot7PByLEzSudvSfpeLxLGslVzM/131WKOqa5LBsrjk8KGmBZwEkAAOcbI5myqbkn
         sMvxhTD1BSyvhR9mi2g4qXVSfc2c1T9IGpQEaty4Nly+azktvompAaEozd4vuuaMdF34
         7ZWnPGVSRwlJz4zPmmuYmFu91i4pc0ZY62+WYZk6B8JsZPIBCuNdUFQhZEXCvhYpRh0C
         1ii9SaRqk9S2nPTQ2jPOiNnqOOoosQMLZKMQKTW1xkFxc6HSlEuc4ZxDi7nU/g7Oicba
         DA8rq25nQp6ByGEoUYlSvLLEIeqU8Jby+Pohs7HUFO+IJi2aieVREUUD/SICmEdZshW6
         QykQ==
X-Gm-Message-State: AO0yUKXvPloUAeyeGUypL0mv/Jz2WUeUl1pCG50NKKHbnoWPdCsPPTiz
        IKtSVVezT3/yPFZe2OvNVgO5Vg==
X-Google-Smtp-Source: AK7set9tt8ELM6mQUqucoLfG4+2zkkeQdoUabomYMcYjwWIMvWpy6ZPc2DVztl7RMEHxCVPROTqqyA==
X-Received: by 2002:a05:600c:35cf:b0:3eb:3104:efec with SMTP id r15-20020a05600c35cf00b003eb3104efecmr7280974wmq.16.1677750359239;
        Thu, 02 Mar 2023 01:45:59 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c2f8800b003e91b9a92c9sm2391461wmn.24.2023.03.02.01.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:45:58 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
Date:   Thu,  2 Mar 2023 10:35:25 +0100
Message-Id: <20230302093539.372962-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/sparc/include/asm/setup.h      | 6 +++++-
 arch/sparc/include/uapi/asm/setup.h | 7 -------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
index 72205684e51e..d1384ed92547 100644
--- a/arch/sparc/include/asm/setup.h
+++ b/arch/sparc/include/asm/setup.h
@@ -7,7 +7,11 @@
 
 #include <linux/interrupt.h>
 
-#include <uapi/asm/setup.h>
+#if defined(__sparc__) && defined(__arch64__)
+# define COMMAND_LINE_SIZE 2048
+#else
+# define COMMAND_LINE_SIZE 256
+#endif
 
 extern char reboot_command[];
 
diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
index 3c208a4dd464..c3cf1b0d30b3 100644
--- a/arch/sparc/include/uapi/asm/setup.h
+++ b/arch/sparc/include/uapi/asm/setup.h
@@ -6,11 +6,4 @@
 #ifndef _UAPI_SPARC_SETUP_H
 #define _UAPI_SPARC_SETUP_H
 
-#if defined(__sparc__) && defined(__arch64__)
-# define COMMAND_LINE_SIZE 2048
-#else
-# define COMMAND_LINE_SIZE 256
-#endif
-
-
 #endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2

