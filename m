Return-Path: <sparclinux+bounces-4537-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22663B3DE1F
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 11:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2746164BCA
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A3E3126D1;
	Mon,  1 Sep 2025 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="N0KT0Dfj"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69947311970
	for <sparclinux@vger.kernel.org>; Mon,  1 Sep 2025 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718384; cv=none; b=YwubjTXVuBC0RSmYPZV3BA+1Eck3eqLKDON5rCaYtFibcSmzykpP4g52qee217SaEbfVUCmGpS7M1zqiBcDDzd+RM6C3n0MY+mBVdzJLRz84LvlKyBWvP+51aOUnMsauFeVbvZu/EBarljWpOmBuf7nWQb0SvvZ9tBcRecFxPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718384; c=relaxed/simple;
	bh=xjKHLumFg3ou+aDa6yrrKcxvq//jCLCBP9h3TsB+vxw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQNqOcRHMAz+VDQxtu/bHjWjk2VF9rDY4UFWXMuJvk0IlZ0tcGtDLB/TcPkjkyAA7njx/43vVA7GzgLOlNpsPL6wdcFtXqDsLseRekzHLSm6aFy+KMm8t6ufH7PBlrK+8+sHoTQJOd4P0doa0IlefGuMypCGO6RizKMgMpCnCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=N0KT0Dfj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a16441so635371266b.2
        for <sparclinux@vger.kernel.org>; Mon, 01 Sep 2025 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756718381; x=1757323181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75MLdbHz+6QcCmBzq5cWAq79ueP+J+aGEFpDLtijxG4=;
        b=N0KT0Dfjacc+60fZMQqo08IbLs/A0cNyu1wwLfFD4zPk7SzeQWoQ6CCHRawj+hEPog
         dk8srdjc5xxXMZ1E40ymoctubzoVQnrrMRbJK8s4V/uXvjBFbiQmyN4Rie34c4lifvjQ
         HW/wcST3o/W230yd8MbTeip9EDfTLT9vTEO9oPlwmOOYEiPfhAO/GFMeSHY/rK9gFT6L
         ttSlJhMjuZ/YxICuQtheNjehLeZa+pUPMRPcwI/L4klKrDPtDAbXK5TCe3cSzivCge87
         MDFE+AqvfGpVuziLjxDM11gFagI9WNFMJN6DdmU6wnNstjgmbUv3iJJBNjSEBHMkIzs4
         N30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718381; x=1757323181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75MLdbHz+6QcCmBzq5cWAq79ueP+J+aGEFpDLtijxG4=;
        b=ZR/3ezcVEvlSJ+cCk9dr5PJWAzXFlvtJMQ7SJbk3gGOzbyuo3y+cEW2i3TDZZ7YZmD
         2j3aoo8HRG1qiB0tByVcaB2tSo86/G74UUM/VwIVLSxHxu06OpbTD4CyKdaxghvBVOnA
         d8dPhPI0TVuh4LnNFrhwFV02HqVfD0EwRp58hRt7n5G8t4pI34xf9wOgwbDhBoscFURo
         5GOeqNNJNKLC5KuFDoeTlOvmEuvtApfhIKQ2obVf0VUBIkeHpAk5kwGcilU4eJIeurU0
         k/lPc//bV1usnK9BXR846lfG35DWpVaZaPPqei4bDyrDoOgDBaiWVtNH5z+V7kf2jwwB
         6Jlw==
X-Forwarded-Encrypted: i=1; AJvYcCUEXUUZiqR286+s1MzP4/lg9QLrUiMLy5s5PyATKdwQvGoQxKmNcMm6Y4btuiGXb6iNPqRC4bwHHmT9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRl5cgq2G5eEBUFvpEBVspckMfx2XbHnyaL8xW0VTTGoifAkzn
	dFRkffRCHIumBv1BE+PWL+NvMM97A4MlVHkrI5m6Dk0LI8hmvfIWcDsf2i7znjKL5K8=
X-Gm-Gg: ASbGncspmRp4AWbY+WTH2CKYmag04xPrWSic5M5Ibspslu0XVQQG5k2ECfChvDmWRb2
	vs6ozqDrEmkhvWSZzal8H9WhByDlnJdPCNWjFQxnnwmvsPKKvBtStvOkydlRSKQX/DWMDOyGz+t
	3uf4DZBpdmDujgh3m8fOvi9JNNffMImeTdgn4Xk9xh2SfqD+SSVDOt45R5fPmFIehaOjNIrKZSe
	B96Nce5bs31DH6z5TfPVzvjzjPPBVH9rdplWBTQvusjqbgcIDwmpDqLKfvvPq04xHHDkti3Kmvw
	DuBPS1gl8u+kdQk3nKsNVdjBfKB5ot64n5QHp9gCZOeVxseXKbn65/Spv/VLqtL52qjqqZZLt0v
	QYUgiD8VgVbG+JMtGjgGMIfChqietDJZikgb6xGVc+nGqwWwNU97d88Y7qsYtxT3Dg76R49vaJm
	W1vljPRqZmGRxgNCFvdTCrTMsMT/pwKxVl
X-Google-Smtp-Source: AGHT+IE9e4KQZ2t/2q7PJOIOamK0vKr4Bi6Eegeqy/erHFPooxkrsYfz9WOXXJNB6N/KC23RU22uVw==
X-Received: by 2002:a17:907:3d42:b0:afe:b92b:28d2 with SMTP id a640c23a62f3a-b01d9772e0dmr678214366b.51.1756718380546;
        Mon, 01 Sep 2025 02:19:40 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm541005766b.12.2025.09.01.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:19:40 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	willy@infradead.org,
	hughd@google.com,
	mhocko@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	vishal.moola@gmail.com,
	linux@armlinux.org.uk,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	weixugc@google.com,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	shakeel.butt@linux.dev,
	max.kellermann@ionos.com,
	thuth@redhat.com,
	broonie@kernel.org,
	osalvador@suse.de,
	jfalempe@redhat.com,
	mpe@ellerman.id.au,
	nysal@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 09/12] mm/mm_types: add const to pointer parameters for improved const-correctness
Date: Mon,  1 Sep 2025 11:19:12 +0200
Message-ID: <20250901091916.3002082-10-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901091916.3002082-1-max.kellermann@ionos.com>
References: <20250901091916.3002082-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory management (mm) subsystem is a fundamental low-level component
of the Linux kernel. Establishing const-correctness at this foundational
level enables higher-level subsystems, such as filesystems and drivers,
to also adopt const-correctness in their interfaces. This patch lays
the groundwork for broader const-correctness throughout the kernel
by starting with the core mm subsystem.

This patch adds const qualifiers to ptdesc and folio pointer parameters
in mm_types.h functions that do not modify the referenced memory,
improving type safety and enabling compiler optimizations.

Functions improved:
- ptdesc_pmd_pts_count()
- folio_get_private()

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d934a3a5b443..46e27ee14bcf 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -632,7 +632,7 @@ static inline void ptdesc_pmd_pts_dec(struct ptdesc *ptdesc)
 	atomic_dec(&ptdesc->pt_share_count);
 }
 
-static inline int ptdesc_pmd_pts_count(struct ptdesc *ptdesc)
+static inline int ptdesc_pmd_pts_count(const struct ptdesc *const ptdesc)
 {
 	return atomic_read(&ptdesc->pt_share_count);
 }
@@ -660,7 +660,7 @@ static inline void set_page_private(struct page *page, unsigned long private)
 	page->private = private;
 }
 
-static inline void *folio_get_private(struct folio *folio)
+static inline void *folio_get_private(const struct folio *const folio)
 {
 	return folio->private;
 }
-- 
2.47.2


