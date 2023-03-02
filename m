Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8DA6A7F5D
	for <lists+sparclinux@lfdr.de>; Thu,  2 Mar 2023 11:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCBKAR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Mar 2023 05:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjCBJ7d (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Mar 2023 04:59:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC08F4BEA8
        for <sparclinux@vger.kernel.org>; Thu,  2 Mar 2023 01:58:50 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q16so15940752wrw.2
        for <sparclinux@vger.kernel.org>; Thu, 02 Mar 2023 01:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=GbOzkhHpIeW6q3QAL7eh/145Udusgp0gIBvSMfE+ON43AdeZu/ee7w201pWjLeG957
         Qq6RowkieZ+r7WYxDV4f068I/TnwbRuLBxT7WIxFprPNBY5ETmLUPXT8bUynxL5VSaUV
         PVUZGZk6ER9seRO9uoW7f1L2mApWo7MewdzdL0qcnQpdXHFH3/9ZB2LUy9VpmO3HrtOm
         pZFwuHfUDS0wMlnfUfqj5o1GaX3nlvS+nxi6hyejhckM5q2KO+HBjRFOyHjW/SKZSMU4
         7gpUQh5NelsMLIJiVkw0+WCtWlNbCFujwtZy/wvskJrB7zILzjZi7BblFbcCuFLCBqPv
         Bewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=qP6MCBbFj4llwPIvl901igl8J9kTTcgZy5qfYIB6o0rJPznVHQ1SnXnBKhRHhBRnje
         ghypd5N9FE7Axy91ReGkl39yBU2fyNVJMOjibodd/hezTu+RJqDH5xpaT1kLzZ/qrhwB
         GMDA8GxgkteQCNTkfpdR+tiRjkreMjGuw5QGfCBzPst7zPBgJQEF0GtF4x3366QEEfI3
         2keCzvE8+hCqigMYp/aYpi+WP+ADSWPaJghe9yEhneNgIYnTFvrMrm6GK/HvjoyH7lca
         drcPr/JHmPJJNUgbx0oaeDKHQUcNwdwQ022yigF0ymUptQZtbSInyNR6mL3pBiLi9yh1
         woMw==
X-Gm-Message-State: AO0yUKWfCeNGw5pt6T9HDbiK46zodx5QoUuMQrDvL+iZ5ckuRgPz5n/9
        fPPHIHawdAZx69j/0mOqXYMiyA==
X-Google-Smtp-Source: AK7set/HXPU9Bp6RN1ljNqKlOOYPCzZVkHLiMhzV0VzI+tVIVoliI9/U3d28g8WZmzzIQccODQQ95w==
X-Received: by 2002:adf:e490:0:b0:2c5:c71:4a84 with SMTP id i16-20020adfe490000000b002c50c714a84mr7272840wrm.68.1677751100153;
        Thu, 02 Mar 2023 01:58:20 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b003df5be8987esm2546772wmo.20.2023.03.02.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:58:19 -0800 (PST)
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
Subject: [PATCH v4 22/24] powerpc: Remove empty <uapi/asm/setup.h>
Date:   Thu,  2 Mar 2023 10:35:37 +0100
Message-Id: <20230302093539.372962-23-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/powerpc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h

diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
deleted file mode 100644
index f2ca747aa45b..000000000000
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_POWERPC_SETUP_H
-#define _UAPI_ASM_POWERPC_SETUP_H
-
-#endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2

