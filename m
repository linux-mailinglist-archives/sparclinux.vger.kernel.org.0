Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CD22582CB
	for <lists+sparclinux@lfdr.de>; Mon, 31 Aug 2020 22:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbgHaUjK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 31 Aug 2020 16:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgHaUiq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 31 Aug 2020 16:38:46 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1927C061575;
        Mon, 31 Aug 2020 13:38:46 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w186so1331502pgb.8;
        Mon, 31 Aug 2020 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZXOK8pT3fKKSH66fLd/ANhE16k3B7ecJU+M0aFuQDuk=;
        b=TzB4sWRm6ZAuIrDMdExk+izGYATh9SydohMYQTrP++FOYoG1+4dBkUG8f4Woek1tYp
         kF3g2XaPKsCF+vCk5+bwIwBkI+5mkEmzIKSRawtVeML+y2a0pxCygQt5FBQgD7P6RpTz
         m61TvHvUxyFyXMZfWfyF3GTJMRFC0pdUL0vJbKH5ylNFYASiCxkZ14GYNRXJaNs8zQk8
         YAtlY4Jw9iHSIV2Z4w+hPBR5HrekVcopfxUJObri1kGVk18WRDyvdrEZzb3qsI1Y5vi6
         UDpeKdiDjI9OVZk6CdeTovFqftK4gmPrhYNcPVjU39Fyvre/MvZNLdRYCNGqF8K+Fk/5
         RHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZXOK8pT3fKKSH66fLd/ANhE16k3B7ecJU+M0aFuQDuk=;
        b=i92LK8jDezNc5lXRC+7wC7kB0NJ0Z+ZTBcoWNJlrIgZo+WsyFaX96Z6NbHQ348jc4M
         JtZyX6C0GmPNeXiNXjEB7ip8OGCqbpswfXhPNJPGbe+36yHKgJuIEyibvO/caOaP51ma
         Wowg9sTHAH3wOdVHI/Dlx5LTflY0ar78TLkbr+8Rgg7zZ/mgM0KziBF4+odVq4sbZiRj
         FY78+SuU9mhSPbIMSeI8w5Daosv2E3WHhhxaUSXfLcCfCPs2P+vUlIASHLi1zRL5qOKt
         wcukVttybuSvt9dLZ+O7dTja0wxrhmUEz9hMmDq3ft+2JAdy2N3FwohxKW9x5OyAf7Ne
         y0OQ==
X-Gm-Message-State: AOAM532sNZvYym+dsG62j6V2zQXji20rP7PQysFLsrcuU0+N2Cr0Mnfm
        ta8BBpMLVbyGVsyh+a/iLA4=
X-Google-Smtp-Source: ABdhPJy+FlNIl8ncpj2AvTKaG971rKjgMQJrwIhf+5uTs4aPH7QA8BVHvYV2MQJ05mGYZgFUh2Wmhg==
X-Received: by 2002:a62:2707:: with SMTP id n7mr2567532pfn.38.1598906326113;
        Mon, 31 Aug 2020 13:38:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:38:45 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
        tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, borntraeger@de.ibm.com, davem@davemloft.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de
Cc:     sfr@canb.auug.org.au, hch@lst.de, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [RESEND][PATCH 2/7] alpha: Avoid overflow at boundary_size
Date:   Mon, 31 Aug 2020 13:38:06 -0700
Message-Id: <20200831203811.8494-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831203811.8494-1-nicoleotsuka@gmail.com>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The boundary_size might be as large as ULONG_MAX, which means
that a device has no specific boundary limit. So "+ 1" would
potentially overflow.

Also, by following other places in the kernel, boundary_size
should align with the PAGE_SIZE before right shifting by the
PAGE_SHIFT. However, passing it to ALIGN() would potentially
overflow too.

According to kernel defines:
    #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
    #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)

We can simplify the logic here:
  ALIGN(boundary + 1, 1 << shift) >> shift
= ALIGN_MASK(b + 1, (1 << s) - 1) >> s
= {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
= [b + 1 + (1 << s) - 1] >> s
= [b + (1 << s)] >> s
= (b >> s) + 1

So fixing a potential overflow with the safer shortcut.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/kernel/pci_iommu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 81037907268d..1ef2c647bd3e 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -141,12 +141,10 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 	unsigned long boundary_size;
 
 	base = arena->dma_base >> PAGE_SHIFT;
-	if (dev) {
-		boundary_size = dma_get_seg_boundary(dev) + 1;
-		boundary_size >>= PAGE_SHIFT;
-	} else {
-		boundary_size = 1UL << (32 - PAGE_SHIFT);
-	}
+
+	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
+	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
+	boundary_size = (boundary_size >> PAGE_SHIFT) + 1;
 
 	/* Search forward for the first mask-aligned sequence of N free ptes */
 	ptes = arena->ptes;
-- 
2.17.1

