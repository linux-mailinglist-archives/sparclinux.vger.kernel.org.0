Return-Path: <sparclinux+bounces-4999-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D409B566AA
	for <lists+sparclinux@lfdr.de>; Sun, 14 Sep 2025 06:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12254226D0
	for <lists+sparclinux@lfdr.de>; Sun, 14 Sep 2025 04:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDB425A2BB;
	Sun, 14 Sep 2025 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJqW6gFT"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA6259C83
	for <sparclinux@vger.kernel.org>; Sun, 14 Sep 2025 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757823574; cv=none; b=i+IrBYQJ4NWKvMwJQnJ3d7JXXtJs7rkD+60SSXPiDZKWwWrbYQ9avFXh/vaN+bQmDobeqtf3QIESS7eWUUPzQSi2f5Z9PHG+7FUjGh32E+Bq8YhvgYglLm4rzmtGodNwIG1DbqSy8XwY18T23Bypgs2EQuNq/WYKIElHuF0DarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757823574; c=relaxed/simple;
	bh=nKH8BykbZ/NG2ohjRy0QYNVXxhFKK6pBLbFy0ufJ1Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yye13rJ+Lauev+x0p2CagzGG4lN3SqdiW+rwATz1VIAVNoU7l87EmAGp/WOx4nIEh7LRGZWiJLnokAl2cTkaiv5EPMhzGUnIhVKC/l29ChItGAlDSgEr3m3M2UNOPZPiznbqwqQ4QcT3Jt3QQfjFaAiqcEBCDhKpcq8ddc0F998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJqW6gFT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b042cc39551so517039766b.0
        for <sparclinux@vger.kernel.org>; Sat, 13 Sep 2025 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=OJqW6gFTmxCLo302hPNut8BO+ryXGy8PIMl/uEHO+E+z8i2EI7bfQdJIzRtBRfvXw+
         kcWbRtogH1JQpYSKNv6/zC4/cphZqfgFpRGzi+biQSqIyclF5+D85pOtnPCF+2OqkZz3
         CDy5gGsVM4vK7s4rQQw8rm4UeVohzh6niXAU3IEb2SuGNO2EeuKPfgMpVtnZIsHoZjbx
         vpDwdZIfOKoR5NhKuV5Cx0QkZBDdn8VSiqtXNhrSCK1lfZzEVpu8tq07tpGEuWiSX78h
         yx8FmO3uN2ENwCxH/6hjHHYqFM9jtWMEntVkZB7EYZ3E0XE1sdusU+KrGJTN7b5oFKbe
         8fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=gdmurKZhM75xU/Ne9C5phppjQH8NPAO+oDqk2g6RFw4u5cU1QC07log0t48QSwaViS
         +7cTOuKVtxMZ3lUsvIbgYDG23SFEm+8PLLnCE5Bn+Mp7VnQjmfAFhRv98KNecy5A3AM7
         eI9d8nH09n6n/gdKtTr1RJqGHK9oN2VxJFggmRxWEO/D/v+TA9gMS6CgpNssHPx80nMr
         8YsdiXl9azBC79a3md4cQPBwPXz8dWUoncWCf2fJOPaBHj0o0w6oJhaaaUN3lX8ulrkI
         510O9gwAjxel9yKUTEH8rGUn2wH2+LAyMPZwU5/xVuIzdGTQp/Kvp5hDxqmYWMhekbZe
         VI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDkC/KQ4Lg1CIJUdZK12/dP7ayVRSQTImZbhE+FyvjX2PLFZJ7NS/6JiKdDyCaj2BHU2veSwUeVu5j@vger.kernel.org
X-Gm-Message-State: AOJu0YzqO6Ijx41c1JQRi6WXTtt0Sn91vzzzrC8zI3eh7gbQnYLxAFZX
	MofQ+ghCx68x+db1NVmwH02ucr5Nhoo60lV4LBfPcNpQcaCXcyTDhAuf
X-Gm-Gg: ASbGncuRILxBBkSZCdLxNdTW5XnB7cpkNUS0CEkSbwmkgNBd/QuMvCzN3emPxqiFau/
	0oxiYRVdHpL+2OmU86qG1x0hmydkq2ykznw48GSUz6+VFvaGpC7uh+4xEfiO0SvavZh9fhYCc4n
	bJKVPSL10zZ874PrhP+i0lQaHP1VU+9NVuOO5GVP44Cub968H0E4vuGdmvkPAz33bwcU9yOIR9g
	sUVM1chgqZH4l4IteKUjbo1Jbr81MaG3QpoI3Btk+h50SrzA5htDiNsQpegDdT7Qaj5Vcm+z6jM
	gxYZOmVtZr6yGS/xe0cePXwhPimo5ow3qsA74OiYq/ATzjYrJECOIZ8seQh6OCrWQw95YFireKE
	5J3SQYLmmrFB6ASbH26AIPERsixap4Q==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin

