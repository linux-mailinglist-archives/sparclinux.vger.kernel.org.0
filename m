Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F133E4A2
	for <lists+sparclinux@lfdr.de>; Wed, 17 Mar 2021 02:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCQBAR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 16 Mar 2021 21:00:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231954AbhCQA7M (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 16 Mar 2021 20:59:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0270765011;
        Wed, 17 Mar 2021 00:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615942751;
        bh=4b1tEAHbreg0k9BU17gZ4Fz/tfFYOrkQpGtKWm6Mkqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DSjg+DNd05LqRgl02scGY0IkAHM5yQtL+J6U//ubDYLSa8ZZwVvQuTkCb10/x0KCV
         +1y8CgmnEfqw5nMIcx2vFuZJVRf0YeFSjNSD4cHfnqdtgk1chblP+/Hb6MFWSIa/Ej
         Jkg4JQ2yMfeLvCRMoyRX3FzXDXkpm6Nsg6EiFVY3PO5j3nHsXtgbaQeiTLCYedRPdt
         w0olc5YAsScZPmo9I/QKIPKfmdxrwXBsQrNoPyvBIK6wB+TZKQMwgbvH9ID2RboABi
         5k2nfIKln1Sl5ezTvjmWY+zZMHtGWHZuM+F5jkpSKQOjJN3Vu/tfB+IhX2lTUZuUEj
         OrELKuVKoZWIg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, sparclinux@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 17/23] sparc64: Fix opcode filtering in handling of no fault loads
Date:   Tue, 16 Mar 2021 20:58:43 -0400
Message-Id: <20210317005850.726479-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005850.726479-1-sashal@kernel.org>
References: <20210317005850.726479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Rob Gardner <rob.gardner@oracle.com>

[ Upstream commit e5e8b80d352ec999d2bba3ea584f541c83f4ca3f ]

is_no_fault_exception() has two bugs which were discovered via random
opcode testing with stress-ng. Both are caused by improper filtering
of opcodes.

The first bug can be triggered by a floating point store with a no-fault
ASI, for instance "sta %f0, [%g0] #ASI_PNF", opcode C1A01040.

The code first tests op3[5] (0x1000000), which denotes a floating
point instruction, and then tests op3[2] (0x200000), which denotes a
store instruction. But these bits are not mutually exclusive, and the
above mentioned opcode has both bits set. The intent is to filter out
stores, so the test for stores must be done first in order to have
any effect.

The second bug can be triggered by a floating point load with one of
the invalid ASI values 0x8e or 0x8f, which pass this check in
is_no_fault_exception():
     if ((asi & 0xf2) == ASI_PNF)

An example instruction is "ldqa [%l7 + %o7] #ASI 0x8f, %f38",
opcode CF95D1EF. Asi values greater than 0x8b (ASI_SNFL) are fatal
in handle_ldf_stq(), and is_no_fault_exception() must not allow these
invalid asi values to make it that far.

In both of these cases, handle_ldf_stq() reacts by calling
sun4v_data_access_exception() or spitfire_data_access_exception(),
which call is_no_fault_exception() and results in an infinite
recursion.

Signed-off-by: Rob Gardner <rob.gardner@oracle.com>
Tested-by: Anatoly Pugachev <matorola@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/sparc/kernel/traps_64.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index aa624ed79db1..86879c28910b 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -274,14 +274,13 @@ bool is_no_fault_exception(struct pt_regs *regs)
 			asi = (regs->tstate >> 24); /* saved %asi       */
 		else
 			asi = (insn >> 5);	    /* immediate asi    */
-		if ((asi & 0xf2) == ASI_PNF) {
-			if (insn & 0x1000000) {     /* op3[5:4]=3       */
-				handle_ldf_stq(insn, regs);
-				return true;
-			} else if (insn & 0x200000) { /* op3[2], stores */
+		if ((asi & 0xf6) == ASI_PNF) {
+			if (insn & 0x200000)        /* op3[2], stores   */
 				return false;
-			}
-			handle_ld_nf(insn, regs);
+			if (insn & 0x1000000)       /* op3[5:4]=3 (fp)  */
+				handle_ldf_stq(insn, regs);
+			else
+				handle_ld_nf(insn, regs);
 			return true;
 		}
 	}
-- 
2.30.1

