Return-Path: <sparclinux+bounces-5486-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C5C09E00
	for <lists+sparclinux@lfdr.de>; Sat, 25 Oct 2025 19:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F1D8D4E14B4
	for <lists+sparclinux@lfdr.de>; Sat, 25 Oct 2025 17:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4390E3002A4;
	Sat, 25 Oct 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk9x7iAG"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFDA2DAFC8
	for <sparclinux@vger.kernel.org>; Sat, 25 Oct 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761413846; cv=none; b=b3tQOvcur+412DPdnbo0RXTIdzLz0gXSLmofK2EW+XlcP/xzgiW9yaortpOn6XuCAPTI/uRCX4RTGbfRQo9vnT98USQ/N4mMarQQOcjzFMV0e9Zfpm3Utcen+PWRrur2cVHKUpoiWr2hGO+MkAtTvf1iHpEIdpMbaNtGvsUlEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761413846; c=relaxed/simple;
	bh=o24Lh0m865LHAd7eTl0nkiD2wbOoM9UeuHg61Ehlg7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4Lc/atHYS0Dm9P6STg3sAqsHM+NThQ1Gh1UIKdWMRILsk1MfLtALt/vDoZT/g5nH6x70cY4iRZ7jNAauF0Awhpk28otrZqzUcm2j0L0cOQMmK6xF3ckueSHtxxQli/vaaR6gaqGMd0cjI9xMs8MK4Tvf/8x5cUINSJKf/PIRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk9x7iAG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6cf1a95274so2241621a12.1
        for <sparclinux@vger.kernel.org>; Sat, 25 Oct 2025 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761413844; x=1762018644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W24fDmk9KGuj2UH3C1cIlrBfOFLoZl/lXv81T5OGdqU=;
        b=mk9x7iAGmYO7tW9YafWV9tGPaXYPbNgrs1aKXU1jolK2PakpbARKQ5w23oK5Wqtguy
         RGd6N5QQvPLy+to9fuBWbf7L1e+TNI+mT4Ir/1XwpO2MbslZnby5W0a/6IRKVPW/qN2k
         sHAQfJT0oKARaftrRM/OKNuboD2/2Gd4n+lt+cD1dg+UzWr83ZPAVsGMD7X5zBvTaOf4
         KXEgMtPx5LwiG/I8zVyPsoIvwep2TwfRkntPCtJ9zK4//dQxSdJdwqjCmb9tVDD7DO84
         kKpoAFHx6CyVZYFD2+8gbQZJT0fwnx1IYonJWI7BAQwHQ0QUjCCRQNRvLjwPIJ65j59d
         2Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761413844; x=1762018644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W24fDmk9KGuj2UH3C1cIlrBfOFLoZl/lXv81T5OGdqU=;
        b=IIkRuoIYjGF3iz/quAUOqPeB0T7q/96Rkd+CvYpDVDcWSkIFugHRbVksPRU1sraCRH
         RkxOwbjxRf3oU1dnjp1ls4413cr4BXbl9KxFoMreEUAbU9kjmYBrj6F8lTehH84URNvx
         9a5uOntQSwHmzdcrdJIX1BNV8y1mqgy5Az4Ft77144YJIjFB5EogIV0ZSyeJXymvWdzM
         x1vMX9cCU6X9h2zDaiST0kiuWQph41FhSowVbiA2RWInLQ4c3pzusQzwzwdWzZI4naRD
         1aDlAwXH7apV7HqmVvehvc83q+hang9KMBYU+wWyQaaVDD5IMZ/o+ry8S3jrRGD+Q1IB
         xGfg==
X-Forwarded-Encrypted: i=1; AJvYcCXSKUqCvVm2LfPFXagQR4uoVzYy+9lTVH5eNS4eEtUZO1KmKymwoInsVkrw7VDS2WOlCgBjriiYRqAW@vger.kernel.org
X-Gm-Message-State: AOJu0YydUTud9F3wFnjAFdQn5zNkIE2ELm06i4YXtJGJ+INqmVgF9xb9
	yf2uQ9xwV9to3oHt2MsFlt/uMbVn4TFwbvouH9b2sEQVVdhreNhAiS9l
X-Gm-Gg: ASbGncvcvIGtaT+vnf/h2V4u6dW+grysN2qlBBu7KpRsY5/QI0XmB/EXp6pId4TPOXk
	C79KtLqdzgT3Lv6GyGjrnKl4BOevnnnbN/bMuZpiPVFNpKUgz2tlrfcxDW2oW19Mcw6rJY3WicX
	EflV3jiG+rZJrX+eS7iC6mEG5UwKfJ2DWl3oIe7+VwnaLHmQq0EAunrrsapFnjqlngb0z9TlAM+
	hBpqjsPpbEpMfQLVy2FRIgLj5GWWa3yGRivwqWU5fyWgpQ1DX42vNuouDNi7kiiBmSuD92/Ut8R
	Nrl5bdSiVmdOi5mulGLOSJ8PHySaCduTnrg/28WoXt8a+4HAKKRj3xfw9c7K8lnqBDL5zL5FetO
	FjCKcuCQzOXAg4Hl4ZJ/rAH8CpOH9TEqgjieGkbJjuQR04mkaOSgRH9C1KwsNzvxkcxt2HcmA6O
	NnuGtYugSuQQchczUSz3rB
X-Google-Smtp-Source: AGHT+IG7r64b+QFeTKdxScX1JEZBuLYNZKVtVxJcQwnEV/Y6Xyj7YdsojGm9RYGUWg1kr834PfcIZg==
X-Received: by 2002:a05:6a20:7344:b0:309:48d8:cf0a with SMTP id adf61e73a8af0-334a8649ed5mr43587422637.54.1761413843895;
        Sat, 25 Oct 2025 10:37:23 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm2656018a12.5.2025.10.25.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 10:37:23 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: riel@surriel.com,
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
Date: Sun, 26 Oct 2025 01:37:00 +0800
Message-ID: <20251025173700.754-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
References: <18734a4944e47952b7ad3e10a36c902392bdaa91.camel@surriel.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 24 Oct 2025 17:36:06 -0400, Rik van Riel wrote:
> Also, what kind of performance improvement
> have you measured with these changes?

When I debugged performance issues before, I used the company's equipment.
I could only observe the macro business performance data, but not the
specific scheduling time. Today I did some testing using my devices,
and the testing logic is as follows:
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

On my device, these patches have very little effect when mitigations off,
but the improvement was still very noticeable when the mitigation was on.
I suspect this is because I'm using a recent Ryzen CPU with a very
powerful instruction cache and branch prediction capabilities, so without
considering the Spectre vulnerability, inlining is less effective.
However, on embedded devices with small instruction caches, these patches
should still be effective even with mitigations off.

Xie Yuanbin

