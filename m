Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E3EA4290
	for <lists+sparclinux@lfdr.de>; Sat, 31 Aug 2019 08:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbfHaGA7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 31 Aug 2019 02:00:59 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6152 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726963AbfHaGA6 (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 31 Aug 2019 02:00:58 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id BFEA57A68E9CC99D4C43;
        Sat, 31 Aug 2019 14:00:46 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Sat, 31 Aug 2019 14:00:36 +0800
From:   Yunsheng Lin <linyunsheng@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
CC:     <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <nfont@linux.vnet.ibm.com>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v2 7/9] sparc64: numa: check the node id consistently for sparc64
Date:   Sat, 31 Aug 2019 13:58:21 +0800
Message-ID: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
of proximity domain is optional, as below:

This optional object is used to describe proximity domain
associations within a machine. _PXM evaluates to an integer
that identifies a device as belonging to a Proximity Domain
defined in the System Resource Affinity Table (SRAT).

This patch checks node id with the below case before returning
&numa_cpumask_lookup_table[node]:
1. if node_id >= nr_node_ids, return cpu_none_mask
2. if node_id < 0, return cpu_online_mask
3. Since numa_cpumask_lookup_table is not a pointer, a comment
   is added to indicate that

[1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf

Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
---
 arch/sparc/include/asm/topology_64.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
index 34c628a..66a7917 100644
--- a/arch/sparc/include/asm/topology_64.h
+++ b/arch/sparc/include/asm/topology_64.h
@@ -11,9 +11,19 @@ static inline int cpu_to_node(int cpu)
 	return numa_cpu_lookup_table[cpu];
 }
 
-#define cpumask_of_node(node) ((node) == -1 ?				\
-			       cpu_all_mask :				\
-			       &numa_cpumask_lookup_table[node])
+static inline const struct cpumask *cpumask_of_node(int node)
+{
+	if (node >= MAX_NUMNODES)
+		return cpu_none_mask;
+
+	/* numa_cpumask_lookup_table[node] is not a pointer, so
+	 * no need to check for NULL here.
+	 */
+	if (node < 0)
+		return cpu_online_mask;
+
+	return &numa_cpumask_lookup_table[node];
+}
 
 struct pci_bus;
 #ifdef CONFIG_PCI
-- 
2.8.1

