Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F45E1699A6
	for <lists+sparclinux@lfdr.de>; Sun, 23 Feb 2020 20:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgBWT3y (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 23 Feb 2020 14:29:54 -0500
Received: from foss.arm.com ([217.140.110.172]:51252 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgBWT3y (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sun, 23 Feb 2020 14:29:54 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D692101E;
        Sun, 23 Feb 2020 11:29:54 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 437293F6CF;
        Sun, 23 Feb 2020 11:29:52 -0800 (PST)
From:   Qais Yousef <qais.yousef@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "David S. Miller" <davem@davemloft.net>,
        Juergen Gross <jgross@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        xen-devel@lists.xenproject.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/15] cpu: Add new {add,remove}_cpu() functions
Date:   Sun, 23 Feb 2020 19:29:28 +0000
Message-Id: <20200223192942.18420-2-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223192942.18420-1-qais.yousef@arm.com>
References: <20200223192942.18420-1-qais.yousef@arm.com>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The new functions use device_{online,offline}() which are userspace
safe.

This is in preparation to move cpu_{up, down} kernel users to use
a safer interface that is not racy with userspace.

Suggested-by: "Paul E. McKenney" <paulmck@kernel.org>
Signed-off-by: Qais Yousef <qais.yousef@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Helge Deller <deller@gmx.de>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Juergen Gross <jgross@suse.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: xen-devel@lists.xenproject.org
CC: linux-parisc@vger.kernel.org
CC: sparclinux@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: x86@kernel.org
CC: linux-kernel@vger.kernel.org
---
 include/linux/cpu.h |  2 ++
 kernel/cpu.c        | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 1ca2baf817ed..cf8cf38dca43 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -89,6 +89,7 @@ extern ssize_t arch_cpu_release(const char *, size_t);
 #ifdef CONFIG_SMP
 extern bool cpuhp_tasks_frozen;
 int cpu_up(unsigned int cpu);
+int add_cpu(unsigned int cpu);
 void notify_cpu_starting(unsigned int cpu);
 extern void cpu_maps_update_begin(void);
 extern void cpu_maps_update_done(void);
@@ -118,6 +119,7 @@ extern void cpu_hotplug_disable(void);
 extern void cpu_hotplug_enable(void);
 void clear_tasks_mm_cpumask(int cpu);
 int cpu_down(unsigned int cpu);
+int remove_cpu(unsigned int cpu);
 
 #else /* CONFIG_HOTPLUG_CPU */
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 9c706af713fb..069802f7010f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1057,6 +1057,18 @@ int cpu_down(unsigned int cpu)
 }
 EXPORT_SYMBOL(cpu_down);
 
+int remove_cpu(unsigned int cpu)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = device_offline(get_cpu_device(cpu));
+	unlock_device_hotplug();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(remove_cpu);
+
 #else
 #define takedown_cpu		NULL
 #endif /*CONFIG_HOTPLUG_CPU*/
@@ -1209,6 +1221,18 @@ int cpu_up(unsigned int cpu)
 }
 EXPORT_SYMBOL_GPL(cpu_up);
 
+int add_cpu(unsigned int cpu)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = device_online(get_cpu_device(cpu));
+	unlock_device_hotplug();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(add_cpu);
+
 #ifdef CONFIG_PM_SLEEP_SMP
 static cpumask_var_t frozen_cpus;
 
-- 
2.17.1

