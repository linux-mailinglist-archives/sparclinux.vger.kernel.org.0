Return-Path: <sparclinux+bounces-1702-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0982E9391D9
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jul 2024 17:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66F98B21100
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jul 2024 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C216E862;
	Mon, 22 Jul 2024 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8iFXR5F"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1216DEBC
	for <sparclinux@vger.kernel.org>; Mon, 22 Jul 2024 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721662316; cv=none; b=V0qcp9Csn4t15np9s7dEthOMru4knfnPGurKmXQUOMN1pH2M7OoXzZxZHC1lqvOBamO6K20RL8tA2WdqnJTze5pQgxOZozdsPBo1pokySjKWNKdBzR3XKofFp75AHnKhpC+NQPTKXOQULlg7zR4Zli/EGIPWOwsfN+W/Bwzw5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721662316; c=relaxed/simple;
	bh=Qme2HpEsv7RSmE58takLuJoDVmou4OYpE5Ns+lgc4w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZKwf6zV/09pjOnKIm14f4VP1tPjNNT30PrRMqOC36TpVUU/zhnuCYSlGEElZ7wP9XyPmcfMImSsQV8z5Y8bvWGbMqd6M5vcOcKkFfYjWriybDcI/Og0sOw6PmB8intqevDzpIaABxH05EuzW1mcSDjN4nleuLLMQ1XBvtyPq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8iFXR5F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721662313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
	b=e8iFXR5FjMpRqjzWoXmGV4rVxrRhwQLPbExuo+6FB8bJBWWWOEcpYU1zIpdPcpXaZtM6E6
	W3LxbECIGSLpocxBe7XynleoT7Mv17Q7iwGsbKE3M175bPCgJ64BQs/EhhTRdkZVy8WIKr
	txoJwVW24+lWXCJmGu2IZ+bVK8HHwzA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-2QjjkkVXOoyErIZO0vBhSw-1; Mon, 22 Jul 2024 11:31:52 -0400
X-MC-Unique: 2QjjkkVXOoyErIZO0vBhSw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-66a9bff5a4eso9216877b3.0
        for <sparclinux@vger.kernel.org>; Mon, 22 Jul 2024 08:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721662312; x=1722267112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
        b=VxN/9qOdjue06m+yeuOubzK5lvyF/2FL3spc2xsLh/Yq75/T69e4pZu0ZU8ff/fxd9
         uTVw/8BYHNCiZ+TnTnXJwT7HfmNI1pe531HykfSzhLlmIwbV0a6axKPE/QCfe24Ihbq5
         ztRZWqMNAX7j0UIi9hVc9zGFmFQBfdXcMkI5P9qS4vcc2xXEb8knD69E1/4OIqY5fK4c
         QD0rKqKBZfsD+7VL2T4gQpQEpt8Dxo3XmaUyy/sMr0rLNlfOx0B/42yWCYCaeXM743fh
         X2jKTtPcrNFQV5n8gasaXgEdBOkoaB/fpMzyVTNyUZWRlWUiqdyBUboj8G/4ty4fgQro
         jJrg==
X-Forwarded-Encrypted: i=1; AJvYcCVGJzdwWLiSfPRMkvBGoVtNhWQUlWvy1SEDykYjUqWfJmkZBpw4kQPF+1z2pd2QvLL6EmNgYoPJ7+QPuX0HCn02Kya9h7XJr18ciw==
X-Gm-Message-State: AOJu0Yznik2ND+YkvURQb/1WhshDDvDn6RBip876BNngVKAP1RbQSC2l
	QuDhvBe8i441pkA1cs7u0g/KFXHnxazBSTgCXxkI80c57n2Kyz/mcntiOhlAO0YRgmjXHbFd5TH
	xEUtpD8WCQcR3HTk9b/Hp9lEi6dFKJUlWzpcMy3DZT8dp8uhMtpw9bOggias=
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047537b3.4.1721662311579;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAYBMqsJOtNPwFqnMhMAJ/HDPRITSVBivrOVSPNdHxvmNPnz6ZnQiqjkhPkHbmoLpOWtDQA==
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047287b3.4.1721662311092;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fba6efsm372071285a.41.2024.07.22.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:31:50 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:31:48 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Message-ID: <Zp57ZLk2IQoHOI7u@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>

On Mon, Jul 22, 2024 at 03:29:43PM +0200, David Hildenbrand wrote:
> On 18.07.24 00:02, Peter Xu wrote:
> > This is an RFC series, so not yet for merging.  Please don't be scared by
> > the code changes: most of them are code movements only.
> > 
> > This series is based on the dax mprotect fix series here (while that one is
> > based on mm-unstable):
> > 
> >    [PATCH v3 0/8] mm/mprotect: Fix dax puds
> >    https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
> > 
> > Overview
> > ========
> > 
> > This series doesn't provide any feature change.  The only goal of this
> > series is to start decoupling two ideas: "THP" and "huge mapping".  We
> > already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
> > one extends that idea into the code.
> > 
> > The issue is that we have so many functions that only compile with
> > CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
> > a pretty common concept, which can apply to many things besides THPs
> > nowadays.  The major THP file is mm/huge_memory.c as of now.
> > 
> > The first example of such huge mapping users will be hugetlb.  We lived
> > until now with no problem simply because Linux almost duplicated all the
> > logics there in the "THP" files into hugetlb APIs.  If we want to get rid
> > of hugetlb specific APIs and paths, this _might_ be the first thing we want
> > to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
> > if !CONFIG_THP.
> > 
> > Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
> > it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
> > a must?  Do we also want to have every new pmd/pud mappings in the future
> > to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.
> > 
> > If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
> > are larger than PAGE_SIZE) is a more generic concept than THP, then I think
> > at some point we need to move the generic code out of THP code into a
> > common code base.
> > 
> > This is what this series does as a start.
> 
> Hi Peter!
> 
> From a quick glimpse, patch #1-#4 do make sense independent of patch #5.
> 
> I am not so sure about all of the code movement in patch #5. If large folios
> are the future, then likely huge_memory.c should simply be the home for all
> that logic.
> 
> Maybe the goal should better be to compile huge_memory.c not only for THP,
> but also for other use cases that require that logic, and fence off all THP
> specific stuff using #ifdef?
> 
> Not sure, though. But a lot of this code movements/churn might be avoidable.

I'm fine using ifdefs in the current fine, but IMHO it's a matter of
whether we want to keep huge_memory.c growing into even larger file, and
keep all large folio logics only in that file.  Currently it's ~4000 LOCs.

Nornally I don't see this as much of a "code churn" category, because it
doesn't changes the code itself but only move things.  I personally also
prefer without code churns, but only in the case where there'll be tiny
little functional changes here and there without real benefit.

It's pretty unavoidable to me when one file grows too large and we'll need
to split, and in this case git doesn't have a good way to track such
movement..

Irrelevant of this, just to mention I think there's still one option that I
at least can make the huge pfnmap depends on THP again which shouldn't be a
huge deal (I don't have any use case that needs huge pfnmap but disable
THP, anyway..), so this series isn't an immediate concern to me for that
route.  But for a hugetlb rework this might be something we need to do,
because we simplly can't make CONFIG_HUGETLB rely on CONFIG_THP..

Thanks,

-- 
Peter Xu


