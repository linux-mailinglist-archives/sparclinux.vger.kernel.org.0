Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEEE5186D83
	for <lists+sparclinux@lfdr.de>; Mon, 16 Mar 2020 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731684AbgCPOmO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 16 Mar 2020 10:42:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38281 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731766AbgCPOmO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 16 Mar 2020 10:42:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id w3so8110715plz.5
        for <sparclinux@vger.kernel.org>; Mon, 16 Mar 2020 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CKzmyWGTBxUz5GAvFJd/RAIPCL6otj16Tz4SiAfElss=;
        b=PPDVtvTLLuLVBBfjuG5HCnZ604AsQtpovQaVrospEvbfrdNJHG0dUj+z/uXvbO92V5
         QQTAwVWXq+xy4nNZcPMtv+1YEK7HOw3jqaSeKlkyXzZBJA+bJOo5HGetbjFgA2ScD0fU
         fz8BQaqjEmhaXFmot90WuLHM2hAJ+hzuqV/OyYMG4p7D1LDaAFwJqDOI1ap2W+PC4Wdv
         ooXbaJepE1fUhHdceIl+aV47yUvclxNZzxgdGaadVZPQBhO2YLQ1/ypZQYOSWm9LBbPW
         o0xZeMOtKCwy2vTq0JotdPddh5uKKi5v2kAJPiOGV9Zf+V7B1lucUpReN/cTTDq9AQgT
         u+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKzmyWGTBxUz5GAvFJd/RAIPCL6otj16Tz4SiAfElss=;
        b=N4uhZEJlz1CPgaCX4JzHXJLAro9xPVSAQo2PBoz2cANj4e0E2A4RutV9jxHHia/Q9a
         HiJIeXk/mifP/iwfRj/0EaPkbi0eQwST8oz7CFlXx+pIuB96Qge+kY/aNzjq24AVidoy
         NOE2oT7bjF1JN/zwtloFFuVUYKW1aAtabk04K2m4+SGQcmgdrmTrdxoDF1UxSWFi3IEO
         r7UzilzGQV1b18bWilm7FIhtLlT2jO4th6xYt22SdeFbmF6TiCkq1EOgnmOOAHC7lYZT
         PEqYLHh+O69fgkWKBS4zsxUhDrSoQjsVnbntUP7mPP/dFSEDYINCYpocl++9vD2CHvPh
         Awtg==
X-Gm-Message-State: ANhLgQ2mlWXZlSA+cb5FE/eeiIlJh2aRNbLNblp1JF2yOp0CyZQBlWl1
        VJk8cx+awXgN2rdXFwsTcXcprQ==
X-Google-Smtp-Source: ADFU+vt5V4s6MO/GQlwK2npa7WQnZw4mRUtHAN7IY4q6iRlMzvJTAc+W0zCvC1+Mq/QtohzWjHRt2A==
X-Received: by 2002:a17:90a:b94a:: with SMTP id f10mr1374711pjw.62.1584369733612;
        Mon, 16 Mar 2020 07:42:13 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:42:12 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCHv2 34/50] sparc: Add show_stack_loglvl()
Date:   Mon, 16 Mar 2020 14:39:00 +0000
Message-Id: <20200316143916.195608-35-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sparc/kernel/process_32.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 26cca65e9246..0b07de5618e5 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -145,10 +145,12 @@ void show_regs(struct pt_regs *r)
 }
 
 /*
- * The show_stack is an external API which we do not use ourselves.
+ * The show_stack(), show_stack_loglvl() are external APIs which
+ * we do not use ourselves.
  * The oops is printed in die_if_kernel.
  */
-void show_stack(struct task_struct *tsk, unsigned long *_ksp)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *_ksp,
+		       const char *loglvl)
 {
 	unsigned long pc, fp;
 	unsigned long task_base;
@@ -170,11 +172,16 @@ void show_stack(struct task_struct *tsk, unsigned long *_ksp)
 			break;
 		rw = (struct reg_window32 *) fp;
 		pc = rw->ins[7];
-		printk("[%08lx : ", pc);
-		printk("%pS ] ", (void *) pc);
+		printk("%s[%08lx : ", loglvl, pc);
+		printk("%s%pS ] ", loglvl, (void *) pc);
 		fp = rw->ins[6];
 	} while (++count < 16);
-	printk("\n");
+	printk("%s\n", loglvl);
+}
+
+void show_stack(struct task_struct *task, unsigned long *sp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT);
 }
 
 /*
-- 
2.25.1

