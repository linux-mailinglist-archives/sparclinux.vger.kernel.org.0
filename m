Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757C2152240
	for <lists+sparclinux@lfdr.de>; Tue,  4 Feb 2020 23:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgBDWMo (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Feb 2020 17:12:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44268 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbgBDWMo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Feb 2020 17:12:44 -0500
Received: by mail-pg1-f195.google.com with SMTP id g3so4663647pgs.11
        for <sparclinux@vger.kernel.org>; Tue, 04 Feb 2020 14:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=;
        b=mvX97Tfq4mMzpXUDFwBDvSHaJpQdGdWGprU6RSPFTeqOFWvaP9yMs0ykI/wg4BBnmn
         PoCAX3HBcsnBFzCr4gsesH4ApFy3w+j2kQvW20NSu3FxGvnClvuPCTxQ4T9DuW9QQyka
         4Aumr3CkYWlSSuyWU+MJEH+IAaMQW4yPR5fGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=;
        b=lrIdFA2QDRNYtzV9mGDH7NZUK9/EdEgzUOqE/Xv3xf5yZOiwDaKviGiDPiARg96cU4
         WP2KzS1WBFNkJAenTx7z1rFKMhA8AayttL2yZMM2v6QVwAGZElQURLZZUYjPyjIGgBeY
         ILdoz0CTim/ckKGPFo+Riz9NU0ha7G2VUlAtAZmtx0Dx6rjNT9QtQxfhJFM7uEAo4duL
         im9U+8CizBore1SdLr1WTEK+XdmQOBnR/JBVIfwtlmAtlFowwViahmDbUNG+jRrXErxP
         cmn4iWymj3gAPbd0ekOi7Sriteos5LDOkZuoazHJ5lbZsgdLR/bEdblWC6tp8Ctknby1
         SrpA==
X-Gm-Message-State: APjAAAVQmAO9iazonyycXrLdihTSwAooF1X6QiMJnQSH60lu0c337sV0
        cxUy/rCsK6vsta/W8Rth7wFeFzVuvb0=
X-Google-Smtp-Source: APXvYqxCQdUqXfhZc+Oe9uYvCKV/DUPxqKgxt4to10QLL9Kq/2IQ/TU+fehc8Lr/r4dYpQ9nDv6Z4w==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr21880478pgf.427.1580854363613;
        Tue, 04 Feb 2020 14:12:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id q21sm25033209pff.105.2020.02.04.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 14:12:43 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Anatoly Pugachev <matorola@gmail.com>
Cc:     sparclinux@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] kdb: Fix compiling on architectures w/out DBG_MAX_REG_NUM defined
Date:   Tue,  4 Feb 2020 14:12:25 -0800
Message-Id: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
if current task has no regs") I tried to clean things up by using "if"
instead of "#ifdef".  Turns out we really need "#ifdef" since not all
architectures define some of the structures that the code is referring
to.

Let's switch to #ifdef again, but at least avoid using it inside of
the function.

Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
Reported-by: Anatoly Pugachev <matorola@gmail.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have a sparc64 compiler but I'm pretty sure this should work.
Testing appreciated.

 kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index b22292b649c4..c84e61747267 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
 /*
  * kdb_rd - This function implements the 'rd' command.
  */
+
+/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
+#if DBG_MAX_REG_NUM <= 0
+static int kdb_rd(int argc, const char **argv)
+{
+	if (!kdb_check_regs())
+		kdb_dumpregs(kdb_current_regs);
+	return 0;
+}
+#else
 static int kdb_rd(int argc, const char **argv)
 {
 	int len = 0;
@@ -1847,12 +1857,6 @@ static int kdb_rd(int argc, const char **argv)
 	if (kdb_check_regs())
 		return 0;
 
-	/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
-	if (DBG_MAX_REG_NUM <= 0) {
-		kdb_dumpregs(kdb_current_regs);
-		return 0;
-	}
-
 	for (i = 0; i < DBG_MAX_REG_NUM; i++) {
 		rsize = dbg_reg_def[i].size * 2;
 		if (rsize > 16)
@@ -1896,6 +1900,7 @@ static int kdb_rd(int argc, const char **argv)
 
 	return 0;
 }
+#endif
 
 /*
  * kdb_rm - This function implements the 'rm' (register modify)  command.
-- 
2.25.0.341.g760bfbb309-goog

