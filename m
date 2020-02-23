Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3031699BC
	for <lists+sparclinux@lfdr.de>; Sun, 23 Feb 2020 20:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBWTab (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 23 Feb 2020 14:30:31 -0500
Received: from foss.arm.com ([217.140.110.172]:51422 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727267AbgBWTaI (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sun, 23 Feb 2020 14:30:08 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4526106F;
        Sun, 23 Feb 2020 11:30:07 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D44E3F6CF;
        Sun, 23 Feb 2020 11:30:06 -0800 (PST)
From:   Qais Yousef <qais.yousef@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/15] sparc: Replace cpu_up/down with add/remove_cpu
Date:   Sun, 23 Feb 2020 19:29:36 +0000
Message-Id: <20200223192942.18420-10-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223192942.18420-1-qais.yousef@arm.com>
References: <20200223192942.18420-1-qais.yousef@arm.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The core device API performs extra housekeeping bits that are missing
from directly calling cpu_up/down.

See commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and
serialization during LPM") for an example description of what might go
wrong.

This also prepares to make cpu_up/down a private interface for anything
but the cpu subsystem.

Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Qais Yousef <qais.yousef@arm.com>
CC: "David S. Miller" <davem@davemloft.net>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Bjorn Helgaas <bhelgaas@google.com>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: sparclinux@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---

David, this now uses add/remove_cpu() which you should be CCed on. I wasn't
sure if I can keep your Ack or remove it in this case. Please let me know if
you need more clarification.

 arch/sparc/kernel/ds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/ds.c b/arch/sparc/kernel/ds.c
index bbf59b3b4af8..75232cbd58bf 100644
--- a/arch/sparc/kernel/ds.c
+++ b/arch/sparc/kernel/ds.c
@@ -555,7 +555,7 @@ static int dr_cpu_configure(struct ds_info *dp, struct ds_cap_state *cp,
 
 		printk(KERN_INFO "ds-%llu: Starting cpu %d...\n",
 		       dp->id, cpu);
-		err = cpu_up(cpu);
+		err = add_cpu(cpu);
 		if (err) {
 			__u32 res = DR_CPU_RES_FAILURE;
 			__u32 stat = DR_CPU_STAT_UNCONFIGURED;
@@ -611,7 +611,7 @@ static int dr_cpu_unconfigure(struct ds_info *dp,
 
 		printk(KERN_INFO "ds-%llu: Shutting down cpu %d...\n",
 		       dp->id, cpu);
-		err = cpu_down(cpu);
+		err = remove_cpu(cpu);
 		if (err)
 			dr_cpu_mark(resp, cpu, ncpus,
 				    DR_CPU_RES_FAILURE,
-- 
2.17.1

