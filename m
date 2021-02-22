Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91545322230
	for <lists+sparclinux@lfdr.de>; Mon, 22 Feb 2021 23:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBVWgL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Feb 2021 17:36:11 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:36006 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBVWgL (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Feb 2021 17:36:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MMYhag149141;
        Mon, 22 Feb 2021 22:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=RNHM8GmodZriAq35N2tMaBVJ9CM09rOtEPJTtSC8jZA=;
 b=zUz1kI/JXMPmDejW9zQLlWCH/tujxHQ1yQ3cDNUj1yCGDrkaKuFC4oI9djwj0hLe687r
 uPnFX7JcuE4YwMJi2oOwp7gppwu8/CC4GjTM/7W2hbpTlf3DhheYTH+1AulqDflL7IGG
 g24c193al7DnZPNivmr/Y1fup4xz5NGRbCuXhwtx73jAxXVHYNymCSNTv7/jrmu8QKqU
 l5EBXnbbuvuCM2dytJ+xjIYziLOUZND4KZ8qEIQQM1zo0hIix/VedYvSDMrgMxBtBPWw
 Oc4KA5V8zykF+ZmkdxSJaNBcNwoaVleITnRX10MSmsCP/VxQKf6iLvCzDvXRw/qhOuzP pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 36tqxbdfte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 22:35:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MMYWU9106049;
        Mon, 22 Feb 2021 22:35:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by aserp3020.oracle.com with ESMTP id 36ucaxm6dh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 22:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VabFB8eUd7eEGZoolxnNVmsW+kwAZ46x7/E5Ckt1qcEmAz434nsvs+8XwaxPLIQ4javkRedr7+AFeDZhvgKzaDpHryCZdPJKVw8tGY54vuf2mSGWK69LpTT82N605jj/QDbbZ3HmzImnJILz/CzPUAdKidaJneT4+F09U+XqLOVgNAoY7N8epnbPY8YJodFpI1k/bVm5DKX00AYSxTvAvePteT4aXyuCrrdFfsuFy0KH9293osICFxr4e0YYCPeAZ7cLVkx8v3iUlyQX4BJzJTUqw77jKjp6PUBIPVOYOYS74l/LETciKR0epdF0avgL6SPLG3PNFZEZ10RkcSFdCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNHM8GmodZriAq35N2tMaBVJ9CM09rOtEPJTtSC8jZA=;
 b=P1OkoneQbq8HVg8pX5/RfeTnXFQqn7rdxeOv9lgbMzKiEAuHuFnlE/90TF3LqDprkLCeWp0oAHX0lJoqtdEOoR/wGkNa1t29GQJvd+x4WiunDvJrAUSUXSxRa7iRN7UD/o4SZLpAEO0bH5dzQgCmaqoRXzZNsz4ABJpcJrbj5WxwOy4KXkcYIhBMIvlZ8EKEL+43t1ht/dsyqyy6e05ktGdK0WMcwKnNIRLnNkE41qiCU8FAVGnqhcoHXCOKP9rGif3oV8VApfyflNL6KFO790TSJV8FKKHi++el32gDE2HIsfhS6wqYZ1SAcoqab7N7++td0kihok+TsZX7SCMBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNHM8GmodZriAq35N2tMaBVJ9CM09rOtEPJTtSC8jZA=;
 b=R5hbmUHYyST5JMICRUmfNoZL5qlda7liqkJvJFzGYOJ+nJlQPpj+3zpk4gKv4XTWPhPCyrhCXWi+eB7Yw1bpWk41nZxOn/DQ4lJAMIq5hX0FTt3cVDar9I1klphAbMLj9AcM5JDK3l8+XKKZJF/e9vVrANoq3Iie3trWWV+ir74=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by BY5PR10MB3762.namprd10.prod.outlook.com (2603:10b6:a03:1b6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Mon, 22 Feb
 2021 22:35:07 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 22:35:07 +0000
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Meelis Roos <mroos@linux.ee>, Anatoly Pugachev <matorola@gmail.com>
Cc:     "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
 <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
 <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <5c14289d-501f-ed36-e1dd-ec00a540a823@oracle.com>
Date:   Mon, 22 Feb 2021 15:35:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <cde8e197-bad5-f239-6e6e-ed39eb3f7d53@linux.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::1f]
X-ClientProxiedBy: SN7PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:806:127::27) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::3f5] (2606:b400:8014:1041::1f) by SN7PR04CA0232.namprd04.prod.outlook.com (2603:10b6:806:127::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33 via Frontend Transport; Mon, 22 Feb 2021 22:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b3c7028-c7b1-4e40-f997-08d8d7821af2
X-MS-TrafficTypeDiagnostic: BY5PR10MB3762:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3762359FAEF2D4997EBFE4B29B819@BY5PR10MB3762.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvKxkvGqRVjLpXsCz5aFO2tPVhmTrHqVoT56xyKyUUl/4sAOa7IIkmfKtDgFxH2d/pqCzu7axNhR5KtiQVCHaM2VmsN6xVjMtYIIHgxKgmctTtIbPN3ZdAnP4GqgSL8J68p5PcW0wdBPGdyFGwcNKuYL1r9nqiyqxeh2AMgZLxmOtPCktdNm/RJ0NrRsjBiUz5Rc6j7Nc2I1qz3O0U5tVo3Hgc51+EMrxP3bSUy6S85pkkY/mSz8rHI0jpVkWbEnZa8L9O1FT/AQFRuFwrUyZofWhlfhaYOhIEfzBpDke3l/kMH+g1uKvuR0/h/AFfjV/aCbABxsxQ7IIk4/GO+CZTZLTiHmqNb3FIbdprbnV3a5mPsKBy+Nl1+j8AH4p1Tjj3sALI7XyHdJid+JWN12wZ1R8J28dLCLn7vt6iJFVr8b6ycZx6J4Fnx1WTG2SwhZ0kK0zPG0WqtszjYyPAv/sx8Zxl68ylHo32obD2KtaW4fha/m86Zf1FYQEBs9OeUtWJ69vIcjD7HlDiR4DdEfuGxarMm0MGJs+i31qJZlqgqKUUzRsGgJkAoaOnsqFfAribXvKdfiMDBvhVdC5HsqTTI/VAaYCqZihrjQSjNJG9N6KCSTy+idyH/GJxSfEfhxc/DagAMtGMY+2nPcdVtPD7G7YpkxEeH70/DPLLtsjkOgfAZeJjJ9mmuxfyFFY1za3e3wGtuC07jx6NcaLctlmkJFrKMN0gq9B8mcPxyNfzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(346002)(136003)(376002)(31686004)(66556008)(8936002)(6486002)(4326008)(83380400001)(8676002)(44832011)(16526019)(110136005)(36756003)(316002)(66476007)(2616005)(966005)(478600001)(5660300002)(86362001)(2906002)(186003)(53546011)(31696002)(66946007)(10126625002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ym42T3p4M29LVjljYlFjTmtZUElESnVHU05zbm44K25kSXZWczRyYzBPMDYr?=
 =?utf-8?B?TTdlZ1FDeDJyMTdLQVJ3N3BXOVI1eTE5aWVMTTlZOENHV2V1WUsxR2pKK2Nt?=
 =?utf-8?B?RnRUUHZEWWY5RU5EajUvQ0JDT1gwWnlqcHJaZEVITlVUYVpKOHU0aVFZZm9j?=
 =?utf-8?B?NVoyUVZFbDR2S0c2NnoyK3k3bGJvNjEzQ2hxV2cxdjhWZzliN2tQNFhlYWYr?=
 =?utf-8?B?eSt5ZndJbkY1eUo0VXRlaE5nbFZkY3AxUVhFUVNrNkhlWDVMWHB2d2tOaEhY?=
 =?utf-8?B?SU43emw2Q3pIVVpMLy9zVmQ4ZDBoYlpFQkFVWS9zVlhBd2tscHlkc3AvQVF3?=
 =?utf-8?B?ellKb3h2M2ZDRDdiYktoLzJqVENmRFdIWVpyZjJxSkoveUZmTEgrRDgvRG1a?=
 =?utf-8?B?Uk9mSUlTT3FoR3Nsc2NnY0Q2djBLZ0szdU05T0JJZWhhWDdRaFZmMnlHMnQ4?=
 =?utf-8?B?MFdXRmNUU1doRmg4ZW9Ud2JtUjN3QXM3RStrU0xhMWlhWitiQUhqb2ZrcUpq?=
 =?utf-8?B?RStFMU1BTlNlblhiamF3R0h2Y1Z0Yzd0VEVkMGh4REJrUUFvaUdrOFU4MENr?=
 =?utf-8?B?ZXR0ajVwZXJUeFNFa2NFb3NwR1U4VjFITWs2Z25QRkFZQlFGUHVzNis3b3Vt?=
 =?utf-8?B?UUUyKysyN0hia05pck5qRUpCMHkzc3NWbTJIcDRoQ3AwQzhGdTlTNy92QWZC?=
 =?utf-8?B?TDNmKzNBTGFoY1VUaHBMVmRCa3JJZmlMc0htTHBMUkh3OVJLVnY0cUZsU0xO?=
 =?utf-8?B?aEhJQ1VUdWdEbFJ1Yk9ua3plNXBma0Q3ODFuajlRVHZzcHhGNXZaOExxVFdt?=
 =?utf-8?B?allvWjQwaTRRRjk3R0J0NEdWNHR3OVAwdURFcXBaZWdJN2xNb1lBTWk5NWVB?=
 =?utf-8?B?WlNVSUd2WVhZaVpLdnpvWndOak9ZcVVEU29zeUplYmkyVi9ubWF5RnlTaGY2?=
 =?utf-8?B?V1VWcGk0VXI3OFJWNlZZaXhXRUtDSDVydDNITjhRbzFWZmY5aCtLUUZ5a2Jo?=
 =?utf-8?B?cHd6QjR1OWl5QVJaTjJPQ3RxVUxIZFV0dlZJNGxRbm1idlBRUHRDazd5cXo4?=
 =?utf-8?B?TnhlcERZREdjVERCMWRaVlBwNGI0Q2ZMa2RCaGlYbUVxZkFvUnYxVGFwT3lv?=
 =?utf-8?B?NXZVUmNTN2JYcnJtZGVYT25iOVZiKzlLamkvR1l4MTQ2OW1UakJsY1pDVkla?=
 =?utf-8?B?RVMwRFA2MkUrYi8xTzlpdDYyRDduYlo3d3VnYUwxaTlXbnJpRFJKL3JKTXBx?=
 =?utf-8?B?djNvV25PYUFrdnc0MDJNdXIyQmc5bzVJRHZrWXVaN21BWW85NTlnR3JyMys2?=
 =?utf-8?B?M3ZYVHQ0TmF2UmFoQXhyS28wYVg0c3hsMU5ZZXJOVHVkREpqNFpRamRzNDdw?=
 =?utf-8?B?RytQaFErRldmSEpRa3NxQzNFdTMxMlN6cmRjdTlxNkYrTm5LZWZVMXJNMnFx?=
 =?utf-8?B?ME5XM3M5NXNPUDlVM09FWmlTYWxaaGdMMXlzd0xaNzRFb2c2Y2grSjE1a2lI?=
 =?utf-8?B?RGd3WjF0Zis3cUdMNnUvNUN6eHZLSHJRVk16TmthWUY3RGVtRHlXMUN3dzV3?=
 =?utf-8?B?N3NtN1VKWkhFb29naXdUdHkvNytaZmJHVGpuei9ZeDRCdHZRR3RWdldOZGQv?=
 =?utf-8?B?bWdQNnFrU2hYVWZ1NlRkTEdoWkFQN1hrZGdRd0ZoZE5pZGZMODlrVk5IbGpC?=
 =?utf-8?B?aXREbHJQQmVFQjY3VlNGdHIyM2EvNnVaSzB6L2V3K0RuazFJODVGNkIzSHFu?=
 =?utf-8?B?MEFXazIyMHh5NDd2a3ZqSHVMc3RLWnZvUUhiK0RaRTd3TVMxUlFFZld1WERn?=
 =?utf-8?B?UzBvNU4zazl3RytmSXVwQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3c7028-c7b1-4e40-f997-08d8d7821af2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 22:35:07.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEHBN1b/h0GGh1E9hG44zePUfSLUV2EK7aYY4RtghC7t3/H8JLdVTuE/+dfnlHCFiATNxnAc+qlvSjFihAx/KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3762
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220194
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220194
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/22/21 12:34 PM, Meelis Roos wrote:
> Hello!
>
>>> 1. https://www.spinics.net/lists/sparclinux/msg25915.html
>>> 2. https://www.spinics.net/lists/sparclinux/msg25917.html
>>
>> I've looked at those and they don't contain the information I am 
>> interested in. I believe that stress-ng issues random opcodes in 
>> order to test how the system reacts. The actual random opcodes are 
>> what I need to see printed out directly from stress-ng before it 
>> actually executes the opcode. The kernel crash traces do not show 
>> those, just the aftermath. For instance, in the second trace I can 
>> see that the faulting instruction is c2070005 (lduw [ %i4 + %g5 ], 
>> %g1) and with i4: 00000000010e11c0 and g5: 794b00a7d5ede977, we can 
>> see how that instruction generated an unaligned access. But that is 
>> not the instruction executed by stress-ng, it's an instruction in the 
>> kernel, operating on faulty data, and I can't tell from the trace 
>> where that strange g5 value came from. The actual user instruction 
>> that was executed may provide a good hint.
>
>
> I instrumented stress-ng with simple opcode block logging patch 
> https://pastebin.com/1dZiCzCg and the results are hard to find usable, 
> so far :(
>
> 1. The amount of code generated at each try is huge - last time it was 
> more than the scrollback buffer of my "screen".
>
> 2. Adding these logging statements makes the bug harder to trigger - 
> tried on 5.10 and it ran fine multiple times and then  failed but that 
> took many minutes of running before the crash. I was observing the 
> data over SSH, that might also change scheduling/CPU usage.
>
> Any ideas for better logging that would not be in the way?
>

Here are a few things to try:

1. If you want to do it just with ng-stress, you could change it so that 
instead of generating a random opcode and executing it, generate a list 
of (many) random opcodes on your ssh client, and send them over to the 
test machine to be executed. If the system doesn't crash or hang, 
generate a new list and try again. If it does crash, then do a binary 
search on the list of opcodes to find the culprit.

2. If that sounds like too much work, we could print the instructions in 
the kernel when we know we're going to return true. (Sorry the 
formatting of this will likely be messed up):

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 27778b65a965..77e31d7c4097 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -277,11 +277,13 @@ bool is_no_fault_exception(struct pt_regs *regs)
                         asi = (insn >> 5);          /* immediate asi    */
                 if ((asi & 0xf2) == ASI_PNF) {
                         if (insn & 0x1000000) {     /* op3[5:4]=3       */
+                               printk(KERN_ALERT "fixing up no fault 
insn %x\n", insn);
                                 handle_ldf_stq(insn, regs);
                                 return true;
                         } else if (insn & 0x200000) { /* op3[2], stores */
                                 return false;
                         }
+                       printk(KERN_ALERT "fixing up no fault insn 
%x\n", insn);
                         handle_ld_nf(insn, regs);
                         return true;
                 }

3. I have a theory that the instruction may be something like this:

         sta %f0, [ %g0 ] #ASI_PNF

which should assemble to 0xc1a01040. You could just try this instruction.

4. If this does result in a crash, this patch might be the fix:

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 77e31d7c4097..c0d2e3665e69 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -276,12 +276,12 @@ bool is_no_fault_exception(struct pt_regs *regs)
                 else
                         asi = (insn >> 5);          /* immediate asi    */
                 if ((asi & 0xf2) == ASI_PNF) {
+                       if (insn & 0x200000)  /* op3[2], stores */
+                               return false;
                         if (insn & 0x1000000) {     /* op3[5:4]=3       */
                                 printk(KERN_ALERT "fixing up no fault 
insn %x\n", insn);
                                 handle_ldf_stq(insn, regs);
                                 return true;
-                       } else if (insn & 0x200000) { /* op3[2], stores */
-                               return false;
                         }
                         printk(KERN_ALERT "fixing up no fault insn 
%x\n", insn);
                         handle_ld_nf(insn, regs);

5. Try the patch in #4 regardless of the outcome of step #3

5. Here is another patch to try after the others:

diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index c0d2e3665e69..e383738fdd9f 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -275,7 +275,7 @@ bool is_no_fault_exception(struct pt_regs *regs)
                         asi = (regs->tstate >> 24); /* saved %asi       */
                 else
                         asi = (insn >> 5);          /* immediate asi    */
-               if ((asi & 0xf2) == ASI_PNF) {
+               if (asi == ASI_PNF) {
                         if (insn & 0x200000)  /* op3[2], stores */
                                 return false;
                         if (insn & 0x1000000) {     /* op3[5:4]=3       */


Let me know what you find out from all this and I'll try to come up with 
more ideas.


Rob



