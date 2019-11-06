Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C1DF0CB2
	for <lists+sparclinux@lfdr.de>; Wed,  6 Nov 2019 04:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731223AbfKFDJ4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 5 Nov 2019 22:09:56 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33582 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388184AbfKFDIS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 5 Nov 2019 22:08:18 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so3739257plb.0
        for <sparclinux@vger.kernel.org>; Tue, 05 Nov 2019 19:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/FjuDAVkneSIjXNySmoeQ30sSkwXAW/X+I2KPagVxs=;
        b=lZUd+XeV+6JlA/p7WuA8YgGZ6G+cSfc+aU1Vhkf1btBpOtEBVP30HHGiXZboWhhpkR
         DmIsjS3MpYSJ2O47TecrvGkX0QrbSqkHD5wPEl7a+GkfeZ/kSsox7QSXTMqz4D54vvpl
         X3rXOQx0sz0Ja3xuIsfeJWpx8NJHSkSLKvcx2I5zirnhVZi/VQxh4v3j5OsFm5n0eD5l
         mjN7RT5vkVrn9IrbU0pg6dapX6Zcd57I1QCypFqaxg1KRNrWBemoyWjdjzNST6U0hZDH
         rQci0XQwnu39Suqwm34YTZXxQqGptjK9cZ+GSdp26GLt2ehUU1XksgwZzi5zdeUvZQZM
         wi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/FjuDAVkneSIjXNySmoeQ30sSkwXAW/X+I2KPagVxs=;
        b=n7QPAGcH3jRh0RoxKJrG5imlKPJA+v2DDmRBrvAVPvp/LAg47KlTfsok+I5jkwMxSn
         tfDVvweLFQxN4wKCRR/T3W3tAUIyL64Dx2MQJm+2azRojj0gTidwRsPEXPzDOp4rZmXx
         tjHFRBJ06suDtNXyApR2SrNfMHJr7SQKSugiEorWGcRYyYzY/ywf0Ji9xQKVlFm75icO
         fI6Tr0xketWIPN1m2pfd6DvZ8qhGCVKNIv8TC4kPIVgA/tJArLeAvgXE3xfGLh8z535g
         P8qxbBQJwoRdxwG9djYuXz6Z/gJH7UpT1GRwMOrvXrhX7nLLMXDHYAb9VrjEUdTflaJ0
         etTw==
X-Gm-Message-State: APjAAAUUOew63K8k+HikZMhIpb3tJM5C2fF3jdDS5QSsMzEsDBU9aU2U
        vEMYfwdsI8eTltP2emWxIiBzag==
X-Google-Smtp-Source: APXvYqxL8zZAN4mEkInLc5fYB8uuO1lkZp8edmG/h4I+MQlWU8B9jGat3umuCJn57DhOZIdcMfzGIQ==
X-Received: by 2002:a17:902:8494:: with SMTP id c20mr155757plo.137.1573009697604;
        Tue, 05 Nov 2019 19:08:17 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:08:16 -0800 (PST)
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
Subject: [PATCH 34/50] sparc: Add show_stack_loglvl()
Date:   Wed,  6 Nov 2019 03:05:25 +0000
Message-Id: <20191106030542.868541-35-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
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
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/sparc/kernel/process_32.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 26cca65e9246..d2f3aea7b977 100644
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
+void show_stack_loglvl(struct task_struct *task, unsigned long *sp,
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
2.23.0

