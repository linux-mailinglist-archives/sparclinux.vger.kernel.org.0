Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4064B20BCA4
	for <lists+sparclinux@lfdr.de>; Sat, 27 Jun 2020 00:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgFZWgl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Jun 2020 18:36:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47776 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgFZWgk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 26 Jun 2020 18:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593210999;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hHOoOMvKCdAD0ZPNXEYJ7zwb9/Vhd5GoKeFrCVrHadg=;
        b=Jx1fABtDUpXzqAgcRu5sxlyEU9/mw5tlFOeevU7166+A/SuhPZWFE0woR+BL5JEjTpOY1c
        UyRcvmyVuftUb14MXKSLP1Hyc1zogKH/bs0rN1yotNIjjnYeqXBwaZ/zWZnagWuX/h1a/L
        Wuqkgf92LFsQ6IgFrz6qk3go+GP9RwI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-wbmti1KGNvisIFGy_E0t5g-1; Fri, 26 Jun 2020 18:36:38 -0400
X-MC-Unique: wbmti1KGNvisIFGy_E0t5g-1
Received: by mail-qv1-f72.google.com with SMTP id em19so1632373qvb.14
        for <sparclinux@vger.kernel.org>; Fri, 26 Jun 2020 15:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHOoOMvKCdAD0ZPNXEYJ7zwb9/Vhd5GoKeFrCVrHadg=;
        b=i021qV9XsH71t/aUZ6TwNUERkrn3BxMkEgawYCZf4h9qA1vftCpohP8u8pE5h3Ppeb
         mG4SlyVsHDCDBcXuV88sv9vQZJHDnsURNcv2JBFw6XScLubuynL/hlXNEuP3zN2ps+Ri
         UgygkGnDVpJ9omdHp/h2OjhOm322+T4H++jAI+N9T3qAEtz1z3ZFiL/9W+6o5YstV1hO
         2AAy618CDo1239IFR+H/2Xc0zlc+lX6Q3j1PwzLicYqR4/hYvCIt+lUsJzkCNk0G+PLo
         uxzxdg9/DUckERFSGGhJXjPg8aLXWJc0NHewUgl+E30OiT27rCuzGJlz1zqr1loteq5N
         Rmmg==
X-Gm-Message-State: AOAM530pOVz4/YKLm0uvoSnCh1qxSHxMZbQ+CGtxM7U3pk2ubkqs1fcP
        iTV8Sc5NVVAlqjlUHa42scfJqwvu68/oL1Uxw+vty46lPxqx+FIpXKT/+Ogja/l8TX7ICUpeCwM
        siNhO55MAKZpe4RrFuUe+mg==
X-Received: by 2002:ad4:57c4:: with SMTP id y4mr5199981qvx.230.1593210997679;
        Fri, 26 Jun 2020 15:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/5lWOLerE4xAFoxX4WH4c6jdmotNqRUcy+IApq6fCmSyWwwC40kou+k60M+HXuwatmhRgOA==
X-Received: by 2002:ad4:57c4:: with SMTP id y4mr5199965qvx.230.1593210997481;
        Fri, 26 Jun 2020 15:36:37 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id c27sm9546702qka.23.2020.06.26.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:36:36 -0700 (PDT)
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
Subject: [PATCH 21/26] mm/sparc64: Use general page fault accounting
Date:   Fri, 26 Jun 2020 18:36:35 -0400
Message-Id: <20200626223635.200006-1-peterx@redhat.com>
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

