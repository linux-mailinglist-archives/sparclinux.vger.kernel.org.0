Return-Path: <sparclinux+bounces-4632-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16555B3EFF7
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 22:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04871A864A0
	for <lists+sparclinux@lfdr.de>; Mon,  1 Sep 2025 20:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C2727A93A;
	Mon,  1 Sep 2025 20:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="RqAwSCd1"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38527A10F
	for <sparclinux@vger.kernel.org>; Mon,  1 Sep 2025 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756759844; cv=none; b=fbpKSwzJP/K0XX1iv5C9Fsh6zFVaSDxlwpavN/TUi4QhAeWS4yCE4B//HWiVZZwJzz8EuUonG3sZq12r5SpuFXqovIjfTt49BgQXYQFJznzYdQBGNB1rCq9VQyexjroF5KmoySoObZAF7lY0YiCdVWMVhI63yALfVjTB4p/thRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756759844; c=relaxed/simple;
	bh=mdsrJUeGrkHnP8zL/eyQeyjJ3gnG2ENBLTOi4VtzzWI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiNlQgZQbqFJ3tkpsJ+TPYEoACw2BVXxyeE8ugOltMD/ytfu/tAFYvdI1thLR/cs5g9Vx0hE/axHeA+JnaUR0UnbzA1BZAUlF3D2pU8sIjOKSKMkSLhvaLHcOKGUnlOPSnIMSXMiNkNbpEohIGpVZm9bzXMQPSqCMpyPY4wT+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=RqAwSCd1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aff0775410eso453674966b.0
        for <sparclinux@vger.kernel.org>; Mon, 01 Sep 2025 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756759841; x=1757364641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbC8N+XiHIHVwpnYZGh3ddN7VzXCXgVoQGtIXVqNTy8=;
        b=RqAwSCd1/MuaH+RNfTQfJif/LUGNnb9+rRIeKmCE5gnIsAPL/QtpEw9jteEXBRg05P
         QbqDNV6IDuvYXvEzLhen9SU34igihvQEZEVcHV3cg5KCfbCpfT01SiZXYWFGNTBKD7xM
         Py+HlZzjhr+6Po5dPKpWKUvZVpEKbiNwEDzMdqEih1P1yiS9Y6eA277wuTIE9H++kXb0
         sn8hJrKBzDp7bK4ffQ37BpnMvwqA5BXpj/l5yO4UZ38YOGd+PD0l7R0Xp+sIaPsYntod
         zGt0Dtzei/Z6r8vFxt4C8/yDUuBS0WOPJdI0C/ypqTRxoaxz27nONjh0FPC+BdRsM+Wn
         qRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756759841; x=1757364641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbC8N+XiHIHVwpnYZGh3ddN7VzXCXgVoQGtIXVqNTy8=;
        b=GaDkbIk6shKsD8yFaxnSSRuOdjkx2sTxMoYtkSEITiC9yJ5VnfbqhjWzUG0LB/p9eu
         eA6GyZuUZ6JNJGQKAbhRSJGc3ZAhnd1CiIrzWOnpi2P406VmnMzwuypMk6avSBcmV6/P
         ldbrT2dYzgrb9h9XgmZKLlM6B3RHxJ/2AQXZ81cXDF8DDvClsFaHOmmfegJSxkDSSukZ
         nyYdmDdDcIyZqx4F14ridnuxke9qVIaSMgiB6q3itDDqXotujCS4kl5gNRHeaaUmB0dO
         0tACJXfT5WE62J/MbwR2e9huIcgrTq+xF80GYhb5A0W0pi8pa9L4aaifatMbbswGxwBw
         r+ow==
X-Forwarded-Encrypted: i=1; AJvYcCX3SNGlBLORs2S9G70DbcmU52/0u8iNetNruM9lqmsVfujtHriBEGiMGfbuCk6VFXGnucu+vfTASNgM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywok+vXXXkNsMsdq7vkm6s1X1aADGkl6oy2AXzdL31Foj7z9EbP
	Qphu4kaKdXnwtN9GiKL7lvOX+09awpou7XKUwcy1EYAZUqVMAZ/NtW3Cl/BZSgJ3U7g=
X-Gm-Gg: ASbGncsF1wvDaG0DBIo8awX8cKIgCSdmRFs6FZL7rzxu0wBo0GEXjk1Ez9jsp18sJ3k
	otZt22AvDIb0zTRnOcDPisbGzjZzpARxK8sLK2w6VV7iZVmeLvxgvyUjX2guyMM/bE6allLlJZ8
	HBPR9/pxwP2XszwrANwmEqa/Eak3Uzq7DmrD4yEp+5rdyMbCp8WJPgqkp8ddS+a8ekke62aj1vQ
	CSw6LF2tPgj0KFYKacg2uj93aU0E/xYVJWvS/DROlkis6LhtFPU0HFyoE+0haFQulgav3NuM+bq
	LZNKR1hRF8R6mYdnlfXO/hCUIm4PaTq6Udi4PQMb6TxqBzCGdIPSMZiFuIo/bqqfQTpfvd0ai3E
	ccAuGZyyi+dYSUu/iC5dCqe3E5qbrmDkbqs57Z8SKQZ7vswud/AAL9Nd2GXFtO95ADwpJ23+RiG
	szaX33JDDoiguQOPBUbLBJg6Vo3h2Y0eJ3
X-Google-Smtp-Source: AGHT+IFaWDHYij5j1CBdsPx53clPCy+ttl9kO3s+0ZW4mKhtLHQkGphieDUSAGfH3AkYqVOXY7BH3Q==
X-Received: by 2002:a17:907:6d28:b0:af9:21ed:6ebe with SMTP id a640c23a62f3a-b01d9754485mr912367266b.21.1756759841055;
        Mon, 01 Sep 2025 13:50:41 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f1d0f00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1d:f00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm937339066b.69.2025.09.01.13.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 13:50:40 -0700 (PDT)
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
Subject: [PATCH v6 07/12] parisc: constify mmap_upper_limit() parameter
Date: Mon,  1 Sep 2025 22:50:16 +0200
Message-ID: <20250901205021.3573313-8-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901205021.3573313-1-max.kellermann@ionos.com>
References: <20250901205021.3573313-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For improved const-correctness.

This piece is necessary to make the `rlim_stack` parameter to
mmap_base() const.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/parisc/include/asm/processor.h | 2 +-
 arch/parisc/kernel/sys_parisc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 4c14bde39aac..dd0b5e199559 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -48,7 +48,7 @@
 #ifndef __ASSEMBLER__
 
 struct rlimit;
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack);
+unsigned long mmap_upper_limit(const struct rlimit *rlim_stack);
 unsigned long calc_max_stack_size(unsigned long stack_max);
 
 /*
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..b2cdbb8a12b1 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -77,7 +77,7 @@ unsigned long calc_max_stack_size(unsigned long stack_max)
  * indicating that "current" should be used instead of a passed-in
  * value from the exec bprm as done with arch_pick_mmap_layout().
  */
-unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
+unsigned long mmap_upper_limit(const struct rlimit *rlim_stack)
 {
 	unsigned long stack_base;
 
-- 
2.47.2


