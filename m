Return-Path: <sparclinux+bounces-2165-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6C96A758
	for <lists+sparclinux@lfdr.de>; Tue,  3 Sep 2024 21:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580541F24699
	for <lists+sparclinux@lfdr.de>; Tue,  3 Sep 2024 19:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F81D7E2B;
	Tue,  3 Sep 2024 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g1xynW/+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0UqXOrhC"
X-Original-To: sparclinux@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0C1D7E24;
	Tue,  3 Sep 2024 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725391577; cv=fail; b=fhqhpaxP9ckcu+/Jq6UKQx68WNrcQYN4g1U3AgrH+Z37w6gJ6ZslGAnim3OaVKQFF4P6FH8XJnAT0zvZKUR3XuZPkFOOWlsexftp2AUSGPTfKbph66YKl3YTvAKqx/VrPdvOUmGNfwp3TBwmQvLG7piu8QhVGYBPmD2VB+ALONI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725391577; c=relaxed/simple;
	bh=1yLHJ6GdeLL+vrcoPTlIjLL7/SQavWAN93u/YE0wsoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HpGJNRWtg7+3Y6pDIOTfSt7ur1sFCewfTABkkOLdghDSN65u0B7Xe1BlFjact0R1yrzEoR39p1Sol29S53FLpj4SKBAwW04J4I1v9805p43iLT/2iP/lt55aL/83BIqNmsbOMTsEsW7yXoiIqPVK6/TCqQZvCgFaXC5Z2Yv1TWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g1xynW/+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0UqXOrhC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtSwb011144;
	Tue, 3 Sep 2024 19:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=1yLHJ6GdeLL+vrc
	oPTlIjLL7/SQavWAN93u/YE0wsoc=; b=g1xynW/+Abr63UaNxr5gr7RQQrxor3e
	huxWTr1S0Ywo304oxylXY5cpQCOlSm72Up3OqgF3n1tpLUFHCAAS5eJSigu54Toe
	xQ35UE6ayPMy/h5QocP7hUs9ZdnasHNf/R8iwwaZlLRnxEp1qzTnesbus3fXtA4L
	V6t79USd8awXAoBFCJ+EPwzB/uoXKn9DpvO36h5xaQucmB2KGwRhxt6sdIXdwIAX
	BdEEWaEsy8yOeaZ0NtRYrXZdzWCl4oYJVyQ0FNzOlBkeQEzMX8xEM6fgjMZhMAA3
	SmAIJJySb/XrDfFQ0xqjW/d9E/LSS9dr1YlgopuOGNJlKgZBx6v/n9g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84jf2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:24:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483IfiI7001728;
	Tue, 3 Sep 2024 19:24:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmfdeyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REXhqYCTFe/qM1XRIQCUgV4O8a2O2pi9zCIzcA30wJeEYFrWc2PMaZhvE+K97fD3GlY5HLUaHOhlbAkpAjjPE/R4Hwee+L8lkLLvWthFxNhL+HbRJppbMtA7N81T/ERO5VtheuXpaK7u59GfUtTpzQY707PA3s2mZMmWbT25rv5bPqv9KybYQI10bwX+1qefhQesSCGtDLQ6XJ/U5RFUJsWVy0wYNLpwY3pc9ZU9Ml2hBx7FZv77a3ZBLZmZTb2ZNXyxIJWQW+Zi2y5U5BLrAwQ4VPBHo3eXTKN4hwWu4e2f2Ex7uXVBv3CQUOPJEl2AVPupEFQHndshrW/bH4INZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yLHJ6GdeLL+vrcoPTlIjLL7/SQavWAN93u/YE0wsoc=;
 b=KjcfJciUmYMRLyt1EdGjQcwQoPqQ11VZ6fseIwdh5kZW9Ya4KrCCtiJ/MTbKs58ffFBz19LyXf+vNrqznBxWZHK8cL/WjM+mXNR+Dh0I2ND1GNGFMl/lix3ss9XtZDpYaapOF2njYAPU+TJNCFQMxCT2G7/CgV7gYIIsDToGQHnE1gTMmxlHsw0DWOrCei17DvbfrUBYQPTe4Gpi521R75rdxbnIWT5kl9qRw+tpyqlQzl7JxyLThWkIoqWZ6xkarkK5zpM2BaEoGvAPkieuLyTVdEbZSYSO/Mvrv9oMEKfneCkY/HX6OJhsnMdHeCYp4X3Ev7+LCfSMhcHRehTYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yLHJ6GdeLL+vrcoPTlIjLL7/SQavWAN93u/YE0wsoc=;
 b=0UqXOrhCf0zAF8p0rcKmZPBBTKHdo4dXU6bgqXSzyDZPAkpBgFMUJMULPDOPJ72RtkI+pvay2/7WvgAc4g5tjbbQLccm4DD94EZLkvwxuFI4Q1sVq21dQlxZYVNh2mL29k/uXm6X5c/peh7FDIlToLMsqfW85EhaY+P0Ucg3X2M=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DM4PR10MB6207.namprd10.prod.outlook.com (2603:10b6:8:8c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.10; Tue, 3 Sep 2024 19:24:52 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 19:24:51 +0000
Date: Tue, 3 Sep 2024 20:24:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <acb7fbf6-2cd3-4589-8156-1b1d8c473ab7@lucifer.local>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <6d91ca85-def3-422c-8fb2-76337136257d@lucifer.local>
 <3ff7a6dc-a21a-4a53-b3d5-cc8b0b5333fb@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff7a6dc-a21a-4a53-b3d5-cc8b0b5333fb@sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0606.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::14) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DM4PR10MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: b0785b97-5886-4ffe-b3ac-08dccc4e1558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r3nRAzs1uosR1AtHBK87P08stfmPoNvFlT1KXSgXGdRI3vdVLu4n77VrUayZ?=
 =?us-ascii?Q?w1zxLEor8ulcydjp1E8yr/dFCoN6VKdR0rYk+cyjGlH8q3QKE6JSJJXBJ9V5?=
 =?us-ascii?Q?I1fRhaUy/igTy3W6tRf+0ZSjwRh4CU9KXaVTInBLZxCdto/wNbPIwgXhMzC4?=
 =?us-ascii?Q?b3XxevESvdDdmcFmkutk8W/A5hAFrxDQeH313H9HAP/4//4FjxADMpBLcNL3?=
 =?us-ascii?Q?xTwoedQ2vXWD9df8O3ED0vz6Scf48g93l8qXINysD3v9bDRFBKB4fPEG6CLA?=
 =?us-ascii?Q?nCKj23cMDAcp9cfXWkJYP2p0dRxqbyjuvn+ZOaLWbrzuIwsWQPjDaE0AaI0W?=
 =?us-ascii?Q?JUGpuTRnJvGtX/TK4qd6fi+ZqcU7dNdpl1A015SeJ6oataE/Afzdr51xNocK?=
 =?us-ascii?Q?vD8IexDo23M4jRF0y7rwmqzXKC8d0xuTV8lWN/ilKxANDK4mQRTVrQn4SmJB?=
 =?us-ascii?Q?RELmxpy9Hs/ZhuPyOS2uAm/D/HQoBnLFrPPSdVi+XFr9Bs4yUskw6gNX5p7J?=
 =?us-ascii?Q?sB2eLAaGrW87z7nzVonAqcdxXA8UAq5UwMVJQDcx+Atkhv48roEaTySkembW?=
 =?us-ascii?Q?MCzYwgto7gtzrK5AV5afjRbp7LRzPCziYfZ846gOA8B8f6/J4R0gTnjMYGyJ?=
 =?us-ascii?Q?B17B9/I7NSkAMPFF2EJNIYvtqYXqU7SbMopU9U0GeD1OQvN8HoNWBDeDKBZ1?=
 =?us-ascii?Q?0P04eVuhK6G8HJHvq0DnCuDcBsZ5BFGCDPkLzfrPxAp91YWWlcMf8My0H9O/?=
 =?us-ascii?Q?EL8Do42cQnIuvNWKmf8weTxqEAb21AT1To1YxIRTEFCCxV7UymEDcCJi7cLG?=
 =?us-ascii?Q?Iu90cue0atqtu5mnoBmOnzLHi4eVI3VO4mkss5Lz2F4Pj6F41pUCS4gRwXGE?=
 =?us-ascii?Q?bH68ynlU3wLwDZm/RmD7KJgDtbBSsBhFzsR+un1nkTmBVku/GGn4USx8Yw3s?=
 =?us-ascii?Q?2jS2HiMSnQY4n65UuVcZKFM+jjqxtTD8tGslK3AWUK2aFDURdj1WOxm4rS9U?=
 =?us-ascii?Q?XzIcwTMpEtN2Uc/PYukTXR9ID+lBn+Ot2buSX4rVu3+UBEnAKF4U05XhsSKH?=
 =?us-ascii?Q?8IuvwnFtq3pD43MQV61uNdbRfE+/ys7Tho5LH1uVVRPajAsYsIdy6v6+hvEd?=
 =?us-ascii?Q?u+wu05XVtVRAo3Dk4W2qCmWJcq6NUwtoFUSIvnVk6IryRAoqnGKRJEaNQeF2?=
 =?us-ascii?Q?y7vHzLwhEkq0BzDFH5nd7mzdkhPj59ONWNznHy95GyTCmclgs8wbwBtMdrP6?=
 =?us-ascii?Q?CX/rKHPQqk2W5eYoGfh4/fkZiG5TQDZlw88Fc+xoLcyfKsuYJQfPhjkUKqTF?=
 =?us-ascii?Q?uvsIlvIP5ZAQNZL1zmfr06ivP22IBAAIrC1ulPykoDdB4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EIywUJ4shY2pf7lSCXfGyxSc/vPufm9z+AWtkkkgxzawoEsF7UPw2sszIxi1?=
 =?us-ascii?Q?s3FrkTPv8cEMaBKDEljUfMosg1FbN1YcZfvH9myK0af2/VqaRsqfOqEtgKJX?=
 =?us-ascii?Q?Yx24oNdM93iPRgHD1MXsGg3pPxPCIaJLaJjq6ePQKDxOvuMK7K+OSWe5Mr1D?=
 =?us-ascii?Q?MnfXsGq5QtpAkMvXkTHH9X172LVD3lxy3fU9aSljBG85MGa0DyEOb0A/gOqv?=
 =?us-ascii?Q?NdJdh1AruP7vnz1xcllS4sCx/2pgSInWukNIeWJjWA5SlHuTkKzZB0/o6QNq?=
 =?us-ascii?Q?/0u7NfJ3yvwi2EbZAFYD/RjVKVbtRIdB+l8l7aoHLLNgHXt32xYbsI8wF+3n?=
 =?us-ascii?Q?ekFI/ioLDovP2/Pka4QI49o1hTlylVc0YOtpDoJCLYu9RyXw/6e+KTApBYA+?=
 =?us-ascii?Q?km1mvKmzLpNd7A9gZdkDnwoErmO7uPhmCDI6BAAPtG3zBjEevB2WKlelodqX?=
 =?us-ascii?Q?DY4gJySeJL8RV1pVKEppTPmiJP43zfRv9H83YSpNTletFEpybGz7mIQqX22K?=
 =?us-ascii?Q?VJ7l59FKZxRksS0jzra/FQJ9gbutr6ZQ+Q0v+9cqq+jKqOqm8s4FgTw8ZrkK?=
 =?us-ascii?Q?agOXJ9SXXfSD1EUyZiVQRA6GiiYTRWVnLhr2CixSfj7T8pC4tYYPK/LoHwzl?=
 =?us-ascii?Q?ayOahkRmyIWePH+W57JoSGYmW2U0b8yOivbBW3BvQKKAjgkYigt13ji7hRwQ?=
 =?us-ascii?Q?OLlqJZ9kFD3gQ2csADrCTgnwPc1eZQ1auavL2Cv6q729T9ogS2am9EietLxl?=
 =?us-ascii?Q?duwqKXh6sIJKVpHR89eRLgz3Wt6MANBtPBvh8xia0KXRjDathh77B7ImuS1e?=
 =?us-ascii?Q?0xroRZQjP8oXuhyLgeGSW7aOyVF9e2x3DlS9wAclNh120IG+jJv34tfkhVPu?=
 =?us-ascii?Q?ll2/EysRktX07UnKNAs7Gf0L2MZqT3HxFOq8fpps2wrPglxH9HUECHfx0yMr?=
 =?us-ascii?Q?U3rF1PgofheBlr47ri4bF28tA111tKua+IsSe0EgD95Xg1GTXyZtJOoxNErG?=
 =?us-ascii?Q?cqvtYxg53c2dDwXS8HLFFPEejLCKrGGo3S5YnGmw1BcWY1lyqdZjrF2Q3OCC?=
 =?us-ascii?Q?N/6IXlcNNy2IX84Ry0TdInfgHNMaa70nIe+QooEGHWCHoiPpSoL82B474Ru0?=
 =?us-ascii?Q?P+UtjATwHB9LTPTJt7aPKY8NofULXOvZdFXw1D90Q6EIGMVWqJJA9HfUfLBN?=
 =?us-ascii?Q?NNAkMAno6ohZGHIXae2Ec6mnt95ODcUC3MNPLRMQe8lXNpulHf/Axo1dInP4?=
 =?us-ascii?Q?mhr4H1hBH/Nnuq3s87jksGmvLgfQWT//1ipsYJ0IgXwpxl1ha8ZJMy82O2QH?=
 =?us-ascii?Q?0yhY2ueu3nSBHkaIj3J6rK30xN/T1ymSAlcRRpDCx8wp8QR+p5y5G4f8KasL?=
 =?us-ascii?Q?X7Ql4KNVheDQilI2dpSXbF4hqjzBKjFLQM9thjAXANssVxJEFlafSk7lIkeg?=
 =?us-ascii?Q?Zjzb5h8LTp+5eQEzY53bCRRrZhqjPfvgYdT1tXfG0SUmtBZxuLOXZYtbW/ty?=
 =?us-ascii?Q?Ws2RQrYss0Wk9Zq6WxQZqkjmCrE0PIc3HxECKYdNFb6/R/rjaDfiAE7/XRMS?=
 =?us-ascii?Q?dxZ6NonyFa6Ztb6BWOvgaMD0O16KJZ5Ask/FCltrCW+xsoIQxxq1Zp0I7V+g?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3r/y+1DSdz6Q3z6KW5IxLrUkGw5wbYuYP6wwiGXRp5ZJFfDZEhy6uQl66k5E7UYfdpXUkYrXi+de5D96oH6y1yqEYjgqiJVEEOFxyJF6s1MTiSBVyt8ghY7oftsm7zGY4o/euQpkjlK76GmYliYX37ivwo8alXF//Q3ePOkiUrXp0f6zW36SZcjaR8roI3M3CFNLJgxb8S2dnP8YcthIGZBd5osig6rXLTppJrKQl7q/pg6/q1jUFACg59ybjsgZUeTn5YyQLfchq8oURhCJhtDK9rheUBRNBPJsbXmS6/UuPcavnsFjb3rCw8g1w1XerzWdmodDZTSHZHPTOBqczPUrcQ0WGl8NPIi8OCHCrVPixvGnTw3n6bew5nU+vc96h70/aN+oT24Ec5eZuKx9gn2GMCvQnyjA1hBvZtHbkeWw56sm7h470Ul5WYAlAq2cH5yt190iE2pFBDX3qk7NvEDzq5e/V9DLQ5SQKYTlHECDBP/hICuInxYpIJyYl6UNmEixMuSnCKkyPplzd9kUe9t0IXH5QRNMWtydY2H6vKW6yg+4Mf/PvbWhjHsy5y/hbD+MKLd6G56sakitQ8eGPUhg8B51itZsMauvY7LVY14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0785b97-5886-4ffe-b3ac-08dccc4e1558
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:24:51.8672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjXc5KRbh+lsNbxwjLLlrQ3NPj0CWFVyQLb9D73Zxi6RD06UkdWgZp3+FOv1GhoRX0AB4VdPw1d20nCiqAmahM1SI4KqOmxx2dUSBbGJZQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6207
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_07,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030156
X-Proofpoint-GUID: qZFeEB0r8UxUashW1-OvnOnEWmpNWkcZ
X-Proofpoint-ORIG-GUID: qZFeEB0r8UxUashW1-OvnOnEWmpNWkcZ

On Tue, Sep 03, 2024 at 07:20:02PM GMT, Mark Brown wrote:
> On Tue, Sep 03, 2024 at 06:49:46PM +0100, Lorenzo Stoakes wrote:
> > On Mon, Sep 02, 2024 at 08:08:15PM GMT, Mark Brown wrote:
>
> > > On x86 there is a custom arch_get_unmapped_area() which was updated by the
> > > above commit to cover this case by specifying a start_gap for allocations
> > > with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
> > > use the generic implementation of arch_get_unmapped_area() so let's make
> > > the equivalent change there so they also don't get shadow stack pages
> > > placed without guard pages.
>
> > Don't you need to unwind that change in x86 now you're doing it in generic code?
>
> No, x86 had a preexisting custom implementation for some other reason
> (hence the "updated by the above commit" part above) - the shadow stack
> support would most likely have been added in the core in the first place
> were it not for that.

Oh yeah missed that!

Other than comment nice-to-have this seems fine:

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

