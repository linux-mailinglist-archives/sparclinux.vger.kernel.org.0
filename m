Return-Path: <sparclinux+bounces-451-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB986ED61
	for <lists+sparclinux@lfdr.de>; Sat,  2 Mar 2024 01:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1662289F95
	for <lists+sparclinux@lfdr.de>; Sat,  2 Mar 2024 00:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C59723A6;
	Sat,  2 Mar 2024 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkJy23/X"
X-Original-To: sparclinux@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25AC10F1
	for <sparclinux@vger.kernel.org>; Sat,  2 Mar 2024 00:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338644; cv=none; b=e8WmzDNUjbzz3796XMONSnRFLj5eKxOe3lz723EdU3LxZ+VBjFpJl+kh9IOzxAx9xbL/XFMCyFw7CjvH8lTYwIVUpWws3B16/Dd4WVtoIgsWPQGhic/zR7okoLKvCLe9s7roNAkGUPwIqQy9VIxkergdcttANeyyrHhTUaNpbEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338644; c=relaxed/simple;
	bh=Q8lflewJVvOA/SjbcwAPzcjdYdEV2au8S/4Oa3Is2uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ptBZ3qysclddzmImClnnOV60uh+bqd9IHt+TkTj/N2bhRr18woVRt6+gWDaonWlphqgXTLryyAGEYKNyOjra9+CwhUCbJkMotaJ5Vn0cOVvY4PFe/Og+k1fzeyiZa2YSFGAMHTHl7kDasKCroK2VqW9u8cIladrpQ+JxSioLOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkJy23/X; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709338642; x=1740874642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q8lflewJVvOA/SjbcwAPzcjdYdEV2au8S/4Oa3Is2uY=;
  b=KkJy23/Xppt2mUEGmKw7WJgkK7LzmEFXVPSWCPA5cCovOr7ULf8nXix4
   E7KFNg61IIAB6pGxm0UcL8785e7V1IYfEhg5JhxJ8dlkLclCd7E0cmzf5
   BLrHC32LyVey17Y8gI+VbZZMPU7csaeuPp7yGsJ7UtARfeIR37qjBCYv6
   fDzvD2wl+rq9avEiV2kLcq9RpCts3L12oDzO8255jtWZyrqoXSbswZ/GT
   Xz5TTOat9uAyfu+lfyqTYsq2VMQU4QV656FeXzPjEQGJkJhV8RtgtGZMA
   /c+Xp3CEiV2L6OWrLKfxHpmcel5kgOXLS6RerMmyPxZ75kS954EHfIIJD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7715674"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="7715674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8495944"
Received: from thwood-mobl1.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.251.7.75])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:17:21 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: rick.p.edgecombe@intel.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	bp@alien8.de,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	debug@rivosinc.com,
	hpa@zytor.com,
	keescook@chromium.org,
	kirill.shutemov@linux.intel.com,
	luto@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	sparclinux@vger.kernel.org,
	tglx@linutronix.de,
	x86@kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [RFC v2.1 01/12] ARC: Use initializer for struct vm_unmapped_area_info
Date: Fri,  1 Mar 2024 16:17:03 -0800
Message-Id: <20240302001714.674091-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
References: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Future changes will need to add a new member to struct
vm_unmapped_area_info. This would cause trouble for any call site that
doesn't initialize the struct. Currently every caller sets each field
manually, so if new fields are added they will be unitialized and the core
code parsing the struct will see garbage in the new field.

It could be possible to initialize the new field manually to 0 at each
call site. This and a couple other options were discussed, and the
consensus (see links) was that in general the best way to accomplish this
would be via static initialization with designated field initiators.
Having some struct vm_unmapped_area_info instances not zero initialized
will put those sites at risk of feeding garbage into vm_unmapped_area() if
the convention is to zero initialize the struct and any new field addition
misses a call site that initializes each field manually.

It could be possible to leave the code mostly untouched, and just change
the line:
struct vm_unmapped_area_info info
to:
struct vm_unmapped_area_info info = {};

However, that would leave cleanup for the fields that are manually set
to zero, as it would no longer be required.

So to be reduce the chance of bugs via uninitialized fields, instead
simply continue the process to initialize the struct this way tree wide.
This will zero any unspecified members. Move the field initializers to the
struct declaration when they are known at that time. Leave the fields out
that were manually initialized to zero, as this would be redundant for
designated initializers.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Link: https://lore.kernel.org/lkml/202402280912.33AEE7A9CF@keescook/#t
Link: https://lore.kernel.org/lkml/j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs/
---
Hi,

This patch was split and refactored out of a tree-wide change [0] to just
zero-init each struct vm_unmapped_area_info. The overall goal of the
series is to help shadow stack guard gaps. Currently, there is only one
arch with shadow stacks, but two more are in progress. It is 0day tested
only.

Thanks,

Rick

[0] https://lore.kernel.org/lkml/20240226190951.3240433-6-rick.p.edgecombe@intel.com/
---
 arch/arc/mm/mmap.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 3c1c7ae73292..9c8b3d1d7bfb 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,12 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {
+		.length = len,
+		.low_limit = mm->mmap_base,
+		.high_limit = TASK_SIZE,
+		.align_offset = pgoff << PAGE_SHIFT
+	};
 
 	/*
 	 * We enforce the MAP_FIXED case.
@@ -51,12 +56,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
-	info.length = len;
-	info.low_limit = mm->mmap_base;
-	info.high_limit = TASK_SIZE;
-	info.align_mask = 0;
-	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
 
-- 
2.34.1


