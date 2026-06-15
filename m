Return-Path: <sparclinux+bounces-6926-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IGRcJAmzL2qyEgUAu9opvQ
	(envelope-from <sparclinux+bounces-6926-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 15 Jun 2026 10:08:41 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0200684693
	for <lists+sparclinux@lfdr.de>; Mon, 15 Jun 2026 10:08:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gaisler.com header.s=selector1 header.b=Kc3crA8F;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6926-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="sparclinux+bounces-6926-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gaisler.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D81B930277D5
	for <lists+sparclinux@lfdr.de>; Mon, 15 Jun 2026 08:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EDB3C0A03;
	Mon, 15 Jun 2026 08:02:35 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from GVZP280CU018.outbound.protection.outlook.com (mail-swedencentralazon11022072.outbound.protection.outlook.com [52.101.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74153C0A04;
	Mon, 15 Jun 2026 08:02:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510555; cv=fail; b=JopRwbw7plZProD/Q3yC/j39a7dcF2Tdsv8n/3gYzpQ8DjQTPYxc4lEohODGe3ZHWt3l9fhW/TaFrwvJs5hrOBcnQZPAh2LtFynmddjZuVA02p7AxsfGwn/6FPsQ/VA6dGXJX/+WMfDg/nwZe8HpWFkLQX3NYraP3r7HPNfw26I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510555; c=relaxed/simple;
	bh=nfS1oxtPChJ1eQfAww+fBzX1w4aCUWMzL1EVr4qKYJA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W06nWAsWSbgDFISYIzoPISgLm5ckOh1CRZF48KDeSV+lSbF/z4T204TAWt0kN4jjOqML2/mn9YraLemIFrYFEzVIqod8DagC59dvMcs+aVO6ClgSxaOg/DUetdilzllNDf8I41lcsuR+TNVYemJmOe9p7bBsF5GYxHafsLyAgho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=permerror header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (2048-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Kc3crA8F; arc=fail smtp.client-ip=52.101.82.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB1kcEZmvv6DmDj31tC6fK/FBnwY+pG0E7YE+7ZEuIcAP0OQmSm1wSys1hyYaxe/OQpi7l5QShgWdlh9m7eCZutU4ounEvAFeFwXWswJyjSDBnuUYOgyVt24RTpXls8GydvzkH4vzhfoGS9oLMwICosvDzX61i/rmmtvb01Xu2KSXO29jmQ4IBBeqsVXoCVR/u87BhzGIVnajLDs8zShi9JHUDiprcRM/Dv6lwZHPb9UI79Fo4FDsZ/9eteXh2IO8/6JE+6MXDTcHATiZAVj7geKPfz4dCPLijhsmEGCjfTKF/v9Hnu2X4PorfmKJidS1BfTp4BXEh5SdR7fuoc6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2fq74+xae2EegzIdkhV1ag2IAaRBVhAwIIE0cpk6Sk=;
 b=F9BKaxw4LZT3+GKV3lpGstYx7UgHXGp/z8nCXDFMChKp6b/vNDg0nDE+hS0FZwyAYtCqt7cEGJOkeDro0bDfEYbLUxdYV+CC+x01WSyGGrq+7arujrO/CPDhg/ycl02uVDSH+QhmZJ7JiTsl8oHHaOZbC25J1+r+FTDFCGof7l4qX/KKSE/VfWF2QkApdbKumfUE/TgX9zazFPcJ/lWNWvBnWjxdYVNrZc+KyZmcWc6eMpO+v31+xdZER74M7x2QaMTBFQU4vuqPRVUSFkuHs9bpTTLUHBMH49eOhuR0MHXy2vQI679VSC8BjX/nJLGCws6JfKzN7jPdDmJ7kGlsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gaisler.com; dmarc=pass action=none header.from=gaisler.com;
 dkim=pass header.d=gaisler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2fq74+xae2EegzIdkhV1ag2IAaRBVhAwIIE0cpk6Sk=;
 b=Kc3crA8FXQof0b4kWWlwxiYr3CVeqMEknX2fSHAppQ5y5ztOuBLPjce+ta7oJMuFUY6CTXcWfG/L3OzY7806jRprfs3Ih1qAOua4dBamXecjNYz9+TI/1PvD7gtbxRWeo3JuvBYa2Qm1WMhSSQgQYcxeg4ZghDmohtmwXeaHTFVJPGxh4ME0TlUOf/Uavr9fXq9uFF7HULcg6NPTZ9YZ0WpLHGHA6UzaB7QL7oCqCIbKHXRwCX0OBMTydg/MQAgPlyeZoem+Y0xBE/t0o3OUXZ27uZRicFtcEkhFK5dOMTGk+QLjQHd6Kg+V2HoeDr7kqFATpn5Zh7I+eWCuvMlbtw==
Received: from GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:195::18)
 by GVYP280MB0988.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:02:27 +0000
Received: from GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 ([fe80::be76:7636:f4ac:6773]) by GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 ([fe80::be76:7636:f4ac:6773%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 08:02:27 +0000
Message-ID: <eb58c07c-d244-4cb3-95c5-037500569b05@gaisler.com>
Date: Mon, 15 Jun 2026 10:02:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sparc: Disable compat support with LLD
To: Rosen Penev <rosenp@gmail.com>, sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20260508000834.834824-1-rosenp@gmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260508000834.834824-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC43.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2fb) To GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:195::18)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVYP280MB1290:EE_|GVYP280MB0988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab9d5c4-288f-43ae-6061-08decab47108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LZMijZipVUjR4xEJ1PMtjKCpn92Z2TThmYlZOKAXP6Vlw4yfCeUIGzB6BA/IMxGd7Nr3j4pZMe3qmtqOrN02cxg/tE0RtCgifqymtP7efa7C2AfGtBTokae8lTNh04IJEpJNDgXWrPdjoCcg0vXwfEBTK6J0RjLEx2CggttAHF3sXun2fI/pdQF3QVNyEVY/wys27XLmqznfjky4yWEOLoPA8r2Lhm7Tg2vrmGBovMCutXcsZbdT/vBQsROoN82l1XB4c/if23D9FLEMy7wlj70psrquPjJyGqAC3UsHEPpZ2zhc625JkErxiIXs2EPa+RPGrWoOYF6CQlcFmBKqN6VqmWqdqcNP9UFqYAgJ8GzYWCtQqf5WU6P5M47vWMwH+PK7u6LYc2rAeD9KODzpPu8RVDc2gd7oBT1C6z4IXT9ZdkHCyDoKKaoSCtFZ6yxSZpbAZIMZ4n5GYSA1G70fuJ5IXprLhjBwNI+E/8/AOUdQZ7iHafGa9Q1TNmk5KwGmpaIlEFzqIe7njcBsv0ZcKVoackVonL+Acyz7f2xJSJQgIV2X8GoxdcTev4X5m0fJxp0TTSOlF2spGlREGEuQweaMqNLZ9wsBzY30uFvL6gIfn9Y+GxS04x/PZvJ7I2cDtYvN5WqifXUBiTx130e8Hv/jFw/wXBY2b4Iq8USMcHUEEXCcrDdwyLsCRHfgJ2Ni
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlNCN2VkeXlMck5DNGpyMW1ZUjhTcmhBUVRjd2lsQk1kdjgrVEdHM1NCakYr?=
 =?utf-8?B?dUx5OThDcXJ6OTNZcHJQTEhjSENvVnZTdWtyTmRKUUd4aldzajhTRFNET2Vp?=
 =?utf-8?B?c1NDQjNhOEloTndOL2hXaFpnTUFlR0k1T21QQU9waWNmdFI3eXYwV3pvdVNX?=
 =?utf-8?B?RTZ2SnRyTUtFdlFqTE5HSGlPVGlwUnFSdDZzemMyTVdMU294KzVHVzVQeUFw?=
 =?utf-8?B?Y0RsOVVtcDZxOHlHQWdFcThlYjNheWtvSkJvR09iMHJMY3g3aTdZNVo2TmUv?=
 =?utf-8?B?eFp0RzVYR2dVZ3hxbDE3VXFUOEZXMEpSNjJHdzc4Ujl1blZyUVloSTlCZHh6?=
 =?utf-8?B?dUxuN3FKOW5RbDczZytncVdSTUd3VkFaeU80R3lMQlJ3ZGNVTk5wTXFOZUZa?=
 =?utf-8?B?Tm5adHBsTjJBR3piWU9yeUhqRndrRktnekJzQ280OVY3RjVKUjhBSHAxdWxJ?=
 =?utf-8?B?S0hZdWkrVHZGTnlUWHU5TEtnZlY3ZnQyMkZHRWdtUTB0Wi9pU1VnZEhKeThC?=
 =?utf-8?B?SFFLSzkwNXQyQ3RBNWl4Y01sMWd1ZFVzSjY1cHZvR1IxaGRWNy9RUHFad0d5?=
 =?utf-8?B?bnJoRWFmd2RMSHdMQUFFN2Z6RzRUb3REWkdoUWF5aTdXaC82bUIySDhodkgw?=
 =?utf-8?B?aHVvSE53WU8vZGwyems4YktFQmthaUplRlF4TzVtKzVLWCttNHh3OUpTbnRt?=
 =?utf-8?B?U0xaRGFWTmhZODc1Z3J2L213dGlSbG5HTmFzeVMyRXIvQWZXek9mYjh4eFhJ?=
 =?utf-8?B?eG5JRDZNRzkrZ0pyV2NHdElXeFZ0NFByL010aElMQ2d6TGRMaUlTTGxsVmJU?=
 =?utf-8?B?SnJTNU1ha3BCRDJBRklrY3lkN0dEbWNmZ0txbFg1dDE4c3A1NCtZU0UweDEv?=
 =?utf-8?B?N296NHFjNVhmT2VWYUJvREF6UGZuTk4rVkxKemZrQ28reU45SlFxQlI2R0Nl?=
 =?utf-8?B?Slg5STkyYVJPejNGUXlyb3FMN1BhWk55NzlNTHpiNGJxY1dOUTdkY3RGWUNo?=
 =?utf-8?B?VlEzRldEWjZMckkvVnZxV0tyYXlXU1ZBVjQxNm9FcDFZL2tPQlhGd0JPSTFh?=
 =?utf-8?B?R1g3RG50b0FMZ1dSZWMwVXMwekZxNUVtSy8zWFkzcE9MV0IrZlc5QllseC9Y?=
 =?utf-8?B?amNVNmhrcFZFd2xYajlDWGJDeDhqWUlrMlZnVHlBdFV4YUZGWG5TMDEzTnhI?=
 =?utf-8?B?ZnFtbEpxRTNsbzNzQzQ1a0RMVTEvOFhOZSsyQmNsUjNselBEQ05EaEdmRVdw?=
 =?utf-8?B?ZjdzSjQ2K1lSNkVRRlF5c2FONDZLSUQrdEw2ZVJaQkFKdVA0ZDlwMWxSd3Ir?=
 =?utf-8?B?NXB5ZStyOWhsWnBtRzQyRE5Fb1B0SmU4aUo1ZEVweTl3WDI2Wm9lZWIwcDhx?=
 =?utf-8?B?Y2JFS3N1anpweDZmc1BrMjJGcHBaVGVqZ0k0bzZxWG1wUmNvRWtSMVVkOURl?=
 =?utf-8?B?cGp4UVJCTHBIdCt5b1lQZk1HS3lyYXlzbzFtYlNTSzN4VTF5djdtcEw2alE3?=
 =?utf-8?B?eW1HWGlJc0EzbTFUWmkvQTlWNUUydm5TNjg0ZUovZHR1bTZYbFc4K2pCY3lE?=
 =?utf-8?B?OTBEdDEweHNocVZJMjk1M0JYN3plUGxvVjE2QTdEaTZJY21rWXhvY1ZjcWcv?=
 =?utf-8?B?d1dKMHhmWDVkdXB3TjZsbXVWREdoUTA5RDNUTFZJTXhXOXRYekRoUjErOTNz?=
 =?utf-8?B?Uk5pU3cwUWNTZi9USjUxOE1LK1JnZ29CZENkc3V2YjgyUlRPRXlKQ0pFTTZB?=
 =?utf-8?B?MzlpUkVDdjF1dyt5R0pCU0FVNmp0UlNOeDR0NDliRWFsOXZrKytBTmRiQUJ0?=
 =?utf-8?B?aFVyZDhmb0hkTDlHTHpCTTBRdXhxM0FJMW9IbmpwV2Q1Vk83WGtWQzhPQ3o1?=
 =?utf-8?B?VjRBZTZHeVYrREN6bTRCUVVpcjZvMkFtT2xaVVMrcHIwekloMDI0RjhiU1lo?=
 =?utf-8?B?RzhyNXhPT2tXQmI2TXdaYlZ4a0tSSmdpY0d1WkJiQmVuOUJjbXMyMUNLNDRH?=
 =?utf-8?B?ODlHRCtnLzZGa3lGd0RUVVZQbzdtR09jNmFLclRHa29UT0tad2E5L2RXWFEx?=
 =?utf-8?B?ZjlpcDVZNUZmUmFvUXhVSUN3RHlIMDRGYld6SzFiMHJOTmorQi9zR2Rqa04z?=
 =?utf-8?B?YnBzZ1N6Q09NRGRWR3JQUlRvMFlUU2NUZUFaVTV0M0ttR01KVXQzMC9GYjVy?=
 =?utf-8?B?MmRtV2Qya3BVVStrQUZodWhzeFhXK2hKTy9KQzlFUC9UaFlkUFRnbUFFQVJt?=
 =?utf-8?B?RWVuNFZMclBrczhUV2ZqRlAzVURKb1BWTHh1cEMxdkM2SzN1T2xjYkdTSkc3?=
 =?utf-8?B?QmZ6NjlVRCtGQlJqL0xsVkN1N3BGc3VVbURqdzB2czNHWTNqOFkyS2xtSXBz?=
 =?utf-8?Q?xWpECGVTNEuv32ok=3D?=
X-OriginatorOrg: gaisler.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab9d5c4-288f-43ae-6061-08decab47108
X-MS-Exchange-CrossTenant-AuthSource: GVYP280MB1290.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:02:27.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 91fa4a59-2167-458a-8318-e45d80469d7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /j2hufJskfZX3OI9AdSNBkX8diXXMR7oLcb2dnaDKVYc0StIALB5c4n5eC6Ye91AuZ1vi1EO+Zkd53qVH1b8L+mn4156BrtAV/daS5u4gT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVYP280MB0988
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[gaisler.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gaisler.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6926-lists,sparclinux=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:sparclinux@vger.kernel.org,m:davem@davemloft.net,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andreas@gaisler.com,sparclinux@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[gaisler.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[sparclinux,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gaisler.com:dkim,gaisler.com:email,gaisler.com:mid,gaisler.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0200684693

On 2026-05-08 02:08, Rosen Penev wrote:
> An LLVM=1 sparc64 allmodconfig enables COMPAT and then tries to
> build the 32-bit vDSO. That path cannot be linked with ld.lld:
> 
>   ld.lld: error: unknown emulation: elf32_sparc
> 
> ld.lld does not support the 32-bit SPARC ELF emulation used for
> the compat vDSO, so keep COMPAT disabled when LLD is the linker.
> This avoids selecting an unsupported build path while leaving the
> existing GNU ld configuration unchanged.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/sparc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index a6b787efc2c4..681ab2fd3d8a 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -474,6 +474,7 @@ endmenu
>  config COMPAT
>  	bool
>  	depends on SPARC64
> +	depends on !LD_IS_LLD
>  	default y
>  	select HAVE_UID16
>  	select ARCH_WANT_OLD_COMPAT_IPC

Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Picking this up to my for-next.

Thanks,
Andreas


