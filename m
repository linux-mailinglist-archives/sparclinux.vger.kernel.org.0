Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FB61FA37C
	for <lists+sparclinux@lfdr.de>; Tue, 16 Jun 2020 00:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgFOWXy (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 15 Jun 2020 18:23:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44309 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726538AbgFOWXY (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 15 Jun 2020 18:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592259802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jqMMZBxWd6hyp1UyBnh6ZHWn/4PP621jPkJ/KevHqC4=;
        b=ZJlSCPiJRzeBu2W7HsbfzyzY2V9bN5jGMrtQ9kk9iyPxRiRMv+qPh7mpSuvOfVU/nLalDl
        PEvxZzk5mzbYznnduNHBvB0+EurnfQ99E83zzAPbdWIyGgKhWjVrHHOM4gqdC6DP1nK0Eg
        qHEVb085Dn7nC6VyugGnwXAyCOSGWtA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-S8sC4sD1MKOEAx4YxTIaZA-1; Mon, 15 Jun 2020 18:23:21 -0400
X-MC-Unique: S8sC4sD1MKOEAx4YxTIaZA-1
Received: by mail-qk1-f199.google.com with SMTP id p138so15398029qke.7
        for <sparclinux@vger.kernel.org>; Mon, 15 Jun 2020 15:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqMMZBxWd6hyp1UyBnh6ZHWn/4PP621jPkJ/KevHqC4=;
        b=lIsYB98YDyEf67DD7BvLvMavDCc3x/tEltp5wvRTJg+cNyWlPuT8yBe9wxGJF4NgUn
         EH4HS5fxcwqrYi2BsYbv2Qdf8CWfL14oBNhAULLN06Gnka7ymQv+LLzvHKz+fK4T8L/x
         JQyao97gKSVgl8gaL78gp+ggN7GMsVLjm+sYFWwCQj3ioYzdDu9QFvKxtUpuwDLSIeDz
         oNumM5ZVj7Gk94FMQ3zwMtHoZ0aO9nxqI4/Np7gB74d1j5gqWls4ze/V4mmMsYGlGi2e
         0Ib/+EOHPBXnpPuIHMUlof4xnSE3fuc0WA7q/OEti4QN8iTQHZRfocm6QC3Gf26HO5mO
         TpUA==
X-Gm-Message-State: AOAM5337pmofg3KGoUuLfwhXtDPAicBWJS00fNiQbXjIICIOy/jcawUA
        20fy0oTvXZswuYVPb+A5p8Ycx6mXw+sqRw9k7X3SNLvBOFc/U0w1AipzGUeg7eI3dgIA7YtxfJc
        lkJUtKH6p+yNz5SaN92CoJw==
X-Received: by 2002:ac8:7303:: with SMTP id x3mr17706234qto.44.1592259800788;
        Mon, 15 Jun 2020 15:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSUb5XIZHW5E1zJcz4VzqFpZD90tEroXjdCFUGU0zNGGOM8YwfFLC116uqeodWPbF2zjxDTA==
X-Received: by 2002:ac8:7303:: with SMTP id x3mr17706219qto.44.1592259800592;
        Mon, 15 Jun 2020 15:23:20 -0700 (PDT)
Received: from xz-x1.hitronhub.home ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id b24sm12209333qkj.0.2020.06.15.15.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:23:20 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Peter Xu <peterx@redhat.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Subject: [PATCH 22/25] mm/sparc64: Use mm_fault_accounting()
Date:   Mon, 15 Jun 2020 18:23:19 -0400
Message-Id: <20200615222319.8601-1-peterx@redhat.com>
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
 arch/sparc/mm/fault_64.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index c0c0dd471b6b..61be0a0d79c6 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -269,7 +269,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	struct vm_area_struct *vma;
 	unsigned int insn = 0;
 	int si_code, fault_code;
-	vm_fault_t fault;
+	vm_fault_t fault, major = 0;
 	unsigned long address, mm_rss;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 
@@ -317,8 +317,6 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	if (faulthandler_disabled() || !mm)
 		goto intr_or_no_mm;
 
-	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
-
 	if (!down_read_trylock(&mm->mmap_sem)) {
 		if ((regs->tstate & TSTATE_PRIV) &&
 		    !search_exception_tables(regs->tpc)) {
@@ -424,6 +422,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	}
 
 	fault = handle_mm_fault(vma, address, flags);
+	major |= fault & VM_FAULT_MAJOR;
 
 	if (fault_signal_pending(fault, regs))
 		goto exit_exception;
@@ -439,15 +438,6 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
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
 
@@ -461,6 +451,8 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	}
 	up_read(&mm->mmap_sem);
 
+	mm_fault_accounting(current, regs, address, major);
+
 	mm_rss = get_mm_rss(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
 	mm_rss -= (mm->context.thp_pte_count * (HPAGE_SIZE / PAGE_SIZE));
-- 
2.26.2

