Return-Path: <sparclinux+bounces-415-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B2868081
	for <lists+sparclinux@lfdr.de>; Mon, 26 Feb 2024 20:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F416A1F251D9
	for <lists+sparclinux@lfdr.de>; Mon, 26 Feb 2024 19:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BC1130ACC;
	Mon, 26 Feb 2024 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b="FbbnLLoP"
X-Original-To: sparclinux@vger.kernel.org
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2124.outbound.protection.outlook.com [40.107.9.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319A12BF27;
	Mon, 26 Feb 2024 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.9.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708974319; cv=fail; b=SsifNahrh2TqlTjKlO/yYeoS9gK8XEw7hzmaiL+dJQNFOr508HA830sNUJe5LSo+OIdftmdahcxW5hyhvQ8+wEvvlpU3v0MhNFzFu973VQIAM1VxO65Lz/Gxxi2uYjOe7FNn+gdFDiIL2NhfJR4K+5jPd/5jc3VyML1i/3jAVYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708974319; c=relaxed/simple;
	bh=AzxYl6WNRZKHuW7XUwRYfQC3UiKvhpv7hdTT1lHkP/o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sh3Rg8fovWrRQ/K+6vpXVID++vnlRQDeLsXpEugTZpfU2BStLk4PQOUp8iU+RVyQeNMtmcsTzXD333bc7/LV/nxCvEvxL7TUlsczFWiLf2F5pua9wfhC6+yCiGscYwJyenXfAi5plXewCLXTuqKFFiMzPYl1EAlTHgWHSSuQHuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b=FbbnLLoP; arc=fail smtp.client-ip=40.107.9.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsOFCUjWUEAFhP1Q7wvKMrdRu9Fykko3hY8PZ953J+foyvKHEy7HDcoGDpA1H1h9gd+IhhfuB517/Z3PRn2PafZp0FTnbBabFmJDwTkz+c00+httLzf+98W8pNDQ2fYh2vRyi7SPDLynDqhNgNh0dnF/LhJFh7VAnIkUnmknDNIYS3EAi7Z8Q+nQax6ZY0AAtZ8bfk9uk/EMuJ74V2PH7DuNPb/oqm/fyCJjeRvz2/+VUEUW7Caw6pfufocJBnnfnP7LjgbK2lwcukqPDZji82rCLpY9v/SoCn2Cqvxd9TbU37RlLtJLSC6/cqjT6UYnGuPkNnIJ77QY99NC0llpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzxYl6WNRZKHuW7XUwRYfQC3UiKvhpv7hdTT1lHkP/o=;
 b=eYfvlHSQGQgAruIYsP49saooVSrjFP0By4Z7QNEUQ6cDHhhUkFbpEChmexZsihdR5DbCYp8NZchJe3YAbiLdPzHpKxoXxApbQ3K276J39w9D1qHUsquQUGSZBG3KPnF+LRUk/gtxysaDDaHHpeF5OVzmlI3S4/szsnl0fDESopkPkLfjBZc39HxKNz+SsS3P6sqtulqPraGaZLCidpq6JgLI8dWutJIaTEIZgqpBOWoYeUghI8fvagi3IBCtYaH4tDuCWYOUWE6C6xiR//HVtdaFGaS/d94QdW4DWaDzOOJoikMZViQGR10jkmt981tJkZlfnK3pDzn6DLMo/NgZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzxYl6WNRZKHuW7XUwRYfQC3UiKvhpv7hdTT1lHkP/o=;
 b=FbbnLLoPvkp/zl0d6GCzIuyshSjGrJSzdi1IP8JOeDWFU/m0BMUkf5Z4087eNtokVOYNFLGJT+2W7oS5aA37ViVdNptro+3JzGWGaMAChSexxUtjc1bImB+PKE3qbsda5KOcZT0pjV1GyiPuHBC6s+YNVhlYYV3HiD0lHC77fuMBucBnUfxj4MPKquBUSewi8ec1C8M8HL4mu6x+9umMShlHcq1dHWU1LpMJoHao93IVsz58yULJvdPs9Rg6m1sid292YI25nBqpoycPJLqguVHuDyrLngv8euFYMzSaBgNSfZ1VPf+69WOY3mOU/fa/VCYx/FjOEj8436h9Ww2s7Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3219.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 19:05:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Mon, 26 Feb 2024
 19:05:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook
	<keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Brian Cain
	<bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
	<andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, "x86@kernel.org"
	<x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Andy Lutomirski
	<luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
	<kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, "linux-hexagon@vger.kernel.org"
	<linux-hexagon@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-openrisc@vger.kernel.org"
	<linux-openrisc@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>
Subject: Re: [PATCH 2/4] arch: simplify architecture specific page size
 configuration
Thread-Topic: [PATCH 2/4] arch: simplify architecture specific page size
 configuration
Thread-Index: AQHaaM7xu3r9QXVYJ0O+Zom/sxgKfbEc+9OA
Date: Mon, 26 Feb 2024 19:05:12 +0000
Message-ID: <803facbe-2dfb-44cd-9110-0a27eb31b62f@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-3-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-3-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3219:EE_
x-ms-office365-filtering-correlation-id: 7ab6c7a7-bfee-404a-1353-08dc36fddbeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Lh5b3h0126swEmjmDAooc3NxgDJ7cZNZb2v1XEBaQcvOL2MiJ8Waeo72ti7xlDkyI8SJRFCIFY3pjxg/FMwu1avhvovSpxGq9qsL/tMjIpo7Z4t7REuU2WzN/xzN21DUfi9xkd90ltaR3XwT6h/9CGfyMnKQUsmaBPP2AoBojYtsanJ8dhVZg8RDCcT3ZkH4gTLKTfP4/+RxPecTfnRfis7G5sXB1vRiO3FJPPTp/n7s5v1RVAOupTQHJAd1SmevWOB7C5rV1aaa21Fd0gv6qQ3q4usJaU/ph2QHw5P9r7ILYMvSQtPgJaYnhcX3Lctl8iNHcL7RfmThQGgDsB2Ap4qGTMicZKo9EWJ1/J2Nhz8Fg/NXHEGGx9ujxuFO135Ry7S3sMAlUhN72LIuXz/5a5yeDJV1Kmq/QWzjQj0ii9U/4toy0vUHjw3wfK0dzWU7bzdezly9FQ89F8/GgN8LtVRYBo2l03jYicOali3ZF/tPXyzUWx3MRL4nKW6ip2Gps7pvTMRYj1yeTq4w1F5261HsKVOG3Kzn9B4+cNr5dO4NhPp27cbB6CN9QdEetjLFRWfw9PFwyaJtx7iYyp3mLUX0ANOJvjo6eKh/FFtUv2mXg7tdZxQDCpxRWI8A41R6AFRQ/6ztxyS807Py47lqAcnNk/ORGQiQ70nbXTPBL3PkfmR5YRCQn5/Jb6ljgct0zIxdRU4tQ3ePhPsYkLVVMyRYDKkykYccMcsR7hQtZC8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1oyS2V3R3hQL2hRZUVURmxKWHJGb1B4d0NQL2VROURXb2UwNUE4dDlhTUtY?=
 =?utf-8?B?MmZsNkFuaXlqRjlTTnBEeWNqZ1puWjdVLytMVGwyZ08rVENodjNjRHBKU3dL?=
 =?utf-8?B?V21OTnhIUjdQdmxhbUhmN2RNRVNoQkhZazh2cHg5ZzRsWFgxaEFrSFpzYmN2?=
 =?utf-8?B?QUNBdkZZUVVSWS90UTJ4WEEzV2RKYTdSakZLZHI4TlNob3FyQ2tDVCtMdllI?=
 =?utf-8?B?NWQwUzZOR015bHZSMUFzSGpNc3pLMUpHR1dIb0tnT0F1YVd5UU9VazEvOTdD?=
 =?utf-8?B?Q2d6bHU5UENkRzltZnlrMzR1clBpRmdibzIzQjZ2b01veTgreFRkUkZqMVJM?=
 =?utf-8?B?ck10OWNoR2dEdWVoNnVOKzdEZ3lkSzhTL3pYK0ZNcGE4Ky93aHkvQk16QVNs?=
 =?utf-8?B?R0FIdlMvY2V0RmxlQkFtcXhVOFN2Z2Q2MFIrSmtFUzR6ZXhDKzNWN0FXWVho?=
 =?utf-8?B?bkh6TXpSM0xGWjIwTkg5T0JFZU02U2FrRFd1elZWNlV0ckVBSDZSVGdKVHhO?=
 =?utf-8?B?bEJGbnNqMnErc1lUKzFNMmUwOFltUlZwd2ZaMGhKT0NvWHNUMVlxL3huMkF0?=
 =?utf-8?B?QnlVcW1iQS9COGgvdEhPVnEzODhFMGR5elZsaVJMcHA2ZDU3c0tGS0J1M21q?=
 =?utf-8?B?dS9GSWJqaXBjWnk2emsxQ05IZkE2cnNZa0RkejhZRnJuNjdPamhPaXdjM0Qr?=
 =?utf-8?B?V1drUmJIem1sdXdRMEU4eUppajZaTXB2c0ROcnlmeExYSXRiRy9tZnBBcVI2?=
 =?utf-8?B?TlFMSXRZdXJ1Q3h5WUUzRWl4ZjhTenNVS1ZrRk5iVjl3VnBjTHVUUDZLeXp4?=
 =?utf-8?B?T2F5SDBSTjZCTk16THpBTmQyUjZYYXZOQ3llYmJUM1dISDZGd0E0SlM4WS9I?=
 =?utf-8?B?NEEzZVJBK2ZDV3RscFBMYUhXWTBQb1hzcTJNMkFMelNheGVVcGhaL0ZmdzA5?=
 =?utf-8?B?WlVJM1JPRU55OGFaSHFnQUxYckw4eFAyNW0zYlB2aDU4TE5mQ2FGRFRyUko2?=
 =?utf-8?B?bndBeXV3Ky9WQ09xc1J1bEJlMnc3NURWaWJ3bkQ0VmNVcmJ3VFhURjNkamF1?=
 =?utf-8?B?ZHM4alVVLzBtTW14ZVlVUCtHZXpmeDRZRTBZcG9RTmlmcFFxcDlrMWdEZFVY?=
 =?utf-8?B?bDNTSXJNZXB6U09QRDFLM0Fya2Jyd2s4c1RwT1R5R0dtUnM0aHdubmROVVNv?=
 =?utf-8?B?aWx2VlM5WWhkZHB5cDNZTUNGUHFRc2lCTS9xSWk2Y3RmSXh1c2JJT2NlLzJl?=
 =?utf-8?B?L0x0dTRPd3VEczBnZ1V0WUFBU0RLY1FhbUJ0cGJYb0hKdU0relkweWhXUk1N?=
 =?utf-8?B?dFZXYU1ObkdRR2F0b0FaMjNPTjV5NHZnSmhkNlVMdnZwQ0RKa294Um9PMUwv?=
 =?utf-8?B?UCtWL2pBMDQvUHh4TXJSMmdOMGl5QmtZTVh6OU5tMUtlbEl2VWFJRXdPdFhQ?=
 =?utf-8?B?NGlNR21sZHp1MTNOQUkwWjQ2aGRkY01QclVIWDFReWtndzNCTnVVelNoOHJG?=
 =?utf-8?B?UFpmU3h0dkxBWVBvdSt4Tlo1M0tIQmdtRVBsNG5YNjFEeGZQbFQ0alYxUmhH?=
 =?utf-8?B?UGlPekV2Zm95a0JQT21zYUg4QUpLSGtpczlWTHBPd1ljcDcwK2ZZREpCMjAy?=
 =?utf-8?B?RSs1WFlYcHRMSC9KdUdjSWJyR1ZYQ1E2bTdEaDZkdmtHWUlvTnptYksrUGh1?=
 =?utf-8?B?NGFhNm5ZV2QxZzZiaEc2eTdvbzBvMUpTWkpTLytFZTgwYm91T2lrNXhvdFhk?=
 =?utf-8?B?ejd2TlBlN1RJK2x6TmVrT3lTc1F2WWhwR0YwZnFHT09tR1QrNjR4alhsZFMy?=
 =?utf-8?B?cytydUI1QTVQTkxqNkc5czNQZ0NxamhxTjA2RzNpelZuUk5sNXdmZkNZQ25Q?=
 =?utf-8?B?aXVubHFpNXVjRThScUk3ZEFMMjNNNXVTMHlUTWNIQnB2V1ZvNWFud041YXg3?=
 =?utf-8?B?T1ZKY1E4TmdXZytueWUwVm5RVTF4TmlzVmpwNmFtZzVEK0lFNVhDaHJ0VW5n?=
 =?utf-8?B?MmRsTUIxYThaYWp0KzVvNnlVdmF4aERDRjdSOHlTTzNtbWtSamtnUWx6bFBt?=
 =?utf-8?B?TDZQY2o0YnBXM1llOHl3V3RRQ0ZKOHVwYUY5ZVpRZkthMlFTeTFMMDVXQ0RP?=
 =?utf-8?B?UWM3aDlsLzRlODZkQ0lnVWFTeXVJZ1M0bVpBa3ZEMjV2T051SVBwUnEyeFA2?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B29AC14F512DD343A43755376F1A2F11@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab6c7a7-bfee-404a-1353-08dc36fddbeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 19:05:12.3908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9HD62PBvdvrVVjLoC6rvl6xzktuTmAP5jy9CCtXR/suIanyTIWrHcpDneUCZLeebKN8ERfXXb7tGAQ5ZcAFut7hCRiEooRyENpNZYaEjm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3219

DQoNCkxlIDI2LzAyLzIwMjQgw6AgMTc6MTQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IGFyYywgYXJtNjQsIHBh
cmlzYyBhbmQgcG93ZXJwYyBhbGwgaGF2ZSB0aGVpciBvd24gS2NvbmZpZyBzeW1ib2xzDQo+IGlu
IHBsYWNlIG9mIHRoZSBjb21tb24gQ09ORklHX1BBR0VfU0laRV80S0Igc3ltYm9scy4gQ2hhbmdl
IHRoZXNlDQo+IHNvIHRoZSBjb21tb24gc3ltYm9scyBhcmUgdGhlIG9uZXMgdGhhdCBhcmUgYWN0
dWFsbHkgdXNlZCwgd2hpbGUNCj4gbGVhdmluZyB0aGUgYXJoY2l0ZWN0dXJlIHNwZWNpZmljIG9u
ZXMgYXMgdGhlIHVzZXIgdmlzaWJsZQ0KPiBwbGFjZSBmb3IgY29uZmlndXJpbmcgaXQsIHRvIGF2
b2lkIGJyZWFraW5nIHVzZXIgY29uZmlncy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IChwb3dlcnBjMzIpDQoNCj4gLS0tDQo+ICAgYXJj
aC9hcmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDMgKysrDQo+ICAgYXJjaC9hcmMvaW5j
bHVkZS91YXBpL2FzbS9wYWdlLmggIHwgIDYgKystLS0tDQo+ICAgYXJjaC9hcm02NC9LY29uZmln
ICAgICAgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gICBh
cmNoL2FybTY0L2luY2x1ZGUvYXNtL3BhZ2UtZGVmLmggfCAgMiArLQ0KPiAgIGFyY2gvcGFyaXNj
L0tjb25maWcgICAgICAgICAgICAgICB8ICAzICsrKw0KPiAgIGFyY2gvcGFyaXNjL2luY2x1ZGUv
YXNtL3BhZ2UuaCAgICB8IDEwICstLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAg
ICAgICAgICAgICAgfCAzMSArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaCAgIHwgIDIgKy0NCj4gICBzY3JpcHRzL2dkYi9s
aW51eC9jb25zdGFudHMucHkuaW4gfCAgMiArLQ0KPiAgIHNjcmlwdHMvZ2RiL2xpbnV4L21tLnB5
ICAgICAgICAgICB8ICAyICstDQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgNTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvS2NvbmZpZyBi
L2FyY2gvYXJjL0tjb25maWcNCj4gaW5kZXggMWIwNDgzYzUxY2MxLi40MDkyYmVjMTk4YmUgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJjL0tjb25maWcNCj4gKysrIGIvYXJjaC9hcmMvS2NvbmZpZw0K
PiBAQCAtMjg0LDE0ICsyODQsMTcgQEAgY2hvaWNlDQo+ICAgDQo+ICAgY29uZmlnIEFSQ19QQUdF
X1NJWkVfOEsNCj4gICAJYm9vbCAiOEtCIg0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV84S0IN
Cj4gICAJaGVscA0KPiAgIAkgIENob29zZSBiZXR3ZWVuIDhrIHZzIDE2aw0KPiAgIA0KPiAgIGNv
bmZpZyBBUkNfUEFHRV9TSVpFXzE2Sw0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV8xNktCDQo+
ICAgCWJvb2wgIjE2S0IiDQo+ICAgDQo+ICAgY29uZmlnIEFSQ19QQUdFX1NJWkVfNEsNCj4gICAJ
Ym9vbCAiNEtCIg0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV80S0INCj4gICAJZGVwZW5kcyBv
biBBUkNfTU1VX1YzIHx8IEFSQ19NTVVfVjQNCj4gICANCj4gICBlbmRjaG9pY2UNCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vcGFnZS5oIGIvYXJjaC9hcmMvaW5jbHVk
ZS91YXBpL2FzbS9wYWdlLmgNCj4gaW5kZXggMmE0YWQ2MTlhYmZiLi43ZmQ5ZTc0MWI1MjcgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vcGFnZS5oDQo+ICsrKyBiL2Fy
Y2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vcGFnZS5oDQo+IEBAIC0xMywxMCArMTMsOCBAQA0KPiAg
ICNpbmNsdWRlIDxsaW51eC9jb25zdC5oPg0KPiAgIA0KPiAgIC8qIFBBR0VfU0hJRlQgZGV0ZXJt
aW5lcyB0aGUgcGFnZSBzaXplICovDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfQVJDX1BBR0VfU0la
RV8xNkspDQo+IC0jZGVmaW5lIFBBR0VfU0hJRlQgMTQNCj4gLSNlbGlmIGRlZmluZWQoQ09ORklH
X0FSQ19QQUdFX1NJWkVfNEspDQo+IC0jZGVmaW5lIFBBR0VfU0hJRlQgMTINCj4gKyNpZmRlZiBf
X0tFUk5FTF9fDQo+ICsjZGVmaW5lIFBBR0VfU0hJRlQgQ09ORklHX1BBR0VfU0hJRlQNCj4gICAj
ZWxzZQ0KPiAgIC8qDQo+ICAgICogRGVmYXVsdCA4aw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IGluZGV4IGFhN2MxZDQzNTEzOS4uMjky
OTBiOGNiMzZkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L0tjb25maWcNCj4gKysrIGIvYXJj
aC9hcm02NC9LY29uZmlnDQo+IEBAIC0yNzcsMjcgKzI3NywyMSBAQCBjb25maWcgNjRCSVQNCj4g
ICBjb25maWcgTU1VDQo+ICAgCWRlZl9ib29sIHkNCj4gICANCj4gLWNvbmZpZyBBUk02NF9QQUdF
X1NISUZUDQo+IC0JaW50DQo+IC0JZGVmYXVsdCAxNiBpZiBBUk02NF82NEtfUEFHRVMNCj4gLQlk
ZWZhdWx0IDE0IGlmIEFSTTY0XzE2S19QQUdFUw0KPiAtCWRlZmF1bHQgMTINCj4gLQ0KPiAgIGNv
bmZpZyBBUk02NF9DT05UX1BURV9TSElGVA0KPiAgIAlpbnQNCj4gLQlkZWZhdWx0IDUgaWYgQVJN
NjRfNjRLX1BBR0VTDQo+IC0JZGVmYXVsdCA3IGlmIEFSTTY0XzE2S19QQUdFUw0KPiArCWRlZmF1
bHQgNSBpZiBQQUdFX1NJWkVfNjRLQg0KPiArCWRlZmF1bHQgNyBpZiBQQUdFX1NJWkVfMTZLQg0K
PiAgIAlkZWZhdWx0IDQNCj4gICANCj4gICBjb25maWcgQVJNNjRfQ09OVF9QTURfU0hJRlQNCj4g
ICAJaW50DQo+IC0JZGVmYXVsdCA1IGlmIEFSTTY0XzY0S19QQUdFUw0KPiAtCWRlZmF1bHQgNSBp
ZiBBUk02NF8xNktfUEFHRVMNCj4gKwlkZWZhdWx0IDUgaWYgUEFHRV9TSVpFXzY0S0INCj4gKwlk
ZWZhdWx0IDUgaWYgUEFHRV9TSVpFXzE2S0INCj4gICAJZGVmYXVsdCA0DQo+ICAgDQo+ICAgY29u
ZmlnIEFSQ0hfTU1BUF9STkRfQklUU19NSU4NCj4gLQlkZWZhdWx0IDE0IGlmIEFSTTY0XzY0S19Q
QUdFUw0KPiAtCWRlZmF1bHQgMTYgaWYgQVJNNjRfMTZLX1BBR0VTDQo+ICsJZGVmYXVsdCAxNCBp
ZiBQQUdFX1NJWkVfNjRLQg0KPiArCWRlZmF1bHQgMTYgaWYgUEFHRV9TSVpFXzE2S0INCj4gICAJ
ZGVmYXVsdCAxOA0KPiAgIA0KPiAgICMgbWF4IGJpdHMgZGV0ZXJtaW5lZCBieSB0aGUgZm9sbG93
aW5nIGZvcm11bGE6DQo+IEBAIC0xMjU5LDExICsxMjUzLDEzIEBAIGNob2ljZQ0KPiAgIA0KPiAg
IGNvbmZpZyBBUk02NF80S19QQUdFUw0KPiAgIAlib29sICI0S0IiDQo+ICsJc2VsZWN0IEhBVkVf
UEFHRV9TSVpFXzRLQg0KPiAgIAloZWxwDQo+ICAgCSAgVGhpcyBmZWF0dXJlIGVuYWJsZXMgNEtC
IHBhZ2VzIHN1cHBvcnQuDQo+ICAgDQo+ICAgY29uZmlnIEFSTTY0XzE2S19QQUdFUw0KPiAgIAli
b29sICIxNktCIg0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV8xNktCDQo+ICAgCWhlbHANCj4g
ICAJICBUaGUgc3lzdGVtIHdpbGwgdXNlIDE2S0IgcGFnZXMgc3VwcG9ydC4gQUFyY2gzMiBlbXVs
YXRpb24NCj4gICAJICByZXF1aXJlcyBhcHBsaWNhdGlvbnMgY29tcGlsZWQgd2l0aCAxNksgKG9y
IGEgbXVsdGlwbGUgb2YgMTZLKQ0KPiBAQCAtMTI3MSw2ICsxMjY3LDcgQEAgY29uZmlnIEFSTTY0
XzE2S19QQUdFUw0KPiAgIA0KPiAgIGNvbmZpZyBBUk02NF82NEtfUEFHRVMNCj4gICAJYm9vbCAi
NjRLQiINCj4gKwlzZWxlY3QgSEFWRV9QQUdFX1NJWkVfNjRLQg0KPiAgIAloZWxwDQo+ICAgCSAg
VGhpcyBmZWF0dXJlIGVuYWJsZXMgNjRLQiBwYWdlcyBzdXBwb3J0ICg0S0IgYnkgZGVmYXVsdCkN
Cj4gICAJICBhbGxvd2luZyBvbmx5IHR3byBsZXZlbHMgb2YgcGFnZSB0YWJsZXMgYW5kIGZhc3Rl
ciBUTEINCj4gQEAgLTEyOTEsMTkgKzEyODgsMTkgQEAgY2hvaWNlDQo+ICAgDQo+ICAgY29uZmln
IEFSTTY0X1ZBX0JJVFNfMzYNCj4gICAJYm9vbCAiMzYtYml0IiBpZiBFWFBFUlQNCj4gLQlkZXBl
bmRzIG9uIEFSTTY0XzE2S19QQUdFUw0KPiArCWRlcGVuZHMgb24gUEFHRV9TSVpFXzE2S0INCj4g
ICANCj4gICBjb25maWcgQVJNNjRfVkFfQklUU18zOQ0KPiAgIAlib29sICIzOS1iaXQiDQo+IC0J
ZGVwZW5kcyBvbiBBUk02NF80S19QQUdFUw0KPiArCWRlcGVuZHMgb24gUEFHRV9TSVpFXzRLQg0K
PiAgIA0KPiAgIGNvbmZpZyBBUk02NF9WQV9CSVRTXzQyDQo+ICAgCWJvb2wgIjQyLWJpdCINCj4g
LQlkZXBlbmRzIG9uIEFSTTY0XzY0S19QQUdFUw0KPiArCWRlcGVuZHMgb24gUEFHRV9TSVpFXzY0
S0INCj4gICANCj4gICBjb25maWcgQVJNNjRfVkFfQklUU180Nw0KPiAgIAlib29sICI0Ny1iaXQi
DQo+IC0JZGVwZW5kcyBvbiBBUk02NF8xNktfUEFHRVMNCj4gKwlkZXBlbmRzIG9uIFBBR0VfU0la
RV8xNktCDQo+ICAgDQo+ICAgY29uZmlnIEFSTTY0X1ZBX0JJVFNfNDgNCj4gICAJYm9vbCAiNDgt
Yml0Ig0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wYWdlLWRlZi5oIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wYWdlLWRlZi5oDQo+IGluZGV4IDI0MDNmN2I0Y2RiZi4u
NzkyZTlmZTg4MWRjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BhZ2Ut
ZGVmLmgNCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wYWdlLWRlZi5oDQo+IEBAIC0x
MSw3ICsxMSw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbnN0Lmg+DQo+ICAgDQo+ICAgLyog
UEFHRV9TSElGVCBkZXRlcm1pbmVzIHRoZSBwYWdlIHNpemUgKi8NCj4gLSNkZWZpbmUgUEFHRV9T
SElGVAkJQ09ORklHX0FSTTY0X1BBR0VfU0hJRlQNCj4gKyNkZWZpbmUgUEFHRV9TSElGVAkJQ09O
RklHX1BBR0VfU0hJRlQNCj4gICAjZGVmaW5lIFBBR0VfU0laRQkJKF9BQygxLCBVTCkgPDwgUEFH
RV9TSElGVCkNCj4gICAjZGVmaW5lIFBBR0VfTUFTSwkJKH4oUEFHRV9TSVpFLTEpKQ0KPiAgIA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wYXJpc2MvS2NvbmZpZyBiL2FyY2gvcGFyaXNjL0tjb25maWcN
Cj4gaW5kZXggNWM4NDVlOGQ1OWQ5Li5iMTgwZTY4NGZhMGQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cGFyaXNjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wYXJpc2MvS2NvbmZpZw0KPiBAQCAtMjczLDYg
KzI3Myw3IEBAIGNob2ljZQ0KPiAgIA0KPiAgIGNvbmZpZyBQQVJJU0NfUEFHRV9TSVpFXzRLQg0K
PiAgIAlib29sICI0S0IiDQo+ICsJc2VsZWN0IEhBVkVfUEFHRV9TSVpFXzRLQg0KPiAgIAloZWxw
DQo+ICAgCSAgVGhpcyBsZXRzIHlvdSBzZWxlY3QgdGhlIHBhZ2Ugc2l6ZSBvZiB0aGUga2VybmVs
LiAgRm9yIGJlc3QNCj4gICAJICBwZXJmb3JtYW5jZSwgYSBwYWdlIHNpemUgb2YgMTZLQiBpcyBy
ZWNvbW1lbmRlZC4gIEZvciBiZXN0DQo+IEBAIC0yODgsMTAgKzI4OSwxMiBAQCBjb25maWcgUEFS
SVNDX1BBR0VfU0laRV80S0INCj4gICANCj4gICBjb25maWcgUEFSSVNDX1BBR0VfU0laRV8xNktC
DQo+ICAgCWJvb2wgIjE2S0IiDQo+ICsJc2VsZWN0IEhBVkVfUEFHRV9TSVpFXzE2S0INCj4gICAJ
ZGVwZW5kcyBvbiBQQThYMDAgJiYgQlJPS0VOICYmICFLRkVOQ0UNCj4gICANCj4gICBjb25maWcg
UEFSSVNDX1BBR0VfU0laRV82NEtCDQo+ICAgCWJvb2wgIjY0S0IiDQo+ICsJc2VsZWN0IEhBVkVf
UEFHRV9TSVpFXzY0S0INCj4gICAJZGVwZW5kcyBvbiBQQThYMDAgJiYgQlJPS0VOICYmICFLRkVO
Q0UNCj4gICANCj4gICBlbmRjaG9pY2UNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1
ZGUvYXNtL3BhZ2UuaCBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPiBpbmRleCA2
NjdlNzAzYzBlOGYuLmFkNGUxNWQxMmVkMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wYXJpc2MvaW5j
bHVkZS9hc20vcGFnZS5oDQo+ICsrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3BhZ2UuaA0K
PiBAQCAtNCwxNSArNCw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbnN0Lmg+DQo+
ICAgDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfUEFSSVNDX1BBR0VfU0laRV80S0IpDQo+IC0jIGRl
ZmluZSBQQUdFX1NISUZUCTEyDQo+IC0jZWxpZiBkZWZpbmVkKENPTkZJR19QQVJJU0NfUEFHRV9T
SVpFXzE2S0IpDQo+IC0jIGRlZmluZSBQQUdFX1NISUZUCTE0DQo+IC0jZWxpZiBkZWZpbmVkKENP
TkZJR19QQVJJU0NfUEFHRV9TSVpFXzY0S0IpDQo+IC0jIGRlZmluZSBQQUdFX1NISUZUCTE2DQo+
IC0jZWxzZQ0KPiAtIyBlcnJvciAidW5rbm93biBkZWZhdWx0IGtlcm5lbCBwYWdlIHNpemUiDQo+
IC0jZW5kaWYNCj4gKyNkZWZpbmUgUEFHRV9TSElGVAlDT05GSUdfUEFHRV9TSElGVA0KPiAgICNk
ZWZpbmUgUEFHRV9TSVpFCShfQUMoMSxVTCkgPDwgUEFHRV9TSElGVCkNCj4gICAjZGVmaW5lIFBB
R0VfTUFTSwkofihQQUdFX1NJWkUtMSkpDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IGluZGV4IGI5ZmMwNjRkMzhkMi4u
OGZhZDRlNWQ3YWQ1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBAQCAtMjEyLDcgKzIxMiw3IEBAIGNvbmZpZyBQUEMN
Cj4gICAJc2VsZWN0IEhBVkVfQVJDSF9IVUdFX1ZNQVAJCWlmIFBQQ19SQURJWF9NTVUgfHwgUFBD
Xzh4eA0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0pVTVBfTEFCRUwNCj4gICAJc2VsZWN0IEhBVkVf
QVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFDQo+IC0Jc2VsZWN0IEhBVkVfQVJDSF9LQVNBTgkJCWlm
IFBQQzMyICYmIFBQQ19QQUdFX1NISUZUIDw9IDE0DQo+ICsJc2VsZWN0IEhBVkVfQVJDSF9LQVNB
TgkJCWlmIFBQQzMyICYmIFBBR0VfU0hJRlQgPD0gMTQNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9L
QVNBTgkJCWlmIFBQQ19SQURJWF9NTVUNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTgkJCWlm
IFBQQ19CT09LM0VfNjQNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DCQlpZiBI
QVZFX0FSQ0hfS0FTQU4NCj4gQEAgLTgwOSwxOSArODA5LDIzIEBAIGNob2ljZQ0KPiAgIGNvbmZp
ZyBQUENfNEtfUEFHRVMNCj4gICAJYm9vbCAiNGsgcGFnZSBzaXplIg0KPiAgIAlzZWxlY3QgSEFW
RV9BUkNIX1NPRlRfRElSVFkgaWYgUFBDX0JPT0szU182NA0KPiArCXNlbGVjdCBIQVZFX1BBR0Vf
U0laRV80S0INCj4gICANCj4gICBjb25maWcgUFBDXzE2S19QQUdFUw0KPiAgIAlib29sICIxNmsg
cGFnZSBzaXplIg0KPiAgIAlkZXBlbmRzIG9uIDQ0eCB8fCBQUENfOHh4DQo+ICsJc2VsZWN0IEhB
VkVfUEFHRV9TSVpFXzE2S0INCj4gICANCj4gICBjb25maWcgUFBDXzY0S19QQUdFUw0KPiAgIAli
b29sICI2NGsgcGFnZSBzaXplIg0KPiAgIAlkZXBlbmRzIG9uIDQ0eCB8fCBQUENfQk9PSzNTXzY0
DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfU09GVF9ESVJUWSBpZiBQUENfQk9PSzNTXzY0DQo+ICsJ
c2VsZWN0IEhBVkVfUEFHRV9TSVpFXzY0S0INCj4gICANCj4gICBjb25maWcgUFBDXzI1NktfUEFH
RVMNCj4gICAJYm9vbCAiMjU2ayBwYWdlIHNpemUgKFJlcXVpcmVzIG5vbi1zdGFuZGFyZCBiaW51
dGlscyBzZXR0aW5ncykiDQo+ICAgCWRlcGVuZHMgb24gNDR4ICYmICFQUENfNDd4DQo+ICsJc2Vs
ZWN0IEhBVkVfUEFHRV9TSVpFXzI1NktCDQo+ICAgCWhlbHANCj4gICAJICBNYWtlIHRoZSBwYWdl
IHNpemUgMjU2ay4NCj4gICANCj4gQEAgLTgzMiwyOSArODM2LDYgQEAgY29uZmlnIFBQQ18yNTZL
X1BBR0VTDQo+ICAgDQo+ICAgZW5kY2hvaWNlDQo+ICAgDQo+IC1jb25maWcgUEFHRV9TSVpFXzRL
Qg0KPiAtCWRlZl9ib29sIHkNCj4gLQlkZXBlbmRzIG9uIFBQQ180S19QQUdFUw0KPiAtDQo+IC1j
b25maWcgUEFHRV9TSVpFXzE2S0INCj4gLQlkZWZfYm9vbCB5DQo+IC0JZGVwZW5kcyBvbiBQUENf
MTZLX1BBR0VTDQo+IC0NCj4gLWNvbmZpZyBQQUdFX1NJWkVfNjRLQg0KPiAtCWRlZl9ib29sIHkN
Cj4gLQlkZXBlbmRzIG9uIFBQQ182NEtfUEFHRVMNCj4gLQ0KPiAtY29uZmlnIFBBR0VfU0laRV8y
NTZLQg0KPiAtCWRlZl9ib29sIHkNCj4gLQlkZXBlbmRzIG9uIFBQQ18yNTZLX1BBR0VTDQo+IC0N
Cj4gLWNvbmZpZyBQUENfUEFHRV9TSElGVA0KPiAtCWludA0KPiAtCWRlZmF1bHQgMTggaWYgUFBD
XzI1NktfUEFHRVMNCj4gLQlkZWZhdWx0IDE2IGlmIFBQQ182NEtfUEFHRVMNCj4gLQlkZWZhdWx0
IDE0IGlmIFBQQ18xNktfUEFHRVMNCj4gLQlkZWZhdWx0IDEyDQo+IC0NCj4gICBjb25maWcgVEhS
RUFEX1NISUZUDQo+ICAgCWludCAiVGhyZWFkIHNoaWZ0IiBpZiBFWFBFUlQNCj4gICAJcmFuZ2Ug
MTMgMTUNCj4gQEAgLTg5MSw3ICs4NzIsNyBAQCBjb25maWcgREFUQV9TSElGVA0KPiAgIAlkZWZh
dWx0IDIzIGlmIChERUJVR19QQUdFQUxMT0MgfHwgS0ZFTkNFKSAmJiBQUENfOHh4ICYmIFBJTl9U
TEJfREFUQQ0KPiAgIAlkZWZhdWx0IDE5IGlmIChERUJVR19QQUdFQUxMT0MgfHwgS0ZFTkNFKSAm
JiBQUENfOHh4DQo+ICAgCWRlZmF1bHQgMjQgaWYgU1RSSUNUX0tFUk5FTF9SV1ggJiYgUFBDXzg1
eHgNCj4gLQlkZWZhdWx0IFBQQ19QQUdFX1NISUZUDQo+ICsJZGVmYXVsdCBQQUdFX1NISUZUDQo+
ICAgCWhlbHANCj4gICAJICBPbiBCb29rM1MgMzIgKDYwMyspLCBEQkFUcyBhcmUgdXNlZCB0byBt
YXAga2VybmVsIHRleHQgYW5kIHJvZGF0YSBSTy4NCj4gICAJICBTbWFsbGVyIGlzIHRoZSBhbGln
bm1lbnQsIGdyZWF0ZXIgaXMgdGhlIG51bWJlciBvZiBuZWNlc3NhcnkgREJBVHMuDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BhZ2UuaA0KPiBpbmRleCBlNWZjYzc5YjViZmIuLmU0MTFlNWE3MGVhMyAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+IEBAIC0yMSw3ICsyMSw3IEBADQo+ICAgICog
cGFnZSBzaXplLiBXaGVuIHVzaW5nIDY0SyBwYWdlcyBob3dldmVyLCB3aGV0aGVyIHdlIGFyZSBy
ZWFsbHkgc3VwcG9ydGluZw0KPiAgICAqIDY0SyBwYWdlcyBpbiBIVyBvciBub3QgaXMgaXJyZWxl
dmFudCB0byB0aG9zZSBkZWZpbml0aW9ucy4NCj4gICAgKi8NCj4gLSNkZWZpbmUgUEFHRV9TSElG
VAkJQ09ORklHX1BQQ19QQUdFX1NISUZUDQo+ICsjZGVmaW5lIFBBR0VfU0hJRlQJCUNPTkZJR19Q
QUdFX1NISUZUDQo+ICAgI2RlZmluZSBQQUdFX1NJWkUJCShBU01fQ09OU1QoMSkgPDwgUEFHRV9T
SElGVCkNCj4gICANCj4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPiBkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9nZGIvbGludXgvY29uc3RhbnRzLnB5LmluIGIvc2NyaXB0cy9nZGIvbGludXgvY29uc3Rh
bnRzLnB5LmluDQo+IGluZGV4IGU4MTBlMGMyN2ZmMS4uMTBmYWRjMjM4NzE5IDEwMDY0NA0KPiAt
LS0gYS9zY3JpcHRzL2dkYi9saW51eC9jb25zdGFudHMucHkuaW4NCj4gKysrIGIvc2NyaXB0cy9n
ZGIvbGludXgvY29uc3RhbnRzLnB5LmluDQo+IEBAIC0xMzksNyArMTM5LDcgQEAgTFhfQ09ORklH
KENPTkZJR19BUk02NF82NEtfUEFHRVMpDQo+ICAgaWYgSVNfQlVJTFRJTihDT05GSUdfQVJNNjQp
Og0KPiAgICAgICBMWF9WQUxVRShDT05GSUdfQVJNNjRfUEFfQklUUykNCj4gICAgICAgTFhfVkFM
VUUoQ09ORklHX0FSTTY0X1ZBX0JJVFMpDQo+IC0gICAgTFhfVkFMVUUoQ09ORklHX0FSTTY0X1BB
R0VfU0hJRlQpDQo+ICsgICAgTFhfVkFMVUUoQ09ORklHX1BBR0VfU0hJRlQpDQo+ICAgICAgIExY
X1ZBTFVFKENPTkZJR19BUkNIX0ZPUkNFX01BWF9PUkRFUikNCj4gICBMWF9DT05GSUcoQ09ORklH
X1NQQVJTRU1FTSkNCj4gICBMWF9DT05GSUcoQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FKQ0KPiBk
aWZmIC0tZ2l0IGEvc2NyaXB0cy9nZGIvbGludXgvbW0ucHkgYi9zY3JpcHRzL2dkYi9saW51eC9t
bS5weQ0KPiBpbmRleCBhZDU2NDFkY2IwNjguLjUxNTczMGZkNGM5ZCAxMDA2NDQNCj4gLS0tIGEv
c2NyaXB0cy9nZGIvbGludXgvbW0ucHkNCj4gKysrIGIvc2NyaXB0cy9nZGIvbGludXgvbW0ucHkN
Cj4gQEAgLTQxLDcgKzQxLDcgQEAgY2xhc3MgYWFyY2g2NF9wYWdlX29wcygpOg0KPiAgICAgICAg
ICAgICAgIHNlbGYuU0VDVElPTl9TSVpFX0JJVFMgPSAyNw0KPiAgICAgICAgICAgc2VsZi5NQVhf
UEhZU01FTV9CSVRTID0gY29uc3RhbnRzLkxYX0NPTkZJR19BUk02NF9WQV9CSVRTDQo+ICAgDQo+
IC0gICAgICAgIHNlbGYuUEFHRV9TSElGVCA9IGNvbnN0YW50cy5MWF9DT05GSUdfQVJNNjRfUEFH
RV9TSElGVA0KPiArICAgICAgICBzZWxmLlBBR0VfU0hJRlQgPSBjb25zdGFudHMuTFhfQ09ORklH
X1BBR0VfU0hJRlQNCj4gICAgICAgICAgIHNlbGYuUEFHRV9TSVpFID0gMSA8PCBzZWxmLlBBR0Vf
U0hJRlQNCj4gICAgICAgICAgIHNlbGYuUEFHRV9NQVNLID0gKH4oc2VsZi5QQUdFX1NJWkUgLSAx
KSkgJiAoKDEgPDwgNjQpIC0gMSkNCj4gICANCg==

