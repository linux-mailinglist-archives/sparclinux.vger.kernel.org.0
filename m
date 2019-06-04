Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39F7345C0
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 13:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfFDLou (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 07:44:50 -0400
Received: from mail-ot1-f73.google.com ([209.85.210.73]:51170 "EHLO
        mail-ot1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfFDLou (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 07:44:50 -0400
Received: by mail-ot1-f73.google.com with SMTP id a21so1132745otk.17
        for <sparclinux@vger.kernel.org>; Tue, 04 Jun 2019 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=XCrbwdAiEJS3sao46jIToUSxgqStqSIKmjosXIycN10=;
        b=OQowASfC1DkZBD6ZzOOewK6YqgU2ZfNgbzHcLMXLm94xATdoL7pRsYoq0Ca983wUlW
         1AzHjVsjPZzLOSw/EYwBC5zTDiT3rRisFVr0otD4kGjI5Q1J+eBrFP3oWQBc3R8o7rZS
         +nEENWNe0lpacPo8kwRr2Cz7TDEttnz9npQcNVZJmeIO9eL9YROdUfyY9G7dPjCT5G4S
         n3vggAvgZl5bnPFVyY5V8gpZBFjsU9LmOWcovr1/jb8oFePv4CCtwEGaE9uoVlfJANln
         MTN/BlGEha/hwcouVsL2ZU5SkLr7wvck5RykyLLoKj5+diBYr1ixXCNWeLnwmH0fmyZF
         THpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=XCrbwdAiEJS3sao46jIToUSxgqStqSIKmjosXIycN10=;
        b=X4seP3f+1ADEOsC7D1VQClUyiBTF4qjVg+nrC3xjkVZRdl/VT+iJ37fmj+WVINCaRN
         v6Uiic5rY2YmV1Y7BkOJXWuQFaJZEqk8OsA5tKNFg09m//Q2zRzwdqndrCJHt/vzdGFO
         0/uRz47AafkGAb0QuCT+exduDHrJdHqWfX3vkqapC7RkKoDLaZWn+6Wy1aq3/1uBQyyN
         q+x6UsTia9U8C3N/LYJuRAe+1letp44JsnBl+K940KM1Yk97hkRlWhMvnBiBaUOflmFt
         r1P8gcRm2xk9e1mFNxXCvjyBhP1AEcSwNWbTu/fikA4TwusXp/0+IwOVXKCkswAt1Y7f
         g0pA==
X-Gm-Message-State: APjAAAVz6PccgsNT8HxfZow20Fm3tvLEToAMSTwgZWNCMzRESVBg9CZ8
        y+PVe6KJAzWLAs8paFBfSpaSS32R2vrowIMB
X-Google-Smtp-Source: APXvYqwXsyeZ/z4p68zy0w3OgwmszH6BSy/5gFuyx/JVk90VXHjFqwFwXGlvbDPhexYH3Gb/pFc8t/if0dU8diyp
X-Received: by 2002:aca:b108:: with SMTP id a8mr4013564oif.81.1559648689594;
 Tue, 04 Jun 2019 04:44:49 -0700 (PDT)
Date:   Tue,  4 Jun 2019 13:44:45 +0200
Message-Id: <8ab5cd1813b0890f8780018e9784838456ace49e.1559648669.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH] uaccess: add noop untagged_addr definition
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Architectures that support memory tagging have a need to perform untagging
(stripping the tag) in various parts of the kernel. This patch adds an
untagged_addr() macro, which is defined as noop for architectures that do
not support memory tagging. The oncoming patch series will define it at
least for sparc64 and arm64.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834ac32b7..949d43e9c0b6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #ifndef __pa_symbol
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
-- 
2.22.0.rc1.311.g5d7573a151-goog

