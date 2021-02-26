Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA920325CC8
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 05:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZE7Z (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 25 Feb 2021 23:59:25 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:56802 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhBZE7U (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 25 Feb 2021 23:59:20 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q4tEVH128984;
        Fri, 26 Feb 2021 04:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=p/Q/39SY+aq5Tuo4/xi3Q0BW0zvWl1YWNCoMNpqk86A=;
 b=zey6BZBWj+xRGnNjJhpXZeuG4njp+mEWHWlcZtRm28MauIe1yBVcZDNGFFYZPgkx9HMZ
 3rZOu/ZrspiDvUVN3pfQjLzBzPpDJ08Sfn9ZVyFAEB90raCqjAH7weq5eEqEv8PXV/q2
 enYPnJQEHdzXnS227KS+LwS9bwqvEblt6I/x6+EB/hy/vThYg7DlWqH1dR++ob9yrhw7
 9hBr1TKGXusiglKw0pP/w6WQBW5s90y9kpi3uCRG8BNDMgDLwZaRxIfemtcuwoGsxTww
 sXmuSBf9NcdrI8KBepmHXR2z1BMdLQe9oAvn5/W9yyOFcwupQG5iphLKZUU2CskEPfaS 0A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 36ugq3qkcm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 04:58:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11Q4oiCe105878;
        Fri, 26 Feb 2021 04:58:31 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        by aserp3020.oracle.com with ESMTP id 36ucb2yjq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 04:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJH/wx+M+63mUPbDRJCpEFRHHd1P2e+w0ngUMyDeoqJkNSw9x9TQg5mZ/PTNhmqR3Bye6hz1a8384FMe4v0nh7R510DPs7pCg2cpZq08IxfYUu3L6cv2A99SGqABBkux6+dcyyhfC2nsvHp+UMIEDh300WTyO7QBlTs6YhAu5wyeJXJ8QqHiDmttZNxocXrGrogVd0/P5cANy25snH0OEx+/GvXN0rL5APuaeSufdcC2WQVgTx1qC94mF9y0mpd4ty5b7cEQ61QtyKyWjFkvh+G85kt79U7/cPTIFltikcKoT5Rub07nD5jOJiK/g2HcGF0fgC5juvq6as0Xuef67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Q/39SY+aq5Tuo4/xi3Q0BW0zvWl1YWNCoMNpqk86A=;
 b=JyO04L3QJdGFl/AsoI7URgqizfYnSpuy0/izgCj9K8eRKxs/3wVC9jYt9VMFZPP8u5eNXsp6XJzNb1r9ifaP535tVimHNwecYaWQQLxxjU4qIcYUwkdK4rLVtMbSeWd9I2MKgJyXKfZq4ixxl2ee5Y/GKLL11Y3xhhaXm4Kro13RxD+3bzAoEBiLzJ+FqFcVjogtclVn+mSgs5zjkzyZ0R1w7nuJVcmEKJBs3QPkc/k9Kdv+L9/GF7RGeDnEZZ4LG7e7jjmsOg3EfJLGHDK2DUQMpaHiilhUMLvXM9kbjqLq2qw4T4eM713mcri5ea0d7sW6uUxT+FPZOFvJsZnaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Q/39SY+aq5Tuo4/xi3Q0BW0zvWl1YWNCoMNpqk86A=;
 b=jX1BxUw79WwTW7+uRwzP9JTDkxFKgukZgcdwiVo7kwKcyd2LQntJtA6LhMiSWeGpH1CAlGY8Bmof5Y344CvB0AEe8G475ohn73oMnTBENakX7CTbwHRgRT3cue/0ZqJES001ROmbiInbT3el2Vz3OxaiQhJe+mKdNZ181Yl1OWo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by SJ0PR10MB4735.namprd10.prod.outlook.com (2603:10b6:a03:2d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 04:58:28 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 04:58:28 +0000
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Meelis Roos <mroos@linux.ee>, Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
 <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
 <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
 <3d42713e-bff6-63d9-2c0e-781e829d78f8@linux.ee>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <584994e3-09b6-de8c-f08a-9962075711f9@oracle.com>
Date:   Thu, 25 Feb 2021 21:58:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <3d42713e-bff6-63d9-2c0e-781e829d78f8@linux.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::1c]
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::5e3] (2606:b400:8014:1041::1c) by SA0PR11CA0102.namprd11.prod.outlook.com (2603:10b6:806:d1::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Fri, 26 Feb 2021 04:58:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf5de5d-bd01-43cd-045e-08d8da13281a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4735:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4735FD91D3B9355478D844AD9B9D9@SJ0PR10MB4735.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yb5fVPU5bceEIb0ElNzeLsKfn0pH8cfNiTke+d+bgBFZmf2Rlp79Fk48qo7ta83HufSgUUiTrCuN2eX0h4LaaR4A1LBL99MwuuVk8M+VIOaL0BHraf7PxsorEWvg3IMo+gUCHukj/cC3zZ62ApAABKSCo4UM5tYSV/Fw5ZHLVKJxVmj+pQp0VOpnqaj3iQoQX9HUVvRjk6zNHD20Am4NI0mlb2sEsW/uzcKzQhlYeveuH43tXtsAJGvwxHZtHbrUVggi971X59yYcjNVh6MrWqDL9nqWOccopRAAJ0PnyJyviRmlzJ/xngcY2+gSysBHvxxpqNeaEq6Nq53CiO+JGgBjdqxlby4eqprcX4qGqp0rw+Hr4Zt7mSCyIlwvWSHv0hQ6U+QIB3zrZNCN10sm0gayAjLirwoVkEYVK6LE99tymwh8w5UurNOijFitAllRLQY5Ul3YwkWwOM3RvdO8CAtk6xunzKiThOO4hBnd+29n0qqA9EZcKsdJ1m/kq3utKbl2kCqBIfZEUY4GqYebqmFxIuLbVmk3eb27KxA5FMDJlYRTQujzE/ZWNQSibP9/JM4+9dyfQirdUqzqyZh2pGOV9MgbnRnxwxIwGSNVhec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(136003)(396003)(366004)(346002)(186003)(36756003)(83380400001)(30864003)(2906002)(6666004)(45080400002)(478600001)(8676002)(4326008)(5660300002)(53546011)(31696002)(44832011)(2616005)(316002)(110136005)(66556008)(6486002)(86362001)(16526019)(66946007)(66476007)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QktMRW1lSjFEY01VOTRrWnp3WlhydUs1UCtodWp6ZVExMjBhRUpuUFRoUHV3?=
 =?utf-8?B?MG1leDdGU1dxV0ZtSVo1eWFDN2tSbWovcndVZE5hUEdWZmxvWXYrQjluckFY?=
 =?utf-8?B?eFdDUG5RZy9GTUJLdURCSWQraDV5RUpJa3padDg4YnNjRmJFT0lxWFFuRU1a?=
 =?utf-8?B?cUs0ODZocTRQTEVqZWRvcExDK0RjZWlMdUZhbStSQ2phdEp2VTJGeitlT1Ew?=
 =?utf-8?B?QmxFdkVGcWdjRFRGaDZybXpkYmxGa1RNWW5TRmVNYVlWYVBpR2EvVWNJdkNy?=
 =?utf-8?B?T28wdVRJOFBOR3BhQTlSNVh3c3gyZFgvRE1aRXBaRFhJMVNmREltRXgvTmFj?=
 =?utf-8?B?T1ZPT0gxOWlOSVBDTzQwZlNJN3NIRG5IcW5MN0w3WFBIeTM5ZldoV3VpeXhS?=
 =?utf-8?B?SVBpQitIZUlaZERVM2lhVVYzRkd2MmdrTFdjYkI3ekFKK1BBNUpIT2wrWUFm?=
 =?utf-8?B?bDNlWVNMQ1p2bHNlMFZBVkJoRGhiNWJMVkdmOUI3TDZrOFZUa0NtSk5rcjAy?=
 =?utf-8?B?SXFuQVNMUWpISlVxdWtpK1B0NmZjVWRNNnFuMFh4N3VNeHk4a2lSZnp1Q2tN?=
 =?utf-8?B?dTR4bk9ucUdKN2YyQ3MxUkhRMmxHRHl2cXFFTWwxY3RCSHVCTnJFMXlVbnFF?=
 =?utf-8?B?N3h4VitVeFE4RVNJMFJpSkNRMTVNc04xVWhiUzg3SW5YVm9GT0YzZ3V5Nm5k?=
 =?utf-8?B?ODdiQWFqRmVMNlVEb0lsalpwMVM4TnNLeG02b0lCNzFaY0RBMkdUekRaZWt2?=
 =?utf-8?B?SURRQlEwaVF3RnUwRFgrNnRCRG5XNytwZEpGKzZMSk1RWXF3Y1ZLRWV1aWh0?=
 =?utf-8?B?Tm4rZExHc2dQQ3NOMXFyS1l5TkdRbnFpejJtM3Z6YmVKZlNORFYxRWxNcU1h?=
 =?utf-8?B?b1BpT2xBUW5yaHhxODJmeTVQcUVqV0IvUU5IT1YvOE1va3NSL2RqRWltbTVH?=
 =?utf-8?B?ZkJ2TnV0L1VnN2wwcEc4Z3JWVWhReXhtNE1VSTJNODZFK0RIbjIxUGRNaEsz?=
 =?utf-8?B?d2NVZVMyR2h0bll6TndTOGlJeTRFQ2U1VG8yRmRPT1hGbjJxaGJ2UFN4M04z?=
 =?utf-8?B?RjhwdG5sdlNNYXdoMjRKNEZlZjhEbFNMVGFwOFhCb1JCRXFQcCtkSCtCTytU?=
 =?utf-8?B?RTlKZUV4NHR1NEV1NTJDVkJzaURaV1JGWjlhekJwNXJJNnpCWlA4TzBtbzJh?=
 =?utf-8?B?SVBYcTI4U1pUZlFySE1FTzdXemVwVE05bTY2NHJUSGNSbnpXME1GTjNtdXJE?=
 =?utf-8?B?UGZvTmphSWpoUXBQYnY5eUlRSUN5L09vOEI1cjZ6bkJEeWxNa3ZUMi9OOFBQ?=
 =?utf-8?B?ZDBNNG1pWUNLdzM2K2FJUVpRMWlKampqNzVGeWwvOGpWYVNFN08vcnJ1Mjgz?=
 =?utf-8?B?M2ZWcHNMRm55MGpQZE90R01PYmFZbVlnd1hJYW54MmQ5Rjl4TWFWY0dRenNr?=
 =?utf-8?B?QXNYTmppMndpU3V6dURWMW95dUpTSFE1SjZYS1RocHVkNVgvM3d1dUx2blhP?=
 =?utf-8?B?ZlBBVmtwekYrUFdMM3ZTMXE4WHlkWEFLamFiN1FPT3YzU3dqRjN4UkRna3ZW?=
 =?utf-8?B?VlhqOWFOSVZIdnVUZ2RNK2J2NGp1ak1MOEpPSks0UnJqS1JEb0xwZ2d3TDRo?=
 =?utf-8?B?UTRCeW9tc3YrVDJCL0lkY0ZieGdnMnlUZ1g1VmxHczlZWXE4R1pGUnlNQzR5?=
 =?utf-8?B?cDFRZWdZRTlpYUpwTWtHVldDSWlCRzAxSUlhalhUanhsWG4zaFB2Ty9SbTdx?=
 =?utf-8?B?ZmRrd2NhWnFnOG81TEFSUzBRYmlJNzBySGRkbmJZempYSU5hUGo2R2JPSUV6?=
 =?utf-8?B?Mmc1MFR0TEcxTFhMa1E5UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf5de5d-bd01-43cd-045e-08d8da13281a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 04:58:28.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZIpyf2PJQogfifeDmkWMmtQTQ0Rd46w+eyuxAvibWvW0MZgnrvaxCq0ie6jKko8Iv6tWXq2tpKIjfuOa19HOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4735
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260035
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9906 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260035
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/25/21 12:12 PM, Meelis Roos wrote:
>> 1. If you want to do it just with ng-stress, you could change it so 
>> that instead of generating a random opcode and executing it, generate 
>> a list of (many) random opcodes on your ssh client, and send them 
>> over to the test machine to be executed. If the system doesn't crash 
>> or hang, generate a new list and try again. If it does crash, then do 
>> a binary search on the list of opcodes to find the culprit.
>
> Well, it generates many opcodes butI do not feel like redesigning 
> stress-ng  opcode stressto client-server solution, I better go with 
> your kernel modifications.
>>
>> 2. If that sounds like too much work, we could print the instructions 
>> in the kernel when we know we're going to return true. (Sorry the 
>> formatting of this will likely be messed up):
>
> Tried it on top of todays git 5.11.0-09786-g3b9cdafb535
>
>
> [   92.724186] fixing up no fault insn c6c310ca
> [   94.675033] fixing up no fault insn c8c6d0de
> [   94.742247] fixing up no fault insn c8c6d0de
>
>
> Login incorrect
> v240 login:
> Password:
>
> Login incorrect
> v240 login: [  125.751204] fixing up no fault insn dad750ec
>
> Login timed out
> Debian GNU/Linux stretch/sid v240 ttyS0
>
> v240 login: [  128.809516] fixing up no fault insn ea8fd1cb
> [  133.757945] fixing up no fault insn fff21079
> [  133.819635] fixing up no fault insn fff21079
> [  134.605780] fixing up no fault insn e09810de
>
> Debian GNU/Linux stretch/sid v240 ttyS0
>
> v240 login: [  138.514897] fixing up no fault insn cf95d1ef
> [  138.571102] fixing up no fault insn cf95d1ef
> [  138.627244] fixing up no fault insn cf95d1ef
> [  138.683339] fixing up no fault insn cf95d1ef
> [  138.739382] fixing up no fault insn cf95d1ef
> [  138.795443] fixing up no fault insn cf95d1ef
> [  138.851583] fixing up no fault insn cf95d1ef
> [  138.907736] fixing up no fault insn cf95d1ef
> [  138.963879] fixing up no fault insn cf95d1ef
> [  139.020024] fixing up no fault insn cf95d1ef
> [  139.076068] fixing up no fault insn cf95d1ef
> [  139.132114] fixing up no fault insn cf95d1ef
> [  139.188159] fixing up no fault insn cf95d1ef
> [  139.244203] fixing up no fault insn cf95d1ef
> [  139.300251] fixing up no fault insn cf95d1ef
> [  139.356293] fixing up no fault insn cf95d1ef
> [  139.412339] fixing up no fault insn cf95d1ef
> [  139.468386] fixing up no fault insn cf95d1ef
> [  139.524432] fixing up no fault insn cf95d1ef
> [  139.580474] fixing up no fault insn cf95d1ef
> [  139.636524] fixing up no fault insn cf95d1ef
> [  139.692570] fixing up no fault insn cf95d1ef
> [  139.748607] fixing up no fault insn cf95d1ef
> [  139.804655] fixing up no fault insn cf95d1ef
> [  139.860720] fixing up no fault insn cf95d1ef
> [  139.860869] Kernel unaligned access at TPC[4add34] 
> cpuacct_charge+0x74/0x80
> [  139.916835] Kernel unaligned access at TPC[469db0] 
> irq_enter_rcu+0x10/0x80


OK, this is great data. I think I know what is causing this.


>
>
> From two boots, the insn varies among
> c798d0c9
> c8c6d0de
> cf95d1ef
> d49cd066
> dad750ec
> e09810de
> e3e790c4
> e5a051cb
> e7f21165
> ea8fd1cb
> ebb611fc
> f4c551de
> fe8690fd
> fff21079


Are you saying that in this list of instructions, each one of them 
causes a crash or hang?



>
> On last try, "fixing up no fault insn ebb611fc" appeared many times 
> and the the machine hung with nothing more on seerial console. This 
> was the second hang like that.


>
>
>> 3. I have a theory that the instruction may be something like this:
>>
>>          sta %f0, [ %g0 ] #ASI_PNF
>>
>> which should assemble to 0xc1a01040. You could just try this 
>> instruction.
>
> Putting 0xc1a01040 at the start of the opcode sequence makes the test 
> spew this in dmesg 26 times:
> fixing up no fault insn c1a01040
> and then the kernel hangs.
>

OK, that means that guess was correct. Almost have all I need...


>> 4. If this does result in a crash, this patch might be the fix:
>
> Yes, with this patch only, it works for multiple minutes and is 
> stable. Nothing in dmesg either.
>
>> 5. Here is another patch to try after the others:
>
>
> This resulted in a crash (this is different, irq5 during mm code):
>
> [  304.847868] Unable to handle kernel paging request at virtual 
> address ffffffffffffe000


But what was the last "fixing up no fault insn" message you got before 
this panic? I need that to be sure that this is just another instance of 
the other panics and not a different cause.

Also, did you apply this code patch along with others or was it alone? 
If alone, please try running with all 3 patches applied. My logic leads 
me to believe that you should not see any panics/hangs with all the code 
changes applied.

I think the important test cases are c1a01040 (which should be fixed by 
the first code patch) and cf95d1ef, (which should be fixed by the second 
code patch.)



Rob





> [ 304.952010] tsk->{mm,active_mm}->context = 00000000000009be
> [  305.025294] tsk->{mm,active_mm}->pgd = fff0000000db6000
> [  305.093913]               \|/ ____ \|/
> [  305.093913]               "@'/ .. \`@"
> [  305.093913]               /_| \__/ |_\
> [  305.093913]                  \__U_/
> [  305.287234] stress-ng-opcod(1517): Oops [#1]
> [  305.343363] CPU: 1 PID: 1517 Comm: stress-ng-opcod Not tainted 
> 5.11.0-09786-g3b9cdafb535-dirty #294
> [  305.462321] TSTATE: 0000004480001603 TPC: 000000000089ad98 TNPC: 
> 000000000089ad9c Y: 00000000    Not tainted
> [  305.591565] TPC: <__inet_lookup_established+0x78/0x1e0>
> [  305.660186] g0: fff0000000a993c1 g1: 0000000000000000 g2: 
> 2057cf51ce000000 g3: 000000000057cf51
> [  305.774569] g4: fff0000000f152c0 g5: fff000133ee8c000 g6: 
> fff000000107c000 g7: 5973ffef02e64d70
> [  305.888946] o0: 00000000000065c8 o1: 30222850b2de49fe o2: 
> 0000000000160000 o3: 6857e211521f25c5
> [  306.003325] o4: 0000000340f12326 o5: 0000000000a8f400 sp: 
> fff000133fe1ed81 ret_pc: 000000000089ad4c
> [  306.122278] RPC: <__inet_lookup_established+0x2c/0x1e0>
> [  306.190900] l0: 0000000000000002 l1: 0000000000000000 l2: 
> fff00000006b2e40 l3: 0000000000010000
> [  306.305281] l4: 0000000000000001 l5: fff0000000be8980 l6: 
> fff0000000be8840 l7: fff0000000be8840
> [  306.419659] i0: 0000000000b30640 i1: 00000000000065c8 i2: 
> 00000000d98965c8 i3: 0000000000000000
> [  306.534037] i4: c0a80101c0a8018e i5: 00000000e4230016 i6: 
> fff000133fe1ee31 i7: 00000000008bee58
> [  306.648415] I7: <tcp_v4_early_demux+0x98/0x160>
> [  306.707887] Call Trace:
> [  306.739910] [<00000000008bee58>] tcp_v4_early_demux+0x98/0x160
> [  306.816544] [<000000000088f178>] 
> ip_rcv_finish_core.isra.17+0x318/0x420
> [  306.903472] [<000000000088f6cc>] ip_list_rcv_finish.isra.19+0x6c/0x140
> [  306.989256] [<000000000088fc5c>] ip_list_rcv+0x11c/0x140
> [  307.059025] [<0000000000834658>] 
> __netif_receive_skb_list_core+0x138/0x240
> [  307.149386] [<0000000000834970>] 
> netif_receive_skb_list_internal+0x210/0x300
> [  307.242031] [<0000000000834a68>] gro_normal_list.part.188+0x8/0x40
> [  307.323239] [<0000000000835e8c>] napi_complete_done+0x14c/0x1e0
> [  307.401015] [<000000001002fc80>] tg3_poll+0x140/0x460 [tg3]
> [  307.474326] [<00000000008360a4>] __napi_poll+0x44/0x1a0
> [  307.542948] [<00000000008363c4>] net_rx_action+0xc4/0x240
> [  307.613861] [<000000000095e170>] __do_softirq+0xd0/0x260
> [  307.683633] [<000000000042c86c>] do_softirq_own_stack+0x2c/0x40
> [  307.761410] [<0000000000469fa8>] irq_exit+0xc8/0xe0
> [  307.825461] [<000000000095de40>] handler_irq+0xc0/0x100
> [  307.894087] [<00000000004208b4>] tl0_irq5+0x14/0x20
> [  307.958140] Disabling lock debugging due to kernel taint
> [  308.027910] Caller[00000000008bee58]: tcp_v4_early_demux+0x98/0x160
> [  308.110263] Caller[000000000088f178]: 
> ip_rcv_finish_core.isra.17+0x318/0x420
> [  308.202910] Caller[000000000088f6cc]: 
> ip_list_rcv_finish.isra.19+0x6c/0x140
> [  308.294411] Caller[000000000088fc5c]: ip_list_rcv+0x11c/0x140
> [  308.369898] Caller[0000000000834658]: 
> __netif_receive_skb_list_core+0x138/0x240
> [  308.465981] Caller[0000000000834970]: 
> netif_receive_skb_list_internal+0x210/0x300
> [  308.564346] Caller[0000000000834a68]: 
> gro_normal_list.part.188+0x8/0x40
> [  308.651270] Caller[0000000000835e8c]: napi_complete_done+0x14c/0x1e0
> [  308.734766] Caller[000000001002fc80]: tg3_poll+0x140/0x460 [tg3]
> [  308.813791] Caller[00000000008360a4]: __napi_poll+0x44/0x1a0
> [  308.888134] Caller[00000000008363c4]: net_rx_action+0xc4/0x240
> [  308.964769] Caller[000000000095e170]: __do_softirq+0xd0/0x260
> [  309.040257] Caller[000000000042c86c]: do_softirq_own_stack+0x2c/0x40
> [  309.123754] Caller[0000000000469fa8]: irq_exit+0xc8/0xe0
> [  309.193523] Caller[000000000095de40]: handler_irq+0xc0/0x100
> [  309.267869] Caller[00000000004208b4]: tl0_irq5+0x14/0x20
> [  309.337640] Caller[000000000055e5d0]: __handle_mm_fault+0x190/0xaa0
> [  309.419992] Caller[000000000055ef74]: handle_mm_fault+0x94/0x220
> [  309.498913] Caller[0000000000451824]: do_sparc64_fault+0x264/0x6e0
> [  309.580120] Caller[0000000000407714]: 
> sparc64_realfault_common+0x10/0x20
> [  309.668191] Caller[00000000f7b5f298]: 0xf7b5f298
> [  309.728811] Instruction DUMP:
> [  309.728815]  808ee001
> [  309.767698]  32600043
> [  309.798579]  b736f001
> [  309.829461] <c206ffa0>
> [  309.860342]  80a0401a
> [  309.891225]  124ffffa
> [  309.922107]  01000000
> [  309.952988]  c206ffa4
> [  309.983871]  80a74001
> [  310.014753]
> [  310.065080] Kernel panic - not syncing: Aiee, killing interrupt 
> handler!
> [  310.153153] ------------[ cut here ]------------
> [  310.213767] WARNING: CPU: 1 PID: 1517 at kernel/smp.c:633 
> smp_call_function_many_cond+0x3bc/0x400
> [  310.330439] Modules linked in: loop flash tg3
> [  310.387621] CPU: 1 PID: 1517 Comm: stress-ng-opcod Tainted: G      
> D           5.11.0-09786-g3b9cdafb535-dirty #294
> [  310.524881] Call Trace:
> [  310.556899] [<0000000000463ea8>] __warn+0x88/0xe0
> [  310.618665] [<0000000000463f58>] warn_slowpath_fmt+0x58/0x80
> [  310.693010] [<00000000004ef8bc>] 
> smp_call_function_many_cond+0x3bc/0x400
> [  310.781083] [<00000000004efb7c>] smp_call_function+0x1c/0x40
> [  310.855426] [<0000000000953e2c>] panic+0x11c/0x334
> [  310.918333] [<0000000000468ebc>] do_exit+0x8bc/0xbc0
> [  310.983529] [<000000000042a854>] die_if_kernel+0x194/0x300
> [  311.055587] [<000000000095389c>] unhandled_fault+0x84/0x90
> [  311.127646] [<0000000000451a2c>] do_sparc64_fault+0x46c/0x6e0
> [  311.203135] [<0000000000407714>] sparc64_realfault_common+0x10/0x20
> [  311.285488] [<000000000089ad98>] __inet_lookup_established+0x78/0x1e0
> [  311.370127] [<00000000008bee58>] tcp_v4_early_demux+0x98/0x160
> [  311.446760] [<000000000088f178>] 
> ip_rcv_finish_core.isra.17+0x318/0x420
> [  311.533687] [<000000000088f6cc>] ip_list_rcv_finish.isra.19+0x6c/0x140
> [  311.619471] [<000000000088fc5c>] ip_list_rcv+0x11c/0x140
> [  311.689241] [<0000000000834658>] 
> __netif_receive_skb_list_core+0x138/0x240
> [  311.779601] ---[ end trace bb4c0255fe0bffe8 ]---
> [  311.840221] ------------[ cut here ]------------
> [  311.900838] WARNING: CPU: 1 PID: 1517 at kernel/smp.c:498 
> smp_call_function_single+0x188/0x1c0
> [  312.014078] Modules linked in: loop flash tg3
> [  312.071261] CPU: 1 PID: 1517 Comm: stress-ng-opcod Tainted: G      
> D W         5.11.0-09786-g3b9cdafb535-dirty #294
> [  312.208523] Call Trace:
> [  312.240539] [<0000000000463ea8>] __warn+0x88/0xe0
> [  312.302304] [<0000000000463f58>] warn_slowpath_fmt+0x58/0x80
> [  312.376652] [<00000000004ef4c8>] smp_call_function_single+0x188/0x1c0
> [  312.461291] [<00000000004efb7c>] smp_call_function+0x1c/0x40
> [  312.535637] [<0000000000953e2c>] panic+0x11c/0x334
> [  312.598543] [<0000000000468ebc>] do_exit+0x8bc/0xbc0
> [  312.663739] [<000000000042a854>] die_if_kernel+0x194/0x300
> [  312.735796] [<000000000095389c>] unhandled_fault+0x84/0x90
> [  312.807856] [<0000000000451a2c>] do_sparc64_fault+0x46c/0x6e0
> [  312.883344] [<0000000000407714>] sparc64_realfault_common+0x10/0x20
> [  312.965698] [<000000000089ad98>] __inet_lookup_established+0x78/0x1e0
> [  313.050337] [<00000000008bee58>] tcp_v4_early_demux+0x98/0x160
> [  313.126970] [<000000000088f178>] 
> ip_rcv_finish_core.isra.17+0x318/0x420
> [  313.213897] [<000000000088f6cc>] ip_list_rcv_finish.isra.19+0x6c/0x140
> [  313.299679] [<000000000088fc5c>] ip_list_rcv+0x11c/0x140
> [  313.369450] [<0000000000834658>] 
> __netif_receive_skb_list_core+0x138/0x240
> [  313.459809] ---[ end trace bb4c0255fe0bffe9 ]---
> [  313.520436] Press Stop-A (L1-A) from sun keyboard or send break
> [  313.520436] twice on console to return to the boot prom
> [  313.666839] ---[ end Kernel panic - not syncing: Aiee, killing 
> interrupt handler! ]---
>
>
>> Let me know what you find out from all this and I'll try to come up 
>> with more ideas.
>
> OK, I can try more things. And thank you for quick response times!


