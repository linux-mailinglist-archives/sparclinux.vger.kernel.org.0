Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B117020FE09
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2020 22:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbgF3Uq2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 30 Jun 2020 16:46:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28647 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730345AbgF3UqA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 30 Jun 2020 16:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZuPZYk0Ns+MCrJXk2nN23I5YsKRR2oHib+g0ZYAxJ90=;
        b=VQvwHFLgKDAc6bUYwQ7HFKFS0wgCWMkyTF/3IXnYaaSgtATxjHPNBempQWg4cnt25qSE66
        yszPWtXm5DEH21WVD0Z63W4wsDijjrl5uRbsQnB9dtP5C6YgMSp9/ya5bHToFQ65PfJIWw
        /G5oyAbi4LraJ073m3ujJTLSiIAMajA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-CykMtK_IPv2KHvmqzGHTvA-1; Tue, 30 Jun 2020 16:45:57 -0400
X-MC-Unique: CykMtK_IPv2KHvmqzGHTvA-1
Received: by mail-qk1-f200.google.com with SMTP id v16so5292533qka.18
        for <sparclinux@vger.kernel.org>; Tue, 30 Jun 2020 13:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuPZYk0Ns+MCrJXk2nN23I5YsKRR2oHib+g0ZYAxJ90=;
        b=miNYL2Uy2fgK+iakvSiUgwJ3Jx6W4XJa2JaB9MRpD1Ti6RdGAYE0gh4whn7Ejo32c8
         Hchjd+W7UGN7SrnQHk2BRJaO455aSOihdMO1ZkZrLpLomMM0usH1ROUoFavP2ZWAMOQZ
         BBDjAzP1UOxlmgF2sJSP+xK6VOKd1Ed+y+zzVTStrNam/sF+Kzl007LBFMqcphj7ptgq
         6x+CJWp1GWsGkIdUGCXO9vyxWZKXFnInfwRw4x3JVHu85Go02H8Xcl45p62Ohj4jMNl9
         ikooX+srtoKbC+zaj30uhGB2RnY4th0XQ/ErrHyjwckdFk3kbv9Nk2TYokLksyXtc5+L
         c1zg==
X-Gm-Message-State: AOAM531sFh0BfjiN7hdzeyKakkjAl+TiNGqzWDwnxBq7DbGdH7PEErOX
        yFuXEZfMOYty4mWR416r5/18+04u7IuDnHhMuv458XiRTTaOp0bS3c6zjU1M41hS/fF51lvW6+P
        dc8ZcXggAttldCzk3YnZvTQ==
X-Received: by 2002:a05:6214:1586:: with SMTP id m6mr20808921qvw.171.1593549956467;
        Tue, 30 Jun 2020 13:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNcVTxS1nLn72PqQ6RmcgCA2jlQ+iPsG1/Q8+SmC7pwUxqSCsBS9tibh2g1OtZBBb74J0RnA==
X-Received: by 2002:a05:6214:1586:: with SMTP id m6mr20808902qvw.171.1593549956202;
        Tue, 30 Jun 2020 13:45:56 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id v184sm3850652qki.12.2020.06.30.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:55 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>, peterx@redhat.com,
        John Hubbard <jhubbard@nvidia.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH v4 20/26] mm/sparc32: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:53 -0400
Message-Id: <20200630204553.39442-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
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

