Return-Path: <sparclinux+bounces-5487-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90694C09E4A
	for <lists+sparclinux@lfdr.de>; Sat, 25 Oct 2025 20:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634423AD6DF
	for <lists+sparclinux@lfdr.de>; Sat, 25 Oct 2025 18:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96912D2499;
	Sat, 25 Oct 2025 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bh6UVIoN"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370962C21F7
	for <sparclinux@vger.kernel.org>; Sat, 25 Oct 2025 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761416476; cv=none; b=Lr0WN+Lj605xuXmRwOFPUbMT1aTDK9gt1n0pm4gIYud+/aWjJz6zyUGMnI7/KH78J/VW+iaJ60yXQjeaNOPqDUQPXXW1rlAIk6ajglpPl8sd+izlnL+fdmcBD8Ong9I/dnQsPfCtqKVczknkxATD9Lfx3rF6jNx3/od3Ru86yIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761416476; c=relaxed/simple;
	bh=+C2t4uOr/arkY4PV0Bi4a8mpwjxLCqXksHgdBuOHyq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blATe8kmgHbo/nz/r/JvKqGNzuR8/66J0jKYmaXXrY0wXg7lGLlSSwHYpF2KMp88D4XZ0Pnoad7uAPCxoCVLBZjU4LdCGOkLWSOowXrAmv81durHkQB1RjLZTGLf0JooK0W2uEJDjgBG7SiTYhMm+/TD88qFGkSkh6SNP5pimpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bh6UVIoN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so3352040a91.1
        for <sparclinux@vger.kernel.org>; Sat, 25 Oct 2025 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761416474; x=1762021274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH14/MnMcHfYPrdUmbrPExznn7x87YgaxQDndo6vh/4=;
        b=bh6UVIoN6V6Ed1kwO7wrh0VhhcnFHMpTi+t3OPI28CEyxBcs8Xb+zGdVjwrtct++fM
         kgtlbQbFJF0hURbxQDVq6b1JFicyoSZ3q0IQZrW8SrNDr+rxrB6tHWmPemaXsxzMW7qr
         vdLc9L51kKsvVOa9pQq8H/f7JiPurVRVPwFJT21oVX4MgWmfB7/SXNVTOnbH9Hxy97GM
         2VV4j9I8K6CfCszYFpTOJYBqezYQu3lU+D+TQ8RL5GikSWtyGxo9Q0g/O2M+i7f6XgmE
         3ryhdMV9DPKZAWYTxomZwmd4HAx0cL5nEa8jpm1KkAO08g5pJw3I8jpYN1hwrmOG8E9X
         zCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761416474; x=1762021274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH14/MnMcHfYPrdUmbrPExznn7x87YgaxQDndo6vh/4=;
        b=vlaSpIkiTjC2jMAFzaWyZaRZc4fCDy4DzN2oFoXBo3lZ4leZLL7ABoLnIf0Nmu3/8F
         gCm/+72tQEoYAc1tRD7x1slbfSo6L+aDK4gIPTpSYlJDEqH0As/DwpyWKduHv3u2p6xF
         0UdfbZ3XymYEinon8x8oMcJE+WpP58P6Rtqm9ZiJfHyd48+SH07xJHfVhPhzTWGpVjZL
         HR7b203cyuGMKaA4M55LB0CqLMZu2cSyUrwup1ryQkAJ8R4f0V0hCpqEPJ+IiXHwNAkr
         Hvrsnuq8Uxh5Ou5hT8KlHVcc08wu0yR3DM0qMc5ywJ42OF3gqbheMdjng/xFguF/4H6D
         K6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJVd6qInFlVna2YOPQ03x1NAbEowVzhD9BcKDIGM745rZEeTguNYZMLAn4yH6pa/rOy8A2gCC0rP7v@vger.kernel.org
X-Gm-Message-State: AOJu0YzOruE2A+BBQt1xEd5IWOTkQIPdpyuuHLa73B/ij02tKN1JPh6O
	LwhquoQniT3hBE4JdJkiZqFRippNrdemskRZXvvJ+iuPTsyjpFyyrB4k
X-Gm-Gg: ASbGnctZzU2JBcb6YHX1fRgRCDUBoW7Q/hjhdoS1U0rtkCXOHTu5TUunFfuthzHQSO1
	fF0UlSNfmlWjsNgs0K9QYOfDqd4Le3wEEl4H0y0n/BuQdps8gir2KlWF9nzIwOsrIxsx2pQoELv
	ERYkJHH9t+Y5Q50LQTg6h85peWFUontO3eSND1PqUTFVBKJHkrPtr6An1C3oM61Oxs8hg00g9EZ
	MZUebYBmSk409AcO3ou+yAur/H6RUsQBp5wp2pYIOs15jbnwkYxA/bYSPzPnS/IuqhhDDTgRB8S
	oW1WkMdEiZLoztbyYjPGENyhdiICbFZ6UGGjdhJszrJSCN47aaoCoHn/xMzxiE5o31pjVm/MXKX
	bCwtZQ/QGjGxfIYq2w7n2jV9jr9VtoLzcnpbTB9SM7/HK0fwTvd1IIQvS80fgIU5XTMMtI0vxDD
	FZ6TuEEYWv09JNqOAzW1iT
X-Google-Smtp-Source: AGHT+IEsUSXlYbD6I629dWvXZvj4cEZuKoZGpxoERZCztC74qj4lgbg/Yxnib/SOWntPtHtuSob5TA==
X-Received: by 2002:a17:902:ea11:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2948b97429emr78955375ad.14.1761416474192;
        Sat, 25 Oct 2025 11:21:14 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4113fsm29127285ad.90.2025.10.25.11.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 11:21:13 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org,
	linux@armlinux.org.uk,
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
Subject: Re: [PATCH 0/3] Optimize code generation during context
Date: Sun, 26 Oct 2025 02:20:53 +0800
Message-ID: <20251025182053.6634-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025122659.GA2352457@noisy.programming.kicks-ass.net>
References: <20251025122659.GA2352457@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 25 Oct 2025 14:26:59 +0200, Peter Zijlstra wrote:
> Not sure what compiler you're running, but it is on the one random
> compile I just checked.

I'm using gcc 15.2 and clang 22 now, Neither of them inlines
finish_task_switch function, even at O2 optimization level.

> you have no performance numbers included or any other justification for
> any of this ugly.

I apologize for this. I originally discovered this missed optimization
when I was debugging a scheduling performance issue. I was using the
company's equipment and could only observe macro business performance
data, but not the specific scheduling time consuming data.
Today I did some testing using my own devices,
the testing logic is as follows:
```
-	return finish_task_switch(prev);
+	start_time = rdtsc();
+	barrier();
+	rq = finish_task_switch(prev);
+	barrier();
+	end_time = rdtsc;
+	return rq;
```

The test data is as follows:
1. mitigations Off, without patches: 13.5 - 13.7
2. mitigations Off, with patches: 13.5 - 13.7
3. mitigations On, without patches: 23.3 - 23.6
4. mitigations On, with patches: 16.6 - 16.8

Some config:
PREEMPT=n
DEBUG_PREEMPT=n
NO_HZ_FULL=n
NO_HZ_IDLE=y
STACKPROTECTOR_STRONG=y

On my device, these patches have very little effect when mitigations off,
but the improvement was still very noticeable when the mitigation was on.
I suspect this is because I'm using a recent Ryzen CPU with a very
powerful instruction cache and branch prediction capabilities, so without
considering the Spectre vulnerability, inlining is less effective.
However, on embedded devices with small instruction caches, these patches
should still be effective even with mitigations off.

>> 3. The __schedule function has __sched attribute, which makes it be
>> placed in the ".sched.text" section, while finish_task_switch does not,
>> which causes their distance to be very far in binary, aggravating the
>> above performance degradation.
>
> How? If it doesn't get inlined it will be a direct call, in which case
> the prefetcher should have no trouble.

Placing related functions and data close together in the binary is a
common compiler optimization. For example, the cold and hot attributes
will place codes in ".text.hot" and ".text.cold" sections. This reduces
cache misses for instruction and data caches.

The current code adds the __sched attribute to the __schedule function
(placing it into ".text.sched" section), but not to finish_task_switch,
causing them to be very far apart in the binary.
If the __schedule function didn't have the __sched attribute, both would
be in the .text section of the sched.o translation unit.
Thus, the __sched attribute in the __schedule function actually causes a
degradation, and inlining finish_task_switch can alleviate this problem.

Xie Yuanbin

