Return-Path: <sparclinux+bounces-600-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7C876737
	for <lists+sparclinux@lfdr.de>; Fri,  8 Mar 2024 16:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177551C215EA
	for <lists+sparclinux@lfdr.de>; Fri,  8 Mar 2024 15:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EA11DA2E;
	Fri,  8 Mar 2024 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tum6bEly"
X-Original-To: sparclinux@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB714C90;
	Fri,  8 Mar 2024 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709911261; cv=fail; b=L+lcj6m1EN8j2n3XycTdM8SOr/wcAdg0Sf2KNia+5h0aMZ/LbyaCv9kLdYuyCVftrKmucxYyO6m4Ft5md/uULYZNtv5I2enzCnwbCJ5HGeeYsLO9KFvaqGu815D+C6n8rXP2ebF6p+IuzYM+eQPeO6ZIE4FpAhguiHs1mqiLsCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709911261; c=relaxed/simple;
	bh=2oKrx0PWo9G6MX3oqme8ntsF0t5hRy0CqERkMwW5LHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RbxFQi5wny0m+/X6oGkzr65Iq/RpO9ThVSSHAwixNH1KZbaE/iOf8X4IVZM1hxwumVmTV+ouv5mqU4fgmM4wdVMNv2gFBwb61Y5wGY02VdkAMnEhJtYQLE4doZrY/2Fhm9yciogbEKTFXGCWVnCnvOSkMN+fPYwAtUiFC40fL2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tum6bEly; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7oMZcrJRkxJCauEeoRXc7JIHDjHNYSQDMeYJDWgzltKEDH4lA9tzVyNkDaaaIHWCqUmdohRsaAx5rzrzMO1UsYTNOVNzR1bzWu+9OoAiUAA4nZ7yFl0mLr0mSWpo828pJICJiiVWLOFPAPTSZBcNzcv09YOU5PPEeXXEL9drVO0Gmje85sqdg0e3elArLIfKpqIjJnk3Y2qGCEfgQB3YWY2IIzto43NCSs4HUAVwg+Txb+wCYbAbDH8PgXN0G3YC4sza66mkZtX2WaO7RkMcxL2PoLJzS7LdGIrwu/JGIqvuyXuUJKQXagv2QsN/y145IADn9kzSRUYw2hkWRQYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYiakZTUOlprqkwsodQuX0BiBMqBwS6JWWCcgGIUhEo=;
 b=UeBWTqDZm++A9ndNRv5nJ3skZrbI/Dyw7ifHlZW1O8g5hPLBoyNIAWY+ELRO1bTOWhdbhEHOSmuhi8d/26UU33ffVRmMDPIhMRtdu7KZuZ2MxeidH4DyAqQXjNhQ0vhTfk+gbIkahIYzDMxgaGbQ8zeDz3nwPxSOZ+QZ5fuVUk+Fi7hDDb4mmxdQrIH1DrPZFX8LmiWKSa8hoDbMqv8eq5LX0CYC6F+yg+76Xik3u4zf+h2uTpmmoxxMk0wGJwvwyjik2ms+LjzFk8/uAF1rV1G5WWnjFAiS5GcJrMqKmXwgLE7qIea/J4t47QXh+9kgJTYWAK0yHl5R7F2yZHs7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYiakZTUOlprqkwsodQuX0BiBMqBwS6JWWCcgGIUhEo=;
 b=tum6bEly7sIONzl0i2Dv/VxtNrMVTMWBa3I7lNZXDSYAAOiiBhUMatRvm3i/7IFrPGOzA6A7vMyLvPuqjB23ToqxjfXW+e2v9EZZS3D0ICOG8cvwcAJaa/plQ99dyPWKCg/ptEmPKXRu0Fwp3s2eIokoKjDJwZwNopSxd2fT2278XW0YFs54m9+1j0pV4Y1mVOK6A3uiqPztXiQyMhEbdr6i9BUZKnBr17p3QzFEgSLBwM/SOSWw9tMZG/ZluQWTx/bmeqcngupLV646VxhNaoHDJi2Y3OXk2iiKLaVbmZ0kOKOW7VDK37Y5RVFvDsJ7CZoQiemSvSDNhC2emYjmEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 15:20:57 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 15:20:57 +0000
Date: Fri, 8 Mar 2024 11:20:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, x86@kernel.org,
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 13/13] mm: Document pXd_leaf() API
Message-ID: <20240308152055.GQ9179@nvidia.com>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-14-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306104147.193052-14-peterx@redhat.com>
X-ClientProxiedBy: DM6PR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::35) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b05d8ca-39b4-46ee-aa50-08dc3f835a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mf1jJ0h2du0z8/ULj/vKUAhJbvjLh6+7CrUOHDqR4eqoQe7Tz7Tujhu6R51ZbKQN/OzHGYfiVxixm/kN/K5B0CzTYc3U95kv4fs8fOFekacbVNlr0K4TfklJeeMhXZ5PY2x6hKqd1/pijLbxT+Yl/sV59wELHlA8Ys0Hw7JZG/8W1ju7DE1n9FnPnk8J3c+BIylGflh0PYeCo9CbNb1ELkFF4FFMu/16iVkgxtTGij92WPuC7aEGrFTFzIYkwIVnqNGQlZSXNCKN4kzQCWJaKwQwBq6m0I1aw45tHY52yRdquTonrNpuJ8egmlWEJ5uo2kIZC6lPcqKuNRmvHzT1ArXNORIZENgNee89Ws0BwL6/3Hd4My564k4+apITOUtyLxAYl8JR76uqTo/7eqDoK99XWJfyCAcZsbbQuARBdxzcsspbmJeQBU1LYR/DEw1UfADXIFX7LUQ9qy0EKF2g5B6E0bbvW44NyLluZu3ccGOeKZFOzQj7nZV0qfT/rKlTimiQwhDaSUDKqBAvfODQ+oapBBcY9FTaUfLDG5EF8Eq2NISTLFjybajpx8W3YMXojzBpO5lY90oBmKYRueV+LvPxjqglxWqMbXZZd9ExAkNS4SoshoJVKvgnFbSEYuIGNlNS2JmlqGB9BUAgjq6QzTEKV9xlqg8SuGCdIDTTcNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDKWvuiosp+EMnaDv5FPU/qmgWC0FBKfxeUDLMcW6BqeyHFVraPoSlcLhSZ5?=
 =?us-ascii?Q?cXMlIaZGJI0aKonFy0dvxORP/md11lRkCJDpF/CbG2X9DYHXdrsnPGaI7y8G?=
 =?us-ascii?Q?xzg7b+0859hQyVRj5XU7DXYQP0fhT4dmtUzuajQBwmDNs4186EL281JzZnXW?=
 =?us-ascii?Q?vlmJoREILSC+cRG4pznq01p+tzp6rMHWL88H+Z1WdsMlsHuyVuEZpAo7i6yO?=
 =?us-ascii?Q?vJdvp/lPimBz5OYrN/eT/z3rKEbj0/07hYh2HzHogRMC7woe6PC6QHHvSo6k?=
 =?us-ascii?Q?JTHJ+ab6YrzkQ8mF7uHAGFZ98/PbB0oYm6i4xsOrQcovJafOPxWYqxLy5rdK?=
 =?us-ascii?Q?cuaVWvFtORNHE3YBLWjXZvBepAL9mZfGOPasTtcPfLQXsZ7UN7QrhzirNEgp?=
 =?us-ascii?Q?NJipU4msr8MLAyOJeqWLMT2j3j+qT/Yq5CY6QHwn85m+Lfe1UL/MfCjwRA1T?=
 =?us-ascii?Q?iLrFkO4sWvrGQRBmxYLgBpX3vtQoW6dmNoHtu2Lqr6c1BxBCkG9OTcCZL3Sv?=
 =?us-ascii?Q?Rmp4SpnoVtqJELJC+Zs8QFftZ2wU2unk6CNZT047Mq9rDjhUJ07kWlqi92eY?=
 =?us-ascii?Q?AVCvNr3SEKNMIkZ8yr2RbDqohc+aFA6HzgEexlsB2WvImaZxLhpoINZGK1n/?=
 =?us-ascii?Q?m0rdB09WIQ3PWvaWfd70kDQg/cIBBmvjMq5RunOOEdlbEz5graZAs17YU4+1?=
 =?us-ascii?Q?7OPoeCGYqMVqFuENs2Nion4fqM0ILSwLP9rfuj8QhTRCWdcBkgTq9uM54hrc?=
 =?us-ascii?Q?+5m7iEqwMeW38xmcwQ2JusBzBSCdxzDEGxFVIV48kbUoZ93MgI0Q0ifsTA+P?=
 =?us-ascii?Q?/ratsOaIkr8R2VkWSMRNo2wZx8LnGvKBSMRilQt7kWGXvTQF0FYRmv0W3nYi?=
 =?us-ascii?Q?wxM/akKZbnHWgBBdKytcuNqkbg4mVBjULtzAFdh7sPMeRHSjCnpdjFMeej5O?=
 =?us-ascii?Q?fjcEnIhvfIv/lKq7GDp7AfLgcF9VFp8ZmAPtDzMQbUljSl8jCCBYasrgaG8D?=
 =?us-ascii?Q?PJLUH2gfrNCKkRRT1ZAAKs0ojgu37YgK0nUjqsZ4IjVAmla3XFUw0FGsh2Sl?=
 =?us-ascii?Q?f6RIS48jUjhJ2+DXVMJoJraiokhORe2ezoHpVgmnMuGrsMFWJTEV3p0vr1jY?=
 =?us-ascii?Q?AWfPsw8CZKxwyEmxgDCFS5MJ7t/DcP7lEdPPV2YagU5Umzz1s9W6ph9h5qrU?=
 =?us-ascii?Q?Y1vyITmKy9zYD7BjQlCgVG0VYViEkXPHpQyAasFzTOeI7gpKaOLdsq/0okfb?=
 =?us-ascii?Q?ycB8h4HoGJ6IK69+1/2Gq7MZFT/E/8DwbBa5bdfflNjxt0VQqu+4Y8KljqIq?=
 =?us-ascii?Q?j0UC/R+XSOz01CNz2f3TJ0a58Ij/J2XY88SY/lcIRkDNkDqD8u/0xaxjPhqE?=
 =?us-ascii?Q?z+VSdLCUgJXmRHc5Yu/tbJNcd6DJD8hemHUgTcq1s98TEpTM5IEt/dOp8jOL?=
 =?us-ascii?Q?63m0J5JnUE7gbiF5h1ExeNU5yvEGQAnQfw5F1lHh5J0XTQayPbuAmAI3t/p+?=
 =?us-ascii?Q?c7CP2UIeRmIpjufkCV7u8jthUN+CT3Gl+6ycbcCUC50UyJoAd5QRI3tN/3tx?=
 =?us-ascii?Q?Go6JQZEkDX1A3tOl2LTM+gtmcJ9iMFWa8QzW0ccC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b05d8ca-39b4-46ee-aa50-08dc3f835a60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:20:57.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWtsoOGaLnCPVHSACr6PP4o6/QfLRD0Y34bz9fbOVcoiZ5mW0tULbel+M85gTh4B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522

On Wed, Mar 06, 2024 at 06:41:47PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> There's one small section already, but since we're going to remove
> pXd_huge(), that comment may start to obsolete.
> 
> Rewrite that section with more information, hopefully with that the API is
> crystal clear on what it implies.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/pgtable.h | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

