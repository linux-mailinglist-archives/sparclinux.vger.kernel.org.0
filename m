Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889D0217B54
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jul 2020 00:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgGGWvF (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 7 Jul 2020 18:51:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42537 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729707AbgGGWvE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 7 Jul 2020 18:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594162263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rPMcfxrEZ236mfezmh1VLu12AnYLZCZwUp1nicTiMR4=;
        b=UHmiCZt9gevQq4dI007uHXwiXYkKXvAHUPaCCkrC9DkaSY0AGJikbS6e14XH/lVl/eLCdI
        k2uWdIRtO9zRVwxIy07h2UIRx/A4XyG8Za6U6MVXMtnxAvhfzcFwk6uS0d+RNhsJ2ffcAG
        YcjFIFHteQfSKma20lcprvhJpHALE4s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-1U01RAjxOSadH2UBglZ6iA-1; Tue, 07 Jul 2020 18:50:59 -0400
X-MC-Unique: 1U01RAjxOSadH2UBglZ6iA-1
Received: by mail-qk1-f199.google.com with SMTP id s5so10848342qkj.1
        for <sparclinux@vger.kernel.org>; Tue, 07 Jul 2020 15:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPMcfxrEZ236mfezmh1VLu12AnYLZCZwUp1nicTiMR4=;
        b=ouy82MMgS+xCdsS5wnQ5ypc8DMJ9C8BurAiYFn2mIwt3EVQGqT8vZU/g8H7WrR2M8+
         EN3dU2z6CkypxLlx19X2OvIwBBuLwKcp9d/ErmtJa50rV9UgIcYTlA7HVCDAENbOXuab
         WGyoVCOQ+bDuwdexV6SeJ+1FcA7tqx2t24GnHJsW5irtMqgWaf1LfeblRB8wo0wzxKwy
         tdocAsSxcbrk3Ze93LNuCYJWJ++5McDPnaJJXQqOja2FzRRwuX235zAmVPhLGIEmp5JS
         /FWHbgt6g+ylz9cuGHLizCO5YQlrxYYQKoO9GVAAamvfEZH+G1FesDt2A64D0oT2zG6v
         6yTQ==
X-Gm-Message-State: AOAM530bVdzw6dKtIUyJQ0Yv3JOugPsOzabGRmvEIcDYzO+hxQKvPTBf
        qnlTuxtyD3fMh178w2Lu0HMra2TQ9oEN0Js28HWadd4qagVsCBeJVCxKqbGqsMbEvjw9NhStCOZ
        5vF9wBY2ZZH/SA404+DFlXA==
X-Received: by 2002:a05:620a:b1a:: with SMTP id t26mr55133333qkg.473.1594162258930;
        Tue, 07 Jul 2020 15:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2J0ngM7MXGA4Cel+DD1H81KUpKJX7/J++AxGaN1fxx6mcf6hQbpqhfEsYybz9zmsLxfBU8g==
X-Received: by 2002:a05:620a:b1a:: with SMTP id t26mr55133309qkg.473.1594162258730;
        Tue, 07 Jul 2020 15:50:58 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j16sm26267642qtp.92.2020.07.07.15.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 15:50:58 -0700 (PDT)
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
Subject: [PATCH v5 21/25] mm/sparc64: Use general page fault accounting
Date:   Tue,  7 Jul 2020 18:50:17 -0400
Message-Id: <20200707225021.200906-22-peterx@redhat.com>
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

