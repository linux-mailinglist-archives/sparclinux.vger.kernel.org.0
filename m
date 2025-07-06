Return-Path: <sparclinux+bounces-3989-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B82AEFB78
	for <lists+sparclinux@lfdr.de>; Tue,  1 Jul 2025 16:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC41E3A15D7
	for <lists+sparclinux@lfdr.de>; Tue,  1 Jul 2025 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EBB27E1C8;
	Tue,  1 Jul 2025 13:57:05 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B719827CCE7;
	Tue,  1 Jul 2025 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378225; cv=none; b=USA1a+dpC9l+zBUvgc8+3MORFNgG96aKWKFkzw9Swbwj1Ltxvp5pk6vxOZ8HeRIT9BEfcG64cACVTbWOYYg5YQ9yEaDmEWDyG7yqVucijKPy2fenI2v33U5O30fYlG7RyNX60nBPTLESrge9A0uE69tzLtMH+OkkzTgcpJ3rBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378225; c=relaxed/simple;
	bh=d4Nv715iVso4a24D+ONygCJMrkBaGt6upCgmBSm/1jI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E7He0mW6u4X4mvkAZGblPpAJNnZEVIXZKaw3M25+fHNsZujzT12DdB+NG/RKuiYajHom8weU+F16eo9AEQX8amuRbtZS5iOyRj7p7589MCzrEbe2pp57B4XWmXmfYPdSWp+4WaBigtzj/9jt6va5Y3N/+xxyceJ3iDDmUiM5fcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FB5B2F28;
	Tue,  1 Jul 2025 06:56:48 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 195AA3F58B;
	Tue,  1 Jul 2025 06:57:01 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	sparclinux@vger.kernel.org
Subject: [PATCH 19/23] sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:12 +0100
Message-Id: <20250701135616.29630-20-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: sparclinux@vger.kernel.org
---
 arch/sparc/kernel/ptrace_32.c | 4 ++--
 arch/sparc/kernel/ptrace_64.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/sparc/kernel/ptrace_32.c b/arch/sparc/kernel/ptrace_32.c
index c273ccebea46..c56333975fb1 100644
--- a/arch/sparc/kernel/ptrace_32.c
+++ b/arch/sparc/kernel/ptrace_32.c
@@ -218,7 +218,7 @@ static const struct user_regset sparc32_regsets[] = {
 	 *	PSR, PC, nPC, Y, WIM, TBR
 	 */
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = 38,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.regset_get = genregs32_get, .set = genregs32_set
@@ -234,7 +234,7 @@ static const struct user_regset sparc32_regsets[] = {
 	 *	FPU QUEUE (64 32-bit ints)
 	 */
 	[REGSET_FP] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = 99,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.regset_get = fpregs32_get, .set = fpregs32_set
diff --git a/arch/sparc/kernel/ptrace_64.c b/arch/sparc/kernel/ptrace_64.c
index 4deba5b6eddb..9fc67fa9336f 100644
--- a/arch/sparc/kernel/ptrace_64.c
+++ b/arch/sparc/kernel/ptrace_64.c
@@ -420,7 +420,7 @@ static const struct user_regset sparc64_regsets[] = {
 	 *	TSTATE, TPC, TNPC, Y
 	 */
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = 36,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = genregs64_get, .set = genregs64_set
@@ -432,7 +432,7 @@ static const struct user_regset sparc64_regsets[] = {
 	 *	FPRS
 	 */
 	[REGSET_FP] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = 35,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = fpregs64_get, .set = fpregs64_set
@@ -750,7 +750,7 @@ static const struct user_regset sparc32_regsets[] = {
 	 *	PSR, PC, nPC, Y, WIM, TBR
 	 */
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = 38,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.regset_get = genregs32_get, .set = genregs32_set
@@ -766,7 +766,7 @@ static const struct user_regset sparc32_regsets[] = {
 	 *	FPU QUEUE (64 32-bit ints)
 	 */
 	[REGSET_FP] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = 99,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.regset_get = fpregs32_get, .set = fpregs32_set
-- 
2.34.1


