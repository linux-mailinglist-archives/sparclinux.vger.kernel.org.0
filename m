Return-Path: <sparclinux+bounces-4678-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2FB43C3E
	for <lists+sparclinux@lfdr.de>; Thu,  4 Sep 2025 14:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8A2173251
	for <lists+sparclinux@lfdr.de>; Thu,  4 Sep 2025 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6085B301029;
	Thu,  4 Sep 2025 12:58:25 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DB33009C3;
	Thu,  4 Sep 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990705; cv=none; b=CxJJxkFRQ6CfiIEP5bDNltX4rpC3S9TLV+uQGTNVI/lGVRaGXZRb6NGaGf49NQr7CZ82b5b8Wq8YH0tqnESZo4vuXt60vi4vySCSZJn5MUyUqR1WXD5WauE/DKSIW2LJhGYvt7g89XS4lZAkPEmCSTYvKZ2yBHfBCfoLituA4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990705; c=relaxed/simple;
	bh=jB8A4olDfnmsrn7GuGHJyBSY1MAa++JEV5h6wbhXk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJF9R+AhIW+zeVRn7doheFxfc5kBaJpZbGZYP+9gbepfJNrnKWRdKHxdZ0BJzm51DqNxYUh/MAEwLZ17YtG3iXSser1u+Kj4AjKgUMIDKZHz05qXBIzwKimzxMQIg6pDsJTErTX9K/kJKU8mqGCyFP1lhI1GmyjPVJTE5bEKEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F7181756;
	Thu,  4 Sep 2025 05:58:12 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684763F6A8;
	Thu,  4 Sep 2025 05:58:16 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/7] Nesting support for lazy MMU mode
Date: Thu,  4 Sep 2025 13:57:29 +0100
Message-ID: <20250904125736.3918646-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the lazy MMU mode was introduced eons ago, it wasn't made clear
whether such a sequence was legal:

	arch_enter_lazy_mmu_mode()
	...
		arch_enter_lazy_mmu_mode()
		...
		arch_leave_lazy_mmu_mode()
	...
	arch_leave_lazy_mmu_mode()

It seems fair to say that nested calls to
arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
architectures never explicitly supported it.

Ryan Roberts' series from March [1] attempted to prevent nesting from
ever occurring, and mostly succeeded. Unfortunately, a corner case
(DEBUG_PAGEALLOC) may still cause nesting to occur on arm64. Ryan
proposed [2] to address that corner case at the generic level but this
approach received pushback; [3] then attempted to solve the issue on
arm64 only, but it was deemed too fragile.

It feels generally fragile to rely on lazy_mmu sections not to nest,
because callers of various standard mm functions do not know if the
function uses lazy_mmu itself. This series therefore performs a U-turn
and adds support for nested lazy_mmu sections, on all architectures.

The main change enabling nesting is patch 2, following the approach
suggested by Catalin Marinas [4]: have enter() return some state and
the matching leave() take that state. In this series, the state is only
used to handle nesting, but it could be used for other purposes such as
restoring context modified by enter(); the proposed kpkeys framework
would be an immediate user [5].

Patch overview:

* Patch 1: general cleanup - not directly related, but avoids any doubt
  regarding the expected behaviour of arch_flush_lazy_mmu_mode() outside
  x86

* Patch 2: main API change, no functional change

* Patch 3-6: nesting support for all architectures that support lazy_mmu

* Patch 7: clarification that nesting is supported in the documentation

Patch 4-6 are technically not required at this stage since nesting is
only observed on arm64, but they ensure future correctness in case
nesting is (re)introduced in generic paths. For instance, it could be
beneficial in some configurations to enter lazy_mmu set_ptes() once
again.

This series has been tested by running the mm kselfetsts on arm64 with
DEBUG_PAGEALLOC and KFENCE. It was also build-tested on other
architectures (with and without XEN_PV on x86).

- Kevin

[1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/
[5] https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/
---
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jann Horn <jannh@google.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
---
Kevin Brodsky (7):
  mm: remove arch_flush_lazy_mmu_mode()
  mm: introduce local state for lazy_mmu sections
  arm64: mm: fully support nested lazy_mmu sections
  x86/xen: support nested lazy_mmu sections (again)
  powerpc/mm: support nested lazy_mmu sections
  sparc/mm: support nested lazy_mmu sections
  mm: update lazy_mmu documentation

 arch/arm64/include/asm/pgtable.h              | 34 ++++++-------------
 .../include/asm/book3s/64/tlbflush-hash.h     | 24 +++++++++----
 arch/powerpc/mm/book3s64/hash_tlb.c           | 10 +++---
 arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +--
 arch/sparc/include/asm/tlbflush_64.h          |  6 ++--
 arch/sparc/mm/tlb.c                           | 19 ++++++++---
 arch/x86/include/asm/paravirt.h               |  8 ++---
 arch/x86/include/asm/paravirt_types.h         |  6 ++--
 arch/x86/include/asm/pgtable.h                |  3 +-
 arch/x86/xen/enlighten_pv.c                   |  2 +-
 arch/x86/xen/mmu_pv.c                         | 13 ++++---
 fs/proc/task_mmu.c                            |  5 +--
 include/linux/mm_types.h                      |  3 ++
 include/linux/pgtable.h                       | 21 +++++++++---
 mm/madvise.c                                  | 20 ++++++-----
 mm/memory.c                                   | 20 ++++++-----
 mm/migrate_device.c                           |  5 +--
 mm/mprotect.c                                 |  5 +--
 mm/mremap.c                                   |  5 +--
 mm/vmalloc.c                                  | 15 ++++----
 mm/vmscan.c                                   | 15 ++++----
 21 files changed, 147 insertions(+), 97 deletions(-)


base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.47.0


