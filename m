Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB832014A7
	for <lists+sparclinux@lfdr.de>; Fri, 19 Jun 2020 18:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393528AbgFSQNz (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 19 Jun 2020 12:13:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47358 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2394405AbgFSQNx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 19 Jun 2020 12:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592583232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hHOoOMvKCdAD0ZPNXEYJ7zwb9/Vhd5GoKeFrCVrHadg=;
        b=CyhSPCHVt54UtnD/QX/a2wH3eCSwijFSoQodKQPrPn9SwhEZZF7L1mgUX4ftMQi6Ib1ppV
        e+qHpBZuj3gAQWvzIX5TeJirOgG1A/rJLjj3MBO6MdJAfXw7ufLjCv8DMOB9Qb0PR/ToOY
        2tiXvpS+t7e0bzfpIZilWdNCeudK+Q4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-9icGQpaXPoaKv225gVWz_A-1; Fri, 19 Jun 2020 12:13:51 -0400
X-MC-Unique: 9icGQpaXPoaKv225gVWz_A-1
Received: by mail-qt1-f197.google.com with SMTP id w14so7457742qtv.19
        for <sparclinux@vger.kernel.org>; Fri, 19 Jun 2020 09:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHOoOMvKCdAD0ZPNXEYJ7zwb9/Vhd5GoKeFrCVrHadg=;
        b=rw25VI0TdCQNP0Eq3Mtjop5W7S5Byqcmqy+w43w63jod0VuP8uTpO2ObdG6k+VrYkH
         +TNPxcWMFAOxXje3IuUW026z8765WLWw9LURlctGiDIJgX3s1CF4z2pzmBs2i8ODpgLU
         vjnIhVzbpEqtwpwVDMwQqy17K5e7buyszDXTHZApEX0b4fndLiQhL1P+82oYC9iWESwx
         Ux7MatL9/uGrDOBJ5UFJkyCJC2GPoWK5XaD31DDxC5d28At3mgsFWK25P1wl6edfgbq3
         qbnhbGlhXMNyLV/Uak/2luMHaUzAN7WgHnlOshQT0l1IKu5I3p/P79W/ROrWdDg2cplL
         DhRQ==
X-Gm-Message-State: AOAM532DkMHYeXZ5Geynp7eAHvtlQfDJ3co9BlxxZRbhN6jgDrbTwBKR
        Cxc7ZzZJifRhyJ4vLoAqq25uGJQFfuIqIU8x1xNqFePuzT9qgXOKtxlmVCCvzywdciyGTKIkudt
        KNTz16UMx/pNIlCDFueNCog==
X-Received: by 2002:a37:9cb:: with SMTP id 194mr4168770qkj.456.1592583230429;
        Fri, 19 Jun 2020 09:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlsFSGYwLSHrNQCrtseIMJR1uot4X4VtcHhU1f6HFiKSJmKiiV4hUEBJBylfQ6YO+vR6eJOw==
X-Received: by 2002:a37:9cb:: with SMTP id 194mr4168749qkj.456.1592583230187;
        Fri, 19 Jun 2020 09:13:50 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id v184sm1283720qki.12.2020.06.19.09.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:13:49 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Peter Xu <peterx@redhat.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH 21/26] mm/sparc64: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:13:48 -0400
Message-Id: <20200619161348.9811-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619160538.8641-1-peterx@redhat.com>
References: <20200619160538.8641-1-peterx@redhat.com>
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
index 6b702a0a8155..fe8854d447ed 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -423,7 +423,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 			goto bad_area;
 	}
 
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 	if (fault_signal_pending(fault, regs))
 		goto exit_exception;
@@ -439,15 +439,6 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
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

