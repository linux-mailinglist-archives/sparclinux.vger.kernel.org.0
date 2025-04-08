Return-Path: <sparclinux+bounces-3408-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D6A7FA99
	for <lists+sparclinux@lfdr.de>; Tue,  8 Apr 2025 12:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993113AA143
	for <lists+sparclinux@lfdr.de>; Tue,  8 Apr 2025 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87CD26A0BE;
	Tue,  8 Apr 2025 09:53:13 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561BB2676C1;
	Tue,  8 Apr 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105993; cv=none; b=Zc1yn3OQzByTYZhNiazHjzRUR41ukTIbMAoeAUhK+OpafTF0JaNoiTH6rMUN16JPqYXE55UeUHPf79ju1vooI7Js80EMUNzxXGTCdUiyrzc0UNisxcZ+m/vnXPM8MqxJcx0AXE3+LjPFOIZ1Aj1zT1Ztgs0jK3iJcOJXPJkwry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105993; c=relaxed/simple;
	bh=RmNYQb9Bay1hhCcESV2xeO534PVfNO4TiTDcUO7dtP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebF7GR11zZsbgO2N/BqNEanT2LcxAUDE8KF9+43WAylQ9/jaEcAaFr06PMd1PXg7UlG8dPiDSva+sBDOlmAZwo03dTqdEqyxDRqc9gYyv0KZRkf1GNY36f2jN8ugFMsPopWSswNKlzyJLj1W3PyBFfC0rKmZ0O2TE3ALEzLntwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2B11688;
	Tue,  8 Apr 2025 02:53:11 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0F73F6A8;
	Tue,  8 Apr 2025 02:53:05 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 00/12] Always call constructor for kernel page tables
Date: Tue,  8 Apr 2025 10:52:10 +0100
Message-ID: <20250408095222.860601-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There has been much confusion around exactly when page table
constructors/destructors (pagetable_*_[cd]tor) are supposed to be
called. They were initially introduced for user PTEs only (to support
split page table locks), then at the PMD level for the same purpose.
Accounting was added later on, starting at the PTE level and then moving
to higher levels (PMD, PUD). Finally, with my earlier series "Account
page tables at all levels" [1], the ctor/dtor is run for all levels, all
the way to PGD.

I thought this was the end of the story, and it hopefully is for user
pgtables, but I was wrong for what concerns kernel pgtables. The current
situation there makes very little sense:

* At the PTE level, the ctor/dtor is not called (at least in the generic
  implementation). Specific helpers are used for kernel pgtables at this
  level (pte_{alloc,free}_kernel()) and those have never called the
  ctor/dtor, most likely because they were initially irrelevant in the
  kernel case.

* At all other levels, the ctor/dtor is normally called. This is
  potentially wasteful at the PMD level (more on that later).

This series aims to ensure that the ctor/dtor is always called for kernel
pgtables, as it already is for user pgtables. Besides consistency, the
main motivation is to guarantee that ctor/dtor hooks are systematically
called; this makes it possible to insert hooks to protect page tables [2],
for instance. There is however an extra challenge: split locks are not
used for kernel pgtables, and it would therefore be wasteful to
initialise them (ptlock_init()).

It is worth clarifying exactly when split locks are used. They clearly
are for user pgtables, but as illustrated in commit 61444cde9170 ("ARM:
8591/1: mm: use fully constructed struct pages for EFI pgd
allocations"), they also are for special page tables like efi_mm. The
one case where split locks are definitely unused is pgtables owned by
init_mm; this is consistent with the behaviour of apply_to_pte_range().

The approach chosen in this series is therefore to pass the mm
associated to the pgtables being constructed to
pagetable_{pte,pmd}_ctor() (patch 1), and skip ptlock_init() if
mm == &init_mm (patch 3 and 7). This makes it possible to call the PTE
ctor/dtor from pte_{alloc,free}_kernel() without unintended consequences
(patch 3). As a result the accounting functions are now called at
all levels for kernel pgtables, and split locks are never initialised.

In configurations where ptlocks are dynamically allocated (32-bit,
PREEMPT_RT, etc.) and ARCH_ENABLE_SPLIT_PMD_PTLOCK is selected, this
series results in the removal of a kmem_cache allocation for every
kernel PMD. Additionally, for certain architectures that do not use
<asm-generic/pgalloc.h> such as s390, the same optimisation occurs at
the PTE level.

---

Things get more complicated when it comes to special pgtable allocators
(patch 8-12). All architectures need such allocators to create initial
kernel pgtables; we are not concerned with those as the ctor cannot be
called so early in the boot sequence. However, those allocators may also
be used later in the boot sequence or during normal operations. There
are two main use-cases:

1. Mapping EFI memory: efi_mm (arm, arm64, riscv)
2. arch_add_memory(): init_mm

The ctor is already explicitly run (at the PTE/PMD level) in the first
case, as required for pgtables that are not associated with init_mm.
However the same allocators may also be used for the second use-case (or
others), and this is where it gets messy. Patch 1 calls the ctor with
NULL as mm in those situations, as the actual mm isn't available.
Practically this means that ptlocks will be unconditionally initialised.
This is fine on arm - create_mapping_late() is only used for the EFI
mapping. On arm64, __create_pgd_mapping() is also used by
arch_add_memory(); patch 8/9/11 ensure that ctors are called at all
levels with the appropriate mm. The situation is similar on riscv, but
propagating the mm down to the ctor would require significant
refactoring. Since they are already called unconditionally, this series
leaves riscv no worse off - patch 10 adds comments to clarify the
situation.

From a cursory look at other architectures implementing
arch_add_memory(), s390 and x86 may also need a similar treatment to add
constructor calls. This is to be taken care of in a future version or as
a follow-up.

---

The complications in those special pgtable allocators beg the question:
does it really make sense to treat efi_mm and init_mm differently in
e.g. apply_to_pte_range()? Maybe what we really need is a way to tell if
an mm corresponds to user memory or not, and never use split locks for
non-user mm's. Feedback and suggestions welcome!

- Kevin

[1] https://lore.kernel.org/linux-mm/20250103184415.2744423-1-kevin.brodsky@arm.com/
[2] https://lore.kernel.org/linux-hardening/20250203101839.1223008-1-kevin.brodsky@arm.com/
---
Changelog

v1..v2:

- Added patch 2 to fix a BUG() on x86 caused by a missing dtor call at
  the PTE level.

- Patch 9: declared the new helpers with __maybe_unused to avoid a
  warning if CONFIG_MEMORY_HOTPLUG isn't selected.

v1: https://lore.kernel.org/linux-mm/20250317141700.3701581-1-kevin.brodsky@arm.com/
---
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
---
Kevin Brodsky (12):
  mm: Pass mm down to pagetable_{pte,pmd}_ctor
  x86: pgtable: Always use pte_free_kernel()
  mm: Call ctor/dtor for kernel PTEs
  m68k: mm: Call ctor/dtor for kernel PTEs
  powerpc: mm: Call ctor/dtor for kernel PTEs
  sparc64: mm: Call ctor/dtor for kernel PTEs
  mm: Skip ptlock_init() for kernel PMDs
  arm64: mm: Use enum to identify pgtable level instead of *_SHIFT
  arm64: mm: Always call PTE/PMD ctor in __create_pgd_mapping()
  riscv: mm: Clarify ctor mm argument in alloc_{pte,pmd}_late
  arm64: mm: Call PUD/P4D ctor in __create_pgd_mapping()
  riscv: mm: Call PUD/P4D ctor in special kernel pgtable alloc

 arch/arm/mm/mmu.c                        |  2 +-
 arch/arm64/mm/mmu.c                      | 93 ++++++++++++++----------
 arch/csky/include/asm/pgalloc.h          |  2 +-
 arch/loongarch/include/asm/pgalloc.h     |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h      |  8 +-
 arch/m68k/include/asm/motorola_pgalloc.h | 10 +--
 arch/m68k/mm/motorola.c                  |  6 +-
 arch/microblaze/mm/pgtable.c             |  2 +-
 arch/mips/include/asm/pgalloc.h          |  2 +-
 arch/openrisc/mm/ioremap.c               |  2 +-
 arch/parisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
 arch/powerpc/mm/pgtable-frag.c           | 30 ++++----
 arch/riscv/mm/init.c                     | 26 ++++---
 arch/s390/include/asm/pgalloc.h          |  2 +-
 arch/s390/mm/pgalloc.c                   |  2 +-
 arch/sparc/mm/init_64.c                  | 29 ++++----
 arch/sparc/mm/srmmu.c                    |  2 +-
 arch/x86/mm/pgtable.c                    |  9 +--
 include/asm-generic/pgalloc.h            | 11 ++-
 include/linux/mm.h                       | 10 ++-
 21 files changed, 142 insertions(+), 112 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.47.0


