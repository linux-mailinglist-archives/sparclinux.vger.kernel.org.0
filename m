Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFED9321E83
	for <lists+sparclinux@lfdr.de>; Mon, 22 Feb 2021 18:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhBVRt4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Feb 2021 12:49:56 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:33378 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhBVRtv (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Feb 2021 12:49:51 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHiXVR015683;
        Mon, 22 Feb 2021 17:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=q+PMkqyP6q/wbZXSaNnZI2i3rqq41Q70Dp+VAFxhaXc=;
 b=tP8HHLTbS2DF784SDwJyDlTaVps0vK4kczTxUMDCjRgDoSKAFha8+EQT+zcbbqDDLAgG
 ZOY6dq1Kd4njIquVHYthse/hn22KN2AsrCOYWcd6OLE4MDRqJ8dnh0WoB5GhQtyfxRTf
 /qcBNGebf85DZO5hWAz72pkQkEQAaVEN5gBP1sz/XdqsMWUxd4MxKrc9n13CCa6diVie
 kKCUy2zLl70kxiBnlDsMWu6zrYpXuYUyeJDhP4H41nN4KQgi9Vsji7RHYWuuS0OA02/S
 TANXUG+nVesv3h4Jtw77VuVVqNHgaoASccOB3Y8OucA98toX/AqkvwKqZgiL8AAYsvla zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 36ugq3bdgb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 17:49:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHk4vO183658;
        Mon, 22 Feb 2021 17:49:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by userp3020.oracle.com with ESMTP id 36uc6qp49k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 17:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVu2+nu5DSNaR4YhIHeyumKMzW83pxmbiCxxAF7E5Wg/QgdmnhrcqkIX4NJmVLKdTC51dMcIpWPIdRHfhO99mKly/BLJC2AAmb/dy7XdtrtcUXXL0yymTCm+3COwuGoQBwV7Ne1IdMAuGwiCatijarS7qweYG8Z+q3hLUln/VJ/KEaND3NoVRlNYkM3zXdD5mYzUtKHO6RvQfN2NfGrNZpNREtPDQnAzG9RrI765/C8Gn3NrtqrPVBZZfh2SaZupkvYPNFpHQU5cPJ87Bbzo2qRmgGZHbeFWSXBJjy7vOo4SGbXx6sNI1Rh1UiWqzy/YDuc90ozOMrvSabjYm/WTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PMkqyP6q/wbZXSaNnZI2i3rqq41Q70Dp+VAFxhaXc=;
 b=U4UZpq6qITvrZ+Q7h9EQ2hi3/54DR2W9B1DF1aDynoCYQ4yk/X42KvFDmKKDNgRH2Lqg3Ha120dj7dD3vaocamQUbjJ4NLQSiYUilS3Bfwp/ERbXR42cVsM7lGzbyNXosdG+Pm/SJ55WfDFuMBkJ9K4t9psWTqjbsPrzXqiXVeloPLhSG/lmirEVdTrY12x2sbhs+ffRNqubh6NSxePgeTiezJ2K83x9jb6KkZ7hj+edB2D9uFWPUCl8xEcWF5VEXnW9YaNv08JCxvhABPOfz8xqFTnzo+fSLhbnOM1upOIb/fMvaR+8tHSHT1pFvwhwqMwM8bF2pkoBCHtA6AJcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PMkqyP6q/wbZXSaNnZI2i3rqq41Q70Dp+VAFxhaXc=;
 b=Lts/8F0Ffq4QrV4DsT6ryVrqya/FLJHhjY0uwCYJ6YW0YRmLWwm9I56ZHZNYtfX/tMW93xe2FbAL7QHT4NcwHoiBkQcv2cl3TSpukTg7M6+J+WWqAAN/LpezuJ283NQdXvFP2hB0Z7tR417JniMlOJPOFdj5K0icu54WWrvhWJg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by BYAPR10MB3096.namprd10.prod.outlook.com (2603:10b6:a03:151::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 17:48:59 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 17:48:59 +0000
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Anatoly Pugachev <matorola@gmail.com>
Cc:     Meelis Roos <mroos@linux.ee>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee>
 <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
 <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <d55f1011-375a-cd41-5c4e-3e38d97e3cba@oracle.com>
Date:   Mon, 22 Feb 2021 10:48:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::1f]
X-ClientProxiedBy: CY4PR18CA0049.namprd18.prod.outlook.com
 (2603:10b6:903:13f::11) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::3f5] (2606:b400:8014:1041::1f) by CY4PR18CA0049.namprd18.prod.outlook.com (2603:10b6:903:13f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 17:48:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9787b1db-72fc-4d44-cd7a-08d8d75a221c
X-MS-TrafficTypeDiagnostic: BYAPR10MB3096:
X-Microsoft-Antispam-PRVS: <BYAPR10MB3096088452EC71AA04B070009B819@BYAPR10MB3096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/nImp6+Np7WiBtyZdCyslUBwKXr7xLPxmXpcilt1wktWj76evrEyzFHz05Le5y8FjC7rmT7uD6YTSKr2P6Z9Fahde/ZlAu0cbnudLAoN/Ah29papek5O+Ub921ggUlS9nYipCF8/gUqBpe+v4WyX+KfOtgd5W4GJ0FNsFIOv3YchPJDdcIEuipjn40hhyzbUe2cf8zvmKtC8tBoxUE1j9jRfxHDA4EPQMU6twg9fP4XYCy0tBF/q8eKJ0MjGaiDc0V3yV4p/SQ/iyyrR9xJAvKwf3wsdHlRueHio5dCx6zmn0ltHq8vsv8B2kAMHWch6T6J188o8BqcGoJoRB4Ya8r+HDJxl2vqWO1WrzuEbsNJv9TRhaPdQWo3sdGre3qMj86rxQaMMTV9HSD5uFP+dzyq199JjA6jtfDy2jtwks8w4K/8DqSF7wFsvKmf/fCBogM2gFOjqEcG4aLcdBqLSLWPbt0xKMngAMiq4CkQmmolALmwPmJmoyVtEXSFRZXjfQiQLgK7dszCliZx15cl1mIIZfcM3z3vXUYxq+3mJQAqiRMRSiowF1HyEEzcBoocp3YS/a79v6teuno31mKXukGccDPILeSPV/MtnmQbyp7RCXhbVrBT6hFGe0WkC1El2CSN4/hMaEvriBS8EFk0m8L4DpRdEaLEHH7PG/1idN2e3V0zozcMRoz3SFB/UBL8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(376002)(136003)(396003)(66556008)(2906002)(66476007)(8676002)(966005)(31686004)(36756003)(6916009)(316002)(16526019)(186003)(66946007)(31696002)(8936002)(5660300002)(6486002)(4326008)(478600001)(86362001)(44832011)(2616005)(83380400001)(53546011)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0lpN2RiVVZJOGlKVCswNUpSY0ZWdXUrV3MzeEVRc3ZTRGUxL2drd3poVFVv?=
 =?utf-8?B?ZVVaK2c3WGtjWWJob3Npb2llZzh4eVZzQkNsYVJOY0Z6dzE3Y05KbzBWZi9Z?=
 =?utf-8?B?VzlTemtadmVzVU0zRmppZHFQNFc2Y0F4c01xQm5iZmF6U3FPTW52UThzMHpo?=
 =?utf-8?B?RU04WUhSRDZXMitHbGo0RzdVL3BCcCt2WHFFRUpaTEZLZk5RTVFMQlFLVTlx?=
 =?utf-8?B?YXFnM3poNlNWdHptaWg2dDFSZTByTmpRcnNQRU5RYVErR0l5MnQwY0s1OGY1?=
 =?utf-8?B?NG1GT2NGNFVZQUtma080Mlp4cFlFN3JySVhoNUNkYjlPWGYvTGc3bC9tNWo5?=
 =?utf-8?B?M0k1WXJZblRxQWlqVUpJWkNuUTBvVmtxaU0wVGtTYjJwcDlPVHpBVUd4M0ly?=
 =?utf-8?B?YWhlYndMcWIvN1VCak56UzZhdkdITXRVV05UNHJnQ01yVG43RDBMSUlmT2hM?=
 =?utf-8?B?ZWdLUVd2NHFIbmFtaXBrbTN2YjhQRkhVdUxkRVk4M3d4dFF3UTNpd1V0dDNN?=
 =?utf-8?B?bWpLSEdNY0pWQTdHTUNnNUNnc3hkWS9GSktxQVczSGMrblQyaERaTUs4TVdS?=
 =?utf-8?B?WGd2NUcrRHdUdkU1ckhKQ25ycFM0SXJiNWhxMUxVSUI1OXJzS1RJT1ljV25s?=
 =?utf-8?B?NFJwdEtKbjdCcGFIZHMraDMzS0VWWm9ac05lclc2N01Cb1JmV3FnZ1NGTEo4?=
 =?utf-8?B?TGtKYVFzV3RYZjlYVFRqbFpBdU5nSUxYbEphZjlCUXR6eDlaQnQ4TUpBZFpj?=
 =?utf-8?B?R1JTNTQzd2QxSUZYeEt0UVFlWmJKRmlBT1hRUHdVOUswRW1zZkpBeWE3UlZx?=
 =?utf-8?B?UmladnJlK3BFRVdoNEFWOVppQkhyQkIzOXNVV0dqU1ZJK3NyWnpaQ0JsR3I1?=
 =?utf-8?B?S0U1VXdXVlJnR1JPOCt2N2Z5cHJNa2kyZHh2SmYwRDU5cGFYM3JsQjVWOElJ?=
 =?utf-8?B?OFlsUFcwSXZES3FFUEt0QnNtTG5lSm5hNnpJM2pUWEdKb2E5N0dWdExpdEFC?=
 =?utf-8?B?UmVMeHNwNVc1YUNrcEtQS2x0ZHVveEM3VUhiNDl3RU04VUwvclZENG16Wm1U?=
 =?utf-8?B?eklQTXJiUDdwc3lJSFB3SlZMNlFNNTlFUlhmZmdsQXorb3g5aGhEUmFzQXY5?=
 =?utf-8?B?djlwUEFWK1ZVblBzaFRqWkZ0VFJMcE9TcmtKcWxHa0RML0M3WjV4VGxDdTRX?=
 =?utf-8?B?U1Y2b1dyNFFUVVVrVTNZNlV2WS9OYkoyWmNpNWpKQXI4clQvc1ZmOHA4VSth?=
 =?utf-8?B?Y1d2ckxLWTVtOHZ3NG1KTGtYUDVRSkRWTm5paWJoNmVoNmh5cnJaMUVlWW91?=
 =?utf-8?B?eHkzalBKR1VRSFZMOFY3c3cydTI2Sk84bE02UGUzTnlJNXZzSDNxWmgwZ1hl?=
 =?utf-8?B?dDdRZy9Wa09rTmVHVjE5blhIcU1uOE1LaVdHejFvb0hUTERvaFRBM0UybUxw?=
 =?utf-8?B?UE82WjhHcStJa1NuaTV5bUpHN1VQYVJZQUVQeStPRUp0WjkwKzJEenBKVHQ0?=
 =?utf-8?B?YU1CbUtmNUYxNElEdVA2cjVJNU5HM3BnUmpaeG1kY3pGVE1PNmtJYUp6dm1E?=
 =?utf-8?B?VFl5T3dWQytYRkFtTlZpa2VacjFVSzNXbm91QXduMVRsTE4zSHk0YmdFcld3?=
 =?utf-8?B?QTBSWWFQWGlqbHpJUnpnN1VYd2hYbXpaVUJqTkZtT3VCMUZRenF1TEJvaXZN?=
 =?utf-8?B?L3VIRU5wYVI0R2ZqME56Y0tiQmhyQXJ0ZktMTHROYXo4MjN3VGc3b25qUWVj?=
 =?utf-8?B?SENZamJOamlpVDZ0eWc3ak9ZdFBkdldXeWZaNVlydEJ5SXZ1emZwR1B5TTBo?=
 =?utf-8?B?RGZoWGtCQ0xOOFkrclU4Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9787b1db-72fc-4d44-cd7a-08d8d75a221c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:48:59.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZtrD6WLzDuvxFZqTv/pJl8/h1FcuK8s2FJlQEquTZzbgdL74wjS8EXQ6tBmtwNoVI6P6biWmKXxLHp0VkpfDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/22/21 10:21 AM, Anatoly Pugachev wrote:
> On Mon, Feb 22, 2021 at 7:21 PM Rob Gardner <rob.gardner@oracle.com> wrote:
>> Can you have stress-ng print out the random opcodes as it runs? That
>> might give a hint about where things are going wrong.
> Rob,
>
> there's quite a few different ones on my tests, please see [1], [2]
>
> 1. https://www.spinics.net/lists/sparclinux/msg25915.html
> 2. https://www.spinics.net/lists/sparclinux/msg25917.html

I've looked at those and they don't contain the information I am 
interested in. I believe that stress-ng issues random opcodes in order 
to test how the system reacts. The actual random opcodes are what I need 
to see printed out directly from stress-ng before it actually executes 
the opcode. The kernel crash traces do not show those, just the 
aftermath. For instance, in the second trace I can see that the faulting 
instruction is c2070005 (lduw [ %i4 + %g5 ], %g1) and with i4: 
00000000010e11c0 and g5: 794b00a7d5ede977, we can see how that 
instruction generated an unaligned access. But that is not the 
instruction executed by stress-ng, it's an instruction in the kernel, 
operating on faulty data, and I can't tell from the trace where that 
strange g5 value came from. The actual user instruction that was 
executed may provide a good hint.

Rob


