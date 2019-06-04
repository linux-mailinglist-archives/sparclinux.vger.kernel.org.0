Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3018334622
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 14:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfFDMEw (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 08:04:52 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:37584 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfFDMEw (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 08:04:52 -0400
Received: by mail-vs1-f73.google.com with SMTP id a23so3336580vsn.4
        for <sparclinux@vger.kernel.org>; Tue, 04 Jun 2019 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=jQ4jdowRSjR3urFOBjyFZklSNNoQ/ud0fhl6APbdVCA=;
        b=GowLAStz/2F1T2+1l2LwgSfjTKRmMNBrNNCBZBil5igL4JQyaWlnxhbbmWCoX861Oi
         B/gqgNlu7CEqXMP2+z7kELt1QAkywzQ/4/CBIgoztk4jhPS0IDaW6f2xT62bZyvCkGPW
         ChaaC18egrJWcY5tXKS1tu+1ggnllHfRVAt4dSrOhgYxZTnaC50stPSrxwS8K7gbAyLN
         UjDTA5LQ+N55Gnmek72ZITAekTqyE/lF715JE4SsnddL1vL3d3tMoF9CBM84jFEXZ+Fi
         /tVHki2lXZ2QdEK7Q+gvSqDXWwBEJ/eJ981jOBPiAFjG2vVRecZEHKzlptA4WkyhnZzl
         0RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=jQ4jdowRSjR3urFOBjyFZklSNNoQ/ud0fhl6APbdVCA=;
        b=O2Rim4UjApgjqBVSCs/2dRj5vEavXF3RybOtS7aNZlYemkyv5x7SPwrDxWZLshtkQw
         9fvdzIINnt/N2/39goZlcgNCOrvXL2+iUGHYmywPeTQFt5y+o1apHl3BIL+mIMMbS1V4
         JgC74pgTY5HBtAoSSA1ph6f4lCLcfJMsrpx3I1YvHoUZ97hh/XEDM2h6xuHJwt3ECyJS
         X6gr81M/CCb8PWtcfjiyx8ZeCht+kPKjj93GhZAix/QoXIKtzTx2MehM55vuYTVHO2kz
         9IuiMdizDTfKf/wPJdUDSM4j/AN8xZXBP8R9NyVqD9FdUMsDwkDRCPZrrlkrY2QlbkZ/
         iLRw==
X-Gm-Message-State: APjAAAUt+Z17EloAH/b5+4n8AJIKMvIQio3PnZdCP2G64qFvTI2bUbRi
        5IcH7+YUfKsbh1JhIjcrQvu/3Fb5CZcSI4xo
X-Google-Smtp-Source: APXvYqzbAGU8OQBoy9uHFFBvYRcfDQrSEKOseigLTkDo7YUO7FMQDDHLZj47ajW7+eNrCdw8uM2m21YgNxpjq+Kq
X-Received: by 2002:ab0:184e:: with SMTP id j14mr15665222uag.91.1559649891290;
 Tue, 04 Jun 2019 05:04:51 -0700 (PDT)
Date:   Tue,  4 Jun 2019 14:04:47 +0200
Message-Id: <c8311f9b759e254308a8e57d9f6eb17728a686a7.1559649879.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v2] uaccess: add noop untagged_addr definition
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
 include/linux/mm.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834ac32b7..dd0b5f4e1e45 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -99,6 +99,17 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 
+/*
+ * Architectures that support memory tagging (assigning tags to memory regions,
+ * embedding these tags into addresses that point to these memory regions, and
+ * checking that the memory and the pointer tags match on memory accesses)
+ * redefine this macro to strip tags from pointers.
+ * It's defined as noop for arcitectures that don't support memory tagging.
+ */
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #ifndef __pa_symbol
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
-- 
2.22.0.rc1.311.g5d7573a151-goog

