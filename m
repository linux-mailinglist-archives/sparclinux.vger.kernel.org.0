Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55103281CD
	for <lists+sparclinux@lfdr.de>; Mon,  1 Mar 2021 16:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236828AbhCAPGi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 1 Mar 2021 10:06:38 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57010 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236821AbhCAPGe (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 1 Mar 2021 10:06:34 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121F556J162720;
        Mon, 1 Mar 2021 15:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=bps/NcqHEdTCIc7atSm/jN/N0yb/c2V8syQgQE0VJ/k=;
 b=pLS7TJ1J988ddLtqxp6qjsYLZnL1VYFLt1AiumBB2JuVWI2lamnW20rmEvKVeAPyzZLF
 3YrAIAV7mpU5+NxtL6QBFR6X9zI2rsQPoNQkCayfXFIgVqZ1vPXgec4LeWEp4UP6sc0s
 N5Rjd/nOB+h+/f5IHGrjIJDp2OVX7jchzFsqQYOajVlHFAJ+Csq4V5+CpYMKkrRrNsNG
 YcOXwoI/4eKIR0yVlaaVvMAScAQa20r1HeBS87j1+x+MBCVltnj3JjNKvPBEj5BifoAZ
 /9VpcIUkN9DGfcHhi6sWeFUKfBsCJy/QrEqlZo4dVmTLEdAc9XYxy+bl4aSbWFO60wXf 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 36ybkb4991-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Mar 2021 15:05:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121F0XeK056063;
        Mon, 1 Mar 2021 15:05:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by userp3020.oracle.com with ESMTP id 36yyuqne9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Mar 2021 15:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4Xf9BT86l/hGJhuegeoNbc5sVmsCn7UMzWhHJOO5+cqNGyTXLJVndt30UcQNJoewR1xVunzE6s/RhqtbE/O8/wuEBjdp4pElJ24SLS1Juk/GZw3nMJmpyB+N6V7RiXeUSqgX04FQsCdnRq6Uvkqb8sEDDgvsfTkyZhejYVwQmjXXvJ3o8oVpCoTwShAvn6TADLiHfgskzxJ76qZeAcn2yGMKhNAmJ+SwevWXEMUyYgKGiLKtpaibUTwJPjDWMZiajwvmOZkaEOZlJTnrM+sGrV+m7fmN/tMJ25fBAtx2kTiQ4kXwJtG1fQpScxVB01b93aYzd1COo07vjWEO9SHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bps/NcqHEdTCIc7atSm/jN/N0yb/c2V8syQgQE0VJ/k=;
 b=mvcZUmB5QLm+EPy//9XTcPtG0BsphqdzTXe5TPamGkpI43el3Kaxf3GMWQLgJB5yEBeu8OU+jowbIgZ/trne0OKJNo2exCkVvRKDfzPbhCq45amnjDq7U1JyjTjMGlnKLHtTNJKGo9GXX34rB4CXjC7xN+pPGC+YmQIHf+k8/cXAG0xjqiCUcgMZCXXpu87HVxC7xofNwa5VbvzPbfmrmulbiUTtPhaxTiFYmzBe1Y9GRGPOjgUJYQgY205Q6Ry7LEv+QMi1YnhZ+P0YwwLYo7srVKyCszpU04ZB05OxnqoW1hqaMK8+sQvQ29wtAB9q2bZR865KV3TfAyG7Bd18tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bps/NcqHEdTCIc7atSm/jN/N0yb/c2V8syQgQE0VJ/k=;
 b=JDRfJgX292HXYLk+mqRjbGk20rARchWcYu6DPW8w9piXAkpcPdjqSbqy9VLNBAL5joK1AaB+Q1xGmb2tUmLEp3LIt0AyMiG3dYU0xCG4c5smflCNetVzSklEUvxoxZoXPQ1ulUC2k81ctbK0hx/NMTmUvejBB+8sUap7FJ/zoO8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13)
 by BY5PR10MB3876.namprd10.prod.outlook.com (2603:10b6:a03:1fa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 15:05:37 +0000
Received: from BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5]) by BY5PR10MB4116.namprd10.prod.outlook.com
 ([fe80::75ca:7cb3:4ea8:50f5%9]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 15:05:37 +0000
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault
 loads
To:     Anatoly Pugachev <matorola@gmail.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
 <CADxRZqxScpzebDEh+LjyKmsgoQErqB=Lie=JUX2WWN2NOzqPcQ@mail.gmail.com>
From:   Rob Gardner <rob.gardner@oracle.com>
Message-ID: <4b2456f6-f080-9104-e5a0-22e009164979@oracle.com>
Date:   Mon, 1 Mar 2021 08:05:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
In-Reply-To: <CADxRZqxScpzebDEh+LjyKmsgoQErqB=Lie=JUX2WWN2NOzqPcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8014:1041::1f]
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To BY5PR10MB4116.namprd10.prod.outlook.com
 (2603:10b6:a03:203::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:2050:24:8000::27] (2606:b400:8014:1041::1f) by SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Mon, 1 Mar 2021 15:05:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f61ec3-7b81-4f7b-d9b2-08d8dcc37873
X-MS-TrafficTypeDiagnostic: BY5PR10MB3876:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3876786AD2DBFA521A922F539B9A9@BY5PR10MB3876.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCL/H1LTex+aaUirDIGYw7xw8by7nTxYedH7Zm/j9y6BDrGYNATG2NZ2BWoY4T5Yh49W6uRxWX7CUN2NCusz56xMEUh2k+ShG17xqU5JzOwzjS0KOo7D+Gxac4ROsYgL0LTxtOW7pm8aGcPRT0vmyos6N8rQ6NzlUJ+hgDJbH+XTR8ZwoaV2hC0OJmTBFo5PkOYfLQQCSQ0BB8Tdqv+PLngbCF4GS2xObpXMVyLbm8HTcQugh1ib/jOj2wdpISP4+MmiYGPzPAYFbIHTrluKAwJmVDH4GZ3KvA6vOsCwJ3TijI57yafy2n6qqV80lN55UmZMkFPvtujVU1pQcRG88/q4UuiGMAjhFzervn3vzoGwO+2HQGOOd7D3inXrF9Ot58MB7uQEErMtngvNaory8kn/dLhwYJ6nZsdqiTydhYrotmthjgNYvNThlKuHUJEaj7pjwqSZu58EAPzPhH/SArLfghdbmRnOPSI9oQQYI/Zsdjf/yLqk2jnF1JrzjGOIACq20VrrqPQGt+ja8U649Tc7BS3nXCImZlmXKlsobgo3d8cyQAMEngolDHRBHD1Lnmo2H9ADpSBBK0vzL06RJZ3izniu4GwWl4bidpociVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4116.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(366004)(376002)(346002)(478600001)(4326008)(4744005)(5660300002)(2616005)(31686004)(44832011)(2906002)(6486002)(66946007)(66476007)(66556008)(53546011)(86362001)(36756003)(8676002)(31696002)(16526019)(186003)(8936002)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWthL0Y0TEcrYS9QSjVBNmY5dFdyVE4xT05MRU9KWmlQR0o5QXNMUDhtUllX?=
 =?utf-8?B?UnA0cXJ0L08zbkxaNkJKelc0aFlvM1BXdU1rYW5PRVN6WEltbzBQNkJUMis3?=
 =?utf-8?B?NjREcDdONXloVERwUUtlUk9zRkU5ViswNWt6WTdUU2NoSXNGYWV1YXZKT2R6?=
 =?utf-8?B?YU5ydjlwR1R6RkRoc005QVNvNnVDUkM4ekpkbWRRcFFvZXNJR0RwdkFuL043?=
 =?utf-8?B?RnEyK1c0Z28rdmNXR0JPZ3lDa2k0TzI3T1JwSlRnbm5vUTFWVDlkaGJpbG0r?=
 =?utf-8?B?bksrSXRBS0pZOFhBUTY0ekN3Q0UyQjBxQlo3S2VsRnN2TXZvM0ZlZW1xc3N2?=
 =?utf-8?B?TkhxRFl6SDFkV0tmcHlZVGpPVjI2NGh1cjJmcUtVenBCejNlOU9CS3JzWTQ4?=
 =?utf-8?B?TG9WY1pmb2lRRDRLaHJyRjZQSmdVam91SDcxOTdTcEc3ZlorRzRDYk5jVEZp?=
 =?utf-8?B?RkE2SGlkQTM2MXFLTUM5alF6Zmx1czluOERzVGxEMUY0S0NoNU5RMVVxWFVG?=
 =?utf-8?B?UERqUjZPVGg3bHBEOE5ET3B4blN2Q3BVZ2E0SmM1amI0RU9Gay90T05WZjVv?=
 =?utf-8?B?ZmhNbmdidWNkTkRUbHN2UWsrZmhjSGZKUlRUYzBYRXR6V0FGUVZtR0kvaVlO?=
 =?utf-8?B?THhuUGV1dWxrMTZvbjlteGgzQnI0d3Z5RDdXaHFHVUZ2TVhSOEtpQWF4ZDJ5?=
 =?utf-8?B?ckNWYTRTUm1kQXdJbDBienhjOWZOWW8wclFGZzVXV21aQzZOelpGeHNSb3lW?=
 =?utf-8?B?UXFkbjR2SXpzcFZCVEdmOWNWQVhueXJwUC85ZnlueUtZcU01TDlZUytYMUIw?=
 =?utf-8?B?VXV4Q0E5RGlkSSsvb2pkRXJ2Vlp3UlNJUGI1c25rQjhmN2psN0ZqaERYVVJK?=
 =?utf-8?B?bDJJSFltR3ptWmJKYk9VdmZtbnlLdTlKSWVDWThCUnpHNGpGYjNQU3VZM041?=
 =?utf-8?B?YnVmYUVjbVEyRWV1djJPRUwvN2xFVlA5MmFXSlpPRHBrWndqZGNXNm5GMWJD?=
 =?utf-8?B?NlBaQS9xSEdwa2p1a1BHT2lNZ1pSQVYzOGpIa2sza1grQmZRZ0VDSnRYbHNB?=
 =?utf-8?B?ajFsdjJmSFdoRTlnYmVhZ1U5cEV2YUZvY0RwREZrRmIzeGNlTFBIR3Mxc0Vt?=
 =?utf-8?B?czlSY3c3MkxoNlg1RTA3R1o0RHF6OGFOYWZPK0pYaTlOMkNFU1p0OWJIYXJV?=
 =?utf-8?B?TndBTms3R2tmbHBOR0U5bUE1Zlg4WDlJUHRMM1dsams1bHZGTEtMNUlnS3lr?=
 =?utf-8?B?c0RNbVVIaVNwVlpxeG5zOXFsZWM0TFZpUjRSRk1LSjIrNmZ1eDNxTVFyWGhJ?=
 =?utf-8?B?Tk1WSmxjT0pSSnRlWko2Y2s2dGljOTVqSC9zUE9idVlwWm51R1BITkFTVzAv?=
 =?utf-8?B?UXoxV0hJOWk3Zno1NGdKMFlYcWZ3MEVNaE1rR202MDVqczh3R0wwTmFZd0g1?=
 =?utf-8?B?WmkzKzQwTERoangvdE9ZOXpRb1BOVHAvUkkrbVIxWStDZEMrQnArUEszNDYx?=
 =?utf-8?B?a1REY05ra2VHTDlWZFBGTXlMQ1RFQnFNSlN4NGFrei85Y1BubzlOSERZVmxC?=
 =?utf-8?B?ZFUxenVDcEtYRkFZT2F2dGFhN2VyTm92OHlWWVE0R2t4WC9PT0RjbnZiSGFn?=
 =?utf-8?B?QnlFaEdtdTEyOEIvWDFhTlRsNkZWVXRjRW56REd1SUxXbTdPNjNvTFhpN1U2?=
 =?utf-8?B?dURGYm9vVTQ3WVZDR2ZsSkFBSXlnbUQybkFBczR1SHUxTkY3ZnRHVnRIRGp2?=
 =?utf-8?B?RDZEaDlZOXhHRmU3WkdmOXRZeXNydC9sVjF6L203K0NUZVNSWFdvbm5ydytI?=
 =?utf-8?B?U0dVZ3prT21SUVQ4Y2Y0UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f61ec3-7b81-4f7b-d9b2-08d8dcc37873
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4116.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 15:05:37.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaSRU1jx4zd5ESdRi+gArgg5E5sExcgYCcMEKujj8vtk69NjEQKgYtsWmR6FTav7TvcT9DU3LI2JAVvEmwpLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3876
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010127
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010128
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 3/1/21 5:56 AM, Anatoly Pugachev wrote:
> On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
>> is_no_fault_exception() has two bugs which were discovered via random
>> opcode testing with stress-ng. Both are caused by improper filtering
>> of opcodes.
> Rob, tested on my ldom, works perfectly now...
>
> $ uname -a
> Linux ttip 5.12.0-rc1-dirty #195 SMP Mon Mar 1 15:46:15 MSK 2021
> sparc64 GNU/Linux
>
> $ stress-ng --opcode 1 --timeout 60 --metrics-brief
> stress-ng: info:  [945] dispatching hogs: 1 opcode
> stress-ng: info:  [945] successful run completed in 60.00s (1 min, 0.00 secs)
> stress-ng: info:  [945] stressor       bogo ops real time  usr time
> sys time   bogo ops/s   bogo ops/s
> stress-ng: info:  [945]                           (secs)    (secs)
> (secs)   (real time) (usr+sys time)
> stress-ng: info:  [945] opcode            17847     60.00     27.45
>   34.03       297.45       290.29
>
> Thank you for a quick fix.


You're welcome. Please add your "tested-by" if you like.

Rob


