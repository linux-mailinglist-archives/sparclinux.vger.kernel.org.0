Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB436217B59
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jul 2020 00:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgGGWvV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 7 Jul 2020 18:51:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50680 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729742AbgGGWvC (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 7 Jul 2020 18:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=goLnSgg43tg59jYNEWM6oaQtVeQ81wyjekL4b1iRhCw=;
        b=HWI0SCETIKWO6lFhXtY7HVlOdKVYg6f/TkFh5KlzcgOGxFe/uVA0cUaYDAkZlLeBAlmlPA
        bZfXjQzeCF4bYOBL/9YZ/P09nEmigYFiT6spmKPwfzHRcsgJE884+FInO9lKCZsx4posMl
        IjhHpwaCLWTRqbGrLdJU2Hal3ZV20Dg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-lgt0VzKkMVyKNjc4R95tVA-1; Tue, 07 Jul 2020 18:50:57 -0400
X-MC-Unique: lgt0VzKkMVyKNjc4R95tVA-1
Received: by mail-qt1-f199.google.com with SMTP id t36so13853021qtc.16
        for <sparclinux@vger.kernel.org>; Tue, 07 Jul 2020 15:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=goLnSgg43tg59jYNEWM6oaQtVeQ81wyjekL4b1iRhCw=;
        b=ihd9/UAA8XayvxJNRBt1ZLoPs88Ljky905NaiTpNkmaNUGA3Jk9fKpGPo8it6GiBCM
         a8MLHqqovxPjdAABVT5i3YmO24XmKvjrA5lmgoanbK0kfy/bSPT7dkCiyHHLpbHxSVDn
         5p/0cALHxfRYwH+esMMtwbAyvLHjvirgIjt3C+Km8+aXz0Z/vaU124M26cR3hCMS2fhr
         MTDCaPXq0hYyBHAF7NEnPsWnRrwKOZ4YZv90oD2vygvkeyo8TO0lyn5spLhCXF0cXEwz
         QzPUyagVu4YNEQfjLslFYjdT2y2HYDczIBi12jFB7ldaSgk3rEm7rkEkTYNugxYfDW5d
         3zUQ==
X-Gm-Message-State: AOAM530r87JLaQWhecfxGf7i/yzxmryvzT1GuUOBYViz+F4QBYcOmfwh
        vb+IoUsS8B8g8ltlov6j8fPvFu8Qfh7aHjlwH6U4JCu11DCd+tyzO5R3GPg58ygtzIHzdoIfhlA
        NxcAZuFj2dpu4OknbhqgTFg==
X-Received: by 2002:a37:c246:: with SMTP id j6mr51752075qkm.444.1594162257352;
        Tue, 07 Jul 2020 15:50:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/jy6TEpSsbY6d9HXsHHh/wU6lHsQhKJI3A8F2vFrC2VOLnGIMx4NbmWJ0GFeoTMgVhdK5UA==
X-Received: by 2002:a37:c246:: with SMTP id j6mr51752065qkm.444.1594162257119;
        Tue, 07 Jul 2020 15:50:57 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:56 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        peterx@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH v5 20/25] mm/sparc32: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:16 -0400
Message-Id: <20200707225021.200906-21-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707225021.200906-1-peterx@redhat.com>
References: <20200707225021.200906-1-peterx@redhat.com>
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
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/sparc/mm/fault_32.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index 06af03db4417..8071bfd72349 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -234,7 +234,7 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		return;
@@ -250,15 +250,6 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
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

