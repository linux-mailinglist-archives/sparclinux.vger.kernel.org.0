Return-Path: <sparclinux+bounces-4727-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14497B45D05
	for <lists+sparclinux@lfdr.de>; Fri,  5 Sep 2025 17:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90693188E661
	for <lists+sparclinux@lfdr.de>; Fri,  5 Sep 2025 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435872FB0B8;
	Fri,  5 Sep 2025 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DRFTEJUz"
X-Original-To: sparclinux@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262024EA9D;
	Fri,  5 Sep 2025 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087365; cv=none; b=JtkcUCRL0WcjHn5gmsJFVld/u5MktpXRg8/gM6PyZo/mLB7valdBm5H2/Jvl0ymb7qbYphqEY1/pqe9SC/vvb17bdNWOy5dEwYRVD6bXyJ4agyhszfqkd5fTbZ/hij+e9XoTWwf/u9PYbMGRBAwkQsckr696s56Tlmp3MtFxxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087365; c=relaxed/simple;
	bh=4mIxP72eS0LmGYvRHu+tYBXtiieXUi8pm8fU9+ptrI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSUDqXLnxbqF/GOBLUc5+myiFXCvK6cwp6V2fb4ETWK5ahqQN9wK6//kwpO+xjLlB1E7nHohrdMmLjchEBpWKmJopqMxnVAjkuq5oqdu+wKMfTTemD8gRJlJGnj7azz5vDhZI0qDshvG72uIqzfrSsZXROpz7sTKWFzH8shJvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DRFTEJUz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585AgQoa017948;
	Fri, 5 Sep 2025 15:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=mCfoUYLMC6HNsYLC2Cmci4imZfw/Ws
	ROhnMAP3rAWN8=; b=DRFTEJUzUMLxbxYuAXuLuwNqrzv8c+DrkFqe89wjY27c9F
	HPKmwnL0ffbZLOY3Rz5gz7HsHuFYQX6DqipN3T17S7pXXoPQ0OUX26rpw2bM2Ta4
	HCoGI8+peE6wgvdwt4ZhOwwGmSI9acpU5CBc496pJ6Kl9gzxQDChu/+1O6PlEWaS
	HHHSSQvfm9GSge31HtdVFwim+meO0SH5sOxV9j5RYTRpeOEqPos2duD1GYvhAUwk
	Y1ASxol3ifR8yNeQRkjgWqPhocL/iRqrC9el8+zCXSORnp/lvdaNXU7o8ETDqd86
	PWf/tQ2g4yPndZLt/k4Lq6iGIW8zebN60vYAGngw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurhfn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:48:31 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 585FkhKr005421;
	Fri, 5 Sep 2025 15:48:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usurhfmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:48:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 585D0Hpj019442;
	Fri, 5 Sep 2025 15:48:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vd4na0hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:48:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 585FmRQ252298180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Sep 2025 15:48:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB1582004E;
	Fri,  5 Sep 2025 15:48:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EE2320043;
	Fri,  5 Sep 2025 15:48:25 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.48.240])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  5 Sep 2025 15:48:25 +0000 (GMT)
Date: Fri, 5 Sep 2025 17:48:23 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/7] x86/xen: support nested lazy_mmu sections (again)
Message-ID: <d3adc2a0-5888-411e-ac7c-9df45e3389c9-agordeev@linux.ibm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-5-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-5-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfX5iXkXHtPokV2
 s58RZ7e813edv+vWWoqJUrrtWQXbub6NiX58yP1v9mbmzE5GTo4wfrfFkR/YZ/MbCR+iaBSdaCX
 adCNlkxNA/nEsZ3agSOH3KgEWq38b6wGZtWAzoLq+mKBzCvbn/uEMkBgl3O9f5obeDeeWy94B3P
 LgKQGohc5o/PIli23EYmnTGZI+Oj8pYgiOworIhg3wrM4u606YHplewCbIn1zTW8AdxtJuUJDYA
 iMBC7cL5Ca1p2IQg+1kqXYCy73F3DoQq/aCn8/pSszhndcjXi11V8uX0tGswVehF3dhVd7AerLt
 JrqhsabJDFJw5fzoqnl1EhDRooO7y32BwqH5cYOjZy4q0rOcELXv53bz54YHJ9HbXtIGc4qdlip
 ckpxcnXd
X-Proofpoint-GUID: u6h_butZCR90wxuVu6ifBPi5r4KK37UM
X-Proofpoint-ORIG-GUID: HU44fewV-eZEBpYhS3NFrN8FS6mJ4q6n
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68bb064f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=36QzpkCBnVJsay_x71QA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030

On Thu, Sep 04, 2025 at 01:57:33PM +0100, Kevin Brodsky wrote:
...
> -static void xen_enter_lazy_mmu(void)
> +static lazy_mmu_state_t xen_enter_lazy_mmu(void)
>  {
> +	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
> +		return LAZY_MMU_NESTED;
> +
>  	enter_lazy(XEN_LAZY_MMU);
> +	return LAZY_MMU_DEFAULT;
>  }
>  
>  static void xen_flush_lazy_mmu(void)
> @@ -2167,11 +2171,12 @@ static void __init xen_post_allocator_init(void)
>  	pv_ops.mmu.write_cr3 = &xen_write_cr3;
>  }
>  
> -static void xen_leave_lazy_mmu(void)
> +static void xen_leave_lazy_mmu(lazy_mmu_state_t state)
>  {
>  	preempt_disable();
>  	xen_mc_flush();
> -	leave_lazy(XEN_LAZY_MMU);
> +	if (state != LAZY_MMU_NESTED)
> +		leave_lazy(XEN_LAZY_MMU);

Based on xen_enter_lazy_mmu(), whether this condition needs to be
executed with the preemption disabled?

Or may be this_cpu_read(xen_lazy_mode) + enter_lazy(XEN_LAZY_MMU)
should be executed with the preemption disabled?

>  	preempt_enable();
>  }

Thanks!

