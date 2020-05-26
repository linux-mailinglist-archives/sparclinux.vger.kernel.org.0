Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35EB1A6AF8
	for <lists+sparclinux@lfdr.de>; Mon, 13 Apr 2020 19:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732497AbgDMRGX (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 13 Apr 2020 13:06:23 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59764 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732482AbgDMRGW (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 13 Apr 2020 13:06:22 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DH56CR151699;
        Mon, 13 Apr 2020 17:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=R/QHTJEbvK5wYmg2dWl63irRcFp2irztNeFiTFWafoM=;
 b=kktfuV3K3lSuFHBc31Ythkb5SLenATE1abhmvREP6KJho8IZK25DiUJDRqDQpY80dSlB
 zPKH4s1foBQcVIjdX6VteTFGLWt1In4vXh6UzrVmtOnamoWJsw+sNkaoGUEteL7Wj6Id
 TSK835Gllrv0py7zpZNvy9pWpkHJe18XhM0YR+R855Lxj/R5mtRO/U8RN0GwMx1Q8Im/
 c9b28/VAT/sCGDL4wnkRBwLKlEoDTQEILj5wqFoG9ey6BDT5YsIgFU0yG4+FjoBk4xb/
 nbySP3Xdz35peCoj4Mbp7NAABCO8dUFBIWIufIqDvvSWCR9DwJBRLWf5sZIItwDNTtMR qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 30b5ukyrq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Apr 2020 17:05:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DH1t0h105739;
        Mon, 13 Apr 2020 17:05:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 30bqpck4ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Apr 2020 17:05:05 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03DH4vor012212;
        Mon, 13 Apr 2020 17:04:57 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Apr 2020 10:04:56 -0700
Subject: Re: [PATCH v2 1/4] hugetlbfs: add arch_hugetlb_valid_size
To:     Peter Xu <peterx@redhat.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S.Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Longpeng <longpeng2@huawei.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mina Almasry <almasrymina@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-2-mike.kravetz@oracle.com>
 <20200410191613.GD3172@xz-x1>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <8d2f8066-98af-4db2-8ffa-f78533a50674@oracle.com>
Date:   Mon, 13 Apr 2020 10:04:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410191613.GD3172@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004130131
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 4/10/20 12:16 PM, Peter Xu wrote:
> On Wed, Apr 01, 2020 at 11:38:16AM -0700, Mike Kravetz wrote:
>> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
>> index 2eb6c234d594..81606223494f 100644
>> --- a/arch/arm64/include/asm/hugetlb.h
>> +++ b/arch/arm64/include/asm/hugetlb.h
>> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>>  				 pte_t *ptep, pte_t pte, unsigned long sz);
>>  #define set_huge_swap_pte_at set_huge_swap_pte_at
>> +bool __init arch_hugetlb_valid_size(unsigned long size);
>> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size
> 
> Sorry for chimming in late.

Thank you for taking a look!

> Since we're working on removing arch-dependent codes after all.. I'm
> thinking whether we can define arch_hugetlb_valid_size() once in the
> common header (e.g. linux/hugetlb.h), then in mm/hugetlb.c:
> 
> bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
> {
> 	return size == HPAGE_SIZE;
> }
> 
> We can simply redefine arch_hugetlb_valid_size() in arch specific C
> files where we want to override the default.  Would that be slightly
> cleaner?

I think both the #define X X and weak attribute methods are acceptable.
I went with the #define method only because it was most familiar to me.
Using the weak attribute method does appear to be cleaner.  I'll code it up.

Anyone else have a preference?
-- 
Mike Kravetz
