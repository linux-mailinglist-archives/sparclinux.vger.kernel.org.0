Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2228959B375
	for <lists+sparclinux@lfdr.de>; Sun, 21 Aug 2022 13:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiHULgy (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 21 Aug 2022 07:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiHULgr (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 21 Aug 2022 07:36:47 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3DA26AEC
        for <sparclinux@vger.kernel.org>; Sun, 21 Aug 2022 04:36:28 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id ay12so4272715wmb.1
        for <sparclinux@vger.kernel.org>; Sun, 21 Aug 2022 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2hp0XgWencqFe8kXeBG8b3/XdH3S4lc4e5c8N+bw8RQ=;
        b=LAUaEh2tAFhDJlCpu8MUfNuM9zMtSGqKo7XN911tRo/xHZRFSssv95uBSiWYBXRNvp
         7UlrwRnOdY0JZcF2H4jZdEU94MUwWA/ozhhj1ZMuEKiKFqthJPnpE4k3HwjOguILHVB7
         d53U+CGg5Q7M4H04caRUuup7XTmPnhFCyOm/hWyHEyUf2/qJeM+8MH/mEPJBDVXky01V
         0BTGH+zJ3dWWXixtmU3ecjvrZJmJJxA5T0UJsfGk3o7lT6SAQZhCJdPsna2QhaozU6fC
         b2WWAWI58CNPdJH9MfcZW1ZfCpmYx0ybFfF3XGsEfu7E+JgPdnqeALGmlhdXaGB53p7o
         /tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2hp0XgWencqFe8kXeBG8b3/XdH3S4lc4e5c8N+bw8RQ=;
        b=aN2/o8pL3fbmApBbUl2DkEDeQKyf+KSBfd2hc00UEDHh7N6xfguevdGfKnjtRyhNVg
         /He9gsdBwMobsC0eQ8o97YXcr7FmgHgrJ1ZaU0+nCV8eGz4VLAf3FsIswKQphvRLAMrc
         3HNuTconhVnjC4xU2YQWhqF8yK+9y/txnPKLfrTAUc2xWvII+5IMyF5y6af3hJGhEDCx
         3e0B0YeeF11OcTCwdQMf3wnVXoFdn+SJNsPcRGciFy69GKnxII3/D5c5YMk989TpEAN+
         jG/uO0oFGZDsqej8PJRuyuXpnuGreMXA44jXHhRBPF6DKsgPITwTCVStzks+qfgReyaP
         /o/A==
X-Gm-Message-State: ACgBeo3SuQjsOyfPk3qxru31NopPMT/8OS8n8lGWUdQM7SDEnk5HoHFW
        7MZG+TYuxs0EJD02TPfl+ROwBA==
X-Google-Smtp-Source: AA6agR4OY+ZRYMqpTNiJlmmD03DUaN+6WGm/km0jEjdnK9nEEF9nc9erLrZ3IW+Npyz9CAeI8E6ZBg==
X-Received: by 2002:a05:600c:4f90:b0:3a6:2bda:dc19 with SMTP id n16-20020a05600c4f9000b003a62bdadc19mr8143133wmq.17.1661081786790;
        Sun, 21 Aug 2022 04:36:26 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:26 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Michal Simek <monstr@monstr.eu>,
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
        "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: [PATCH 6/6] x86: use the asm-generic version of cpuinfo_op
Date:   Sun, 21 Aug 2022 12:35:13 +0100
Message-Id: <20220821113512.2056409-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220821113512.2056409-1-mail@conchuod.ie>
References: <20220821113512.2056409-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

There's little point in duplicating the declaration of cpuinfo_op now
that there's a shared version of it, so drop it & include the generic
header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 356308c73951..175b0e750675 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -27,6 +27,7 @@ struct vm86;
 #include <asm/unwind_hints.h>
 #include <asm/vmxfeatures.h>
 #include <asm/vdso/processor.h>
+#include <asm-generic/processor.h>
 
 #include <linux/personality.h>
 #include <linux/cache.h>
@@ -188,7 +189,6 @@ DECLARE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
 #define cpu_data(cpu)		boot_cpu_data
 #endif
 
-extern const struct seq_operations cpuinfo_op;
 
 #define cache_line_size()	(boot_cpu_data.x86_cache_alignment)
 
-- 
2.37.1

