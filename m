Return-Path: <sparclinux+bounces-2840-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8499F133D
	for <lists+sparclinux@lfdr.de>; Fri, 13 Dec 2024 18:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FEBC283DE3
	for <lists+sparclinux@lfdr.de>; Fri, 13 Dec 2024 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E322C1E47D9;
	Fri, 13 Dec 2024 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="29b4MEey"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2861E22E6
	for <sparclinux@vger.kernel.org>; Fri, 13 Dec 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109718; cv=none; b=D/lk5nUN8DfYBbO/qdB4tPQXMK64F4rccohOTFPt6HE4MYBw4G0EKQ7MuEKR1A9ED19uUNrKq7N9GSJdqH/kt6gDUbU6APiEsMGb0ymqcXtuPXonsxi5CMrq9Z5barHMrUlqTWLHgBrKJ/I5y42qWxGaw2wmw3b8+lyYDgLc8lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109718; c=relaxed/simple;
	bh=wE+q7QeqF7YQbDHKzcLUrEGn0D/xKRMVNiL8FZYTzQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DpsyLdFSV8qivmHtUk93gVsBYxayVGxd5Ws74NWf/Bq61b6agV628NM6eqAaFBpI8LbKQCwWkNVzEa+/KuUUF3tAHx4pd4+13BT9j8sbS2A0cIiEwUutd/DWdppxBbttjC5+IR1kuef8lO0aWG6pPIHkRlV+QXQpkfcZrgN6ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=29b4MEey; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so9580a12.1
        for <sparclinux@vger.kernel.org>; Fri, 13 Dec 2024 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734109715; x=1734714515; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=29b4MEeyBWkVqUolfzYcE3Jdwe7eQHVydzI7lGKVgmmConI+6fH8W2P+q2VO49uDZU
         C9TfKKZuLFMdARUuq6mANwRls3tczCxmzBvg0mpeB6exQq5q1UNiToBEPR2Aq/s9jcUv
         4X1t3MRrxJK8Ow8Tix1kwDBH7MzB65liCWjkSHJGGm6SyeQr0FuJCa/NhsUzZQz3Kivz
         k3keI7cVj46jO3yV1rZim5teLqYabD+WToJTOWQT73CAEj6tSajtmdWGmMK9kFijo5FW
         JOn6Wat/cc96//d75BRW2AX3jCfi9sNSZdMpfV2KRsuza6meR3S4Ufr7evF5pJ5tMOr2
         xycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109715; x=1734714515;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=tcGQEWKzc4DWcy76RUPHc7Lq0mN+oahFCIuyldA3FPa7T6IziDPv8Rb2rZ158MBpFg
         6BpSDHxGC67AK72CrrYBbNtdMRb3A7Lohz9uJookiOzxUM4MhkalczkvZRmLJlzQoXjb
         V3FYtzExBG1tTl1NCPQ+df5ibMP28Dv53vM+dbhyHOWzEwmvJAwKba0UIj6K0y4upgYO
         gnGuMOvwJgzPcBMPAUz0+x3eHHcPdnSqvrdWM/Xj6k9Xqz1pYZ2FNFc1NwKSfQhBKqwq
         msTZ4Sf1epCbD656kaM3yejrOTyMcxINMEL4+O/9JGw5sRNXXL3V1UHUSEDnNbinXD1O
         Ru6g==
X-Forwarded-Encrypted: i=1; AJvYcCVT01pa+42PwWwRxRxvZIVViW3ky1fhFLIreWYjRl6vzt562fE+o09hzbVTLCQr7FU9G1bt0/T+hOrB@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBFFeTC3xzzqnYEhOZKZFQ8ntTO+gru8YWj6+Uq7Wq+tg7K68
	aif9I7Fil3+huCOjt+nlaI29HGbbwdHachccDejJMvj12+9ClDqPr86xTZhfvuZMw9QCbPuSJBF
	MzuCEybis8uChZNpdI6aDAvtoWuDwQZ7XZlga
X-Gm-Gg: ASbGnct5AV+BYQnJpmkvuCOoPwnn5w/76mQK7TAfxsdv9Fzk+eqyrIKsalz2n60SKFM
	8k8mpuVdc+MicnaWj5gbD2tYJOuv1zKY40MlpBA==
X-Google-Smtp-Source: AGHT+IE0pzRAvhpWcDoHVTc25a7VJDPqOoxFfUFUvV3kZNJPG0d3Y6hVFQO+pd+M5jbFDlDiTJn/R0kKY+NzL+UHXcQ=
X-Received: by 2002:a05:6402:1517:b0:5d0:b20c:2063 with SMTP id
 4fb4d7f45d1cf-5d63c09e36emr92135a12.7.1734109713373; Fri, 13 Dec 2024
 09:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local> <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local> <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
In-Reply-To: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 12:08:18 -0500
Message-ID: <CAC_TJvdZxQ0-O3Y1bzH0-XdjQYuJPkkpn-umVan--Z6As-tSow@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 11:45=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [241213 10:16]:
> > On Fri, Dec 13, 2024 at 10:06:55AM -0500, Kalesh Singh wrote:
> > > On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
>
> ...
>
> > >
> > > On the technical side, Liam is right that the copy-pasted arch code
> > > has inconsistencies (missing checks, order of checks, ...). I agree
> > > there=E2=80=99s room for further consolidation. I=E2=80=99ll take ano=
ther stab at it
> > > and resend it as an RFC with an updated cover letter, as Lorenzo and
> > > others suggested.
>
> Thanks.  Can you please include what platforms you have tested in your
> cover letter (and level of testing - booting, running something, etc).
>
> If you have not tested them, then it might be worth it to have it as an
> RFC to point this out - at least initially.  Some of these are very
> difficult to set up for testing, but it is also possible that you did
> that and the maintainers/people who usually test these things will
> assume it's fine if you don't spell out what's going on.
>

I build-tested most of these except (csky and loongarch) and ran
android runtime (ART) tests on arm64 and x86. I can try to spin up a
few of the others and will add it to the description.

> >
> > The most useful thing here as well to help us understand would be to wr=
ite
> > more in the cover letter to expand on what it is you ultimately what to
> > achieve here - it seems like an extension on the existing THP work on a
> > per-arch basis (I may be wrong)? So adding more detail would be super
> > useful here! :)
> >
> > We do hope to avoid arch hooks if at all possible explicitly for the re=
ason
> > that they can be applied at unfortunate times in terms of locking/wheth=
er
> > the objects in question are fully/partially instantiated, VMA visibilit=
y
> > etc. etc. based on having had issues in these areas before.
> >
> > Also if a hook means 'anything' can happen at a certain point, it means=
 we
> > can't make any assumptions about what has/hasn't and have to account fo=
r
> > anything which seriously complicates things.
> >
> > Ideally we'd find a means to achieve the same thing while also exposing=
 us
> > as little as possible to what may be mutated.
>
>
> Yes, I'm not sure of what your plans are, but I would like to see all of
> these custom functions removed, if at all possible.

Initially I think we can remove the mmap hint portion of the logic;
and follow up with removing arch_get_unmapped_area[_topdown](). Some
of those may not make sense to consolidate e.g. powerpc's
slice_get_unmapped_area() which doesn't share much in common with the
rest.

Thanks,
Kalesh

>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

