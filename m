Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA42014A9
	for <lists+sparclinux@lfdr.de>; Fri, 19 Jun 2020 18:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391946AbgFSQOA (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 19 Jun 2020 12:14:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25992 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2394397AbgFSQNq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 19 Jun 2020 12:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592583225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+T4PahBLwp+qMqIXI+a8sKJL/5YpPnDyt5GJ45wieOk=;
        b=ZLEZhxQjyhdyv2ydo0hQqKOJSBFOiE3UI++1ZNHnlv+0GZocK2lbSo8EikGb4ms7GD9dIW
        vO/jahuqQspheRue9u7hYUYW+Xqs3cr7Jjwqc7KJ2aXMN413fBlEnQz7QGGYxeYSxLXR3R
        eqTNgpvfpZvEE0YOgHfovXa6m8f8aFM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-zVTrzYr1M7-Umsg_HoGLow-1; Fri, 19 Jun 2020 12:13:44 -0400
X-MC-Unique: zVTrzYr1M7-Umsg_HoGLow-1
Received: by mail-qt1-f200.google.com with SMTP id b1so1490529qti.4
        for <sparclinux@vger.kernel.org>; Fri, 19 Jun 2020 09:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+T4PahBLwp+qMqIXI+a8sKJL/5YpPnDyt5GJ45wieOk=;
        b=YxmTkY6QaGaS+jM6O1zMSRMi+YbpcymICQoNd8xgRuS5kdDQwn1S1j7KE14Xpf+IB+
         40SwjyIjKMq0QwyDfHSLpk8HCPd8+wq3swBBULaTTzmYRw4zKyAAaduOBAI9O+ZyNxY8
         MkctGN2MzbbpaFnbP3SixNspNqWYR+3J+IoPKdEOlqkCCHVZON+7TXlwEsPVwrlDhJ74
         dawBXrxyAcJpEi6r03OA4DLA8Zp7t0tVPYXVcxd5mK2SSZ+YxlIvUh2anqIEZB9Vw/yr
         k7WcD2Hllef8XtNAC7uLFZ4rionoYaXu48xN64wzE/6KoFHKF1aU+/Vnsf2Tn+9jt2QT
         nuKA==
X-Gm-Message-State: AOAM532VvR1MkjUC9RS28M3dV5lDYI76evS+xE2TqvvcK7jhvCeUnQWN
        iqq9Obj3KKrunMozaCDqVyC19Iej/N1jhU04Ieas5N2YIsQ/5PoHxk2j93fGmxfy5lhpA7apDLK
        dEREcKW+Fnxy8j9MZJHuFrA==
X-Received: by 2002:a37:4ac6:: with SMTP id x189mr4077389qka.323.1592583223600;
        Fri, 19 Jun 2020 09:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6soZaP4dnoM13q0hEmGSoc9m+CP9QFqBJTTn4uB3sxC+M1N2RbKnkZrYMa4KMFGRLAMCg6A==
X-Received: by 2002:a37:4ac6:: with SMTP id x189mr4077348qka.323.1592583223233;
        Fri, 19 Jun 2020 09:13:43 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id k26sm7453496qtk.55.2020.06.19.09.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 09:13:42 -0700 (PDT)
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
Subject: [PATCH 20/26] mm/sparc32: Use general page fault accounting
Date:   Fri, 19 Jun 2020 12:13:41 -0400
Message-Id: <20200619161341.9762-1-peterx@redhat.com>
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

