Return-Path: <sparclinux+bounces-5476-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8721C07C5D
	for <lists+sparclinux@lfdr.de>; Fri, 24 Oct 2025 20:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89E671C4603A
	for <lists+sparclinux@lfdr.de>; Fri, 24 Oct 2025 18:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821232ED853;
	Fri, 24 Oct 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvTbg3Jj"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCD27E7EC
	for <sparclinux@vger.kernel.org>; Fri, 24 Oct 2025 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330963; cv=none; b=IajrGOmu7cNTqegYetYx0HRd++wFOXea7EHZAIF7hrQqGUnU2UiqEJL0AFIOEKzvspjWx1Y7XeDHHEf5oRLRL8MWYC9dn+hQNPbcFQQZ1oW4GyI+myEsS+/fljqtw9Npb9Qx4ev6k4tjufJ1PQ0FNxRAid5Yg8+x4CS23B4opIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330963; c=relaxed/simple;
	bh=e082r4kTfLA0aLgFTCWcX+NL5EgNNmKTh51Ro59hkR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO8KtbQ9EWhmnFlzMm4aFzgKMpE62LbbmLXLwsmMbGVowJu7TOhjEkVod45bwWhP991c2thfxunqLcX58jeMVUrH6qnu74iP4LdIJmNpwEY7BFaeYgrfjnjJqODioblTArQd+IS7cLVSLk4djUZcaGXfJJW96BBvJxTf25oVvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvTbg3Jj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b550eff972eso1637631a12.3
        for <sparclinux@vger.kernel.org>; Fri, 24 Oct 2025 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761330961; x=1761935761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw14jVuf7BqeO+cDKjQTg5GGuEVAt7PwD+gUI7IAUIA=;
        b=ZvTbg3JjuXHrseS7A8JtFy+f2+lGP0o/jbK1hsn7H3Vf0ZOAwgYTV3+mx7I76ML8oX
         rZ2WtcTq59dOKyW7+DVn9+AX/smhr/6Vh1fIW+6PM3wusl/FONZLXBDr3Wqg8k8mTfHZ
         SSdZk6Ac0CbUKiRST6geJikFcMwUvJqpyLqIcgvYEageuF2Fceffqo5qon+YVEYm0aCz
         1p1BEAeNJ82LbbiP8QFOeZJs01IQg3qWMQNo7O8Hmv+YfGDhBYFviy92Fc6YyUVKSRy+
         oXEHJAmpzKB6rdydirZYH4H35CbvxcgLglzjjMc+xVFrKI84s2TZwb6gTChQD25ECUG/
         aVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761330961; x=1761935761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw14jVuf7BqeO+cDKjQTg5GGuEVAt7PwD+gUI7IAUIA=;
        b=mVK8xTBbLd07afmN05XgW3QuTT3Djh1qUBQyXAfkxi69N/2xM4KJ4gvG7E8l8kpusu
         iy7AsDhKDwL+oD4aHoSlQfmsHdqEY9kTInmDxbc3o5vAPwP3KCQIAAcHyg1ts1MADbcr
         AA1ObpAruzhzbQ34TMpRz8/xxrZe1zeOYYAEDRKiH/neW74shlG0nFzSpXZhffExrWyC
         VKZU1iQk9MZjku1ppjqzQD9umu5JY93lGdPz3TYZcUpm5KtTjMBMHNHch98pbsNaH9Vq
         qfJQ/rmCjRJ1Ahn6gXcnyndj8Zx9V/twovvtkoIQvlwfoBaJzpTlkSX8AyX5SySGcGDY
         M6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWdTorXSjUbn7DKZn73nb/8MVFkG+TkKMVXXxJGcp4Yyckpf1te+PqyMBSiOh5wqq72O9LdilB1eEqd@vger.kernel.org
X-Gm-Message-State: AOJu0YztPu/UtFqZqOVQdQJlbpVco+OSc2i2NiKlu+h/+MRORHIAlCMg
	9x6IiB513ScsYcYhPb4n4vJvgShqtr04AaYn0+aEIj5Di1ngglrl5oYT
X-Gm-Gg: ASbGncvkNLkwDbS+5qKIFGt8xLgDG6LFjklpLLVx/qKMO4WKBI9so5PEfwEY4GCRkMH
	oJizAGJjjGcq/Znb3osxiwR8cV+oScSeiIVRNaZOOmUcXVDxP99xJXmwpOm9YQLrzYlv4YC3cUV
	bTokpSB1yLklpeKvMc7AhWh7Zbv57tzL6m25eAtdD+Sf7JDWfqoJj3kyHfd0UCH+8UBvLWvmTOB
	vv0+HZOoWXwbsKvj1GA/q04DLIfpN6J5FZs9MQJ9KzpXMrm42Pnrdmgj7MNYAQIgGet7Nk8JhEF
	+zsRJ3XxtKX7V2N3nchF4YH0fFkDLbTbkXce6ZPueiVBrtLqZVqpNa7uU39t3r+FZSrOeVG95Wv
	Q6MyFZh9Sh1KehvSmAZkVoEIe5sVYavYjtMOzMZQqeEIrIquKGa6VCo/ETSjmQnmRxi4wsJheef
	Wy23dAxNYO8MzeGQcxGD/ek0iQT4+6MGE=
X-Google-Smtp-Source: AGHT+IHx41IImbCDHn2Jdh7zMNuF3nPpqYLXXAVHuVL/C8w986MehdGPWmZ5hrXWnJ9gl1uAvj5v1w==
X-Received: by 2002:a17:903:18c:b0:294:66ad:113e with SMTP id d9443c01a7336-29466ad11e3mr111410385ad.47.1761330960942;
        Fri, 24 Oct 2025 11:36:00 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e2579e2sm62725945ad.111.2025.10.24.11.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:36:00 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: [PATCH 2/3] Provide and use an always inline version of finish_task_switch
Date: Sat, 25 Oct 2025 02:35:40 +0800
Message-ID: <20251024183541.68955-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024182628.68921-1-qq570070308@gmail.com>
References: <20251024182628.68921-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

finish_task_switch is called during context switching,
inlining it can bring some performance benefits.

Add an always inline version `finish_task_switch_ainline` to be called
during context switching, and keep the original version for being called
elsewhere, so as to take into account the size impact.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 kernel/sched/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1842285eac1e..6cb3f57c4d35 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5069,21 +5069,21 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
  * Note that we may have delayed dropping an mm in context_switch(). If
  * so, we finish that here outside of the runqueue lock. (Doing it
  * with the lock held can cause deadlocks; see schedule() for
  * details.)
  *
  * The context switch have flipped the stack from under us and restored the
  * local variables which were saved when this task called schedule() in the
  * past. 'prev == current' is still correct but we need to recalculate this_rq
  * because prev may have moved to another CPU.
  */
-static struct rq *finish_task_switch(struct task_struct *prev)
+static __always_inline struct rq *finish_task_switch_ainline(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
 	struct mm_struct *mm = rq->prev_mm;
 	unsigned int prev_state;
 
 	/*
 	 * The previous task will have left us with a preempt_count of 2
 	 * because it left us after:
 	 *
@@ -5153,20 +5153,25 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 
 		/* Task is done with its stack. */
 		put_task_stack(prev);
 
 		put_task_struct_rcu_user(prev);
 	}
 
 	return rq;
 }
 
+static struct rq *finish_task_switch(struct task_struct *prev)
+{
+	return finish_task_switch_ainline(prev);
+}
+
 /**
  * schedule_tail - first thing a freshly forked thread must call.
  * @prev: the thread we just switched away from.
  */
 asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	/*
 	 * New tasks start with FORK_PREEMPT_COUNT, see there and
 	 * finish_task_switch() for details.
@@ -5247,21 +5252,21 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 	/* switch_mm_cid() requires the memory barriers above. */
 	switch_mm_cid(rq, prev, next);
 
 	prepare_lock_switch(rq, next, rf);
 
 	/* Here we just switch the register state and the stack. */
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	return finish_task_switch_ainline(prev);
 }
 
 /*
  * nr_running and nr_context_switches:
  *
  * externally visible scheduler statistics: current number of runnable
  * threads, total number of context switches performed since bootup.
  */
 unsigned int nr_running(void)
 {
-- 
2.51.0


