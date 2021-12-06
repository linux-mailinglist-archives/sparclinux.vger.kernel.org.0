Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9B846ABBF
	for <lists+sparclinux@lfdr.de>; Mon,  6 Dec 2021 23:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357928AbhLFWbj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 6 Dec 2021 17:31:39 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:45684 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356945AbhLFWbO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 6 Dec 2021 17:31:14 -0500
Message-ID: <20211206210224.485668098@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1638829663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=72+QGnlfGFYAah1BUmp4cO4oz9eONu1lmUkDHP/6Oes=;
        b=MTZjX5pNCpaLIFSorwc1uUDuJV8DuheJ4/PGRwS1V0RSzJLru3QK+UoDdKktWtJ56DE+pU
        XMpfnvWnX2DR2KWbp528BWcbOq9/jHSo0OnwKIJ8pTjKPXuby1tve6XYSQnjznzx4p1fBU
        w9WdmdFGIspyqZDGRSwYdx6WrLg3PlS+GMjjb4rlRHfSZXzCU3kz76eVMP7TXFSr/bxAqB
        hknvBA5hjCwrysbiAFo8k4a+IMj8BlgkaRUzgsM4eFkl42Z3vu1UzIfASxszOhpin7rnmz
        04sigZF0h+k3QB7F9/sJJGfxNvzCN++bfCAbCCj0/SAXu469vIUDg9AhAd93Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1638829663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=72+QGnlfGFYAah1BUmp4cO4oz9eONu1lmUkDHP/6Oes=;
        b=TNvJwf8MfIZ37eFOPxUxrqpZTcApvnb0v/Ziy52Uyn6Q/lFKZMvbhi8K0X/S9Y8AgRN6JC
        cp1HJaq7RkboAqDA==
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Megha Dey <megha.dey@intel.com>,
        Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
        Cedric Le Goater <clg@kaod.org>,
        Juergen Gross <jgross@suse.com>, x86@kernel.org,
        xen-devel@lists.xenproject.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        sparclinux@vger.kernel.org, ath11k@lists.infradead.org,
        Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org
Subject: [patch V2 12/23] PCI/MSI: Make arch_restore_msi_irqs() less horrible.
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date:   Mon,  6 Dec 2021 23:27:42 +0100 (CET)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Make arch_restore_msi_irqs() return a boolean which indicates whether the
core code should restore the MSI message or not. Get rid of the indirection
in x86.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/pci/pci_irq.c               |    4 +-
 arch/x86/include/asm/x86_init.h       |    6 ---
 arch/x86/include/asm/xen/hypervisor.h |    8 +++++
 arch/x86/kernel/apic/msi.c            |    6 +++
 arch/x86/kernel/x86_init.c            |   12 -------
 arch/x86/pci/xen.c                    |   13 ++++----
 drivers/pci/msi.c                     |   54 +++++++++++-----------------------
 include/linux/msi.h                   |    7 +---
 8 files changed, 45 insertions(+), 65 deletions(-)

--- a/arch/s390/pci/pci_irq.c
+++ b/arch/s390/pci/pci_irq.c
@@ -387,13 +387,13 @@ void arch_teardown_msi_irqs(struct pci_d
 		airq_iv_free(zpci_ibv[0], zdev->msi_first_bit, zdev->msi_nr_irqs);
 }
 
-void arch_restore_msi_irqs(struct pci_dev *pdev)
+bool arch_restore_msi_irqs(struct pci_dev *pdev)
 {
 	struct zpci_dev *zdev = to_zpci(pdev);
 
 	if (!zdev->irqs_registered)
 		zpci_set_irq(zdev);
-	default_restore_msi_irqs(pdev);
+	return true;
 }
 
 static struct airq_struct zpci_airq = {
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -289,12 +289,6 @@ struct x86_platform_ops {
 	struct x86_hyper_runtime hyper;
 };
 
-struct pci_dev;
-
-struct x86_msi_ops {
-	void (*restore_msi_irqs)(struct pci_dev *dev);
-};
-
 struct x86_apic_ops {
 	unsigned int	(*io_apic_read)   (unsigned int apic, unsigned int reg);
 	void		(*restore)(void);
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -57,6 +57,14 @@ static inline bool __init xen_x2apic_par
 }
 #endif
 
+struct pci_dev;
+
+#ifdef CONFIG_XEN_DOM0
+bool xen_initdom_restore_msi(struct pci_dev *dev);
+#else
+static inline bool xen_initdom_restore_msi(struct pci_dev *dev) { return true; }
+#endif
+
 #ifdef CONFIG_HOTPLUG_CPU
 void xen_arch_register_cpu(int num);
 void xen_arch_unregister_cpu(int num);
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -19,6 +19,7 @@
 #include <asm/hw_irq.h>
 #include <asm/apic.h>
 #include <asm/irq_remapping.h>
+#include <asm/xen/hypervisor.h>
 
 struct irq_domain *x86_pci_msi_default_domain __ro_after_init;
 
@@ -345,3 +346,8 @@ void dmar_free_hwirq(int irq)
 	irq_domain_free_irqs(irq, 1);
 }
 #endif
+
+bool arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return xen_initdom_restore_msi(dev);
+}
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -145,18 +145,6 @@ struct x86_platform_ops x86_platform __r
 
 EXPORT_SYMBOL_GPL(x86_platform);
 
-#if defined(CONFIG_PCI_MSI)
-struct x86_msi_ops x86_msi __ro_after_init = {
-	.restore_msi_irqs	= default_restore_msi_irqs,
-};
-
-/* MSI arch specific hooks */
-void arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	x86_msi.restore_msi_irqs(dev);
-}
-#endif
-
 struct x86_apic_ops x86_apic_ops __ro_after_init = {
 	.io_apic_read	= native_io_apic_read,
 	.restore	= native_restore_boot_irq_mode,
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -351,10 +351,13 @@ static int xen_initdom_setup_msi_irqs(st
 	return ret;
 }
 
-static void xen_initdom_restore_msi_irqs(struct pci_dev *dev)
+bool xen_initdom_restore_msi(struct pci_dev *dev)
 {
 	int ret = 0;
 
+	if (!xen_initial_domain())
+		return true;
+
 	if (pci_seg_supported) {
 		struct physdev_pci_device restore_ext;
 
@@ -375,10 +378,10 @@ static void xen_initdom_restore_msi_irqs
 		ret = HYPERVISOR_physdev_op(PHYSDEVOP_restore_msi, &restore);
 		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
 	}
+	return false;
 }
 #else /* CONFIG_XEN_PV_DOM0 */
 #define xen_initdom_setup_msi_irqs	NULL
-#define xen_initdom_restore_msi_irqs	NULL
 #endif /* !CONFIG_XEN_PV_DOM0 */
 
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
@@ -466,12 +469,10 @@ static __init struct irq_domain *xen_cre
 static __init void xen_setup_pci_msi(void)
 {
 	if (xen_pv_domain()) {
-		if (xen_initial_domain()) {
+		if (xen_initial_domain())
 			xen_msi_ops.setup_msi_irqs = xen_initdom_setup_msi_irqs;
-			x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
-		} else {
+		else
 			xen_msi_ops.setup_msi_irqs = xen_setup_msi_irqs;
-		}
 		xen_msi_ops.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_hvm_domain()) {
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -106,29 +106,6 @@ void __weak arch_teardown_msi_irqs(struc
 }
 #endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
-static void default_restore_msi_irq(struct pci_dev *dev, int irq)
-{
-	struct msi_desc *entry;
-
-	entry = NULL;
-	if (dev->msix_enabled) {
-		for_each_pci_msi_entry(entry, dev) {
-			if (irq == entry->irq)
-				break;
-		}
-	} else if (dev->msi_enabled)  {
-		entry = irq_get_msi_desc(irq);
-	}
-
-	if (entry)
-		__pci_write_msi_msg(entry, &entry->msg);
-}
-
-void __weak arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	return default_restore_msi_irqs(dev);
-}
-
 /*
  * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
  * mask all MSI interrupts by clearing the MSI enable bit does not work
@@ -242,14 +219,6 @@ void pci_msi_unmask_irq(struct irq_data
 }
 EXPORT_SYMBOL_GPL(pci_msi_unmask_irq);
 
-void default_restore_msi_irqs(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		default_restore_msi_irq(dev, entry->irq);
-}
-
 void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
 	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
@@ -403,10 +372,19 @@ static void pci_msi_set_enable(struct pc
 	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
 }
 
+/*
+ * Architecture override returns true when the PCI MSI message should be
+ * written by the generic restore function.
+ */
+bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return true;
+}
+
 static void __pci_restore_msi_state(struct pci_dev *dev)
 {
-	u16 control;
 	struct msi_desc *entry;
+	u16 control;
 
 	if (!dev->msi_enabled)
 		return;
@@ -415,7 +393,8 @@ static void __pci_restore_msi_state(stru
 
 	pci_intx_for_msi(dev, 0);
 	pci_msi_set_enable(dev, 0);
-	arch_restore_msi_irqs(dev);
+	if (arch_restore_msi_irqs(dev))
+		__pci_write_msi_msg(entry, &entry->msg);
 
 	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
 	pci_msi_update_mask(entry, 0, 0);
@@ -437,6 +416,7 @@ static void pci_msix_clear_and_set_ctrl(
 static void __pci_restore_msix_state(struct pci_dev *dev)
 {
 	struct msi_desc *entry;
+	bool write_msg;
 
 	if (!dev->msix_enabled)
 		return;
@@ -447,9 +427,13 @@ static void __pci_restore_msix_state(str
 	pci_msix_clear_and_set_ctrl(dev, 0,
 				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
 
-	arch_restore_msi_irqs(dev);
-	for_each_pci_msi_entry(entry, dev)
+	write_msg = arch_restore_msi_irqs(dev);
+
+	for_each_pci_msi_entry(entry, dev) {
+		if (write_msg)
+			__pci_write_msi_msg(entry, &entry->msg);
 		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
+	}
 
 	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
 }
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -273,11 +273,10 @@ static inline void arch_teardown_msi_irq
 #endif
 
 /*
- * The restore hooks are still available as they are useful even
- * for fully irq domain based setups. Courtesy to XEN/X86.
+ * The restore hook is still available even for fully irq domain based
+ * setups. Courtesy to XEN/X86.
  */
-void arch_restore_msi_irqs(struct pci_dev *dev);
-void default_restore_msi_irqs(struct pci_dev *dev);
+bool arch_restore_msi_irqs(struct pci_dev *dev);
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 

