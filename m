Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA9C20FE03
	for <lists+sparclinux@lfdr.de>; Tue, 30 Jun 2020 22:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgF3UqI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 30 Jun 2020 16:46:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53032 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730364AbgF3UqG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Tue, 30 Jun 2020 16:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593549964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nRL7j1WwZNqVLuKE8r33la3T5z/V/hLFvWs36l0m98c=;
        b=CS3vYmRrnlbRdN3ip4BOiXClp2s0SzmCiZexLuMOvyaKCr+ofb05nowFMECJhaHMpHohHv
        Vz1h6BbYyiowz9xnsOqIKCKUDrhHJ/PlQWDow6NEIcBBqCcgOpNjKV4PB51fFlugP6+raw
        HueAEUR6hSlmWzAOfuyfHMKP0sxvoRE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-d-rCmZdzMS6ME_Yj0o_VUg-1; Tue, 30 Jun 2020 16:46:03 -0400
X-MC-Unique: d-rCmZdzMS6ME_Yj0o_VUg-1
Received: by mail-qv1-f71.google.com with SMTP id w18so14602144qvd.16
        for <sparclinux@vger.kernel.org>; Tue, 30 Jun 2020 13:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRL7j1WwZNqVLuKE8r33la3T5z/V/hLFvWs36l0m98c=;
        b=gOFy//hL4/bh1KP9r8wN0aLEedQCF0L0+hbb9VdXLjXMfh5e6JU+Y/r2feup7lZouh
         1xShs9+AChtC9ZJ7vLMFF1fsBwfPVk5yUwbdhC05i63CgmOYp44BpbWigyBH+ME4Nsdk
         8IzURhcXX16CXPHFxAikaZykeLkDWdmque2R0zsYVZcf1UL1ckLEZ+lHYIfLg7xAbiKq
         QgplSKI8IRH3ST/FOc21thyKDEwnpCtouuu5VtrQIAz9V5JkrRrhAbTUlPe0Mf0b3UAD
         av14ZIF+aBOzf56fNBjg0TxP2wyMCUeeYdMr9UdgwDMdCWdaqYszInDnFnz+IJF6jN3h
         p8eA==
X-Gm-Message-State: AOAM5321LtUe1CQze2lh6NuQpR6dhH6UgpSkgXEVSquOb2HaCeZ/EQ6h
        AYeKYerlCx3FPkYwM34WppW41HzcexnvAfl7Wb2hnJhPJKATcAQSqm+ThSijEILUHoabXpXrJPG
        UfPhM22UENx9U+Fy284K89A==
X-Received: by 2002:a05:620a:635:: with SMTP id 21mr22244593qkv.491.1593549961986;
        Tue, 30 Jun 2020 13:46:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlUPsr/W+WeZFM6KWdqEHBVB5RxdLgehVJ6NhUZN7D0mYiZYTZhpM7moIljz6u9XaYXW1fJQ==
X-Received: by 2002:a05:620a:635:: with SMTP id 21mr22244374qkv.491.1593549958835;
        Tue, 30 Jun 2020 13:45:58 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f18sm4467263qtc.28.2020.06.30.13.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:45:58 -0700 (PDT)
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
Subject: [PATCH v4 21/26] mm/sparc64: Use general page fault accounting
Date:   Tue, 30 Jun 2020 16:45:56 -0400
Message-Id: <20200630204556.39491-1-peterx@redhat.com>
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
 arch/sparc/mm/fault_64.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 9ebee14ee893..0a6bcc85fba7 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -422,7 +422,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 			goto bad_area;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		goto exit_exception;
@@ -438,15 +438,6 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
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

