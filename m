Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E19321C9F
	for <lists+sparclinux@lfdr.de>; Mon, 22 Feb 2021 17:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhBVQTB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Feb 2021 11:19:01 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:36962 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhBVQSz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Feb 2021 11:18:55 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MGEWrj069228;
        Mon, 22 Feb 2021 16:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=gZK0vYYxbG9H+XBvZxChzD40pRjb13G7EEfj+E0oUto=;
 b=AMd4oh8V1ZYC0z63why5UHF/+9Wqsacisb0XjjqQRJwYZmJbSdPnJ41acok4dUEw/OQM
 Ik+ar0Dz6m8P79BUGnnqxS+YIbaNELJcMzfFnNepDkhK9O5C9PBlYBQR9f1hRUWntqG6
 ObIatIZ38ODsI5eel6P9Jz6toVKteO7P9iu7lZQojkVysM8Ns/Q8kKut1vqiYyWZUgR9
 p4X1GFIDs04gcorMS2baUDDbRFyV07hr4sWss5k93eZwtQSEV2aLxm1vm4BzzIYvJfRj
 GNWcAulBVmC4tpIctWJuUErC9GCkRHWsaXPSDmrCfdrSq6uul/vYnVPZvHXK5kjWwrkn Ig== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36ugq3b2m7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 16:17:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MGGQfh064057;
        Mon, 22 Feb 2021 16:17:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by userp3030.oracle.com with ESMTP id 36ucbwae99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 16:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAMwzCKXjmO+u9e7YQms5BcVE0zQvK8ypdsJp9TFxRdd8hZhAg8m0ryveqzWYNEDnrGiGnjIf3ZLxFcg3QxPbjza3ng1e/6Qr9oJhHmb8jpsAeq1AXElfaHOSD8b8yL7Pp23b2L1F5p60WflKOR2X01VbeeQE96jA8GAYR6hZ7BIfgqEvMTt67qSsDr52S/X/7h+rg0fnlltkZFZ4Y+GF91iTejne2oFY6mbQ28DsOEdqwvbpta/x9pXM/l5RQ2ehqChNjucvZHC3L9rA5CzPaHly5Dz/GhzVO8E0zwAIFZYT41PMZNb5HahVvek/QVHhqz7qsREd4mtQo8iemMAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZK0vYYxbG9H+XBvZxChzD40pRjb13G7EEfj+E0oUto=;
 b=ZeYHvhkGsSDY5qgGPs1gO3zIRGka7dz1eStdIDoQolvhD7X+taUnZFRqJ6vBO6sw0GLrjANs7DX1+CES6rPB1D1JgM4+/xfcIqO+UZjjcrJrevu8jCglT5oo0Q5rsYJHVHlbYi67IBxhCDo7KesXTa8y610nznoGIwVgJo8J/Z8Ie/qUmNNfmMPcR1HvtE7zoEPu4JoMzXM9qK3caQUNnzLAtGDbUs/RMhwuAZ2gTsuicGyDsEDBF+7ldHI3hWc4OnLK+FqHJtbwoxG8b2peBF4KyX0mOaPYnrJFRwq74TxJ/jXx1eEKzpnkUZawyfqhkxJ8CYc8nU/qwY1oB68k8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZK0vYYxbG9H+XBvZxChzD40pRjb13G7EEfj+E0oUto=;
 b=N8DeyJ34vdrO9MjQJbjyjlb35ppp9ytg+BXcvW6Tffk87S/kQcP9imdl7WELm/4UAQTjPSR0qhqHWJRcSdaeaAbkzud8fYJe5NYeZ+j6rh5oLow/2pC2Tj4fwn3mHl8gk9an1q+wQPSG/Bt0F1EgyEbXpl5sJ1ZkbYabvOmBmkM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by SJ0PR10MB4541.namprd10.prod.outlook.com (2603:10b6:a03:2db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 22 Feb
 2021 16:17:46 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 16:17:46 +0000
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Meelis Roos <mroos@linux.ee>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
Date:   Mon, 22 Feb 2021 09:17:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::1f]
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::3f5] (2606:b400:8014:1041::1f) by SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 16:17:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f3d9e3e-3647-4f44-1985-08d8d74d6390
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4541:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB45414A038934D8DC5D5387919B819@SJ0PR10MB4541.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOQmk8If18RoWKlUxhmoPKJEa5+/reVVOgaL2OIbtYHtcTscnxWHQlG8NGRVKHI3OJ9XqSlDoaAa6BNO3huPxFN8/of+/WYPwnZGZwfE4GZPHFZhcNe0SaEOeCRUthdQXOX9o6jo6N3zos9EC0Himo8u/xZmrN87CtqdG/WNsuNjDOurQWGcFTURbsZuhJwAT8VJMo2ZyTX4dLw6QaacJioOqbLuuzm9argfa8QirLrSocNYUnl2+WH0IYKvSFZtRxm0bDuqcMRhRPgTxyvxXyUvUmkivl85+6vkM2fX6C2Pg2ZQXIwCipQrQ0gaHweANm1tOyiS6dyneMF7D8M+ZMTk1CmMG1+zR78B1ccwABA8xotKe5Po26DHK4ULsl5ZLP6rsoz75+BhNeJIOVFHcy3RV+y71eI2K5EmOMjLAoAlan2y9ksDYKidwyUR0psio9Tu7+b3flW4PbVCIgKX4/pqVmoYqrGrHGNU9fu83zqD6/RN6vhUikTPVs8/UpNoRQ/mjvj+eehht8ZZS2M5EyoraPK7KN0/DojCp2C31i94o6U9IG2sv2IbCqa5lu5Q6rLa+I7wDVHx5cBrxzu7podUoO3mB5Dc9OKqvYlLPa54r088teUCFqVdpT4sWWxvqXAj/txq7ZKqsuKFSH0pyWEymMOILzqB/DjGlM+UCRPM+amm4W+krCnQkrpvsggH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(45080400002)(186003)(6486002)(44832011)(66556008)(30864003)(36756003)(316002)(8676002)(2616005)(83380400001)(478600001)(31686004)(53546011)(66476007)(66946007)(16526019)(86362001)(966005)(5660300002)(110136005)(66574015)(2906002)(31696002)(8936002)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2NtT1FZc2l2OHpaL3JFK1lGeldpbWttWWRPRE9FOXZHT2RTM2lhTWRCSWdj?=
 =?utf-8?B?WXp5RS9NYncxbW5BNHc3ampEZjVMTnRzME03c2tBOHNlQ2RUUmwzZGFPVWlM?=
 =?utf-8?B?SW5sMXBqTFl4dE1lc3dZTW40NG5Ed3piYlBoS1RINWEwQTZqS2diTW5JVmFx?=
 =?utf-8?B?YmRwMDZDYkJ1aENEOXJQendGd3dPK1l6cDZrNFprOWRGNkZ0eFNuVUo0RWVN?=
 =?utf-8?B?UXlyY0Z2am9nK092d3NZS21oeXdmV0ZlM3FndzYzdGlEMTZXb1NlKzJDQkhB?=
 =?utf-8?B?UlNoMVFkRUlkcUpWUzRsVXdDZGkyUEdlanM4d0tvZmlrSUVITGZ2U2FYNU5U?=
 =?utf-8?B?cDJKSWt4TlVTVTNQZU5Ka3hSVkxNTmp4bHNzdkZqSXFTNXlIUHU2MTNObXFn?=
 =?utf-8?B?Z2w3cVFKR3NPM3poblY5RXFyM3dwQ3Z3QjAxQjMxZytwaWVET1dJbklrbUpY?=
 =?utf-8?B?SEpsaWhON1hoVU5wTDdBV0o0MkFCNHdGMEdSNnN6bFBhL2RqUkFDc1pwaU1p?=
 =?utf-8?B?VjVsTGZBVGNXdnl6L2Ura28yNVFuS090aUhTdHZEeHRIZWxiNDdEVzlhcUJv?=
 =?utf-8?B?c09nSEhnOVZLUFN3K2xzTWw3Q0pvRHgwZi9CaDRLNzdHYkxBbWZ4TXVkYjVI?=
 =?utf-8?B?amtVOVdvOXlYeUJIWVJ5MTh1QkYvVHk0NnlSN0oralFMQVJlOExhK1J6RkQr?=
 =?utf-8?B?YXZZZHV5Z1N1SUFSOGpMQUVTbXBuOS9CRXVmZGpPMVBHdVpQekpwZ1pqV2Vx?=
 =?utf-8?B?ZHJyUVNUczBEdHNCbVNuelNnd0pkWUw4WnZqc1p1OEVHSFBBY3VLSWtucGk0?=
 =?utf-8?B?RWEyaXVZcG9oRk9Ra3JBcWJaSG1lSnV0cmp0OElzeklTaGo4anJaUGtxL25C?=
 =?utf-8?B?ZmswYUxFaUtNLzBkYmNYeE5FME1GcG5IMlZFQjE2cjI3R3VybVRKOE9BNzVm?=
 =?utf-8?B?QklxVUFXalFOY003Z2F0Mmkxbk9KRjYwODRSMUVmalozaHo3QWZ3Y0FlR2xP?=
 =?utf-8?B?NzJWRkEvRUZPaXJLbUZwNCtDelQ0SHdpYXpKV3FDTmRqNitmRDdMTndDTE5w?=
 =?utf-8?B?azR0ZHdWYWNrUVQ3eW9RVnU2QlJoWDM4aDU3ZWU2QUI0bmNZRmhwMnlsWU5G?=
 =?utf-8?B?TjZPNXM2T3lENW1SU3N3elZOSlFERzRaMjIyUWZGMFFmQmx6eG9NdUp2UWhK?=
 =?utf-8?B?YlhpeWtkdTVxSEp2MkhHdENYS041eURRUVVCMnMzU1FmYVRzL2FCWG1tbWZi?=
 =?utf-8?B?dEZEZ0pwZDgyaFlDVkNoMnEwdTRZKzhMdENnd2h3Nk1VaDlSWmxBT0dTVi90?=
 =?utf-8?B?eHV3ODhlNUxGNXd6OG53NE5jTm0wSU9IR0ZmZ0YvTnlCM1lYRGN2RkZGRmFT?=
 =?utf-8?B?QUp3ZnZmVk4zNzgvcjdFaWhiNkFwT0lmT21uZFVnbVZ6M1lIUThNRWYrbWdM?=
 =?utf-8?B?a1dWMVV3T2dzdWVCbTY4ZjhyaW1qUDRMU2VWamhLbkpobnZtenJIdlBaUi9a?=
 =?utf-8?B?eEhvT2JsWFNFcmJoQXJlYWVTeFZKWUFZUXJldHdMRS9Za0s5Z2hUQmpPNVhW?=
 =?utf-8?B?Z3FyNDJyS3ZlNzd6THhEV1lZb0ZMM1JCOEtRSHo2c3R6Uno2TVZzVDFtQWJr?=
 =?utf-8?B?M3RVNnNUbGRWQVVQUEtZT0VzVVhpUHdJU2dOV0FsWUVEcEhRbCt6V0NDY25i?=
 =?utf-8?B?dTJPV0xtV0RTem43Q1JCSm01Qk54YnBkN29HemthS1RXRXY5NWEzdncrRkNa?=
 =?utf-8?B?emx4RVk0Q2laaGxKRk4zMmhOUHVvRUxOb3lWVE9Jd0ExMitMTWVzSExUSmdq?=
 =?utf-8?B?RDRWbVIxQW5OUkpNQUVPUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3d9e3e-3647-4f44-1985-08d8d74d6390
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:17:45.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec5qijHOWZocJfcMsz3NtBWUduO/+ixX1EhPqS/0Wln4a3sSGvJ62bQyfCipoLl/kf+Q/LuTAhv1uUKaCivoTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4541
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220148
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220148
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Can you have stress-ng print out the random opcodes as it runs? That 
might give a hint about where things are going wrong.

Rob


On 2/22/21 5:52 AM, Meelis Roos wrote:
> Since my Sun Fire V240 is online again, I did a bisection of the 
> kernel hang with
>  stress-ng --opcode 1 --timeout 60
> This is reproducible on multiple sparc64 CPU families, I used 
> self-compiled stress-ng from git 
> https://github.com/ColinIanKing/stress-ng
>
> This led me back to 4.13-4.14 timeframe and the result of the 
> bisection is
>
> !makeb6fe1089667a7afcc2cf92cdaec590c7b8381715 is the first bad commit
> commit b6fe1089667a7afcc2cf92cdaec590c7b8381715
> Author: Rob Gardner <rob.gardner@oracle.com>
> Date:   Fri Sep 8 16:34:21 2017 -0600
>
>     sparc64: Handle additional cases of no fault loads
>
>     Load instructions using ASI_PNF or other no-fault ASIs should not
>     cause a SIGSEGV or SIGBUS.
>
>     A garden variety unmapped address follows the TSB miss path, and when
>     no valid mapping is found in the process page tables, the miss 
> handler
>     checks to see if the access was via a no-fault ASI.  It then fixes up
>     the target register with a zero, and skips the no-fault load
>     instruction.
>
>     But different paths are taken for data access exceptions and 
> alignment
>     traps, and these do not respect the no-fault ASI. We add checks in
>     these paths for the no-fault ASI, and fix up the target register and
>     TPC just like in the TSB miss case.
>
>     Signed-off-by: Rob Gardner <rob.gardner@oracle.com>
>     Acked-by: Sam Ravnborg <sam@ravnborg.org>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
>
> :040000 040000 ecd738008861e44777f6cb13c880aa12288f6b2d 
> 4737b21c6537f03170b9859af4c03d1d461b1461 M      arch
>
>
> My kernel config during bisection:
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/sparc64 4.13.0-rc4 Kernel Configuration
> #
> CONFIG_64BIT=y
> CONFIG_SPARC=y
> # CONFIG_SPARC32 is not set
> CONFIG_SPARC64=y
> CONFIG_ARCH_DEFCONFIG="arch/sparc/configs/sparc64_defconfig"
> CONFIG_ARCH_PROC_KCORE_TEXT=y
> CONFIG_CPU_BIG_ENDIAN=y
> CONFIG_ARCH_ATU=y
> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> CONFIG_IOMMU_HELPER=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_AUDIT_ARCH=y
> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> CONFIG_MMU=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_NEED_SG_DMA_LENGTH=y
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> CONFIG_PGTABLE_LEVELS=4
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
>
> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=32
> CONFIG_CROSS_COMPILE=""
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=""
> CONFIG_LOCALVERSION_AUTO=y
> CONFIG_DEFAULT_HOSTNAME="(none)"
> CONFIG_SWAP=y
> CONFIG_SYSVIPC=y
> CONFIG_SYSVIPC_SYSCTL=y
> CONFIG_POSIX_MQUEUE=y
> CONFIG_POSIX_MQUEUE_SYSCTL=y
> CONFIG_CROSS_MEMORY_ATTACH=y
> CONFIG_FHANDLE=y
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
>
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_IRQ_PREFLOW_FASTEOI=y
> CONFIG_GENERIC_MSI_IRQ=y
> CONFIG_SPARSE_IRQ=y
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> CONFIG_GENERIC_CLOCKEVENTS=y
>
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_NO_HZ_COMMON=y
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=y
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=y
> CONFIG_HIGH_RES_TIMERS=y
>
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_TASKSTATS=y
> CONFIG_TASK_DELAY_ACCT=y
> CONFIG_TASK_XACCT=y
> CONFIG_TASK_IO_ACCOUNTING=y
>
> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=y
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=y
> CONFIG_TREE_SRCU=y
> # CONFIG_TASKS_RCU is not set
> CONFIG_RCU_STALL_COMMON=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> # CONFIG_BUILD_BIN2C is not set
> # CONFIG_IKCONFIG is not set
> CONFIG_LOG_BUF_SHIFT=17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> CONFIG_CGROUPS=y
> CONFIG_PAGE_COUNTER=y
> CONFIG_MEMCG=y
> CONFIG_MEMCG_SWAP=y
> CONFIG_MEMCG_SWAP_ENABLED=y
> CONFIG_BLK_CGROUP=y
> # CONFIG_DEBUG_BLK_CGROUP is not set
> CONFIG_CGROUP_WRITEBACK=y
> CONFIG_CGROUP_SCHED=y
> CONFIG_FAIR_GROUP_SCHED=y
> CONFIG_CFS_BANDWIDTH=y
> CONFIG_RT_GROUP_SCHED=y
> CONFIG_CGROUP_PIDS=y
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=y
> CONFIG_CGROUP_HUGETLB=y
> CONFIG_CPUSETS=y
> CONFIG_PROC_PID_CPUSET=y
> CONFIG_CGROUP_DEVICE=y
> CONFIG_CGROUP_CPUACCT=y
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=y
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=y
> CONFIG_UTS_NS=y
> CONFIG_IPC_NS=y
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=y
> CONFIG_NET_NS=y
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> # CONFIG_BLK_DEV_INITRD is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=y
> CONFIG_ANON_INODES=y
> CONFIG_HAVE_UID16=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_BPF=y
> # CONFIG_EXPERT is not set
> CONFIG_UID16=y
> CONFIG_MULTIUSER=y
> CONFIG_SGETMASK_SYSCALL=y
> CONFIG_SYSFS_SYSCALL=y
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_POSIX_TIMERS=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_PRINTK=y
> CONFIG_PRINTK_NMI=y
> CONFIG_BUG=y
> CONFIG_ELF_CORE=y
> CONFIG_BASE_FULL=y
> CONFIG_FUTEX=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> CONFIG_EVENTFD=y
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> CONFIG_ADVISE_SYSCALLS=y
> CONFIG_USERFAULTFD=y
> CONFIG_PCI_QUIRKS=y
> CONFIG_MEMBARRIER=y
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_USE_VMALLOC=y
> # CONFIG_PC104 is not set
>
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=y
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SLAB=y
> # CONFIG_SLUB is not set
> CONFIG_SLAB_MERGE_DEFAULT=y
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> # CONFIG_PROFILING is not set
> CONFIG_HAVE_OPROFILE=y
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=y
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_UPROBES is not set
> CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_NMI=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_DMA_API_DEBUG=y
> CONFIG_HAVE_NMI_WATCHDOG=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_RCU_TABLE_FREE=y
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_THIN_ARCHIVES=y
> CONFIG_HAVE_CONTEXT_TRACKING=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_HAVE_EXIT_THREAD=y
> # CONFIG_HAVE_ARCH_HASH is not set
> # CONFIG_ISA_BUS_API is not set
> CONFIG_ODD_RT_SIGACTION=y
> CONFIG_OLD_SIGSUSPEND=y
> CONFIG_COMPAT_OLD_SIGACTION=y
> CONFIG_CPU_NO_EFFICIENT_FFS=y
> # CONFIG_HAVE_ARCH_VMAP_STACK is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> # CONFIG_ARCH_HAS_STRICT_KERNEL_RWX is not set
> # CONFIG_ARCH_HAS_STRICT_MODULE_RWX is not set
> CONFIG_ARCH_WANT_RELAX_ORDER=y
> # CONFIG_REFCOUNT_FULL is not set
>
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=y
> # CONFIG_ARCH_HAS_GCOV_PROFILE_ALL is not set
> # CONFIG_GCOV_FORMAT_AUTODETECT is not set
> # CONFIG_GCOV_FORMAT_3_4 is not set
> CONFIG_GCOV_FORMAT_4_7=y
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=y
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> CONFIG_MODULES=y
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=y
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> CONFIG_TRIM_UNUSED_KSYMS=y
> CONFIG_MODULES_TREE_LOOKUP=y
> CONFIG_BLOCK=y
> CONFIG_BLK_SCSI_REQUEST=y
> CONFIG_BLK_DEV_BSG=y
> CONFIG_BLK_DEV_BSGLIB=y
> CONFIG_BLK_DEV_INTEGRITY=y
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=y
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> # CONFIG_BLK_WBT is not set
> # CONFIG_BLK_DEBUG_FS is not set
> # CONFIG_BLK_SED_OPAL is not set
>
> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=y
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=y
> CONFIG_OSF_PARTITION=y
> # CONFIG_AMIGA_PARTITION is not set
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=y
> CONFIG_MSDOS_PARTITION=y
> CONFIG_BSD_DISKLABEL=y
> CONFIG_MINIX_SUBPARTITION=y
> CONFIG_SOLARIS_X86_PARTITION=y
> CONFIG_UNIXWARE_DISKLABEL=y
> CONFIG_LDM_PARTITION=y
> # CONFIG_LDM_DEBUG is not set
> CONFIG_SGI_PARTITION=y
> CONFIG_ULTRIX_PARTITION=y
> CONFIG_SUN_PARTITION=y
> CONFIG_KARMA_PARTITION=y
> CONFIG_EFI_PARTITION=y
> CONFIG_SYSV68_PARTITION=y
> # CONFIG_CMDLINE_PARTITION is not set
> CONFIG_BLOCK_COMPAT=y
> CONFIG_BLK_MQ_PCI=y
>
> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=y
> CONFIG_IOSCHED_DEADLINE=y
> CONFIG_IOSCHED_CFQ=y
> # CONFIG_CFQ_GROUP_IOSCHED is not set
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_CFQ=y
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED="cfq"
> CONFIG_MQ_IOSCHED_DEADLINE=y
> # CONFIG_MQ_IOSCHED_KYBER is not set
> # CONFIG_IOSCHED_BFQ is not set
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
> CONFIG_INLINE_READ_UNLOCK=y
> CONFIG_INLINE_READ_UNLOCK_IRQ=y
> CONFIG_INLINE_WRITE_UNLOCK=y
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_MUTEX_SPIN_ON_OWNER=y
> CONFIG_RWSEM_SPIN_ON_OWNER=y
> CONFIG_LOCK_SPIN_ON_OWNER=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_QUEUED_RWLOCKS=y
> CONFIG_FREEZER=y
>
> #
> # Processor type and features
> #
> CONFIG_SMP=y
> CONFIG_NR_CPUS=2
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250
> CONFIG_SCHED_HRTICK=y
> CONFIG_RWSEM_XCHGADD_ALGORITHM=y
> CONFIG_GENERIC_HWEIGHT=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> CONFIG_SPARC64_SMP=y
> CONFIG_EARLYFB=y
> CONFIG_SECCOMP=y
> CONFIG_HOTPLUG_CPU=y
>
> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=y
> CONFIG_CPU_FREQ_GOV_ATTR_SET=y
> CONFIG_CPU_FREQ_GOV_COMMON=y
> CONFIG_CPU_FREQ_STAT=y
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_GOV_USERSPACE is not set
> CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> # CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
> # CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
>
> #
> # CPU frequency scaling drivers
> #
> CONFIG_SPARC_US3_CPUFREQ=m
> CONFIG_SPARC_US2E_CPUFREQ=m
> CONFIG_US3_MC=y
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SELECT_MEMORY_MODEL=y
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> CONFIG_FORCE_MAX_ZONEORDER=13
> CONFIG_SELECT_MEMORY_MODEL=y
> CONFIG_SPARSEMEM_MANUAL=y
> CONFIG_SPARSEMEM=y
> CONFIG_HAVE_MEMORY_PRESENT=y
> CONFIG_SPARSEMEM_EXTREME=y
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> CONFIG_SPARSEMEM_VMEMMAP=y
> CONFIG_HAVE_MEMBLOCK=y
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
> CONFIG_NO_BOOTMEM=y
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_COMPACTION=y
> CONFIG_MIGRATION=y
> CONFIG_PHYS_ADDR_T_64BIT=y
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> # CONFIG_ARCH_WANTS_THP_SWAP is not set
> # CONFIG_CLEANCACHE is not set
> # CONFIG_FRONTSWAP is not set
> # CONFIG_CMA is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> # CONFIG_IDLE_PAGE_TRACKING is not set
> # CONFIG_PERCPU_STATS is not set
> CONFIG_HIBERNATE_CALLBACKS=y
> CONFIG_HIBERNATION=y
> CONFIG_PM_STD_PARTITION=""
> CONFIG_PM_SLEEP=y
> CONFIG_PM_SLEEP_SMP=y
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=y
> # CONFIG_PM_DEBUG is not set
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_SCHED_SMT is not set
> # CONFIG_SCHED_MC is not set
> CONFIG_PREEMPT_NONE=y
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> # CONFIG_CMDLINE_BOOL is not set
>
> #
> # Bus options (PCI etc.)
> #
> CONFIG_SBUS=y
> CONFIG_SBUSCHAR=y
> # CONFIG_SUN_LDOMS is not set
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_PCI_SYSCALL=y
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=y
> CONFIG_PCI_MSI=y
> # CONFIG_PCI_MSI_IRQ_DOMAIN is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> # CONFIG_HOTPLUG_PCI is not set
>
> #
> # DesignWare PCI Core Support
> #
>
> #
> # PCI host controller drivers
> #
>
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
>
> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # CONFIG_PCCARD is not set
> CONFIG_SUN_OPENPROMFS=m
> CONFIG_SPARC64_PCI=y
> CONFIG_SPARC64_PCI_MSI=y
>
> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=y
> CONFIG_COMPAT_BINFMT_ELF=y
> CONFIG_ELFCORE=y
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
> CONFIG_BINFMT_SCRIPT=y
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=m
> CONFIG_COREDUMP=y
> CONFIG_COMPAT=y
> CONFIG_SYSVIPC_COMPAT=y
> CONFIG_NET=y
>
> #
> # Networking options
> #
> CONFIG_PACKET=y
> CONFIG_PACKET_DIAG=m
> CONFIG_UNIX=y
> CONFIG_UNIX_DIAG=y
> # CONFIG_TLS is not set
> # CONFIG_XFRM_USER is not set
> # CONFIG_NET_KEY is not set
> CONFIG_INET=y
> CONFIG_IP_MULTICAST=y
> # CONFIG_IP_ADVANCED_ROUTER is not set
> # CONFIG_IP_PNP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=m
> # CONFIG_IP_MROUTE is not set
> CONFIG_SYN_COOKIES=y
> # CONFIG_NET_UDP_TUNNEL is not set
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> # CONFIG_INET_XFRM_TUNNEL is not set
> CONFIG_INET_TUNNEL=m
> # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> # CONFIG_INET_XFRM_MODE_BEET is not set
> CONFIG_INET_DIAG=y
> CONFIG_INET_TCP_DIAG=y
> CONFIG_INET_UDP_DIAG=y
> CONFIG_INET_RAW_DIAG=y
> # CONFIG_INET_DIAG_DESTROY is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=y
> CONFIG_DEFAULT_TCP_CONG="cubic"
> CONFIG_TCP_MD5SIG=y
> CONFIG_IPV6=y
> CONFIG_IPV6_ROUTER_PREF=y
> CONFIG_IPV6_ROUTE_INFO=y
> CONFIG_IPV6_OPTIMISTIC_DAD=y
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_INET6_XFRM_TUNNEL is not set
> # CONFIG_INET6_TUNNEL is not set
> # CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
> # CONFIG_INET6_XFRM_MODE_TUNNEL is not set
> # CONFIG_INET6_XFRM_MODE_BEET is not set
> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> CONFIG_IPV6_SIT=m
> CONFIG_IPV6_SIT_6RD=y
> CONFIG_IPV6_NDISC_NODETYPE=y
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_FOU is not set
> # CONFIG_IPV6_FOU_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_NETLABEL is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NET_PTP_CLASSIFY is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> # CONFIG_BRIDGE is not set
> CONFIG_HAVE_NET_DSA=y
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=y
> CONFIG_RFS_ACCEL=y
> CONFIG_XPS=y
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=y
> CONFIG_NET_RX_BUSY_POLL=y
> CONFIG_BQL=y
> CONFIG_BPF_JIT=y
> CONFIG_NET_FLOW_LIMIT=y
>
> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_IRDA is not set
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> # CONFIG_STREAM_PARSER is not set
> # CONFIG_WIRELESS is not set
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_CEPH_LIB is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> CONFIG_DST_CACHE=y
> CONFIG_GRO_CELLS=y
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=y
> CONFIG_HAVE_EBPF_JIT=y
>
> #
> # Device Drivers
> #
>
> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=y
> CONFIG_UEVENT_HELPER_PATH=""
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_STANDALONE=y
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> CONFIG_FW_LOADER=y
> CONFIG_FIRMWARE_IN_KERNEL=y
> CONFIG_EXTRA_FIRMWARE=""
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_ALLOW_DEV_COREDUMP=y
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> # CONFIG_DMA_SHARED_BUFFER is not set
>
> #
> # Bus devices
> #
> # CONFIG_SIMPLE_PM_BUS is not set
> # CONFIG_CONNECTOR is not set
> # CONFIG_MTD is not set
> CONFIG_OF=y
> CONFIG_OF_PROMTREE=y
> CONFIG_OF_NET=y
> CONFIG_OF_MDIO=y
> CONFIG_OF_PCI=y
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> # CONFIG_PARPORT is not set
> CONFIG_BLK_DEV=y
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=m
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_NVME_FC is not set
> # CONFIG_NVME_TARGET is not set
>
> #
> # Misc devices
> #
> # CONFIG_SENSORS_LIS3LV02D is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_SRAM is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_C2PORT is not set
>
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_93CX6 is not set
> # CONFIG_CB710_CORE is not set
>
> #
> # Texas Instruments shared transport line discipline
> #
>
> #
> # Altera FPGA firmware download module
> #
>
> #
> # Intel MIC Bus Driver
> #
>
> #
> # SCIF Bus Driver
> #
>
> #
> # VOP Bus Driver
> #
>
> #
> # Intel MIC Host Driver
> #
>
> #
> # Intel MIC Card Driver
> #
>
> #
> # SCIF Driver
> #
>
> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
>
> #
> # VOP Driver
> #
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> # CONFIG_CXL_LIB is not set
> CONFIG_HAVE_IDE=y
> # CONFIG_IDE is not set
>
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> # CONFIG_RAID_ATTRS is not set
> CONFIG_SCSI=y
> CONFIG_SCSI_DMA=y
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_SCSI_PROC_FS is not set
>
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=y
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_CHR_DEV_OSST is not set
> CONFIG_BLK_DEV_SR=y
> CONFIG_BLK_DEV_SR_VENDOR=y
> CONFIG_CHR_DEV_SG=y
> # CONFIG_CHR_DEV_SCH is not set
> # CONFIG_SCSI_CONSTANTS is not set
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=y
>
> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=y
> # CONFIG_SCSI_FC_ATTRS is not set
> CONFIG_SCSI_ISCSI_ATTRS=m
> # CONFIG_SCSI_SAS_ATTRS is not set
> # CONFIG_SCSI_SAS_LIBSAS is not set
> # CONFIG_SCSI_SRP_ATTRS is not set
> CONFIG_SCSI_LOWLEVEL=y
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> # CONFIG_SCSI_MPT3SAS is not set
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FUTURE_DOMAIN is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_STEX is not set
> CONFIG_SCSI_SYM53C8XX_2=y
> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
> CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
> CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
> CONFIG_SCSI_SYM53C8XX_MMIO=y
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLOGICPTI is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> # CONFIG_SCSI_DEBUG is not set
> # CONFIG_SCSI_SUNESP is not set
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_DH is not set
> # CONFIG_SCSI_OSD_INITIATOR is not set
> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
>
> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> CONFIG_NETDEVICES=y
> CONFIG_NET_CORE=y
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NETPOLL is not set
> # CONFIG_NET_POLL_CONTROLLER is not set
> CONFIG_TUN=m
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_NLMON is not set
> CONFIG_SUNGEM_PHY=m
> # CONFIG_ARCNET is not set
>
> #
> # CAIF transport drivers
> #
>
> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_ETHERNET=y
> # CONFIG_NET_VENDOR_3COM is not set
> # CONFIG_NET_VENDOR_ADAPTEC is not set
> # CONFIG_GRETH is not set
> # CONFIG_NET_VENDOR_AGERE is not set
> # CONFIG_NET_VENDOR_ALACRITECH is not set
> # CONFIG_NET_VENDOR_ALTEON is not set
> # CONFIG_ALTERA_TSE is not set
> # CONFIG_NET_VENDOR_AMAZON is not set
> # CONFIG_NET_VENDOR_AMD is not set
> # CONFIG_NET_VENDOR_AQUANTIA is not set
> # CONFIG_NET_VENDOR_ARC is not set
> # CONFIG_NET_VENDOR_ATHEROS is not set
> # CONFIG_NET_VENDOR_AURORA is not set
> # CONFIG_NET_CADENCE is not set
> CONFIG_NET_VENDOR_BROADCOM=y
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> CONFIG_TIGON3=m
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> # CONFIG_NET_VENDOR_BROCADE is not set
> # CONFIG_NET_VENDOR_CAVIUM is not set
> # CONFIG_NET_VENDOR_CHELSIO is not set
> # CONFIG_NET_VENDOR_CISCO is not set
> # CONFIG_DNET is not set
> # CONFIG_NET_VENDOR_DEC is not set
> # CONFIG_NET_VENDOR_DLINK is not set
> # CONFIG_NET_VENDOR_EMULEX is not set
> # CONFIG_NET_VENDOR_EZCHIP is not set
> # CONFIG_NET_VENDOR_EXAR is not set
> # CONFIG_NET_VENDOR_HP is not set
> # CONFIG_NET_VENDOR_INTEL is not set
> # CONFIG_JME is not set
> # CONFIG_NET_VENDOR_MARVELL is not set
> # CONFIG_NET_VENDOR_MELLANOX is not set
> # CONFIG_NET_VENDOR_MICREL is not set
> # CONFIG_NET_VENDOR_MYRI is not set
> # CONFIG_FEALNX is not set
> # CONFIG_NET_VENDOR_NATSEMI is not set
> # CONFIG_NET_VENDOR_NETRONOME is not set
> # CONFIG_NET_VENDOR_NVIDIA is not set
> # CONFIG_NET_VENDOR_OKI is not set
> # CONFIG_ETHOC is not set
> # CONFIG_NET_PACKET_ENGINE is not set
> # CONFIG_NET_VENDOR_QLOGIC is not set
> # CONFIG_NET_VENDOR_QUALCOMM is not set
> # CONFIG_NET_VENDOR_REALTEK is not set
> # CONFIG_NET_VENDOR_RENESAS is not set
> # CONFIG_NET_VENDOR_RDC is not set
> # CONFIG_NET_VENDOR_ROCKER is not set
> # CONFIG_NET_VENDOR_SAMSUNG is not set
> # CONFIG_NET_VENDOR_SEEQ is not set
> # CONFIG_NET_VENDOR_SILAN is not set
> # CONFIG_NET_VENDOR_SIS is not set
> # CONFIG_NET_VENDOR_SOLARFLARE is not set
> # CONFIG_NET_VENDOR_SMSC is not set
> # CONFIG_NET_VENDOR_STMICRO is not set
> CONFIG_NET_VENDOR_SUN=y
> CONFIG_HAPPYMEAL=m
> CONFIG_SUNBMAC=m
> # CONFIG_SUNQE is not set
> CONFIG_SUNGEM=m
> CONFIG_CASSINI=m
> # CONFIG_NIU is not set
> # CONFIG_NET_VENDOR_TEHUTI is not set
> # CONFIG_NET_VENDOR_TI is not set
> # CONFIG_NET_VENDOR_VIA is not set
> # CONFIG_NET_VENDOR_WIZNET is not set
> # CONFIG_NET_VENDOR_SYNOPSYS is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> CONFIG_MDIO_DEVICE=y
> CONFIG_MDIO_BUS=y
> # CONFIG_MDIO_BCM_UNIMAC is not set
> # CONFIG_MDIO_BITBANG is not set
> # CONFIG_MDIO_BUS_MUX_MMIOREG is not set
> # CONFIG_MDIO_HISI_FEMAC is not set
> # CONFIG_MDIO_OCTEON is not set
> # CONFIG_MDIO_THUNDER is not set
> CONFIG_PHYLIB=y
> CONFIG_SWPHY=y
>
> #
> # MII PHY device drivers
> #
> # CONFIG_AMD_PHY is not set
> # CONFIG_AQUANTIA_PHY is not set
> # CONFIG_AT803X_PHY is not set
> # CONFIG_BCM7XXX_PHY is not set
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_BROADCOM_PHY is not set
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> CONFIG_FIXED_PHY=y
> # CONFIG_ICPLUS_PHY is not set
> # CONFIG_INTEL_XWAY_PHY is not set
> # CONFIG_LSI_ET1011C_PHY is not set
> # CONFIG_LXT_PHY is not set
> # CONFIG_MARVELL_PHY is not set
> # CONFIG_MARVELL_10G_PHY is not set
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> # CONFIG_QSEMI_PHY is not set
> # CONFIG_REALTEK_PHY is not set
> # CONFIG_SMSC_PHY is not set
> # CONFIG_STE10XP is not set
> # CONFIG_TERANETICS_PHY is not set
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
>
> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> # CONFIG_USB_NET_DRIVERS is not set
> # CONFIG_WLAN is not set
>
> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_ISDN is not set
> # CONFIG_NVM is not set
>
> #
> # Input device support
> #
> CONFIG_INPUT=y
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_POLLDEV is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
>
> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
>
> #
> # Input Device Drivers
> #
> # CONFIG_INPUT_KEYBOARD is not set
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=y
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_E3X0_BUTTON is not set
> CONFIG_INPUT_SPARCSPKR=y
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_UINPUT is not set
> # CONFIG_INPUT_ADXL34X is not set
> # CONFIG_INPUT_CMA3000 is not set
> # CONFIG_RMI4_CORE is not set
>
> #
> # Hardware I/O ports
> #
> # CONFIG_SERIO is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> # CONFIG_GAMEPORT is not set
>
> #
> # Character devices
> #
> CONFIG_TTY=y
> CONFIG_VT=y
> CONFIG_CONSOLE_TRANSLATIONS=y
> CONFIG_VT_CONSOLE=y
> CONFIG_VT_CONSOLE_SLEEP=y
> CONFIG_HW_CONSOLE=y
> # CONFIG_VT_HW_CONSOLE_BINDING is not set
> CONFIG_UNIX98_PTYS=y
> # CONFIG_LEGACY_PTYS is not set
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
>
> #
> # Serial drivers
> #
> # CONFIG_SERIAL_8250 is not set
>
> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_SUNCORE=y
> CONFIG_SERIAL_SUNZILOG=y
> CONFIG_SERIAL_SUNZILOG_CONSOLE=y
> CONFIG_SERIAL_SUNSU=y
> CONFIG_SERIAL_SUNSU_CONSOLE=y
> CONFIG_SERIAL_SUNSAB=y
> CONFIG_SERIAL_SUNSAB_CONSOLE=y
> # CONFIG_SERIAL_SUNHV is not set
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_GRLIB_GAISLER_APBUART is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_HW_RANDOM is not set
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_TCG_TPM is not set
> CONFIG_DEVPORT=y
> # CONFIG_XILLYBUS is not set
>
> #
> # I2C support
> #
> # CONFIG_I2C is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> # CONFIG_PPS is not set
>
> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
>
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional 
> clocks.
> #
> # CONFIG_GPIOLIB is not set
> # CONFIG_W1 is not set
> # CONFIG_POWER_AVS is not set
> # CONFIG_POWER_RESET is not set
> # CONFIG_POWER_SUPPLY is not set
> # CONFIG_HWMON is not set
> # CONFIG_THERMAL is not set
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
> # CONFIG_WATCHDOG_SYSFS is not set
>
> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_ALIM7101_WDT=m
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_WATCHDOG_CP1XXX is not set
> # CONFIG_WATCHDOG_RIO is not set
> # CONFIG_WATCHDOG_SUN4V is not set
>
> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
>
> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
>
> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> CONFIG_SSB_POSSIBLE=y
>
> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=y
>
> #
> # Broadcom specific AMBA
> #
> # CONFIG_BCMA is not set
>
> #
> # Multifunction device drivers
> #
> # CONFIG_MFD_CORE is not set
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> # CONFIG_MFD_ATMEL_HLCDC is not set
> # CONFIG_MFD_DLN2 is not set
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> # CONFIG_MFD_RTSX_USB is not set
> # CONFIG_MFD_SM501 is not set
> # CONFIG_ABX500_CORE is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> # CONFIG_REGULATOR is not set
> # CONFIG_MEDIA_SUPPORT is not set
>
> #
> # Graphics support
> #
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> # CONFIG_DRM is not set
>
> #
> # ACP (Audio CoProcessor) Configuration
> #
> # CONFIG_DRM_LIB_RANDOM is not set
>
> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> # CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> # CONFIG_VGASTATE is not set
>
> #
> # Console display driver support
> #
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_DUMMY_CONSOLE_COLUMNS=80
> CONFIG_DUMMY_CONSOLE_ROWS=25
> # CONFIG_SOUND is not set
>
> #
> # HID support
> #
> # CONFIG_HID is not set
>
> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> # CONFIG_HID_PID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=m
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=m
> CONFIG_USB_PCI=y
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>
> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=y
> CONFIG_USB_DYNAMIC_MINORS=y
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> # CONFIG_USB_MON is not set
> # CONFIG_USB_WUSB_CBAF is not set
>
> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> # CONFIG_USB_XHCI_HCD is not set
> CONFIG_USB_EHCI_HCD=m
> CONFIG_USB_EHCI_ROOT_HUB_TT=y
> CONFIG_USB_EHCI_TT_NEWSCHED=y
> CONFIG_USB_EHCI_PCI=m
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_ISP1362_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> CONFIG_USB_OHCI_HCD=m
> # CONFIG_USB_OHCI_HCD_PCI is not set
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=m
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
>
> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> # CONFIG_USB_TMC is not set
>
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
>
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=m
> # CONFIG_USB_STORAGE_DEBUG is not set
> CONFIG_USB_STORAGE_REALTEK=m
> CONFIG_REALTEK_AUTOPM=y
> CONFIG_USB_STORAGE_DATAFAB=m
> CONFIG_USB_STORAGE_FREECOM=m
> CONFIG_USB_STORAGE_ISD200=m
> CONFIG_USB_STORAGE_USBAT=m
> CONFIG_USB_STORAGE_SDDR09=m
> CONFIG_USB_STORAGE_SDDR55=m
> CONFIG_USB_STORAGE_JUMPSHOT=m
> CONFIG_USB_STORAGE_ALAUDA=m
> CONFIG_USB_STORAGE_ONETOUCH=m
> CONFIG_USB_STORAGE_KARMA=m
> CONFIG_USB_STORAGE_CYPRESS_ATACB=m
> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> # CONFIG_USB_UAS is not set
>
> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USB_MICROTEK is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
>
> #
> # USB port drivers
> #
> # CONFIG_USB_SERIAL is not set
>
> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_RIO500 is not set
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_USB_SISUSBVGA is not set
> # CONFIG_USB_LD is not set
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
>
> #
> # USB Physical Layer drivers
> #
> # CONFIG_USB_PHY is not set
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GADGET is not set
>
> #
> # USB Power Delivery and Type-C drivers
> #
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_UWB is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> # CONFIG_NEW_LEDS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_RTC_LIB=y
> CONFIG_RTC_MC146818_LIB=y
> CONFIG_RTC_CLASS=y
> CONFIG_RTC_HCTOSYS=y
> CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=y
>
> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=y
> CONFIG_RTC_INTF_PROC=y
> CONFIG_RTC_INTF_DEV=y
> CONFIG_RTC_INTF_DEV_UIE_EMUL=y
> # CONFIG_RTC_DRV_TEST is not set
>
> #
> # I2C RTC drivers
> #
>
> #
> # SPI RTC drivers
> #
>
> #
> # SPI and I2C RTC drivers
> #
>
> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=y
> # CONFIG_RTC_DRV_DS1286 is not set
> # CONFIG_RTC_DRV_DS1511 is not set
> # CONFIG_RTC_DRV_DS1553 is not set
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_DS2404 is not set
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=y
> # CONFIG_RTC_DRV_MSM6242 is not set
> CONFIG_RTC_DRV_BQ4802=y
> # CONFIG_RTC_DRV_RP5C01 is not set
> # CONFIG_RTC_DRV_V3020 is not set
> # CONFIG_RTC_DRV_ZYNQMP is not set
>
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_SUN4V=y
> CONFIG_RTC_DRV_STARFIRE=y
> # CONFIG_RTC_DRV_FTRTC010 is not set
> # CONFIG_RTC_DRV_SNVS is not set
> # CONFIG_RTC_DRV_R7301 is not set
>
> #
> # HID Sensor RTC drivers
> #
> # CONFIG_DMADEVICES is not set
>
> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> # CONFIG_VIRT_DRIVERS is not set
>
> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_MMIO is not set
>
> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV_TSCPAGE is not set
> # CONFIG_STAGING is not set
> # CONFIG_HWSPINLOCK is not set
>
> #
> # Clock Source drivers
> #
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
>
> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
>
> #
> # Rpmsg drivers
> #
>
> #
> # SOC (System On Chip) specific Drivers
> #
>
> #
> # Broadcom SoC drivers
> #
>
> #
> # i.MX SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> # CONFIG_SOC_TI is not set
> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> CONFIG_ARM_GIC_MAX_NR=1
> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
>
> #
> # PHY Subsystem
> #
> # CONFIG_GENERIC_PHY is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
>
> #
> # Performance monitor support
> #
> # CONFIG_RAS is not set
>
> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=m
> CONFIG_NVMEM=y
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
>
> #
> # FPGA Configuration Support
> #
> # CONFIG_FPGA is not set
>
> #
> # FSI support
> #
> # CONFIG_FSI is not set
>
> #
> # Misc Linux/SPARC drivers
> #
> CONFIG_SUN_OPENPROMIO=m
> CONFIG_OBP_FLASH=m
> # CONFIG_TADPOLE_TS102_UCTRL is not set
> CONFIG_BBC_I2C=y
> # CONFIG_ENVCTRL is not set
> # CONFIG_DISPLAY7SEG is not set
>
> #
> # File systems
> #
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_USE_FOR_EXT2=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y
> # CONFIG_EXT4_ENCRYPTION is not set
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=y
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=y
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> # CONFIG_XFS_FS is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> CONFIG_FILE_LOCKING=y
> CONFIG_MANDATORY_FILE_LOCKING=y
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> CONFIG_INOTIFY_USER=y
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> CONFIG_AUTOFS4_FS=m
> # CONFIG_FUSE_FS is not set
> # CONFIG_OVERLAY_FS is not set
>
> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
>
> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> # CONFIG_UDF_FS is not set
>
> #
> # DOS/FAT/NT Filesystems
> #
> # CONFIG_MSDOS_FS is not set
> # CONFIG_VFAT_FS is not set
> # CONFIG_NTFS_FS is not set
>
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> CONFIG_PROC_KCORE=y
> CONFIG_PROC_SYSCTL=y
> CONFIG_PROC_PAGE_MONITOR=y
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> CONFIG_TMPFS_POSIX_ACL=y
> CONFIG_TMPFS_XATTR=y
> CONFIG_HUGETLBFS=y
> CONFIG_HUGETLB_PAGE=y
> CONFIG_CONFIGFS_FS=m
> # CONFIG_MISC_FILESYSTEMS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=m
> CONFIG_NLS_DEFAULT="utf-8"
> CONFIG_NLS_CODEPAGE_437=m
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=m
> CONFIG_NLS_CODEPAGE_850=m
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=m
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=m
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> # CONFIG_NLS_MAC_CROATIAN is not set
> # CONFIG_NLS_MAC_CYRILLIC is not set
> # CONFIG_NLS_MAC_GAELIC is not set
> # CONFIG_NLS_MAC_GREEK is not set
> # CONFIG_NLS_MAC_ICELAND is not set
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=m
> # CONFIG_DLM is not set
>
> #
> # Kernel hacking
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
>
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
>
> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=2048
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=y
> # CONFIG_HEADERS_CHECK is not set
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0xffff
> CONFIG_MAGIC_SYSRQ_SERIAL=y
> CONFIG_DEBUG_KERNEL=y
>
> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=y
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_MEMORY_INIT=y
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_DEBUG_SHIRQ=y
>
> #
> # Debug Lockups and Hangs
> #
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
> CONFIG_WQ_WATCHDOG=y
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_PANIC_TIMEOUT=0
> # CONFIG_SCHED_DEBUG is not set
> CONFIG_SCHED_INFO=y
> # CONFIG_SCHEDSTATS is not set
> CONFIG_SCHED_STACK_END_CHECK=y
> # CONFIG_DEBUG_TIMEKEEPING is not set
>
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_HAVE_DEBUG_BUGVERBOSE=y
> CONFIG_DEBUG_BUGVERBOSE=y
> CONFIG_DEBUG_LIST=y
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_DEBUG_CREDENTIALS is not set
>
> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_PERF_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=60
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_TRACING_SUPPORT=y
> # CONFIG_FTRACE is not set
>
> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_USER_COPY is not set
> # CONFIG_TEST_BPF is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=y
> # CONFIG_KGDB is not set
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> CONFIG_UBSAN=y
> CONFIG_UBSAN_ALIGNMENT=y
> CONFIG_UBSAN_NULL=y
> # CONFIG_DEBUG_DCFLUSH is not set
>
> #
> # Security options
> #
> # CONFIG_KEYS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=y
> # CONFIG_SECURITY_WRITABLE_HOOKS is not set
> CONFIG_SECURITYFS=y
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> CONFIG_HARDENED_USERCOPY=y
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_LOADPIN is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_DEFAULT_SECURITY=""
> CONFIG_CRYPTO=y
>
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> # CONFIG_CRYPTO_RSA is not set
> # CONFIG_CRYPTO_DH is not set
> # CONFIG_CRYPTO_ECDH is not set
> # CONFIG_CRYPTO_MANAGER is not set
> # CONFIG_CRYPTO_MANAGER2 is not set
> # CONFIG_CRYPTO_USER is not set
> # CONFIG_CRYPTO_GF128MUL is not set
> # CONFIG_CRYPTO_NULL is not set
> # CONFIG_CRYPTO_PCRYPT is not set
> # CONFIG_CRYPTO_CRYPTD is not set
> # CONFIG_CRYPTO_MCRYPTD is not set
> # CONFIG_CRYPTO_AUTHENC is not set
> # CONFIG_CRYPTO_TEST is not set
>
> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> # CONFIG_CRYPTO_GCM is not set
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> # CONFIG_CRYPTO_SEQIV is not set
> # CONFIG_CRYPTO_ECHAINIV is not set
>
> #
> # Block modes
> #
> # CONFIG_CRYPTO_CBC is not set
> # CONFIG_CRYPTO_CTR is not set
> # CONFIG_CRYPTO_CTS is not set
> # CONFIG_CRYPTO_ECB is not set
> # CONFIG_CRYPTO_LRW is not set
> # CONFIG_CRYPTO_PCBC is not set
> # CONFIG_CRYPTO_XTS is not set
> # CONFIG_CRYPTO_KEYWRAP is not set
>
> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> # CONFIG_CRYPTO_HMAC is not set
> # CONFIG_CRYPTO_XCBC is not set
> # CONFIG_CRYPTO_VMAC is not set
>
> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=y
> # CONFIG_CRYPTO_CRC32C_SPARC64 is not set
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRCT10DIF=y
> # CONFIG_CRYPTO_GHASH is not set
> # CONFIG_CRYPTO_POLY1305 is not set
> # CONFIG_CRYPTO_MD4 is not set
> CONFIG_CRYPTO_MD5=y
> # CONFIG_CRYPTO_MD5_SPARC64 is not set
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD128 is not set
> # CONFIG_CRYPTO_RMD160 is not set
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> # CONFIG_CRYPTO_SHA1 is not set
> # CONFIG_CRYPTO_SHA1_SPARC64 is not set
> # CONFIG_CRYPTO_SHA256 is not set
> # CONFIG_CRYPTO_SHA256_SPARC64 is not set
> # CONFIG_CRYPTO_SHA512 is not set
> # CONFIG_CRYPTO_SHA512_SPARC64 is not set
> # CONFIG_CRYPTO_SHA3 is not set
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
>
> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=y
> # CONFIG_CRYPTO_AES_TI is not set
> # CONFIG_CRYPTO_AES_SPARC64 is not set
> # CONFIG_CRYPTO_ANUBIS is not set
> # CONFIG_CRYPTO_ARC4 is not set
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> # CONFIG_CRYPTO_CAMELLIA_SPARC64 is not set
> # CONFIG_CRYPTO_CAST5 is not set
> # CONFIG_CRYPTO_CAST6 is not set
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_DES_SPARC64 is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> # CONFIG_CRYPTO_CHACHA20 is not set
> # CONFIG_CRYPTO_SEED is not set
> # CONFIG_CRYPTO_SERPENT is not set
> # CONFIG_CRYPTO_TEA is not set
> # CONFIG_CRYPTO_TWOFISH is not set
>
> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> # CONFIG_CRYPTO_LZO is not set
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
>
> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> # CONFIG_CRYPTO_DRBG_MENU is not set
> # CONFIG_CRYPTO_JITTERENTROPY is not set
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> # CONFIG_CRYPTO_HW is not set
>
> #
> # Certificates for signature checking
> #
> # CONFIG_BINARY_PRINTF is not set
>
> #
> # Library routines
> #
> CONFIG_BITREVERSE=y
> # CONFIG_HAVE_ARCH_BITREVERSE is not set
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IO=y
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> # CONFIG_CRC_ITU_T is not set
> CONFIG_CRC32=y
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=y
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC4 is not set
> # CONFIG_CRC7 is not set
> # CONFIG_LIBCRC32C is not set
> # CONFIG_CRC8 is not set
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> # CONFIG_XZ_DEC is not set
> # CONFIG_XZ_DEC_BCJ is not set
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> # CONFIG_DMA_NOOP_OPS is not set
> # CONFIG_DMA_VIRT_OPS is not set
> CONFIG_CPU_RMAP=y
> CONFIG_DQL=y
> CONFIG_NLATTR=y
> # CONFIG_CORDIC is not set
> # CONFIG_DDR is not set
> # CONFIG_IRQ_POLL is not set
> # CONFIG_SG_SPLIT is not set
> CONFIG_SG_POOL=y
> CONFIG_ARCH_HAS_SG_CHAIN=y
> CONFIG_SBITMAP=y


