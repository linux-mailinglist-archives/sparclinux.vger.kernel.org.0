Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C976020BCA3
	for <lists+sparclinux@lfdr.de>; Sat, 27 Jun 2020 00:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgFZWgk (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Jun 2020 18:36:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52817 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726177AbgFZWgj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 26 Jun 2020 18:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+T4PahBLwp+qMqIXI+a8sKJL/5YpPnDyt5GJ45wieOk=;
        b=Bbl3X+rve91/4f1eQdhvyX7GQiB/1WhukmX1T5gjWtnFssT+87pJ/zIVTWH4rnreBhmz/s
        5s+owkIPdeymoGM/9R6xn7EYobebqlHSQ6aJgaR9kWTaD29Zn0ytUhfAMzZJyyx9nXH4hg
        gIJhxp1DpMq0gwqt7P5iVmLzdmRk9mA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-vO2QdBVEOoGMBGZAeQL1UQ-1; Fri, 26 Jun 2020 18:36:35 -0400
X-MC-Unique: vO2QdBVEOoGMBGZAeQL1UQ-1
Received: by mail-qt1-f197.google.com with SMTP id i5so7566349qtw.3
        for <sparclinux@vger.kernel.org>; Fri, 26 Jun 2020 15:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+T4PahBLwp+qMqIXI+a8sKJL/5YpPnDyt5GJ45wieOk=;
        b=CIrkJhLlWuX4p/K7EYzivimjloB2nrHFCvPrDB+05pTQqpDy6yvuTBctX2YXYcEyvr
         M0Mv3O2VRMb4O8H0FLahRso6zjAQ+jt2UXnVnxOOQKZrcOr6iXy0pCOc1Nx0flYloNjm
         BEyM3/umOtJ8sQqibCz9bxbfspWrOvEIHEOXGExNN5UCWfcjBuL1mewuG0gYerXpWUkL
         MM4dUz8f1BavKkhMxV9UtJqRUDrBJ3yIrRinSneivkczjlJ01U2MfU8Sf6INX8gOU0Vf
         fJTOGZ88iyVKjvJg3HJmkUva9Jn3c+fqLkhmeQRsCzri3SV4pWMlyYIwzG0yHqEtVhpO
         QzwA==
X-Gm-Message-State: AOAM5307so8vCvrhAZv5xMeWtPwxSR73d8wwNNaOD1inhACriCdi3Q3j
        IcadcQgZKQXMkRM8d8Pvxr3BIlCLltfQhh7zz+Wi5fk4qlFDTsG+O9E7FTn7SMkplZdPN1pD/ay
        oI1xAI4rzLevh33nvP2da+g==
X-Received: by 2002:a0c:b5db:: with SMTP id o27mr5409109qvf.205.1593210995311;
        Fri, 26 Jun 2020 15:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlD82Q8cmc5NmNE8445OCDFJdhANJej0rzVbZKfEZCyzpK7wCQulyA+sPy13MiOQo1jaWdnA==
X-Received: by 2002:a0c:b5db:: with SMTP id o27mr5409095qvf.205.1593210995113;
        Fri, 26 Jun 2020 15:36:35 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id s71sm9636682qke.0.2020.06.26.15.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:36:34 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH 20/26] mm/sparc32: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:36:32 -0400
Message-Id: <20200626223632.199958-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Use the general page fault accounting by passing regs into handle_mm_fault().
It naturally solve the issue of multiple page fault accounting when page fault
retry happened.

CC: David S. Miller <davem@davemloft.net>
CC: sparclinux@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sparc/mm/fault_32.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index 61524d284706..542bf034962f 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -235,7 +235,7 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -251,15 +251,6 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	}
 
 	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_MAJOR) {
-			current->maj_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ,
-				      1, regs, address);
-		} else {
-			current->min_flt++;
-			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN,
-				      1, regs, address);
-		}
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
 
-- 
2.26.2

