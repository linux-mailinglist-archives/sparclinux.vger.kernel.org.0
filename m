Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D704351C3
	for <lists+sparclinux@lfdr.de>; Wed, 20 Oct 2021 19:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhJTRsH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 20 Oct 2021 13:48:07 -0400
Received: from out01.mta.xmission.com ([166.70.13.231]:43558 "EHLO
        out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhJTRrk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 20 Oct 2021 13:47:40 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:50654)
        by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mdFeX-00EwP4-Bx; Wed, 20 Oct 2021 11:45:25 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:47894 helo=localhost.localdomain)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mdFeV-001NdN-HO; Wed, 20 Oct 2021 11:45:24 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arch@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org
Date:   Wed, 20 Oct 2021 12:44:02 -0500
Message-Id: <20211020174406.17889-16-ebiederm@xmission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87y26nmwkb.fsf@disp2133>
References: <87y26nmwkb.fsf@disp2133>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-XM-SPF: eid=1mdFeV-001NdN-HO;;;mid=<20211020174406.17889-16-ebiederm@xmission.com>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+PPL8dLrIlJ5bbcAk6ZNzCrUxBuSVPrlA=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMNoVowels,
        XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5022]
        *  0.7 XMSubLong Long Subject
        *  1.5 XMNoVowels Alpha-numberic number with no vowels
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;linux-kernel@vger.kernel.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 487 ms - load_scoreonly_sql: 0.08 (0.0%),
        signal_user_changed: 12 (2.4%), b_tie_ro: 10 (2.0%), parse: 1.12
        (0.2%), extract_message_metadata: 18 (3.7%), get_uri_detail_list: 1.53
        (0.3%), tests_pri_-1000: 22 (4.6%), tests_pri_-950: 1.66 (0.3%),
        tests_pri_-900: 1.10 (0.2%), tests_pri_-90: 223 (45.8%), check_bayes:
        221 (45.5%), b_tokenize: 6 (1.2%), b_tok_get_all: 6 (1.2%),
        b_comp_prob: 1.98 (0.4%), b_tok_touch_all: 204 (41.9%), b_finish: 0.95
        (0.2%), tests_pri_0: 196 (40.3%), check_dkim_signature: 0.59 (0.1%),
        check_dkim_adsp: 2.5 (0.5%), poll_dns_idle: 0.69 (0.1%), tests_pri_10:
        2.1 (0.4%), tests_pri_500: 7 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH 16/20] signal/sparc32: In setup_rt_frame and setup_fram use force_fatal_sig
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Modify the 32bit version of setup_rt_frame and setup_frame to act
similar to the 64bit version of setup_rt_frame and fail with a signal
instead of calling do_exit.

Replacing do_exit(SIGILL) with force_fatal_signal(SIGILL) ensures that
the process will be terminated cleanly when the stack frame is
invalid, instead of just killing off a single thread and leaving the
process is a weird state.

Cc: David Miller <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 arch/sparc/kernel/signal_32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/signal_32.c b/arch/sparc/kernel/signal_32.c
index 02f3ad55dfe3..cd677bc564a7 100644
--- a/arch/sparc/kernel/signal_32.c
+++ b/arch/sparc/kernel/signal_32.c
@@ -244,7 +244,7 @@ static int setup_frame(struct ksignal *ksig, struct pt_regs *regs,
 		get_sigframe(ksig, regs, sigframe_size);
 
 	if (invalid_frame_pointer(sf, sigframe_size)) {
-		do_exit(SIGILL);
+		force_fatal_sig(SIGILL);
 		return -EINVAL;
 	}
 
@@ -336,7 +336,7 @@ static int setup_rt_frame(struct ksignal *ksig, struct pt_regs *regs,
 	sf = (struct rt_signal_frame __user *)
 		get_sigframe(ksig, regs, sigframe_size);
 	if (invalid_frame_pointer(sf, sigframe_size)) {
-		do_exit(SIGILL);
+		force_fatal_sig(SIGILL);
 		return -EINVAL;
 	}
 
-- 
2.20.1

