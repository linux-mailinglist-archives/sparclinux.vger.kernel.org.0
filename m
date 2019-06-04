Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF6B342BC
	for <lists+sparclinux@lfdr.de>; Tue,  4 Jun 2019 11:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfFDJKE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 4 Jun 2019 05:10:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48200 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726873AbfFDJKE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 4 Jun 2019 05:10:04 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5497YmG021847
        for <sparclinux@vger.kernel.org>; Tue, 4 Jun 2019 05:10:02 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2swmk13jjy-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <sparclinux@vger.kernel.org>; Tue, 04 Jun 2019 05:10:02 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <sparclinux@vger.kernel.org> from <aneesh.kumar@linux.ibm.com>;
        Tue, 4 Jun 2019 10:10:02 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 4 Jun 2019 10:09:58 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x5499vQ015728696
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 4 Jun 2019 09:09:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 65482AE06D;
        Tue,  4 Jun 2019 09:09:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BC025AE063;
        Tue,  4 Jun 2019 09:09:54 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.234])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  4 Jun 2019 09:09:54 +0000 (GMT)
From:   "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH] mm/mmap: Move common defines to mman-common.h
Date:   Tue,  4 Jun 2019 14:39:50 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060409-0064-0000-0000-000003E974B8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011212; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213036; UDB=6.00637527; IPR=6.00994103;
 MB=3.00027178; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 09:10:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060409-0065-0000-0000-00003DBBE0F9
Message-Id: <20190604090950.31417-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=396 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040061
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Two architecture that use arch specific MMAP flags are powerpc and sparc.
We still have few flag values common across them and other architectures.
Consolidate this in mman-common.h.

Also update the comment to indicate where to find HugeTLB specific reserved
values

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/mman.h   | 6 +-----
 arch/sparc/include/uapi/asm/mman.h     | 6 ------
 include/uapi/asm-generic/mman-common.h | 6 +++++-
 include/uapi/asm-generic/mman.h        | 9 ++++-----
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/mman.h b/arch/powerpc/include/uapi/asm/mman.h
index 65065ce32814..c0c737215b00 100644
--- a/arch/powerpc/include/uapi/asm/mman.h
+++ b/arch/powerpc/include/uapi/asm/mman.h
@@ -21,15 +21,11 @@
 #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 
+
 #define MCL_CURRENT     0x2000          /* lock all currently mapped pages */
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
 #define MCL_ONFAULT	0x8000		/* lock all pages that are faulted in */
 
-#define MAP_POPULATE	0x8000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x10000		/* do not block on IO */
-#define MAP_STACK	0x20000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x40000		/* create a huge page mapping */
-
 /* Override any generic PKEY permission defines */
 #define PKEY_DISABLE_EXECUTE   0x4
 #undef PKEY_ACCESS_MASK
diff --git a/arch/sparc/include/uapi/asm/mman.h b/arch/sparc/include/uapi/asm/mman.h
index f6f99ec65bb3..cec9f4109687 100644
--- a/arch/sparc/include/uapi/asm/mman.h
+++ b/arch/sparc/include/uapi/asm/mman.h
@@ -22,10 +22,4 @@
 #define MCL_FUTURE      0x4000          /* lock all additions to address space */
 #define MCL_ONFAULT	0x8000		/* lock all pages that are faulted in */
 
-#define MAP_POPULATE	0x8000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x10000		/* do not block on IO */
-#define MAP_STACK	0x20000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x40000		/* create a huge page mapping */
-
-
 #endif /* _UAPI__SPARC_MMAN_H__ */
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index bea0278f65ab..ef4623f03156 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -25,7 +25,11 @@
 # define MAP_UNINITIALIZED 0x0		/* Don't support this flag */
 #endif
 
-/* 0x0100 - 0x40000 flags are defined in asm-generic/mman.h */
+/* 0x0100 - 0x4000 flags are defined in asm-generic/mman.h */
+#define MAP_POPULATE		0x008000	/* populate (prefault) pagetables */
+#define MAP_NONBLOCK		0x010000	/* do not block on IO */
+#define MAP_STACK		0x020000	/* give out an address that is best suited for process/thread stacks */
+#define MAP_HUGETLB		0x040000	/* create a huge page mapping */
 #define MAP_SYNC		0x080000 /* perform synchronous page faults for the mapping */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 2dffcbf705b3..57e8195d0b53 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -9,12 +9,11 @@
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 #define MAP_LOCKED	0x2000		/* pages are locked */
 #define MAP_NORESERVE	0x4000		/* don't check for reservations */
-#define MAP_POPULATE	0x8000		/* populate (prefault) pagetables */
-#define MAP_NONBLOCK	0x10000		/* do not block on IO */
-#define MAP_STACK	0x20000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x40000		/* create a huge page mapping */
 
-/* Bits [26:31] are reserved, see mman-common.h for MAP_HUGETLB usage */
+/*
+ * Bits [26:31] are reserved, see asm-generic/hugetlb_encode.h
+ * for MAP_HUGETLB usage
+ */
 
 #define MCL_CURRENT	1		/* lock all current mappings */
 #define MCL_FUTURE	2		/* lock all future mappings */
-- 
2.21.0

