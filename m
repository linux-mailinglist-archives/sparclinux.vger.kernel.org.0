Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF361BAB2B
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 19:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgD0R0m (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 13:26:42 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39610 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgD0R0m (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 27 Apr 2020 13:26:42 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03RHNNun032176;
        Mon, 27 Apr 2020 17:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=2uE+mNBlryTX8hj4mQm6UWx/K31ONdvabCMIKOLtOyU=;
 b=xTCYIbf7r5dai610kYmRfslwcsdHMEa6nYuPYmpMy+7WUkM9840zuWRmT2v1MiaH6Cad
 +fYWXCh8PyDfm6g+dIyG7BXcw3P9PeZXXougO6mlOLOylsBzYtMAlZzBzlRJJatu4I9N
 /AveFv2IyJQslCKqyCxuN+21YY9yrbN47PRg98fdwJ2kPrlLeXvj0DTMFDZB9ZWRvRM7
 Ed+D9rxwrxjP3D1PFlRuVFcuOx+bDZYZm4iIaDJw0NmlAZ9XtPZO6joC0Rr+di/qtUTo
 oTv+6hlYH5+uyVoe6FV6yxjUAbpvIRv9bN/idQ6mOzjti7KgZTFrdQJIrHma1+l6CzbV yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 30p2p00ddv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 17:25:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03RHMbqg085782;
        Mon, 27 Apr 2020 17:25:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 30mxpdrdfm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 17:25:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03RHP5vx008462;
        Mon, 27 Apr 2020 17:25:05 GMT
Received: from [192.168.2.157] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Apr 2020 10:25:05 -0700
Subject: Re: [PATCH v3 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To:     Sandipan Das <sandipan.osd@gmail.com>
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
        Randy Dunlap <rdunlap@infradead.org>,
        Mina Almasry <almasrymina@google.com>,
        Peter Xu <peterx@redhat.com>,
        Nitesh Narayan Lal <nitesh@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <20200417185049.275845-3-mike.kravetz@oracle.com>
 <7583dfcc-62d8-2a54-6eef-bcb4e01129b3@gmail.com>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <5a380060-38db-b690-1003-678ca0f28f07@oracle.com>
Date:   Mon, 27 Apr 2020 10:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7583dfcc-62d8-2a54-6eef-bcb4e01129b3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004270142
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 4/26/20 10:04 PM, Sandipan Das wrote:
> Hi Mike,
> 
> On 18/04/20 12:20 am, Mike Kravetz wrote:
>> Now that architectures provide arch_hugetlb_valid_size(), parsing
>> of "hugepagesz=" can be done in architecture independent code.
>> Create a single routine to handle hugepagesz= parsing and remove
>> all arch specific routines.  We can also remove the interface
>> hugetlb_bad_size() as this is no longer used outside arch independent
>> code.
>>
>> This also provides consistent behavior of hugetlbfs command line
>> options.  The hugepagesz= option should only be specified once for
>> a specific size, but some architectures allow multiple instances.
>> This appears to be more of an oversight when code was added by some
>> architectures to set up ALL huge pages sizes.
>>
>> [...]
>>
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>> index de54d2a37830..2c3fa0a7787b 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -589,21 +589,6 @@ static int __init add_huge_page_size(unsigned long long size)
>>  	return 0;
>>  }
>>  
>> -static int __init hugepage_setup_sz(char *str)
>> -{
>> -	unsigned long long size;
>> -
>> -	size = memparse(str, &str);
>> -
>> -	if (add_huge_page_size(size) != 0) {
>> -		hugetlb_bad_size();
>> -		pr_err("Invalid huge page size specified(%llu)\n", size);
>> -	}
>> -
>> -	return 1;
>> -}
>> -__setup("hugepagesz=", hugepage_setup_sz);
>> -
>> [...]
> 
> This isn't working as expected on powerpc64.
> 
>   [    0.000000] Kernel command line: root=UUID=dc7b49cf-95a2-4996-8e7d-7c64ddc7a6ff hugepagesz=16G hugepages=2 
>   [    0.000000] HugeTLB: huge pages not supported, ignoring hugepagesz = 16G
>   [    0.000000] HugeTLB: huge pages not supported, ignoring hugepages = 2
>   [    0.284177] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
>   [    0.284182] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
>   [    2.585062]     hugepagesz=16G
>   [    2.585063]     hugepages=2
> 
> The "huge pages not supported" messages are under a !hugepages_supported()
> condition which checks if HPAGE_SHIFT is non-zero. On powerpc64, HPAGE_SHIFT
> comes from the hpage_shift variable. At this point, it is still zero and yet
> to be set. Hence the check fails. The reason being hugetlbpage_init_default(),
> which sets hpage_shift, it now called after hugepage_setup_sz().

Thanks for catching this Sandipan.

In the new arch independent version of hugepages_setup, I added the following
code in patch 4 off this series:

> +static int __init hugepages_setup(char *s)
>  {
>  	unsigned long *mhp;
>  	static unsigned long *last_mhp;
>  
> +	if (!hugepages_supported()) {
> +		pr_warn("HugeTLB: huge pages not supported, ignoring hugepages = %s\n", s);
> +		return 0;
> +	}
> +
>  	if (!parsed_valid_hugepagesz) {

In fact, I added it to the beginning of all the hugetlb command line parsing
routines.  My 'thought' was to warn early if hugetlb pages were not supported.
Previously, the first check for hugepages_supported() was in hugetlb_init()
which ran after hugetlbpage_init_default().

The easy solution is to remove all the hugepages_supported() checks from
command line parsing routines and rely on the later check in hugetlb_init().

Another reason for adding those early checks was to possibly prevent the
preallocation of gigantic pages at command line parsing time.   Gigantic
pages are allocated at command line parsing time as they need to be allocated
with the bootmem allocator.  My concern is that there could be some strange
configuration where !hugepages_supported(), yet we allocate gigantic pages
from bootmem that can not be used or freeed later.

powerpc is the only architecture which has it's own alloc_bootmem_huge_page
routine.  So, it handles this potential issue.

I'll send out a fix shortly.
-- 
Mike Kravetz
