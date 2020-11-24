Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8FC2C1A01
	for <lists+sparclinux@lfdr.de>; Tue, 24 Nov 2020 01:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgKXA3x (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 23 Nov 2020 19:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgKXA3v (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 23 Nov 2020 19:29:51 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7085EC0613CF
        for <sparclinux@vger.kernel.org>; Mon, 23 Nov 2020 16:29:51 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a65so1201838wme.1
        for <sparclinux@vger.kernel.org>; Mon, 23 Nov 2020 16:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m/kFRqUqwxijt/DGbS3WOuCvqMr9UHx0WnOtO3sm9XE=;
        b=b54pIT41AYJZEExrHBSx9U6mfbeW+EjiTmxg3rqOzonVYS+1OcU+vD34fyG5Gpi1ca
         257/tXsGXDh+xOjHQ/x/O/XiqQcsExngL27Earq8QRMU+TECAMsfdOI4rMRDeOB65jUX
         TJT2H/+ujKc3g2moWNQiS4R/cPj6Y3YMytVuQWuqwaLGMC9SqbJZbbaNFlb04t1EJJ6X
         KFFRrIr6NxK+jEsFzqA5RDzbo4N9dF7COi3ZjoFYCSeax3nnDqJnkhHUFYbatZhxHBGR
         1vFSIR2fU19xnpxi/v01k+dX1EXVcuCQxBoog+hbJUgfkRGeeV59dmqGVM62tpvBaKgr
         MgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m/kFRqUqwxijt/DGbS3WOuCvqMr9UHx0WnOtO3sm9XE=;
        b=ZhFTwe3bgYHVFzilZUWT6J/aTQzTxpRaev42d5E328DLMu8SfdeEneKyNsV7hQmB84
         Y/+3oRik/jZhAiNFOjJBVTyJqJZB6KYhxvikfBG5rURpcgebQRadropUscth//lFAceZ
         IBXYI32hzzbxWZceEdIk1pyVVRRWQmPlLjbxWIZ6fA9+kgY0Pr7scBqK6RR6vuBiqM83
         zsOt8i5GiZN6No7n2uSGScZDYmNZ0y6xMmTPKe+4ishyCyLUV7muI64RV84ljoixPsUM
         cKWmIJrZ4Gaw/mOUCWmWEeoYNCC7UROhqyfuWWbY4f4aEUWNNC0xIZlZagMRn3PjR+Y6
         p/Mw==
X-Gm-Message-State: AOAM5316Y9Itd9isBftG2KysELDebmF+8Udc6pl70H46bZEzsIM1dhkT
        Zo/nS6yMg20pivhnnfv0b79vPw==
X-Google-Smtp-Source: ABdhPJxxJF3XMzaU9a8FkG0PfgkwlbKF5WIGqMSsecPkybQrZkYA+btTNXLgry0Ef11zEbtDNHZh1w==
X-Received: by 2002:a05:600c:2197:: with SMTP id e23mr1406145wme.42.1606177790120;
        Mon, 23 Nov 2020 16:29:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id c6sm25047360wrh.74.2020.11.23.16.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:29:49 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH v2 10/19] sparc/vdso: Remove vdso pointer from mm->context
Date:   Tue, 24 Nov 2020 00:29:23 +0000
Message-Id: <20201124002932.1220517-11-dima@arista.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124002932.1220517-1-dima@arista.com>
References: <20201124002932.1220517-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Not used any more.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sparc/include/asm/mmu_64.h | 1 -
 arch/sparc/vdso/vma.c           | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/sparc/include/asm/mmu_64.h b/arch/sparc/include/asm/mmu_64.h
index 7e2704c770e9..8e7892890d14 100644
--- a/arch/sparc/include/asm/mmu_64.h
+++ b/arch/sparc/include/asm/mmu_64.h
@@ -111,7 +111,6 @@ typedef struct {
 	unsigned long		thp_pte_count;
 	struct tsb_config	tsb_block[MM_NUM_TSBS];
 	struct hv_tsb_descr	tsb_descr[MM_NUM_TSBS];
-	void			*vdso;
 	bool			adi;
 	tag_storage_desc_t	*tag_store;
 	spinlock_t		tag_lock;
diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index bf9195fe9bcc..255e052223ca 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -389,7 +389,6 @@ static int map_vdso(const struct vdso_image *image,
 	}
 
 	text_start = addr - image->sym_vvar_start;
-	current->mm->context.vdso = (void __user *)text_start;
 
 	/*
 	 * MAYWRITE to allow gdb to COW and set breakpoints
@@ -418,9 +417,7 @@ static int map_vdso(const struct vdso_image *image,
 	}
 
 up_fail:
-	if (ret)
-		current->mm->context.vdso = NULL;
-	else
+	if (!ret)
 		*sysinfo_ehdr = text_start;
 
 	mmap_write_unlock(mm);
-- 
2.29.2

