Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E84918A7B8
	for <lists+sparclinux@lfdr.de>; Wed, 18 Mar 2020 23:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgCRWJB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 18 Mar 2020 18:09:01 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:51298 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRWJB (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 18 Mar 2020 18:09:01 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ILx6Gx105391;
        Wed, 18 Mar 2020 22:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=ox5qUf5D6WTBPl3rtmnft5xufOmx+0Hi+IA1Hia8V2k=;
 b=j7RRCoSXNAacP2Bdds6O491TkrTiNOQIhpKAKir7hYE4YlJ8R5R+doFi0DEojOtv5YXd
 YoC2mTGkjKoYJ9jSfBQLMLmFdMHhpY8+ULqmaJs9rXHaz0GEEeWIUzhIqwo0DQzYS7Qy
 LkcKiJ8WrfXBaoxPftbsO9YBUFDsfAZSWtwtCmrl553kTOu/+zjx5CKpSrP6u53wNCG8
 ZDKkD0UlRXN6KRUmggXuXx4btzi6xthw81ykExv6hmWxQX0KaWrjQ8Pnu/s7SXc/xJXY
 IomP50Dc4YOFdKfqFmiNfMKaXX4F9kZrq90uIP9+Vu1nJRbEJP5c+d9Rqb5uA0KZoHJq WQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2yrpprd9m7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Mar 2020 22:06:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ILv9Oq058865;
        Wed, 18 Mar 2020 22:06:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2ys8tuteuj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 Mar 2020 22:06:58 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02IM6vVZ006849;
        Wed, 18 Mar 2020 22:06:57 GMT
Received: from monkey.oracle.com (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 18 Mar 2020 15:06:57 -0700
From:   Mike Kravetz <mike.kravetz@oracle.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Longpeng <longpeng2@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH 4/4] hugetlbfs: clean up command line processing
Date:   Wed, 18 Mar 2020 15:06:34 -0700
Message-Id: <20200318220634.32100-5-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318220634.32100-1-mike.kravetz@oracle.com>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180094
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

With all hugetlb page processing done in a single file clean up code.
- Make code match desired semantics
  - Update documentation with semantics
- Make all warnings and errors messages start with 'HugeTLB:'.
- Consistently name command line parsing routines.
- Add comments to code
  - Describe some of the subtle interactions
  - Describe semantics of command line arguments

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 26 +++++++
 mm/hugetlb.c                                 | 78 +++++++++++++++-----
 2 files changed, 87 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 1cc0bc78d10e..afc8888f33c3 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -100,6 +100,32 @@ with a huge page size selection parameter "hugepagesz=<size>".  <size> must
 be specified in bytes with optional scale suffix [kKmMgG].  The default huge
 page size may be selected with the "default_hugepagesz=<size>" boot parameter.
 
+Hugetlb boot command line parameter semantics
+hugepagesz - Specify a huge page size.  Used in conjunction with hugepages
+	parameter to preallocate a number of huge pages of the specified
+	size.  Hence, hugepagesz and hugepages are typically specified in
+	pairs such as:
+		hugepagesz=2M hugepages=512
+	hugepagesz can only be specified once on the command line for a
+	specific huge page size.  Valid huge page sizes are architecture
+	dependent.
+hugepages - Specify the number of huge pages to preallocate.  This typically
+	follows a valid hugepagesz parameter.  However, if hugepages is the
+	first or only hugetlb command line parameter it specifies the number
+	of huge pages of default size to allocate.  The number of huge pages
+	of default size specified in this manner can be overwritten by a
+	hugepagesz,hugepages parameter pair for the default size.
+	For example, on an architecture with 2M default huge page size:
+		hugepages=256 hugepagesz=2M hugepages=512
+	will result in 512 2M huge pages being allocated.  If a hugepages
+	parameter is preceded by an invalid hugepagesz parameter, it will
+	be ignored.
+default_hugepagesz - Specify the default huge page size.  This parameter can
+	only be specified on the command line.  No other hugetlb command line
+	parameter is associated with default_hugepagesz.  Therefore, it can
+	appear anywhere on the command line.  Valid default huge page size is
+	architecture dependent.
+
 When multiple huge page sizes are supported, ``/proc/sys/vm/nr_hugepages``
 indicates the current number of pre-allocated huge pages of the default size.
 Thus, one can use the following command to dynamically allocate/deallocate
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cc85b4f156ca..2b9bf01db2b6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2954,7 +2954,7 @@ static void __init hugetlb_sysfs_init(void)
 		err = hugetlb_sysfs_add_hstate(h, hugepages_kobj,
 					 hstate_kobjs, &hstate_attr_group);
 		if (err)
-			pr_err("Hugetlb: Unable to add hstate %s", h->name);
+			pr_err("HugeTLB: Unable to add hstate %s", h->name);
 	}
 }
 
@@ -3058,7 +3058,7 @@ static void hugetlb_register_node(struct node *node)
 						nhs->hstate_kobjs,
 						&per_node_hstate_attr_group);
 		if (err) {
-			pr_err("Hugetlb: Unable to add hstate %s for node %d\n",
+			pr_err("HugeTLB: Unable to add hstate %s for node %d\n",
 				h->name, node->dev.id);
 			hugetlb_unregister_node(node);
 			break;
@@ -3109,19 +3109,35 @@ static int __init hugetlb_init(void)
 	if (!hugepages_supported())
 		return 0;
 
-	if (!size_to_hstate(default_hstate_size)) {
-		if (default_hstate_size != 0) {
-			pr_err("HugeTLB: unsupported default_hugepagesz %lu. Reverting to %lu\n",
-			       default_hstate_size, HPAGE_SIZE);
-		}
-
+	/*
+	 * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
+	 * architectures depend on setup being done here.
+	 *
+	 * If a valid default huge page size was specified on the command line,
+	 * add associated hstate if necessary.  If not, set default_hstate_size
+	 * to default size.  default_hstate_idx is used at runtime to identify
+	 * the default huge page size/hstate.
+	 */
+	hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
+	if (default_hstate_size)
+		hugetlb_add_hstate(ilog2(default_hstate_size) - PAGE_SHIFT);
+	else
 		default_hstate_size = HPAGE_SIZE;
-		hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
-	}
 	default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
+
+	/*
+	 * default_hstate_max_huge_pages != 0 indicates a count (hugepages=)
+	 * specified before a size (hugepagesz=).  Use this count for the
+	 * default huge page size, unless a specific value was specified for
+	 * this size in a hugepagesz/hugepages pair.
+	 */
 	if (default_hstate_max_huge_pages) {
 		if (!default_hstate.max_huge_pages)
-			default_hstate.max_huge_pages = default_hstate_max_huge_pages;
+			default_hstate.max_huge_pages =
+				default_hstate_max_huge_pages;
+		else
+			pr_warn("HugeTLB: First hugepages=%lu kB ignored\n",
+				default_hstate_max_huge_pages);
 	}
 
 	hugetlb_init_hstates();
@@ -3174,20 +3190,27 @@ void __init hugetlb_add_hstate(unsigned int order)
 	parsed_hstate = h;
 }
 
-static int __init hugetlb_nrpages_setup(char *s)
+/*
+ * hugepages command line processing
+ * hugepages must normally follows a valid hugepagsz specification.  If not,
+ * ignore the hugepages value.  hugepages can also be the first huge page
+ * command line option in which case it specifies the number of huge pages
+ * for the default size.
+ */
+static int __init hugepages_setup(char *s)
 {
 	unsigned long *mhp;
 	static unsigned long *last_mhp;
 
 	if (!parsed_valid_hugepagesz) {
-		pr_warn("hugepages = %s preceded by "
+		pr_warn("HugeTLB: hugepages = %s preceded by "
 			"an unsupported hugepagesz, ignoring\n", s);
 		parsed_valid_hugepagesz = true;
 		return 1;
 	}
 	/*
-	 * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter yet,
-	 * so this hugepages= parameter goes to the "default hstate".
+	 * !hugetlb_max_hstate means we haven't parsed a hugepagesz= parameter
+	 * yet, so this hugepages= parameter goes to the "default hstate".
 	 */
 	else if (!hugetlb_max_hstate)
 		mhp = &default_hstate_max_huge_pages;
@@ -3195,7 +3218,8 @@ static int __init hugetlb_nrpages_setup(char *s)
 		mhp = &parsed_hstate->max_huge_pages;
 
 	if (mhp == last_mhp) {
-		pr_warn("hugepages= specified twice without interleaving hugepagesz=, ignoring\n");
+		pr_warn("HugeTLB: hugepages= specified twice without interleaving hugepagesz=, ignoring hugepages=%s\n",
+			s);
 		return 1;
 	}
 
@@ -3214,8 +3238,15 @@ static int __init hugetlb_nrpages_setup(char *s)
 
 	return 1;
 }
-__setup("hugepages=", hugetlb_nrpages_setup);
+__setup("hugepages=", hugepages_setup);
 
+/*
+ * hugepagesz command line processing
+ * A specific huge page size can only be specified once with hugepagesz.
+ * hugepagesz is followed by hugepages on the commnad line.  The global
+ * variable 'parsed_valid_hugepagesz' is used to determine if prior
+ * hugepagesz argument was valid.
+ */
 static int __init hugepagesz_setup(char *s)
 {
 	unsigned long long size;
@@ -3230,16 +3261,23 @@ static int __init hugepagesz_setup(char *s)
 	}
 
 	if (size_to_hstate(size)) {
+		parsed_valid_hugepagesz = false;
 		pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n",
 			saved_s);
 		return 0;
 	}
 
+	parsed_valid_hugepagesz = true;
 	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
 	return 1;
 }
 __setup("hugepagesz=", hugepagesz_setup);
 
+/*
+ * default_hugepagesz command line input
+ * Only one instance of default_hugepagesz allowed on command line.  Do not
+ * add hstate here as that will confuse hugepagesz/hugepages processing.
+ */
 static int __init default_hugepagesz_setup(char *s)
 {
 	unsigned long long size;
@@ -3252,6 +3290,12 @@ static int __init default_hugepagesz_setup(char *s)
 		return 0;
 	}
 
+	if (default_hstate_size) {
+		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n",
+			saved_s);
+		return 0;
+	}
+
 	default_hstate_size = size;
 	return 1;
 }
-- 
2.24.1

