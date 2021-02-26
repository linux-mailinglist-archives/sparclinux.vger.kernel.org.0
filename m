Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C36326977
	for <lists+sparclinux@lfdr.de>; Fri, 26 Feb 2021 22:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBZV11 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 26 Feb 2021 16:27:27 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:51908 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhBZV1Z (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 26 Feb 2021 16:27:25 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QLOKFa188886;
        Fri, 26 Feb 2021 21:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ES40U6aXUfbJgzu4x4jyYD96YaGiZt/oWDcimemT/Fs=;
 b=fS4klSaoLyakjXku7CCOIbWxJyaVt9m6c6oDCSlluqxfIz8YUGrvIoe/hxMHcT1X5U0K
 ghYi3FH54DEi9zjVh2srvAKR8O39OLBIycl/wmKXeYoQ1h0MsAJ1cEtZkaZ67mbmYDLD
 GLfvs59I5Yh5CnCY4BGVOHfFDI56IkDMJuvycIInhNMbNhptFf6V1LEYoXklZOG8lfM3
 +1QOY6IsI43CGZBjO1CaNcvii5Ve/iFACE4UC/WcqSTXOltM+CfhjvAHdV/HpxdCTyH/
 mNgjN11W0qd9StHCP5adCZRQsmFWYAiFB4bJuJ/fli5LYQhf1Rr89yMJzn+16mqDZBuC SA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 36xqkfavv2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 21:26:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11QLKltp085610;
        Fri, 26 Feb 2021 21:26:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by aserp3020.oracle.com with ESMTP id 36ucb3w6c2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Feb 2021 21:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIdY5MdKK/oYNtcg7BbHBgJa9HwujWU0p0zzxBAObAD9idnel20JXow8H7WuC55X2yLuVwe9/0EWNO21/Sa/6+CW82LlGAamqSMwRrbscbtiJt7przAzkm2/2xlJlXSzL69LUfDqgAs8oNKborVthiHJw/0CVZsHGmli67HmMCpLv2GwBsKvN3YhXlkfk+QQIGohz4KPNRQEtvwF1x865tHUBRxc0Iv6llXTLGssHsSkn6Q03MX70Vg/BntWfMC4aCgZR52zbD8hewEblAAJ/+mc0EJm/Uw+rxuDMqdPscW6HZb3mUd6vNUZebOeuO4d+U8UHKmJTpWL1JP9d1Wfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES40U6aXUfbJgzu4x4jyYD96YaGiZt/oWDcimemT/Fs=;
 b=n8lmTJbp0q4lYXmzX9/dhmcuOWCUWdu4OvxaqwdF3hQVMG8IWDVShMBV+pWoPjcZVb0GD6Sc31Sa8SX0/nXub89NbuKO+Xays4ql19t9OeIqV6OPploUM2v5TrynwCpZCTg1q76ixp6DYMB2QKhuiRktGTrA4hq8U0vA8LgXtsfm1z25ZEoJ3PLPmw6woYazUZVqumCefZ+u08toOqWS33198EoF0scI2KpQLTx6/n+zCiIBw2avhd4o2/+NHjDM0sGqccUH2+W/9N/OjiFCwiq9vy1KFSeSnc5H0b255wVk3vO7nurpouuahgHet2uPfUBLNtXHf40WKh3gw9tD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES40U6aXUfbJgzu4x4jyYD96YaGiZt/oWDcimemT/Fs=;
 b=IEt9/XQaolvt35ALMDic++5/1b85UoFRkCJcnNZfwIl6/3PQXn/PKNugpqDYPfmpYnDS42zOQh06JHMoIo9cRpISm9MN1UAwspNNJtmA/RACUxEh6dklcY/B+MH7LNNJ6P/vIxukCmXEVcwTTHiwpxngbA1PU7JDKXwrsTR6zJA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 21:26:34 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 21:26:34 +0000
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
 <584994e3-09b6-de8c-f08a-9962075711f9@oracle.com>
 <ede51bdb-6746-93d8-7f4b-8620c2105d81@linux.ee>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <6cd974c1-4727-8245-f149-7f971a3965d5@oracle.com>
Date:   Fri, 26 Feb 2021 14:26:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <ede51bdb-6746-93d8-7f4b-8620c2105d81@linux.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::17]
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::3be] (2606:b400:8014:1041::17) by SJ0PR03CA0121.namprd03.prod.outlook.com (2603:10b6:a03:33c::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Fri, 26 Feb 2021 21:26:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e9e810-80c1-4ae3-3adc-08d8da9d30c9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4463F0581B7DC11B4FD46EC79B9D9@SJ0PR10MB4463.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vcb0kxHO6eecRzvBZ32Fq+PP7rRLRuixrFgLdsD1F4miEzz6uW1yfGNBXv6wxTajvx0NiRW52s1jduL2ZANo26n7XQqBiWPGkIh+XlGNPk7bRXYtY50lOCbC8YujiXy8Vnvz/TcCJ0HE/fvRAMwmboBy4MQ7fbJ5T4gGxnWTgK0wGlA9vwQUKhPAytfroxx8c5fAtvit3MDG6/v0N6reHpi8lzn+V8cHUq2rngfUaojAcWmaBmSe2l+BtRdNy2naiBAVNSy/jv9m18O05QF9TdOTJwAAK82ngkJpyk8oNK5DPA4mCx8Mw9ewrd1BNzNHOPnKJ84EZojLKu+nlV/ssqIrfMJn4toNcEXDa0/ke5rem9w8aX3Ph3ALIrNTk3G1e4PnFzHFkmQ3YbDqHFC3eQ4i8ZnUC7eS7YJYScpYbcmxf08VpDj5P77mKV3RvT+DRm1N83J9IbhtgR6PS95/VPjnM6aKWgsS0cOlwFCIVFO781cfCQTgZoepmEnR5TRkISIQjbxOusgB+wCxYVK+AaffYf8NMlyCny9tnsK78BIA5Q3mqRh+SD6tBpGz3IF7hGjMaArVnGVPDaeqpoEkLHRrtLQUplm0O6ULWdmkfwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(39860400002)(366004)(186003)(44832011)(53546011)(8676002)(16526019)(316002)(8936002)(2616005)(110136005)(2906002)(6486002)(478600001)(66476007)(31686004)(66556008)(66946007)(4326008)(86362001)(31696002)(36756003)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzYyY2NmL0hIYmFlOFowb1I1R1U4UFFFTTNYV0ozSi9jRWZ6SC9Pd2o2eWhM?=
 =?utf-8?B?TUh2MXJzcWZBQjdFSHlXdVBNbzVsUEVJaTlSNmk2RzJrMTlQRWNOeUkxUVl1?=
 =?utf-8?B?cC94SjZVUE8wZ0hCVHp3V0NNaEZzZTNYei84YWQ5akdkbFA2T3VhQ04wUkR1?=
 =?utf-8?B?VThQdkRvZTRjT0NaTUt5Sk9oWjFFaEVJTkVJY21ueWNLOWxxMVVXUyt0VXdV?=
 =?utf-8?B?Y2h0YUtYOEJCZDQzMmJleEtCUDBFL3pLa3NSbWdXTUtLY0pmdmxCcW9iOGhl?=
 =?utf-8?B?ZmNpS3prRDI5Z3YrVFBDRzYzK0hJeEhUSTZySEJRUzJKYWt0Y3h0cWdzckVk?=
 =?utf-8?B?ejBZU2FDMXRGWkRWajdVYXhuT28wd3N2c3NHSFMvRlBlTmx2dVhkTzVJTUpH?=
 =?utf-8?B?SUpobUhvTFVXYVNDV3U0NGN5VU5ScnBBR1cxekUwL0ZkbkVPYnd6NzhZQXF3?=
 =?utf-8?B?MzVhd1lhSVFzZHRZMXBVTVBoNXR1bG9vWWU5MEdVNkJQUmRhdWFyaDdVK214?=
 =?utf-8?B?QUd5VXF2VVdQNFlrbEMyN3BPMFM1RWFkc1NEZm5DbE5jZDZiVGM0aTJXdy9r?=
 =?utf-8?B?Tkd5WW5UYXN4cmV4OXdmM2h4ZytuekM0aC9Dek9ZL09jOU5WQkVPN0ZXL01p?=
 =?utf-8?B?bUxHQlpGc3FWRlEzOGdpeDc1aE5sb2ZyODJ2WHJPUDJBSmpNd0FWdXNTTi9X?=
 =?utf-8?B?MjZ3UldsblVlRHA3aGI2dVV2UzFXNmw3WHlwMmVMVkcrUUM5em1ET0JqcmYr?=
 =?utf-8?B?clFycVR4UHhEY1g0SmQ1WUgzRGdMTVNoUGtCQkVlWVpGOFN5bmlNYk9RYURX?=
 =?utf-8?B?RWJ3aC91bXNYTmkzeXN2RHVTOXlzYVllQk5DaS9tdVMvL2o4VFlqcFpzSmlp?=
 =?utf-8?B?dkZIa1lIbGNWK29EU2N0d25VVlZJc1ZkUVR2T1VZemJEQUd1UFlPY3VJT3k0?=
 =?utf-8?B?aWF6SlhUcTFmZ0VYWXhWMUs2c09COFpNUnF6UjFBeFJSKzdHZkJUUVpRUVRv?=
 =?utf-8?B?MkFqWkd1VmtpK1dkdDdiMHdoTERzaEtHODJGNnhISlF6QnNaQzQ4aWh1WWh6?=
 =?utf-8?B?cTlYRDBwTUhvT0R5UkhiTmdTa2pEdFRWWlhQTkg4WnMzOWVaWjVXU3NGRTBO?=
 =?utf-8?B?ZHNJU3BRTlowOGt1WHkrVDZseEVFMERHdTFtZUNlT0JtbkRmbzE2ZThzMUVr?=
 =?utf-8?B?NmVYWUVNM2tBcW94ZWgxeGtMODdXK1N2cU1QQm1CeC9lNFVTSnJGYXp3T3lW?=
 =?utf-8?B?amN1ekZmMG1vdnBJVEFma2FIRkJrc3ovSW9QY2VLSnZudEF6MzZkbHNCK0lO?=
 =?utf-8?B?b2VlRHdvY2hQRElrT3c1L1AwTHVMRk5ZcHg4SUpBVktjOGFEMTJFQTRYbldh?=
 =?utf-8?B?d2czTDJPZXFDT2hNVDg5c2FtVkQyaWMrOENRSlUvemtWZVQvdXpyYm1TS1Rm?=
 =?utf-8?B?VUdoM082cDVNT3F0K3NQd0pJQkNoZVFac2FEbUFtdzA0WVVCTlFBa0JkcXJ4?=
 =?utf-8?B?MG9rcnIyeDl1ZUI4VmlqY3FpZ0JnMU1uTVE3Z2Z4bHVtZnZwU0grUjlEVkJn?=
 =?utf-8?B?T2xXUFZmaTlqdmtSN2N4Y3lUbjIwSnUxdGxqckdvZzh2eXl5MUVFUytwMHlN?=
 =?utf-8?B?QVZnbnd3VlRHT25mME9mYU9MbW82dGVBT1hPTlZ2d2VXVytkeDdtbFZBcEJH?=
 =?utf-8?B?ZkpoT0ROcndjVnJZbDhUZDJNVERhdEs2b1NRVVVnblhuZjZKdmVSTk5SYnFR?=
 =?utf-8?B?OVhqQW9KUHVVcVRMaURMektOb1c3SVFkU2FhcytlN081L1dCL0xuOGZmS29D?=
 =?utf-8?B?R2lzcXZQMW1IdlhVQ2ZHdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e9e810-80c1-4ae3-3adc-08d8da9d30c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 21:26:33.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCC7j+7x+ohLygE30U6001mEHWdbiwQeqAwaCdVvOVLBGaXWZKQeC3EU83k5YAM1Pog/9wSsLGDAulRNtvrvEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260159
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260159
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/26/21 11:03 AM, Meelis Roos wrote:
>
>>> This resulted in a crash (this is different, irq5 during mm code):
>>>
>>> [  304.847868] Unable to handle kernel paging request at virtual 
>>> address ffffffffffffe000
>>
>>
>> But what was the last "fixing up no fault insn" message you got 
>> before this panic? I need that to be sure that this is just another 
>> instance of the other panics and not a different cause.
>
>
> Rechecked with the same kernel image of last patch only, this time the 
> fault address is different, but still no previous debug messages 
> (probably expected since no previous patches are there),
> just starts with
> Unable to handle kernel paging request at virtual address 
> 256c780a00000000
> And the rest of addresses and backtrace is also different.
>
>> Also, did you apply this code patch along with others or was it 
>> alone? If alone, please try running with all 3 patches applied. My 
>> logic leads me to believe that you should not see any panics/hangs 
>> with all the code changes applied.
>
> I hope to have the SSH console connection in better shape now (no 
> mikrotik jumphost on the way), will start retesting with incremental 
> patches.
>

Here is a single patch that does everything, and is cleaned up and more 
concise. If this all works then I can send it as an official patch 
(though with the printk removed of course.)

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 27778b6..13d8763 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -275,14 +275,14 @@ bool is_no_fault_exception(struct pt_regs *regs)
                         asi = (regs->tstate >> 24); /* saved %asi       */
                 else
                         asi = (insn >> 5);          /* immediate asi    */
-               if ((asi & 0xf2) == ASI_PNF) {
-                       if (insn & 0x1000000) {     /* op3[5:4]=3       */
-                               handle_ldf_stq(insn, regs);
-                               return true;
-                       } else if (insn & 0x200000) { /* op3[2], stores */
+               if ((asi & 0xf6) == ASI_PNF) {
+                       if (insn & 0x200000)        /* op3[2], stores   */
                                 return false;
-                       }
-                       handle_ld_nf(insn, regs);
+                       printk(KERN_ALERT "fixing up no fault insn 
%x\n", insn);
+                       if (insn & 0x1000000)       /* op3[5:4]=3 (fp)  */
+                               handle_ldf_stq(insn, regs);
+                       else
+                               handle_ld_nf(insn, regs);
                         return true;
                 }
         }



