Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B13E327737
	for <lists+sparclinux@lfdr.de>; Mon,  1 Mar 2021 06:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhCAFty (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 1 Mar 2021 00:49:54 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45310 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhCAFtx (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 1 Mar 2021 00:49:53 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1215jIQv168261
        for <sparclinux@vger.kernel.org>; Mon, 1 Mar 2021 05:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id; s=corp-2020-01-29;
 bh=W+lyc+mqEbI0IXglSP/VKFnT5/pi9W3s6/+x8e/XEww=;
 b=zXkxcJ7I/7PkkjICUAReQWnLV7RaNOPnQkrigIdi/Y6f3bc4blp8L5LiX9XBsUGaRfIJ
 8kYYjjsSfpUO3l8zlJvt8kyv7dcT6WmcQ6X+jg6gWYcdpykUhutG+rcXpT4GRhEl1qfl
 YwE4sxYUaGqVPY32jO5a43w+0hWZQj7IjyTScAsyxN27D4tTu3taVu6xnYuYZuGGjG6m
 pV4K+tRuVi3zBnl/1CfRZeKQSe570V1/SMPly+Fen+gX1Wf1ki3tgqZ3TE8Fd2F5p1d0
 EdjbjiDvJJBzo/AZmJf79ZEZ8LvCslAZmj4W4mddy3eDsZcuSaDJPPgXFWDpMxfiZO0f Ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 36yeqmtfyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <sparclinux@vger.kernel.org>; Mon, 01 Mar 2021 05:48:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1215kTnt051120
        for <sparclinux@vger.kernel.org>; Mon, 1 Mar 2021 05:48:16 GMT
Received: from maggid.us.oracle.com (dhcp-10-65-188-222.vpn.oracle.com [10.65.188.222])
        by userp3020.oracle.com with ESMTP id 36yyuq2n92-1
        for <sparclinux@vger.kernel.org>; Mon, 01 Mar 2021 05:48:16 +0000
From:   Rob Gardner <rob.gardner@oracle.com>
To:     sparclinux@vger.kernel.org
Subject: [PATCH] sparc64: Fix opcode filtering in handling of no fault loads
Date:   Sun, 28 Feb 2021 22:48:16 -0700
Message-Id: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9909 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010048
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9909 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010048
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

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
---
 arch/sparc/kernel/traps_64.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index d92e5ea..a850dcc 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -275,14 +275,13 @@ bool is_no_fault_exception(struct pt_regs *regs)
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
2.7.4

