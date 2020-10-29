Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDE229F149
	for <lists+sparclinux@lfdr.de>; Thu, 29 Oct 2020 17:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgJ2QWq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 29 Oct 2020 12:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgJ2QWn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 29 Oct 2020 12:22:43 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8046CC0613D2
        for <sparclinux@vger.kernel.org>; Thu, 29 Oct 2020 09:22:43 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id u19so4150247ion.3
        for <sparclinux@vger.kernel.org>; Thu, 29 Oct 2020 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=KxyZTABZaXKhoQYm430CZEoZnSMrL+rt39jxjcYyNjA=;
        b=UZDeiSpNGW8EPteZo7zwd8smPkCE3RnbaUBralJIfzwjYYOJCBe+WnuOd0tuWkPMRj
         f2/kS0nta3Fk8NSogkQMweCKaI7+Gkm05s9CkuVjr9toI9XynNtu7E+jtV1A7OXOmCLZ
         uDAPvwkfkG5p8bPDfI5qvMPQRgHIdw9Af03ZIzKTRYIHo+tssLp0iS7wesQPATwo/jmG
         hUtQnCJMM9rsBFO/GxWRjjewCqG69M6Lqj02m1RgZ9G7Oa+TEu0FSvXyxjtw8kPcxgEi
         QyjBPMbxxvswnKnDGNLg1UrErhW/joRSZRUB6dMqXEL53dRiPgNPoOzrUzazgG9KdybW
         9wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=KxyZTABZaXKhoQYm430CZEoZnSMrL+rt39jxjcYyNjA=;
        b=AfXikx0TYih2m5W6H4W2M9OXHnLaPkD00cYe7R+M5+MqWx8j0U2YTTATvqD4r3ql/M
         0hIDhYdJQzjlYh9N+o4eiMDKAoBUMZ2zN/u/surpkg7shI692YuQ3zQOnrHyZXerUlHS
         hSx9igwkyXmZKbdDjiZInl83gLKi/NI+C8hEJTkRza1pq2ZZnFUHh/ody8TBNUvBh8Uv
         tCMk0mzF8olh2UBCLowvl9IaF2YoJnrjw8IiwcZcCP/MxE4UFWqg4qL7dSiIah3h+zex
         yyRF962Wcip9Dt1CcdUkfOgWZ1f1oBzgCba8IqVK97Ch43Yds+7xZXK61hkst7AxnQ0N
         SlLQ==
X-Gm-Message-State: AOAM531VLCJBNJxLbb15e1JI36WX1doacBmolSIUd7rDJcw5GugvzZiz
        y0x6IFeUCyEv5Aj8drRz7z20UfEtpPlL+w==
X-Google-Smtp-Source: ABdhPJzqUrROKgNrLPf9wY6I5MRZvu/iac/u1z7IWuhLBVaRd5Jsslv4j4HFwcA/8epMKmk41U7I6g==
X-Received: by 2002:a6b:c9c9:: with SMTP id z192mr3971542iof.175.1603988562877;
        Thu, 29 Oct 2020 09:22:42 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c1sm2788414ile.0.2020.10.29.09.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:22:42 -0700 (PDT)
To:     Sparc kernel list <sparclinux@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] sparc: add support for TIF_NOTIFY_SIGNAL
Message-ID: <c2ddcd10-55ba-dad9-c9c5-02a8bd2aa3f6@kernel.dk>
Date:   Thu, 29 Oct 2020 10:22:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for sparc.

Cc: sparclinux@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/sparc/include/asm/thread_info_32.h | 4 +++-
 arch/sparc/include/asm/thread_info_64.h | 6 ++++--
 arch/sparc/kernel/signal_32.c           | 2 +-
 arch/sparc/kernel/signal_64.c           | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/include/asm/thread_info_32.h b/arch/sparc/include/asm/thread_info_32.h
index 548b366165dd..45b4955b253f 100644
--- a/arch/sparc/include/asm/thread_info_32.h
+++ b/arch/sparc/include/asm/thread_info_32.h
@@ -104,6 +104,7 @@ register struct thread_info *current_thread_info_reg asm("g6");
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_RESTORE_SIGMASK	4	/* restore signal mask in do_signal() */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_USEDFPU		8	/* FPU was used by this task
 					 * this quantum (SMP) */
 #define TIF_POLLING_NRFLAG	9	/* true if poll_idle() is polling
@@ -115,11 +116,12 @@ register struct thread_info *current_thread_info_reg asm("g6");
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_USEDFPU		(1<<TIF_USEDFPU)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 
 #define _TIF_DO_NOTIFY_RESUME_MASK	(_TIF_NOTIFY_RESUME | \
-					 _TIF_SIGPENDING)
+					 _TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)
 
 #define is_32bit_task()	(1)
 
diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
index 20255471e653..42cd4cd3892e 100644
--- a/arch/sparc/include/asm/thread_info_64.h
+++ b/arch/sparc/include/asm/thread_info_64.h
@@ -180,7 +180,7 @@ extern struct thread_info *current_thread_info(void);
 #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
-/* flag bit 4 is available */
+#define TIF_NOTIFY_SIGNAL	4	/* signal notifications exist */
 #define TIF_UNALIGNED		5	/* allowed to do unaligned accesses */
 #define TIF_UPROBE		6	/* breakpointed or singlestepped */
 #define TIF_32BIT		7	/* 32-bit binary */
@@ -200,6 +200,7 @@ extern struct thread_info *current_thread_info(void);
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_UNALIGNED		(1<<TIF_UNALIGNED)
 #define _TIF_UPROBE		(1<<TIF_UPROBE)
 #define _TIF_32BIT		(1<<TIF_32BIT)
@@ -213,7 +214,8 @@ extern struct thread_info *current_thread_info(void);
 				 _TIF_DO_NOTIFY_RESUME_MASK | \
 				 _TIF_NEED_RESCHED)
 #define _TIF_DO_NOTIFY_RESUME_MASK	(_TIF_NOTIFY_RESUME | \
-					 _TIF_SIGPENDING | _TIF_UPROBE)
+					 _TIF_SIGPENDING | _TIF_UPROBE | \
+					 _TIF_NOTIFY_SIGNAL)
 
 #define is_32bit_task()	(test_thread_flag(TIF_32BIT))
 
diff --git a/arch/sparc/kernel/signal_32.c b/arch/sparc/kernel/signal_32.c
index 741d0701003a..11cf2281b581 100644
--- a/arch/sparc/kernel/signal_32.c
+++ b/arch/sparc/kernel/signal_32.c
@@ -521,7 +521,7 @@ static void do_signal(struct pt_regs *regs, unsigned long orig_i0)
 void do_notify_resume(struct pt_regs *regs, unsigned long orig_i0,
 		      unsigned long thread_info_flags)
 {
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs, orig_i0);
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
diff --git a/arch/sparc/kernel/signal_64.c b/arch/sparc/kernel/signal_64.c
index f7ef7edcd5c1..a0eec62c825d 100644
--- a/arch/sparc/kernel/signal_64.c
+++ b/arch/sparc/kernel/signal_64.c
@@ -549,7 +549,7 @@ void do_notify_resume(struct pt_regs *regs, unsigned long orig_i0, unsigned long
 	user_exit();
 	if (thread_info_flags & _TIF_UPROBE)
 		uprobe_notify_resume(regs);
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs, orig_i0);
 	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
-- 
2.29.0

-- 
Jens Axboe

