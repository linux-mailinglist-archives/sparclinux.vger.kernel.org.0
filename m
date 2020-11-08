Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6C02AA929
	for <lists+sparclinux@lfdr.de>; Sun,  8 Nov 2020 06:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgKHFRt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 8 Nov 2020 00:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgKHFRs (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 8 Nov 2020 00:17:48 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1AA2C0613D3
        for <sparclinux@vger.kernel.org>; Sat,  7 Nov 2020 21:17:47 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id c17so5321573wrc.11
        for <sparclinux@vger.kernel.org>; Sat, 07 Nov 2020 21:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkLh0FZVC1l01ZndeEmge2GbTRSpNuP7ms2slDapalo=;
        b=neMv9FZ7D6zt5fes0a16Lk4hMho8WCoK8l+WcdffETz5c0j5ZG8syOrjzH8cV23RXP
         qvHZnkmd5WTWFRrMrtdjdnpitUGm0OOcg7H198zTVfORxTaGbjFi+AsumFU0kBMezyf8
         I6/N3hIhnlOIKeiR1VUuaF95iAUaWk//cmA+gbkzYVwGStcN53lIdcnRg9rnH1Tvn8Hz
         6DzsmP4v1neIqKZaVa0Wt0LRSjAMl+LB8/RdB2N0/PvLECLqGNhOzhO3T6GhfpVAbo0f
         OadJ0iojj6wykJg/XzRYK3n18upfh0JKQfbXH0ymyBucZxr8wBK+xBvIgI4dWTRwdnD9
         oPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkLh0FZVC1l01ZndeEmge2GbTRSpNuP7ms2slDapalo=;
        b=HVnJMtx5GoVr1YzYRMGHKqqxTnkxLaN1pc/VPTDk0N4PbdoW3U9NI+/4DxKaRy9BeY
         9DRaEhO7naf0W6laDz8ZrRtz1NSldhJJpLF49RPdOBTA7CBICLWtiET+KKJ1Sb8Mjiyw
         r9EI6E0M1tbTnhmNXis4gz12MxQhteGFOf0WuYDryHIofs/NlPKhkP16R38i8lnE+8Pu
         MOSdRjSvdf5jOJwltfzI7GWLA+s6biNuAHl9AYUjn1MptXPKd0ikQRWlfR5nCR00XSn6
         Nx5cibzOD8lChJL0t4AF+bUewygrNS9ik2/gqnGH1StDOHzPThdtmkc4mg7X+BxsLSUs
         cLaw==
X-Gm-Message-State: AOAM533/jUEAnJYs9PgFgSTfa6sWBEAubgeQR5VY/IisvX7YaVJk+7uT
        +7ftxhq4vxZGY/p7Dcxz9v/nvQ==
X-Google-Smtp-Source: ABdhPJyLRPHCshJLZDhJvG2kojOfYyN7kR7raWFHc4iZlAx4PxbkKSV9ueJ4U5EVYtnnfQGWnHxnVQ==
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr4509381wro.184.1604812666569;
        Sat, 07 Nov 2020 21:17:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id r10sm8378462wmg.16.2020.11.07.21.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 21:17:46 -0800 (PST)
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
Subject: [PATCH 10/19] sparc/vdso: Remove vdso pointer from mm->context
Date:   Sun,  8 Nov 2020 05:17:20 +0000
Message-Id: <20201108051730.2042693-11-dima@arista.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108051730.2042693-1-dima@arista.com>
References: <20201108051730.2042693-1-dima@arista.com>
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
2.28.0

