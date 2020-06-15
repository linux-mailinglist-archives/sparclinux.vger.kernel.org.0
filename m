Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF531FA373
	for <lists+sparclinux@lfdr.de>; Tue, 16 Jun 2020 00:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgFOWX0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 15 Jun 2020 18:23:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34392 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726536AbgFOWXV (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 15 Jun 2020 18:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rD6jqofe19p826ewHi4IKOMv32t8zGceLQG6Qi0KA6A=;
        b=D9Jiz/e4jY6C0Zv0VytEiZPchVSQA1Ws1hArjQI3wseoLnQYZHYojCwOBq/VVLpWp8dFTQ
        PJo7W5xjtxLCucoOxTZK8XMSo+ScsVvBpTqzK+NRVed34bzJJs2JXq+ScaJFGd6cHTGSM7
        qALBRz5qG2Z1BWj7OEF38FMOJIAqQX4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-lAJAOGtjPHekLWJEZ2sthg-1; Mon, 15 Jun 2020 18:23:18 -0400
X-MC-Unique: lAJAOGtjPHekLWJEZ2sthg-1
Received: by mail-qk1-f200.google.com with SMTP id 140so15354782qko.23
        for <sparclinux@vger.kernel.org>; Mon, 15 Jun 2020 15:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rD6jqofe19p826ewHi4IKOMv32t8zGceLQG6Qi0KA6A=;
        b=tAdxuv0G2IF4oROIRkHoZ8gftuYbyvv73Q8Dzogt1FE1DHVN9dmHjN3bqIZsRrO1AL
         s3SuwWUM4xApl7VwCVVmON7iHzOv+xgR1E+dvzCuqqHQeTnNxpu3ZHaXtT9tl5eijI6A
         4x6ZpWIdb2dtbSQ05kUO7r3OkJ3DyU976qyCvKhNvlALKYz09MuEMY/UfxyGNtq/F9hC
         cXoPqinYZ+kGYCiO11GjP9ezNQ5oDtS8laRS5r3JFMNahr4HSG03/IRkThDA7uLVoGKS
         cbx8kfvgYUdrxGrO3tPYw+kQ+kbVU3Y8lmVTybRjz7Es4uO6pjs+Y7YFASibYGNv8PcW
         eXWQ==
X-Gm-Message-State: AOAM531Y/WQDm3dm1batVLsG/A6voV/CLE3S5XHyF+l6iOv++xunrk0d
        m9DjWpAtC8j6BxND4QQefhukpr8YLTOqk8DhqMTpCwXhBdreBBApl+SkVQrQ7xqglEpgaECSnr2
        9ALooodh+7KPfLRPVdEV5lw==
X-Received: by 2002:ad4:4c0d:: with SMTP id bz13mr27999612qvb.164.1592259797817;
        Mon, 15 Jun 2020 15:23:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoYFbvQP7f745RiHe5XpfLpFaM5rWW6QJeCE9RJ1UwqB//J+ePvEAngR737a2w3RSMKlY7Gw==
X-Received: by 2002:ad4:4c0d:: with SMTP id bz13mr27999595qvb.164.1592259797560;
        Mon, 15 Jun 2020 15:23:17 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id k7sm12645910qth.10.2020.06.15.15.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:23:17 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH 21/25] mm/sparc32: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:23:16 -0400
Message-Id: <20200615222316.8551-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615221607.7764-1-peterx@redhat.com>
References: <20200615221607.7764-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Use the new mm_fault_accounting() helper for page fault accounting.

Avoid doing page fault accounting multiple times if the page fault is retried.

CC: David S. Miller <davem@davemloft.net>
CC: sparclinux@vger.kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sparc/mm/fault_32.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index f6e0e601f857..299e6e241a1c 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -167,7 +167,7 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	unsigned long g2;
 	int from_user = !(regs->psr & PSR_PS);
 	int code;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
 	if (text_fault)
@@ -192,9 +192,6 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	 */
 	if (pagefault_disabled() || !mm)
 		goto no_context;
-
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
 retry:
 	down_read(&mm->mmap_sem);
 
@@ -236,6 +233,7 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	 * the fault.
 	 */
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -251,15 +249,6 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
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
 
@@ -273,6 +262,7 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	}
 
 	up_read(&mm->mmap_sem);
+	mm_fault_accounting(current, regs, address, major);
 	return;
 
 	/*
-- 
2.26.2

