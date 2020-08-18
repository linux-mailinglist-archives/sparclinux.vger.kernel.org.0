Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97E5247CA1
	for <lists+sparclinux@lfdr.de>; Tue, 18 Aug 2020 05:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgHRDRy (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 17 Aug 2020 23:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDRx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 17 Aug 2020 23:17:53 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA78CC061389
        for <sparclinux@vger.kernel.org>; Mon, 17 Aug 2020 20:17:52 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y9so20669465ybp.8
        for <sparclinux@vger.kernel.org>; Mon, 17 Aug 2020 20:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ENjwI+c+9h49Vg4hokOWFeyLCpVfxOCw9YeA7/aKyFw=;
        b=igsq2uyS+1lU/jnGPjU3ESSv2UrhEB2eJV5tp6qGMNaAoYl84icAKEqdRSb29JCnl3
         pzw71lQfvpRXXA7HDLHbctaHvW43Sa21DOnTuYFxMolGxDHvFaE+je+d/HpKh6vIwQc8
         OYLVNVPzGJ2/j+fkzvodIo1hWsSlUVDz4JnElGl9VDTnU5kod3HksozK7FTb2F7+7gHl
         PMKfcfDbX36a+urDoDIZ6S7ha+2FKihf2tB+FvLhL6/UQNxr0NDJUJnnbmb2f2968n6D
         vTHzl0NMMmJ02Wn2PL9Z1O211u46lNfUCD95FDo9S16hK0bPInosxbo9T/WpR5pndcCA
         fEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ENjwI+c+9h49Vg4hokOWFeyLCpVfxOCw9YeA7/aKyFw=;
        b=RAQQw7Kz+QjYOBDUejUfk4gXgmTgpwRgNDfqs0ZEWTxpJYQTCQ69cQDi9LTuJKSXdY
         B9xozweL+RBU76lJII2/YBXvRjd5mOQm2iKzgNnuvErVtlAZ1C7KpWOO0gvRBHxwCJVT
         tauz7SqIXEm0qU/TURJuOFtQcgB0IIEkzaYIezbpGT0OTMGdqtHbOHHCojGHAmemXgxN
         +LABacF9J5iYsc7qsqGVmAzEzJLSr29ZDeSkOUMdSCL0ZXsUCzNtVlHGjIMxx2G01gZX
         iM+BQDGPk03augiwqZnQMMd2jY4wDtR5HN+7bnXhF0chuWfY08b1rzNC+gpRcjqtdWHO
         WVbg==
X-Gm-Message-State: AOAM532DokOCNb0+K7RjR6+ydFzEXKwwT0IwOOzHJcyvzZWZj5Ly9YYh
        tk13N3r4rlH2yIw6BfIagsuUrU4=
X-Google-Smtp-Source: ABdhPJyJ+ZOgnizM7R0AlzdY8I9RIzBNAjBQTwT71hBNL4ma6tJ2dG8IC87K7WmyydbhfHgPin8+hz4=
X-Received: by 2002:a25:5557:: with SMTP id j84mr25446258ybb.461.1597720672051;
 Mon, 17 Aug 2020 20:17:52 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:17:45 -0700
Message-Id: <20200818031745.393056-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH] sparc: remove SA_STATIC_ALLOC macro definition
From:   Peter Collingbourne <pcc@google.com>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Peter Collingbourne <pcc@google.com>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This macro is not exposed to uapi and is unreferenced in the
kernel. The last reference to it was removed in commit 4c6773c3954c
("sparc32,leon: add support for extended interrupt controller"),
so remove the definition.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
View this change in Gerrit: https://linux-review.googlesource.com/q/I1db1466b27cf37f84e27379f595029d9eda59374

 arch/sparc/include/asm/signal.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/sparc/include/asm/signal.h b/arch/sparc/include/asm/signal.h
index 827b73a97f8a..28f81081e37d 100644
--- a/arch/sparc/include/asm/signal.h
+++ b/arch/sparc/include/asm/signal.h
@@ -9,18 +9,6 @@
 #include <uapi/asm/signal.h>
 
 #ifndef __ASSEMBLY__
-/*
- * DJHR
- * SA_STATIC_ALLOC is used for the sparc32 system to indicate that this
- * interrupt handler's irq structure should be statically allocated
- * by the request_irq routine.
- * The alternative is that arch/sparc/kernel/irq.c has carnal knowledge
- * of interrupt usage and that sucks. Also without a flag like this
- * it may be possible for the free_irq routine to attempt to free
- * statically allocated data.. which is NOT GOOD.
- *
- */
-#define SA_STATIC_ALLOC         0x8000
 
 #define __ARCH_HAS_KA_RESTORER
 #define __ARCH_HAS_SA_RESTORER
-- 
2.28.0.220.ged08abb693-goog

