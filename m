Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29D27472F1
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jul 2023 15:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbjGDNmH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jul 2023 09:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjGDNmG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jul 2023 09:42:06 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DBDEE;
        Tue,  4 Jul 2023 06:42:05 -0700 (PDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 364DTXNs022520;
        Tue, 4 Jul 2023 13:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=qnpGbBnDkYYC+z9pQbSW6astkpshRcKvtSylhfCCTXA=;
 b=fLORtZWQOQlqKyEtg1CH2xPIGv/FAMsdkQthxTu+jYJK/Hv7cWQMHgxL9eLo/UC1Xver
 5NdgUWVQrNoH00LYDzPqX1HsxMJIS8A9i+097Z14WbOzXok9+Crl7pytTmGWkKOIsXGY
 v3+1/6GelphpW7Qw/Eqld6l/DzGdqbnOC09Qm/B4VeQ0CzYAPLviQl9hUBa5gIIK4dae
 WyBkgmi8woaflAekSjpQoJ28kIuC5h7Ka4CLVcGnVE0iT6Ev4PH0d+HqFK3Yyvxzi623
 WtK5/6MHI2AEo77w9uIabHeVw4DyJUY6scnPAln5NDe/cTfD/xH5W/ahfRcPNu380iU7 GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmmbpr8q5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 13:40:53 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 364DUHlt024978;
        Tue, 4 Jul 2023 13:40:52 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmmbpr8p9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 13:40:52 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3647Nkqg020313;
        Tue, 4 Jul 2023 13:40:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
        by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rjbddsg6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 13:40:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
        by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 364DejUl19268110
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 4 Jul 2023 13:40:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C987920040;
        Tue,  4 Jul 2023 13:40:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 522B92004F;
        Tue,  4 Jul 2023 13:40:44 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
        by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Tue,  4 Jul 2023 13:40:44 +0000 (GMT)
Date:   Tue, 4 Jul 2023 15:40:43 +0200
From:   Alexander Gordeev <agordeev@linux.ibm.com>
To:     Hugh Dickins <hughd@google.com>
Cc:     Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Yang Shi <shy828301@gmail.com>,
        Mel Gorman <mgorman@techsingularity.net>,
        Peter Xu <peterx@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Steven Price <steven.price@arm.com>,
        SeongJae Park <sj@kernel.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Huang Ying <ying.huang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Zack Rusin <zackr@vmware.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Minchan Kim <minchan@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Song Liu <song@kernel.org>,
        Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Jann Horn <jannh@google.com>,
        Vishal Moola <vishal.moola@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZKQhW2aHJHsnkJhv@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
 <20230628211624.531cdc58@thinkpad-T15>
 <cd7c2851-1440-7220-6c53-16b343b1474@google.com>
 <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
 <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
 <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BtBza05dswPGCwLp6PNd7IQX4Cdszb6T
X-Proofpoint-GUID: ksrVlFb-3Vd1Kbm-HDCPBScRUs9lmkUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_08,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040116
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sat, Jul 01, 2023 at 09:32:38PM -0700, Hugh Dickins wrote:
> On Thu, 29 Jun 2023, Hugh Dickins wrote:

Hi Hugh,

...
> No, not quite the same rules as before: I came to realize that using
> list_add_tail() for the HH pages would be liable to put a page on the
> list which forever blocked reuse of PP list_add_tail() pages after it
> (could be solved by a list_move() somewhere, but we have agreed to
> prefer simplicity).

Just to make things more clear for me: do I understand correctly that this
was an attempt to add HH fragments to pgtable_list from pte_free_defer()?

Thanks!
