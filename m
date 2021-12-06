Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B105546ABBB
	for <lists+sparclinux@lfdr.de>; Mon,  6 Dec 2021 23:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357858AbhLFWbh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 6 Dec 2021 17:31:37 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:45658 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356734AbhLFWbU (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 6 Dec 2021 17:31:20 -0500
Message-ID: <20211206210224.655043033@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1638829669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=hpRKFVK8c6sDVWghKmB03eN3IVYFpF158rP8c0DN+zU=;
        b=DD7Z+qzS1P/gjNNk2znBKgd9uRGSqVR88yvssnFC0CZU/afuXistxfer8K0hwXIoB1c4Jn
        PqRrEAglAqx367yBrLe6dup6ML0/Id/g9Ml0/rdwgF1xSYCegVtQCz7W3sUZ0ffbFQ2DJn
        /lj6lp1L1s3O5iAnCOo6SpNl5SAcpT1t5/bUm/1Tuo2g2WeUKVYgK2cFKSl+DAquVOKovj
        6K0NSK5RUuvpJ+E4VaPJ7BMrc3L4ka5XNf7kc+g9QTNbi9fHQ0tRV7tqx7g7xh1c4NYYMw
        q80yD/5r4rTIjRE+pFImF2AtyTutmLOm8jVVOo4zggySWH9XUTdZwWs4NL56mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1638829669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=hpRKFVK8c6sDVWghKmB03eN3IVYFpF158rP8c0DN+zU=;
        b=J/QydmuG4kUWmq0qp7FRGdfW6TFqRC4+PJUo1op2aZStVi39MK/MNRVQ3vj1evJCECiHKX
        YSFYnk5fQDetOUCw==
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Megha Dey <megha.dey@intel.com>,
        Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
        Cedric Le Goater <clg@kaod.org>,
        Juergen Gross <jgross@suse.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        sparclinux@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
        Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 15/23] PCI/MSI: Move code into a separate directory
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date:   Mon,  6 Dec 2021 23:27:47 +0100 (CET)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

msi.c is getting larger and really could do with a splitup. Move it into
it's own directory to prepare for that.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 Documentation/driver-api/pci/pci.rst |    2 
 drivers/pci/Makefile                 |    3 
 drivers/pci/msi.c                    | 1532 -----------------------------------
 drivers/pci/msi/Makefile             |    4 
 drivers/pci/msi/msi.c                | 1532 +++++++++++++++++++++++++++++++++++
 5 files changed, 1539 insertions(+), 1534 deletions(-)

--- a/Documentation/driver-api/pci/pci.rst
+++ b/Documentation/driver-api/pci/pci.rst
@@ -13,7 +13,7 @@ PCI Support Library
 .. kernel-doc:: drivers/pci/search.c
    :export:
 
-.. kernel-doc:: drivers/pci/msi.c
+.. kernel-doc:: drivers/pci/msi/msi.c
    :export:
 
 .. kernel-doc:: drivers/pci/bus.c
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -5,8 +5,9 @@
 obj-$(CONFIG_PCI)		+= access.o bus.o probe.o host-bridge.o \
 				   remove.o pci.o pci-driver.o search.o \
 				   pci-sysfs.o rom.o setup-res.o irq.o vpd.o \
-				   setup-bus.o vc.o mmap.o setup-irq.o msi.o
+				   setup-bus.o vc.o mmap.o setup-irq.o
 
+obj-$(CONFIG_PCI)		+= msi/
 obj-$(CONFIG_PCI)		+= pcie/
 
 ifdef CONFIG_PCI
--- a/drivers/pci/msi.c
+++ /dev/null
@@ -1,1532 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * PCI Message Signaled Interrupt (MSI)
- *
- * Copyright (C) 2003-2004 Intel
- * Copyright (C) Tom Long Nguyen (tom.l.nguyen@intel.com)
- * Copyright (C) 2016 Christoph Hellwig.
- */
-
-#include <linux/acpi_iort.h>
-#include <linux/err.h>
-#include <linux/export.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/msi.h>
-#include <linux/of_irq.h>
-#include <linux/pci.h>
-
-#include "pci.h"
-
-#ifdef CONFIG_PCI_MSI
-
-static int pci_msi_enable = 1;
-int pci_msi_ignore_mask;
-
-#define msix_table_size(flags)	((flags & PCI_MSIX_FLAGS_QSIZE) + 1)
-
-#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
-static int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct irq_domain *domain;
-
-	domain = dev_get_msi_domain(&dev->dev);
-	if (domain && irq_domain_is_hierarchy(domain))
-		return msi_domain_alloc_irqs(domain, &dev->dev, nvec);
-
-	return arch_setup_msi_irqs(dev, nvec, type);
-}
-
-static void pci_msi_teardown_msi_irqs(struct pci_dev *dev)
-{
-	struct irq_domain *domain;
-
-	domain = dev_get_msi_domain(&dev->dev);
-	if (domain && irq_domain_is_hierarchy(domain))
-		msi_domain_free_irqs(domain, &dev->dev);
-	else
-		arch_teardown_msi_irqs(dev);
-}
-#else
-#define pci_msi_setup_msi_irqs		arch_setup_msi_irqs
-#define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
-#endif
-
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
-/* Arch hooks */
-int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
-{
-	return -EINVAL;
-}
-
-void __weak arch_teardown_msi_irq(unsigned int irq)
-{
-}
-
-int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	int i;
-	struct msi_desc *entry;
-
-	for_each_pci_msi_entry(entry, dev)
-		if (entry->irq)
-			for (i = 0; i < entry->nvec_used; i++)
-				arch_teardown_msi_irq(entry->irq + i);
-}
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
-
-/*
- * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
- * mask all MSI interrupts by clearing the MSI enable bit does not work
- * reliably as devices without an INTx disable bit will then generate a
- * level IRQ which will never be cleared.
- */
-static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
-{
-	/* Don't shift by >= width of type */
-	if (desc->pci.msi_attrib.multi_cap >= 5)
-		return 0xffffffff;
-	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
-}
-
-static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
-{
-	raw_spinlock_t *lock = &desc->dev->msi_lock;
-	unsigned long flags;
-
-	if (!desc->pci.msi_attrib.can_mask)
-		return;
-
-	raw_spin_lock_irqsave(lock, flags);
-	desc->pci.msi_mask &= ~clear;
-	desc->pci.msi_mask |= set;
-	pci_write_config_dword(msi_desc_to_pci_dev(desc), desc->pci.mask_pos,
-			       desc->pci.msi_mask);
-	raw_spin_unlock_irqrestore(lock, flags);
-}
-
-static inline void pci_msi_mask(struct msi_desc *desc, u32 mask)
-{
-	pci_msi_update_mask(desc, 0, mask);
-}
-
-static inline void pci_msi_unmask(struct msi_desc *desc, u32 mask)
-{
-	pci_msi_update_mask(desc, mask, 0);
-}
-
-static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
-{
-	return desc->pci.mask_base + desc->pci.msi_attrib.entry_nr * PCI_MSIX_ENTRY_SIZE;
-}
-
-/*
- * This internal function does not flush PCI writes to the device.  All
- * users must ensure that they read from the device before either assuming
- * that the device state is up to date, or returning out of this file.
- * It does not affect the msi_desc::msix_ctrl cache either. Use with care!
- */
-static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
-{
-	void __iomem *desc_addr = pci_msix_desc_addr(desc);
-
-	if (desc->pci.msi_attrib.can_mask)
-		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
-}
-
-static inline void pci_msix_mask(struct msi_desc *desc)
-{
-	desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
-	/* Flush write to device */
-	readl(desc->pci.mask_base);
-}
-
-static inline void pci_msix_unmask(struct msi_desc *desc)
-{
-	desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
-}
-
-static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
-{
-	if (desc->pci.msi_attrib.is_msix)
-		pci_msix_mask(desc);
-	else
-		pci_msi_mask(desc, mask);
-}
-
-static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
-{
-	if (desc->pci.msi_attrib.is_msix)
-		pci_msix_unmask(desc);
-	else
-		pci_msi_unmask(desc, mask);
-}
-
-/**
- * pci_msi_mask_irq - Generic IRQ chip callback to mask PCI/MSI interrupts
- * @data:	pointer to irqdata associated to that interrupt
- */
-void pci_msi_mask_irq(struct irq_data *data)
-{
-	struct msi_desc *desc = irq_data_get_msi_desc(data);
-
-	__pci_msi_mask_desc(desc, BIT(data->irq - desc->irq));
-}
-EXPORT_SYMBOL_GPL(pci_msi_mask_irq);
-
-/**
- * pci_msi_unmask_irq - Generic IRQ chip callback to unmask PCI/MSI interrupts
- * @data:	pointer to irqdata associated to that interrupt
- */
-void pci_msi_unmask_irq(struct irq_data *data)
-{
-	struct msi_desc *desc = irq_data_get_msi_desc(data);
-
-	__pci_msi_unmask_desc(desc, BIT(data->irq - desc->irq));
-}
-EXPORT_SYMBOL_GPL(pci_msi_unmask_irq);
-
-void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
-{
-	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
-
-	BUG_ON(dev->current_state != PCI_D0);
-
-	if (entry->pci.msi_attrib.is_msix) {
-		void __iomem *base = pci_msix_desc_addr(entry);
-
-		if (WARN_ON_ONCE(entry->pci.msi_attrib.is_virtual))
-			return;
-
-		msg->address_lo = readl(base + PCI_MSIX_ENTRY_LOWER_ADDR);
-		msg->address_hi = readl(base + PCI_MSIX_ENTRY_UPPER_ADDR);
-		msg->data = readl(base + PCI_MSIX_ENTRY_DATA);
-	} else {
-		int pos = dev->msi_cap;
-		u16 data;
-
-		pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
-				      &msg->address_lo);
-		if (entry->pci.msi_attrib.is_64) {
-			pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
-					      &msg->address_hi);
-			pci_read_config_word(dev, pos + PCI_MSI_DATA_64, &data);
-		} else {
-			msg->address_hi = 0;
-			pci_read_config_word(dev, pos + PCI_MSI_DATA_32, &data);
-		}
-		msg->data = data;
-	}
-}
-
-void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
-{
-	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
-
-	if (dev->current_state != PCI_D0 || pci_dev_is_disconnected(dev)) {
-		/* Don't touch the hardware now */
-	} else if (entry->pci.msi_attrib.is_msix) {
-		void __iomem *base = pci_msix_desc_addr(entry);
-		u32 ctrl = entry->pci.msix_ctrl;
-		bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);
-
-		if (entry->pci.msi_attrib.is_virtual)
-			goto skip;
-
-		/*
-		 * The specification mandates that the entry is masked
-		 * when the message is modified:
-		 *
-		 * "If software changes the Address or Data value of an
-		 * entry while the entry is unmasked, the result is
-		 * undefined."
-		 */
-		if (unmasked)
-			pci_msix_write_vector_ctrl(entry, ctrl | PCI_MSIX_ENTRY_CTRL_MASKBIT);
-
-		writel(msg->address_lo, base + PCI_MSIX_ENTRY_LOWER_ADDR);
-		writel(msg->address_hi, base + PCI_MSIX_ENTRY_UPPER_ADDR);
-		writel(msg->data, base + PCI_MSIX_ENTRY_DATA);
-
-		if (unmasked)
-			pci_msix_write_vector_ctrl(entry, ctrl);
-
-		/* Ensure that the writes are visible in the device */
-		readl(base + PCI_MSIX_ENTRY_DATA);
-	} else {
-		int pos = dev->msi_cap;
-		u16 msgctl;
-
-		pci_read_config_word(dev, pos + PCI_MSI_FLAGS, &msgctl);
-		msgctl &= ~PCI_MSI_FLAGS_QSIZE;
-		msgctl |= entry->pci.msi_attrib.multiple << 4;
-		pci_write_config_word(dev, pos + PCI_MSI_FLAGS, msgctl);
-
-		pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
-				       msg->address_lo);
-		if (entry->pci.msi_attrib.is_64) {
-			pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
-					       msg->address_hi);
-			pci_write_config_word(dev, pos + PCI_MSI_DATA_64,
-					      msg->data);
-		} else {
-			pci_write_config_word(dev, pos + PCI_MSI_DATA_32,
-					      msg->data);
-		}
-		/* Ensure that the writes are visible in the device */
-		pci_read_config_word(dev, pos + PCI_MSI_FLAGS, &msgctl);
-	}
-
-skip:
-	entry->msg = *msg;
-
-	if (entry->write_msi_msg)
-		entry->write_msi_msg(entry, entry->write_msi_msg_data);
-
-}
-
-void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
-{
-	struct msi_desc *entry = irq_get_msi_desc(irq);
-
-	__pci_write_msi_msg(entry, msg);
-}
-EXPORT_SYMBOL_GPL(pci_write_msi_msg);
-
-static void free_msi_irqs(struct pci_dev *dev)
-{
-	struct list_head *msi_list = dev_to_msi_list(&dev->dev);
-	struct msi_desc *entry, *tmp;
-	int i;
-
-	for_each_pci_msi_entry(entry, dev)
-		if (entry->irq)
-			for (i = 0; i < entry->nvec_used; i++)
-				BUG_ON(irq_has_action(entry->irq + i));
-
-	if (dev->msi_irq_groups) {
-		msi_destroy_sysfs(&dev->dev, dev->msi_irq_groups);
-		dev->msi_irq_groups = NULL;
-	}
-
-	pci_msi_teardown_msi_irqs(dev);
-
-	list_for_each_entry_safe(entry, tmp, msi_list, list) {
-		if (entry->pci.msi_attrib.is_msix) {
-			if (list_is_last(&entry->list, msi_list))
-				iounmap(entry->pci.mask_base);
-		}
-
-		list_del(&entry->list);
-		free_msi_entry(entry);
-	}
-}
-
-static void pci_intx_for_msi(struct pci_dev *dev, int enable)
-{
-	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
-		pci_intx(dev, enable);
-}
-
-static void pci_msi_set_enable(struct pci_dev *dev, int enable)
-{
-	u16 control;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
-	control &= ~PCI_MSI_FLAGS_ENABLE;
-	if (enable)
-		control |= PCI_MSI_FLAGS_ENABLE;
-	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
-}
-
-/*
- * Architecture override returns true when the PCI MSI message should be
- * written by the generic restore function.
- */
-bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
-{
-	return true;
-}
-
-static void __pci_restore_msi_state(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-	u16 control;
-
-	if (!dev->msi_enabled)
-		return;
-
-	entry = irq_get_msi_desc(dev->irq);
-
-	pci_intx_for_msi(dev, 0);
-	pci_msi_set_enable(dev, 0);
-	if (arch_restore_msi_irqs(dev))
-		__pci_write_msi_msg(entry, &entry->msg);
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
-	pci_msi_update_mask(entry, 0, 0);
-	control &= ~PCI_MSI_FLAGS_QSIZE;
-	control |= (entry->pci.msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
-	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
-}
-
-static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
-{
-	u16 ctrl;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
-	ctrl &= ~clear;
-	ctrl |= set;
-	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
-}
-
-static void __pci_restore_msix_state(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-	bool write_msg;
-
-	if (!dev->msix_enabled)
-		return;
-	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
-
-	/* route the table */
-	pci_intx_for_msi(dev, 0);
-	pci_msix_clear_and_set_ctrl(dev, 0,
-				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
-
-	write_msg = arch_restore_msi_irqs(dev);
-
-	for_each_pci_msi_entry(entry, dev) {
-		if (write_msg)
-			__pci_write_msi_msg(entry, &entry->msg);
-		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
-	}
-
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
-}
-
-void pci_restore_msi_state(struct pci_dev *dev)
-{
-	__pci_restore_msi_state(dev);
-	__pci_restore_msix_state(dev);
-}
-EXPORT_SYMBOL_GPL(pci_restore_msi_state);
-
-static struct msi_desc *
-msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
-{
-	struct irq_affinity_desc *masks = NULL;
-	struct msi_desc *entry;
-	u16 control;
-
-	if (affd)
-		masks = irq_create_affinity_masks(nvec, affd);
-
-	/* MSI Entry Initialization */
-	entry = alloc_msi_entry(&dev->dev, nvec, masks);
-	if (!entry)
-		goto out;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
-	/* Lies, damned lies, and MSIs */
-	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
-		control |= PCI_MSI_FLAGS_MASKBIT;
-
-	entry->pci.msi_attrib.is_msix	= 0;
-	entry->pci.msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
-	entry->pci.msi_attrib.is_virtual    = 0;
-	entry->pci.msi_attrib.entry_nr	= 0;
-	entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
-					  !!(control & PCI_MSI_FLAGS_MASKBIT);
-	entry->pci.msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
-	entry->pci.msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
-	entry->pci.msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
-
-	if (control & PCI_MSI_FLAGS_64BIT)
-		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
-	else
-		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
-
-	/* Save the initial mask status */
-	if (entry->pci.msi_attrib.can_mask)
-		pci_read_config_dword(dev, entry->pci.mask_pos, &entry->pci.msi_mask);
-
-out:
-	kfree(masks);
-	return entry;
-}
-
-static int msi_verify_entries(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-
-	if (!dev->no_64bit_msi)
-		return 0;
-
-	for_each_pci_msi_entry(entry, dev) {
-		if (entry->msg.address_hi) {
-			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
-				entry->msg.address_hi, entry->msg.address_lo);
-			return -EIO;
-		}
-	}
-	return 0;
-}
-
-/**
- * msi_capability_init - configure device's MSI capability structure
- * @dev: pointer to the pci_dev data structure of MSI device function
- * @nvec: number of interrupts to allocate
- * @affd: description of automatic IRQ affinity assignments (may be %NULL)
- *
- * Setup the MSI capability structure of the device with the requested
- * number of interrupts.  A return value of zero indicates the successful
- * setup of an entry with the new MSI IRQ.  A negative return value indicates
- * an error, and a positive return value indicates the number of interrupts
- * which could have been allocated.
- */
-static int msi_capability_init(struct pci_dev *dev, int nvec,
-			       struct irq_affinity *affd)
-{
-	const struct attribute_group **groups;
-	struct msi_desc *entry;
-	int ret;
-
-	pci_msi_set_enable(dev, 0);	/* Disable MSI during set up */
-
-	entry = msi_setup_entry(dev, nvec, affd);
-	if (!entry)
-		return -ENOMEM;
-
-	/* All MSIs are unmasked by default; mask them all */
-	pci_msi_mask(entry, msi_multi_mask(entry));
-
-	list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
-
-	/* Configure MSI capability structure */
-	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSI);
-	if (ret)
-		goto err;
-
-	ret = msi_verify_entries(dev);
-	if (ret)
-		goto err;
-
-	groups = msi_populate_sysfs(&dev->dev);
-	if (IS_ERR(groups)) {
-		ret = PTR_ERR(groups);
-		goto err;
-	}
-
-	dev->msi_irq_groups = groups;
-
-	/* Set MSI enabled bits	*/
-	pci_intx_for_msi(dev, 0);
-	pci_msi_set_enable(dev, 1);
-	dev->msi_enabled = 1;
-
-	pcibios_free_irq(dev);
-	dev->irq = entry->irq;
-	return 0;
-
-err:
-	pci_msi_unmask(entry, msi_multi_mask(entry));
-	free_msi_irqs(dev);
-	return ret;
-}
-
-static void __iomem *msix_map_region(struct pci_dev *dev,
-				     unsigned int nr_entries)
-{
-	resource_size_t phys_addr;
-	u32 table_offset;
-	unsigned long flags;
-	u8 bir;
-
-	pci_read_config_dword(dev, dev->msix_cap + PCI_MSIX_TABLE,
-			      &table_offset);
-	bir = (u8)(table_offset & PCI_MSIX_TABLE_BIR);
-	flags = pci_resource_flags(dev, bir);
-	if (!flags || (flags & IORESOURCE_UNSET))
-		return NULL;
-
-	table_offset &= PCI_MSIX_TABLE_OFFSET;
-	phys_addr = pci_resource_start(dev, bir) + table_offset;
-
-	return ioremap(phys_addr, nr_entries * PCI_MSIX_ENTRY_SIZE);
-}
-
-static int msix_setup_entries(struct pci_dev *dev, void __iomem *base,
-			      struct msix_entry *entries, int nvec,
-			      struct irq_affinity *affd)
-{
-	struct irq_affinity_desc *curmsk, *masks = NULL;
-	struct msi_desc *entry;
-	void __iomem *addr;
-	int ret, i;
-	int vec_count = pci_msix_vec_count(dev);
-
-	if (affd)
-		masks = irq_create_affinity_masks(nvec, affd);
-
-	for (i = 0, curmsk = masks; i < nvec; i++) {
-		entry = alloc_msi_entry(&dev->dev, 1, curmsk);
-		if (!entry) {
-			if (!i)
-				iounmap(base);
-			else
-				free_msi_irqs(dev);
-			/* No enough memory. Don't try again */
-			ret = -ENOMEM;
-			goto out;
-		}
-
-		entry->pci.msi_attrib.is_msix	= 1;
-		entry->pci.msi_attrib.is_64	= 1;
-
-		if (entries)
-			entry->pci.msi_attrib.entry_nr = entries[i].entry;
-		else
-			entry->pci.msi_attrib.entry_nr = i;
-
-		entry->pci.msi_attrib.is_virtual =
-			entry->pci.msi_attrib.entry_nr >= vec_count;
-
-		entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
-						  !entry->pci.msi_attrib.is_virtual;
-
-		entry->pci.msi_attrib.default_irq	= dev->irq;
-		entry->pci.mask_base			= base;
-
-		if (entry->pci.msi_attrib.can_mask) {
-			addr = pci_msix_desc_addr(entry);
-			entry->pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
-		}
-
-		list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
-		if (masks)
-			curmsk++;
-	}
-	ret = 0;
-out:
-	kfree(masks);
-	return ret;
-}
-
-static void msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
-{
-	struct msi_desc *entry;
-
-	if (entries) {
-		for_each_pci_msi_entry(entry, dev) {
-			entries->vector = entry->irq;
-			entries++;
-		}
-	}
-}
-
-static void msix_mask_all(void __iomem *base, int tsize)
-{
-	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
-	int i;
-
-	if (pci_msi_ignore_mask)
-		return;
-
-	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
-		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
-}
-
-/**
- * msix_capability_init - configure device's MSI-X capability
- * @dev: pointer to the pci_dev data structure of MSI-X device function
- * @entries: pointer to an array of struct msix_entry entries
- * @nvec: number of @entries
- * @affd: Optional pointer to enable automatic affinity assignment
- *
- * Setup the MSI-X capability structure of device function with a
- * single MSI-X IRQ. A return of zero indicates the successful setup of
- * requested MSI-X entries with allocated IRQs or non-zero for otherwise.
- **/
-static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
-				int nvec, struct irq_affinity *affd)
-{
-	const struct attribute_group **groups;
-	void __iomem *base;
-	int ret, tsize;
-	u16 control;
-
-	/*
-	 * Some devices require MSI-X to be enabled before the MSI-X
-	 * registers can be accessed.  Mask all the vectors to prevent
-	 * interrupts coming in before they're fully set up.
-	 */
-	pci_msix_clear_and_set_ctrl(dev, 0, PCI_MSIX_FLAGS_MASKALL |
-				    PCI_MSIX_FLAGS_ENABLE);
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
-	/* Request & Map MSI-X table region */
-	tsize = msix_table_size(control);
-	base = msix_map_region(dev, tsize);
-	if (!base) {
-		ret = -ENOMEM;
-		goto out_disable;
-	}
-
-	/* Ensure that all table entries are masked. */
-	msix_mask_all(base, tsize);
-
-	ret = msix_setup_entries(dev, base, entries, nvec, affd);
-	if (ret)
-		goto out_disable;
-
-	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
-	if (ret)
-		goto out_avail;
-
-	/* Check if all MSI entries honor device restrictions */
-	ret = msi_verify_entries(dev);
-	if (ret)
-		goto out_free;
-
-	msix_update_entries(dev, entries);
-
-	groups = msi_populate_sysfs(&dev->dev);
-	if (IS_ERR(groups)) {
-		ret = PTR_ERR(groups);
-		goto out_free;
-	}
-
-	dev->msi_irq_groups = groups;
-
-	/* Set MSI-X enabled bits and unmask the function */
-	pci_intx_for_msi(dev, 0);
-	dev->msix_enabled = 1;
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
-
-	pcibios_free_irq(dev);
-	return 0;
-
-out_avail:
-	if (ret < 0) {
-		/*
-		 * If we had some success, report the number of IRQs
-		 * we succeeded in setting up.
-		 */
-		struct msi_desc *entry;
-		int avail = 0;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->irq != 0)
-				avail++;
-		}
-		if (avail != 0)
-			ret = avail;
-	}
-
-out_free:
-	free_msi_irqs(dev);
-
-out_disable:
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
-
-	return ret;
-}
-
-/**
- * pci_msi_supported - check whether MSI may be enabled on a device
- * @dev: pointer to the pci_dev data structure of MSI device function
- * @nvec: how many MSIs have been requested?
- *
- * Look at global flags, the device itself, and its parent buses
- * to determine if MSI/-X are supported for the device. If MSI/-X is
- * supported return 1, else return 0.
- **/
-static int pci_msi_supported(struct pci_dev *dev, int nvec)
-{
-	struct pci_bus *bus;
-
-	/* MSI must be globally enabled and supported by the device */
-	if (!pci_msi_enable)
-		return 0;
-
-	if (!dev || dev->no_msi)
-		return 0;
-
-	/*
-	 * You can't ask to have 0 or less MSIs configured.
-	 *  a) it's stupid ..
-	 *  b) the list manipulation code assumes nvec >= 1.
-	 */
-	if (nvec < 1)
-		return 0;
-
-	/*
-	 * Any bridge which does NOT route MSI transactions from its
-	 * secondary bus to its primary bus must set NO_MSI flag on
-	 * the secondary pci_bus.
-	 *
-	 * The NO_MSI flag can either be set directly by:
-	 * - arch-specific PCI host bus controller drivers (deprecated)
-	 * - quirks for specific PCI bridges
-	 *
-	 * or indirectly by platform-specific PCI host bridge drivers by
-	 * advertising the 'msi_domain' property, which results in
-	 * the NO_MSI flag when no MSI domain is found for this bridge
-	 * at probe time.
-	 */
-	for (bus = dev->bus; bus; bus = bus->parent)
-		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
-			return 0;
-
-	return 1;
-}
-
-/**
- * pci_msi_vec_count - Return the number of MSI vectors a device can send
- * @dev: device to report about
- *
- * This function returns the number of MSI vectors a device requested via
- * Multiple Message Capable register. It returns a negative errno if the
- * device is not capable sending MSI interrupts. Otherwise, the call succeeds
- * and returns a power of two, up to a maximum of 2^5 (32), according to the
- * MSI specification.
- **/
-int pci_msi_vec_count(struct pci_dev *dev)
-{
-	int ret;
-	u16 msgctl;
-
-	if (!dev->msi_cap)
-		return -EINVAL;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &msgctl);
-	ret = 1 << ((msgctl & PCI_MSI_FLAGS_QMASK) >> 1);
-
-	return ret;
-}
-EXPORT_SYMBOL(pci_msi_vec_count);
-
-static void pci_msi_shutdown(struct pci_dev *dev)
-{
-	struct msi_desc *desc;
-
-	if (!pci_msi_enable || !dev || !dev->msi_enabled)
-		return;
-
-	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
-	desc = first_pci_msi_entry(dev);
-
-	pci_msi_set_enable(dev, 0);
-	pci_intx_for_msi(dev, 1);
-	dev->msi_enabled = 0;
-
-	/* Return the device with MSI unmasked as initial states */
-	pci_msi_unmask(desc, msi_multi_mask(desc));
-
-	/* Restore dev->irq to its default pin-assertion IRQ */
-	dev->irq = desc->pci.msi_attrib.default_irq;
-	pcibios_alloc_irq(dev);
-}
-
-void pci_disable_msi(struct pci_dev *dev)
-{
-	if (!pci_msi_enable || !dev || !dev->msi_enabled)
-		return;
-
-	pci_msi_shutdown(dev);
-	free_msi_irqs(dev);
-}
-EXPORT_SYMBOL(pci_disable_msi);
-
-/**
- * pci_msix_vec_count - return the number of device's MSI-X table entries
- * @dev: pointer to the pci_dev data structure of MSI-X device function
- * This function returns the number of device's MSI-X table entries and
- * therefore the number of MSI-X vectors device is capable of sending.
- * It returns a negative errno if the device is not capable of sending MSI-X
- * interrupts.
- **/
-int pci_msix_vec_count(struct pci_dev *dev)
-{
-	u16 control;
-
-	if (!dev->msix_cap)
-		return -EINVAL;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
-	return msix_table_size(control);
-}
-EXPORT_SYMBOL(pci_msix_vec_count);
-
-static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
-			     int nvec, struct irq_affinity *affd, int flags)
-{
-	int nr_entries;
-	int i, j;
-
-	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
-		return -EINVAL;
-
-	nr_entries = pci_msix_vec_count(dev);
-	if (nr_entries < 0)
-		return nr_entries;
-	if (nvec > nr_entries && !(flags & PCI_IRQ_VIRTUAL))
-		return nr_entries;
-
-	if (entries) {
-		/* Check for any invalid entries */
-		for (i = 0; i < nvec; i++) {
-			if (entries[i].entry >= nr_entries)
-				return -EINVAL;		/* invalid entry */
-			for (j = i + 1; j < nvec; j++) {
-				if (entries[i].entry == entries[j].entry)
-					return -EINVAL;	/* duplicate entry */
-			}
-		}
-	}
-
-	/* Check whether driver already requested for MSI IRQ */
-	if (dev->msi_enabled) {
-		pci_info(dev, "can't enable MSI-X (MSI IRQ already assigned)\n");
-		return -EINVAL;
-	}
-	return msix_capability_init(dev, entries, nvec, affd);
-}
-
-static void pci_msix_shutdown(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-
-	if (!pci_msi_enable || !dev || !dev->msix_enabled)
-		return;
-
-	if (pci_dev_is_disconnected(dev)) {
-		dev->msix_enabled = 0;
-		return;
-	}
-
-	/* Return the device with MSI-X masked as initial states */
-	for_each_pci_msi_entry(entry, dev)
-		pci_msix_mask(entry);
-
-	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
-	pci_intx_for_msi(dev, 1);
-	dev->msix_enabled = 0;
-	pcibios_alloc_irq(dev);
-}
-
-void pci_disable_msix(struct pci_dev *dev)
-{
-	if (!pci_msi_enable || !dev || !dev->msix_enabled)
-		return;
-
-	pci_msix_shutdown(dev);
-	free_msi_irqs(dev);
-}
-EXPORT_SYMBOL(pci_disable_msix);
-
-void pci_no_msi(void)
-{
-	pci_msi_enable = 0;
-}
-
-/**
- * pci_msi_enabled - is MSI enabled?
- *
- * Returns true if MSI has not been disabled by the command-line option
- * pci=nomsi.
- **/
-int pci_msi_enabled(void)
-{
-	return pci_msi_enable;
-}
-EXPORT_SYMBOL(pci_msi_enabled);
-
-static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
-				  struct irq_affinity *affd)
-{
-	int nvec;
-	int rc;
-
-	if (!pci_msi_supported(dev, minvec) || dev->current_state != PCI_D0)
-		return -EINVAL;
-
-	/* Check whether driver already requested MSI-X IRQs */
-	if (dev->msix_enabled) {
-		pci_info(dev, "can't enable MSI (MSI-X already enabled)\n");
-		return -EINVAL;
-	}
-
-	if (maxvec < minvec)
-		return -ERANGE;
-
-	if (WARN_ON_ONCE(dev->msi_enabled))
-		return -EINVAL;
-
-	nvec = pci_msi_vec_count(dev);
-	if (nvec < 0)
-		return nvec;
-	if (nvec < minvec)
-		return -ENOSPC;
-
-	if (nvec > maxvec)
-		nvec = maxvec;
-
-	for (;;) {
-		if (affd) {
-			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
-			if (nvec < minvec)
-				return -ENOSPC;
-		}
-
-		rc = msi_capability_init(dev, nvec, affd);
-		if (rc == 0)
-			return nvec;
-
-		if (rc < 0)
-			return rc;
-		if (rc < minvec)
-			return -ENOSPC;
-
-		nvec = rc;
-	}
-}
-
-/* deprecated, don't use */
-int pci_enable_msi(struct pci_dev *dev)
-{
-	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
-	if (rc < 0)
-		return rc;
-	return 0;
-}
-EXPORT_SYMBOL(pci_enable_msi);
-
-static int __pci_enable_msix_range(struct pci_dev *dev,
-				   struct msix_entry *entries, int minvec,
-				   int maxvec, struct irq_affinity *affd,
-				   int flags)
-{
-	int rc, nvec = maxvec;
-
-	if (maxvec < minvec)
-		return -ERANGE;
-
-	if (WARN_ON_ONCE(dev->msix_enabled))
-		return -EINVAL;
-
-	for (;;) {
-		if (affd) {
-			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
-			if (nvec < minvec)
-				return -ENOSPC;
-		}
-
-		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
-		if (rc == 0)
-			return nvec;
-
-		if (rc < 0)
-			return rc;
-		if (rc < minvec)
-			return -ENOSPC;
-
-		nvec = rc;
-	}
-}
-
-/**
- * pci_enable_msix_range - configure device's MSI-X capability structure
- * @dev: pointer to the pci_dev data structure of MSI-X device function
- * @entries: pointer to an array of MSI-X entries
- * @minvec: minimum number of MSI-X IRQs requested
- * @maxvec: maximum number of MSI-X IRQs requested
- *
- * Setup the MSI-X capability structure of device function with a maximum
- * possible number of interrupts in the range between @minvec and @maxvec
- * upon its software driver call to request for MSI-X mode enabled on its
- * hardware device function. It returns a negative errno if an error occurs.
- * If it succeeds, it returns the actual number of interrupts allocated and
- * indicates the successful configuration of MSI-X capability structure
- * with new allocated MSI-X interrupts.
- **/
-int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
-		int minvec, int maxvec)
-{
-	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
-}
-EXPORT_SYMBOL(pci_enable_msix_range);
-
-/**
- * pci_alloc_irq_vectors_affinity - allocate multiple IRQs for a device
- * @dev:		PCI device to operate on
- * @min_vecs:		minimum number of vectors required (must be >= 1)
- * @max_vecs:		maximum (desired) number of vectors
- * @flags:		flags or quirks for the allocation
- * @affd:		optional description of the affinity requirements
- *
- * Allocate up to @max_vecs interrupt vectors for @dev, using MSI-X or MSI
- * vectors if available, and fall back to a single legacy vector
- * if neither is available.  Return the number of vectors allocated,
- * (which might be smaller than @max_vecs) if successful, or a negative
- * error code on error. If less than @min_vecs interrupt vectors are
- * available for @dev the function will fail with -ENOSPC.
- *
- * To get the Linux IRQ number used for a vector that can be passed to
- * request_irq() use the pci_irq_vector() helper.
- */
-int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
-				   unsigned int max_vecs, unsigned int flags,
-				   struct irq_affinity *affd)
-{
-	struct irq_affinity msi_default_affd = {0};
-	int nvecs = -ENOSPC;
-
-	if (flags & PCI_IRQ_AFFINITY) {
-		if (!affd)
-			affd = &msi_default_affd;
-	} else {
-		if (WARN_ON(affd))
-			affd = NULL;
-	}
-
-	if (flags & PCI_IRQ_MSIX) {
-		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
-						affd, flags);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	if (flags & PCI_IRQ_MSI) {
-		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
-		if (nvecs > 0)
-			return nvecs;
-	}
-
-	/* use legacy IRQ if allowed */
-	if (flags & PCI_IRQ_LEGACY) {
-		if (min_vecs == 1 && dev->irq) {
-			/*
-			 * Invoke the affinity spreading logic to ensure that
-			 * the device driver can adjust queue configuration
-			 * for the single interrupt case.
-			 */
-			if (affd)
-				irq_create_affinity_masks(1, affd);
-			pci_intx(dev, 1);
-			return 1;
-		}
-	}
-
-	return nvecs;
-}
-EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
-
-/**
- * pci_free_irq_vectors - free previously allocated IRQs for a device
- * @dev:		PCI device to operate on
- *
- * Undoes the allocations and enabling in pci_alloc_irq_vectors().
- */
-void pci_free_irq_vectors(struct pci_dev *dev)
-{
-	pci_disable_msix(dev);
-	pci_disable_msi(dev);
-}
-EXPORT_SYMBOL(pci_free_irq_vectors);
-
-/**
- * pci_irq_vector - return Linux IRQ number of a device vector
- * @dev:	PCI device to operate on
- * @nr:		Interrupt vector index (0-based)
- *
- * @nr has the following meanings depending on the interrupt mode:
- *   MSI-X:	The index in the MSI-X vector table
- *   MSI:	The index of the enabled MSI vectors
- *   INTx:	Must be 0
- *
- * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
- */
-int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
-{
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->pci.msi_attrib.entry_nr == nr)
-				return entry->irq;
-		}
-		WARN_ON_ONCE(1);
-		return -EINVAL;
-	}
-
-	if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
-
-		if (WARN_ON_ONCE(nr >= entry->nvec_used))
-			return -EINVAL;
-	} else {
-		if (WARN_ON_ONCE(nr > 0))
-			return -EINVAL;
-	}
-
-	return dev->irq + nr;
-}
-EXPORT_SYMBOL(pci_irq_vector);
-
-/**
- * pci_irq_get_affinity - return the affinity of a particular MSI vector
- * @dev:	PCI device to operate on
- * @nr:		device-relative interrupt vector index (0-based).
- *
- * @nr has the following meanings depending on the interrupt mode:
- *   MSI-X:	The index in the MSI-X vector table
- *   MSI:	The index of the enabled MSI vectors
- *   INTx:	Must be 0
- *
- * Return: A cpumask pointer or NULL if @nr is out of range
- */
-const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
-{
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->pci.msi_attrib.entry_nr == nr)
-				return &entry->affinity->mask;
-		}
-		WARN_ON_ONCE(1);
-		return NULL;
-	} else if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
-
-		if (WARN_ON_ONCE(!entry || !entry->affinity ||
-				 nr >= entry->nvec_used))
-			return NULL;
-
-		return &entry->affinity[nr].mask;
-	} else {
-		return cpu_possible_mask;
-	}
-}
-EXPORT_SYMBOL(pci_irq_get_affinity);
-
-struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
-{
-	return to_pci_dev(desc->dev);
-}
-EXPORT_SYMBOL(msi_desc_to_pci_dev);
-
-#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
-/**
- * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
- * @irq_data:	Pointer to interrupt data of the MSI interrupt
- * @msg:	Pointer to the message
- */
-static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
-{
-	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
-
-	/*
-	 * For MSI-X desc->irq is always equal to irq_data->irq. For
-	 * MSI only the first interrupt of MULTI MSI passes the test.
-	 */
-	if (desc->irq == irq_data->irq)
-		__pci_write_msi_msg(desc, msg);
-}
-
-/**
- * pci_msi_domain_calc_hwirq - Generate a unique ID for an MSI source
- * @desc:	Pointer to the MSI descriptor
- *
- * The ID number is only used within the irqdomain.
- */
-static irq_hw_number_t pci_msi_domain_calc_hwirq(struct msi_desc *desc)
-{
-	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
-
-	return (irq_hw_number_t)desc->pci.msi_attrib.entry_nr |
-		pci_dev_id(dev) << 11 |
-		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
-}
-
-static inline bool pci_msi_desc_is_multi_msi(struct msi_desc *desc)
-{
-	return !desc->pci.msi_attrib.is_msix && desc->nvec_used > 1;
-}
-
-/**
- * pci_msi_domain_check_cap - Verify that @domain supports the capabilities
- * 			      for @dev
- * @domain:	The interrupt domain to check
- * @info:	The domain info for verification
- * @dev:	The device to check
- *
- * Returns:
- *  0 if the functionality is supported
- *  1 if Multi MSI is requested, but the domain does not support it
- *  -ENOTSUPP otherwise
- */
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev)
-{
-	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
-
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) &&
-	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
-		return 1;
-	else if (desc->pci.msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
-		return -ENOTSUPP;
-
-	return 0;
-}
-
-static int pci_msi_domain_handle_error(struct irq_domain *domain,
-				       struct msi_desc *desc, int error)
-{
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
-		return 1;
-
-	return error;
-}
-
-static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
-				    struct msi_desc *desc)
-{
-	arg->desc = desc;
-	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
-}
-
-static struct msi_domain_ops pci_msi_domain_ops_default = {
-	.set_desc	= pci_msi_domain_set_desc,
-	.msi_check	= pci_msi_domain_check_cap,
-	.handle_error	= pci_msi_domain_handle_error,
-};
-
-static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
-{
-	struct msi_domain_ops *ops = info->ops;
-
-	if (ops == NULL) {
-		info->ops = &pci_msi_domain_ops_default;
-	} else {
-		if (ops->set_desc == NULL)
-			ops->set_desc = pci_msi_domain_set_desc;
-		if (ops->msi_check == NULL)
-			ops->msi_check = pci_msi_domain_check_cap;
-		if (ops->handle_error == NULL)
-			ops->handle_error = pci_msi_domain_handle_error;
-	}
-}
-
-static void pci_msi_domain_update_chip_ops(struct msi_domain_info *info)
-{
-	struct irq_chip *chip = info->chip;
-
-	BUG_ON(!chip);
-	if (!chip->irq_write_msi_msg)
-		chip->irq_write_msi_msg = pci_msi_domain_write_msg;
-	if (!chip->irq_mask)
-		chip->irq_mask = pci_msi_mask_irq;
-	if (!chip->irq_unmask)
-		chip->irq_unmask = pci_msi_unmask_irq;
-}
-
-/**
- * pci_msi_create_irq_domain - Create a MSI interrupt domain
- * @fwnode:	Optional fwnode of the interrupt controller
- * @info:	MSI domain info
- * @parent:	Parent irq domain
- *
- * Updates the domain and chip ops and creates a MSI interrupt domain.
- *
- * Returns:
- * A domain pointer or NULL in case of failure.
- */
-struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
-					     struct msi_domain_info *info,
-					     struct irq_domain *parent)
-{
-	struct irq_domain *domain;
-
-	if (WARN_ON(info->flags & MSI_FLAG_LEVEL_CAPABLE))
-		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
-
-	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
-		pci_msi_domain_update_dom_ops(info);
-	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
-		pci_msi_domain_update_chip_ops(info);
-
-	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
-		info->flags |= MSI_FLAG_MUST_REACTIVATE;
-
-	/* PCI-MSI is oneshot-safe */
-	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
-
-	domain = msi_create_irq_domain(fwnode, info, parent);
-	if (!domain)
-		return NULL;
-
-	irq_domain_update_bus_token(domain, DOMAIN_BUS_PCI_MSI);
-	return domain;
-}
-EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
-
-/*
- * Users of the generic MSI infrastructure expect a device to have a single ID,
- * so with DMA aliases we have to pick the least-worst compromise. Devices with
- * DMA phantom functions tend to still emit MSIs from the real function number,
- * so we ignore those and only consider topological aliases where either the
- * alias device or RID appears on a different bus number. We also make the
- * reasonable assumption that bridges are walked in an upstream direction (so
- * the last one seen wins), and the much braver assumption that the most likely
- * case is that of PCI->PCIe so we should always use the alias RID. This echoes
- * the logic from intel_irq_remapping's set_msi_sid(), which presumably works
- * well enough in practice; in the face of the horrible PCIe<->PCI-X conditions
- * for taking ownership all we can really do is close our eyes and hope...
- */
-static int get_msi_id_cb(struct pci_dev *pdev, u16 alias, void *data)
-{
-	u32 *pa = data;
-	u8 bus = PCI_BUS_NUM(*pa);
-
-	if (pdev->bus->number != bus || PCI_BUS_NUM(alias) != bus)
-		*pa = alias;
-
-	return 0;
-}
-
-/**
- * pci_msi_domain_get_msi_rid - Get the MSI requester id (RID)
- * @domain:	The interrupt domain
- * @pdev:	The PCI device.
- *
- * The RID for a device is formed from the alias, with a firmware
- * supplied mapping applied
- *
- * Returns: The RID.
- */
-u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
-{
-	struct device_node *of_node;
-	u32 rid = pci_dev_id(pdev);
-
-	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
-
-	of_node = irq_domain_get_of_node(domain);
-	rid = of_node ? of_msi_map_id(&pdev->dev, of_node, rid) :
-			iort_msi_map_id(&pdev->dev, rid);
-
-	return rid;
-}
-
-/**
- * pci_msi_get_device_domain - Get the MSI domain for a given PCI device
- * @pdev:	The PCI device
- *
- * Use the firmware data to find a device-specific MSI domain
- * (i.e. not one that is set as a default).
- *
- * Returns: The corresponding MSI domain or NULL if none has been found.
- */
-struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
-{
-	struct irq_domain *dom;
-	u32 rid = pci_dev_id(pdev);
-
-	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
-	dom = of_msi_map_get_device_domain(&pdev->dev, rid, DOMAIN_BUS_PCI_MSI);
-	if (!dom)
-		dom = iort_get_device_domain(&pdev->dev, rid,
-					     DOMAIN_BUS_PCI_MSI);
-	return dom;
-}
-
-/**
- * pci_dev_has_special_msi_domain - Check whether the device is handled by
- *				    a non-standard PCI-MSI domain
- * @pdev:	The PCI device to check.
- *
- * Returns: True if the device irqdomain or the bus irqdomain is
- * non-standard PCI/MSI.
- */
-bool pci_dev_has_special_msi_domain(struct pci_dev *pdev)
-{
-	struct irq_domain *dom = dev_get_msi_domain(&pdev->dev);
-
-	if (!dom)
-		dom = dev_get_msi_domain(&pdev->bus->dev);
-
-	if (!dom)
-		return true;
-
-	return dom->bus_token != DOMAIN_BUS_PCI_MSI;
-}
-
-#endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
-#endif /* CONFIG_PCI_MSI */
-
-void pci_msi_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	/*
-	 * Disable the MSI hardware to avoid screaming interrupts
-	 * during boot.  This is the power on reset default so
-	 * usually this should be a noop.
-	 */
-	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
-	if (!dev->msi_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
-	if (ctrl & PCI_MSI_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
-				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
-
-	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
-		dev->no_64bit_msi = 1;
-}
-
-void pci_msix_init(struct pci_dev *dev)
-{
-	u16 ctrl;
-
-	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
-	if (!dev->msix_cap)
-		return;
-
-	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
-	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
-		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
-				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
-}
--- /dev/null
+++ b/drivers/pci/msi/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the PCI/MSI
+obj-$(CONFIG_PCI)		+= msi.o
--- /dev/null
+++ b/drivers/pci/msi/msi.c
@@ -0,0 +1,1532 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCI Message Signaled Interrupt (MSI)
+ *
+ * Copyright (C) 2003-2004 Intel
+ * Copyright (C) Tom Long Nguyen (tom.l.nguyen@intel.com)
+ * Copyright (C) 2016 Christoph Hellwig.
+ */
+
+#include <linux/acpi_iort.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/msi.h>
+#include <linux/of_irq.h>
+#include <linux/pci.h>
+
+#include "../pci.h"
+
+#ifdef CONFIG_PCI_MSI
+
+static int pci_msi_enable = 1;
+int pci_msi_ignore_mask;
+
+#define msix_table_size(flags)	((flags & PCI_MSIX_FLAGS_QSIZE) + 1)
+
+#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
+static int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct irq_domain *domain;
+
+	domain = dev_get_msi_domain(&dev->dev);
+	if (domain && irq_domain_is_hierarchy(domain))
+		return msi_domain_alloc_irqs(domain, &dev->dev, nvec);
+
+	return arch_setup_msi_irqs(dev, nvec, type);
+}
+
+static void pci_msi_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct irq_domain *domain;
+
+	domain = dev_get_msi_domain(&dev->dev);
+	if (domain && irq_domain_is_hierarchy(domain))
+		msi_domain_free_irqs(domain, &dev->dev);
+	else
+		arch_teardown_msi_irqs(dev);
+}
+#else
+#define pci_msi_setup_msi_irqs		arch_setup_msi_irqs
+#define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
+#endif
+
+#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
+/* Arch hooks */
+int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
+{
+	return -EINVAL;
+}
+
+void __weak arch_teardown_msi_irq(unsigned int irq)
+{
+}
+
+int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
+{
+	struct msi_desc *entry;
+	int ret;
+
+	/*
+	 * If an architecture wants to support multiple MSI, it needs to
+	 * override arch_setup_msi_irqs()
+	 */
+	if (type == PCI_CAP_ID_MSI && nvec > 1)
+		return 1;
+
+	for_each_pci_msi_entry(entry, dev) {
+		ret = arch_setup_msi_irq(dev, entry);
+		if (ret < 0)
+			return ret;
+		if (ret > 0)
+			return -ENOSPC;
+	}
+
+	return 0;
+}
+
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
+{
+	int i;
+	struct msi_desc *entry;
+
+	for_each_pci_msi_entry(entry, dev)
+		if (entry->irq)
+			for (i = 0; i < entry->nvec_used; i++)
+				arch_teardown_msi_irq(entry->irq + i);
+}
+#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
+
+/*
+ * PCI 2.3 does not specify mask bits for each MSI interrupt.  Attempting to
+ * mask all MSI interrupts by clearing the MSI enable bit does not work
+ * reliably as devices without an INTx disable bit will then generate a
+ * level IRQ which will never be cleared.
+ */
+static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
+{
+	/* Don't shift by >= width of type */
+	if (desc->pci.msi_attrib.multi_cap >= 5)
+		return 0xffffffff;
+	return (1 << (1 << desc->pci.msi_attrib.multi_cap)) - 1;
+}
+
+static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
+{
+	raw_spinlock_t *lock = &desc->dev->msi_lock;
+	unsigned long flags;
+
+	if (!desc->pci.msi_attrib.can_mask)
+		return;
+
+	raw_spin_lock_irqsave(lock, flags);
+	desc->pci.msi_mask &= ~clear;
+	desc->pci.msi_mask |= set;
+	pci_write_config_dword(msi_desc_to_pci_dev(desc), desc->pci.mask_pos,
+			       desc->pci.msi_mask);
+	raw_spin_unlock_irqrestore(lock, flags);
+}
+
+static inline void pci_msi_mask(struct msi_desc *desc, u32 mask)
+{
+	pci_msi_update_mask(desc, 0, mask);
+}
+
+static inline void pci_msi_unmask(struct msi_desc *desc, u32 mask)
+{
+	pci_msi_update_mask(desc, mask, 0);
+}
+
+static inline void __iomem *pci_msix_desc_addr(struct msi_desc *desc)
+{
+	return desc->pci.mask_base + desc->pci.msi_attrib.entry_nr * PCI_MSIX_ENTRY_SIZE;
+}
+
+/*
+ * This internal function does not flush PCI writes to the device.  All
+ * users must ensure that they read from the device before either assuming
+ * that the device state is up to date, or returning out of this file.
+ * It does not affect the msi_desc::msix_ctrl cache either. Use with care!
+ */
+static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
+{
+	void __iomem *desc_addr = pci_msix_desc_addr(desc);
+
+	if (desc->pci.msi_attrib.can_mask)
+		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
+}
+
+static inline void pci_msix_mask(struct msi_desc *desc)
+{
+	desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+	/* Flush write to device */
+	readl(desc->pci.mask_base);
+}
+
+static inline void pci_msix_unmask(struct msi_desc *desc)
+{
+	desc->pci.msix_ctrl &= ~PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+}
+
+static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
+{
+	if (desc->pci.msi_attrib.is_msix)
+		pci_msix_mask(desc);
+	else
+		pci_msi_mask(desc, mask);
+}
+
+static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
+{
+	if (desc->pci.msi_attrib.is_msix)
+		pci_msix_unmask(desc);
+	else
+		pci_msi_unmask(desc, mask);
+}
+
+/**
+ * pci_msi_mask_irq - Generic IRQ chip callback to mask PCI/MSI interrupts
+ * @data:	pointer to irqdata associated to that interrupt
+ */
+void pci_msi_mask_irq(struct irq_data *data)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+
+	__pci_msi_mask_desc(desc, BIT(data->irq - desc->irq));
+}
+EXPORT_SYMBOL_GPL(pci_msi_mask_irq);
+
+/**
+ * pci_msi_unmask_irq - Generic IRQ chip callback to unmask PCI/MSI interrupts
+ * @data:	pointer to irqdata associated to that interrupt
+ */
+void pci_msi_unmask_irq(struct irq_data *data)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+
+	__pci_msi_unmask_desc(desc, BIT(data->irq - desc->irq));
+}
+EXPORT_SYMBOL_GPL(pci_msi_unmask_irq);
+
+void __pci_read_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
+{
+	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
+
+	BUG_ON(dev->current_state != PCI_D0);
+
+	if (entry->pci.msi_attrib.is_msix) {
+		void __iomem *base = pci_msix_desc_addr(entry);
+
+		if (WARN_ON_ONCE(entry->pci.msi_attrib.is_virtual))
+			return;
+
+		msg->address_lo = readl(base + PCI_MSIX_ENTRY_LOWER_ADDR);
+		msg->address_hi = readl(base + PCI_MSIX_ENTRY_UPPER_ADDR);
+		msg->data = readl(base + PCI_MSIX_ENTRY_DATA);
+	} else {
+		int pos = dev->msi_cap;
+		u16 data;
+
+		pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
+				      &msg->address_lo);
+		if (entry->pci.msi_attrib.is_64) {
+			pci_read_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
+					      &msg->address_hi);
+			pci_read_config_word(dev, pos + PCI_MSI_DATA_64, &data);
+		} else {
+			msg->address_hi = 0;
+			pci_read_config_word(dev, pos + PCI_MSI_DATA_32, &data);
+		}
+		msg->data = data;
+	}
+}
+
+void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
+{
+	struct pci_dev *dev = msi_desc_to_pci_dev(entry);
+
+	if (dev->current_state != PCI_D0 || pci_dev_is_disconnected(dev)) {
+		/* Don't touch the hardware now */
+	} else if (entry->pci.msi_attrib.is_msix) {
+		void __iomem *base = pci_msix_desc_addr(entry);
+		u32 ctrl = entry->pci.msix_ctrl;
+		bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);
+
+		if (entry->pci.msi_attrib.is_virtual)
+			goto skip;
+
+		/*
+		 * The specification mandates that the entry is masked
+		 * when the message is modified:
+		 *
+		 * "If software changes the Address or Data value of an
+		 * entry while the entry is unmasked, the result is
+		 * undefined."
+		 */
+		if (unmasked)
+			pci_msix_write_vector_ctrl(entry, ctrl | PCI_MSIX_ENTRY_CTRL_MASKBIT);
+
+		writel(msg->address_lo, base + PCI_MSIX_ENTRY_LOWER_ADDR);
+		writel(msg->address_hi, base + PCI_MSIX_ENTRY_UPPER_ADDR);
+		writel(msg->data, base + PCI_MSIX_ENTRY_DATA);
+
+		if (unmasked)
+			pci_msix_write_vector_ctrl(entry, ctrl);
+
+		/* Ensure that the writes are visible in the device */
+		readl(base + PCI_MSIX_ENTRY_DATA);
+	} else {
+		int pos = dev->msi_cap;
+		u16 msgctl;
+
+		pci_read_config_word(dev, pos + PCI_MSI_FLAGS, &msgctl);
+		msgctl &= ~PCI_MSI_FLAGS_QSIZE;
+		msgctl |= entry->pci.msi_attrib.multiple << 4;
+		pci_write_config_word(dev, pos + PCI_MSI_FLAGS, msgctl);
+
+		pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_LO,
+				       msg->address_lo);
+		if (entry->pci.msi_attrib.is_64) {
+			pci_write_config_dword(dev, pos + PCI_MSI_ADDRESS_HI,
+					       msg->address_hi);
+			pci_write_config_word(dev, pos + PCI_MSI_DATA_64,
+					      msg->data);
+		} else {
+			pci_write_config_word(dev, pos + PCI_MSI_DATA_32,
+					      msg->data);
+		}
+		/* Ensure that the writes are visible in the device */
+		pci_read_config_word(dev, pos + PCI_MSI_FLAGS, &msgctl);
+	}
+
+skip:
+	entry->msg = *msg;
+
+	if (entry->write_msi_msg)
+		entry->write_msi_msg(entry, entry->write_msi_msg_data);
+
+}
+
+void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
+{
+	struct msi_desc *entry = irq_get_msi_desc(irq);
+
+	__pci_write_msi_msg(entry, msg);
+}
+EXPORT_SYMBOL_GPL(pci_write_msi_msg);
+
+static void free_msi_irqs(struct pci_dev *dev)
+{
+	struct list_head *msi_list = dev_to_msi_list(&dev->dev);
+	struct msi_desc *entry, *tmp;
+	int i;
+
+	for_each_pci_msi_entry(entry, dev)
+		if (entry->irq)
+			for (i = 0; i < entry->nvec_used; i++)
+				BUG_ON(irq_has_action(entry->irq + i));
+
+	if (dev->msi_irq_groups) {
+		msi_destroy_sysfs(&dev->dev, dev->msi_irq_groups);
+		dev->msi_irq_groups = NULL;
+	}
+
+	pci_msi_teardown_msi_irqs(dev);
+
+	list_for_each_entry_safe(entry, tmp, msi_list, list) {
+		if (entry->pci.msi_attrib.is_msix) {
+			if (list_is_last(&entry->list, msi_list))
+				iounmap(entry->pci.mask_base);
+		}
+
+		list_del(&entry->list);
+		free_msi_entry(entry);
+	}
+}
+
+static void pci_intx_for_msi(struct pci_dev *dev, int enable)
+{
+	if (!(dev->dev_flags & PCI_DEV_FLAGS_MSI_INTX_DISABLE_BUG))
+		pci_intx(dev, enable);
+}
+
+static void pci_msi_set_enable(struct pci_dev *dev, int enable)
+{
+	u16 control;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
+	control &= ~PCI_MSI_FLAGS_ENABLE;
+	if (enable)
+		control |= PCI_MSI_FLAGS_ENABLE;
+	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
+}
+
+/*
+ * Architecture override returns true when the PCI MSI message should be
+ * written by the generic restore function.
+ */
+bool __weak arch_restore_msi_irqs(struct pci_dev *dev)
+{
+	return true;
+}
+
+static void __pci_restore_msi_state(struct pci_dev *dev)
+{
+	struct msi_desc *entry;
+	u16 control;
+
+	if (!dev->msi_enabled)
+		return;
+
+	entry = irq_get_msi_desc(dev->irq);
+
+	pci_intx_for_msi(dev, 0);
+	pci_msi_set_enable(dev, 0);
+	if (arch_restore_msi_irqs(dev))
+		__pci_write_msi_msg(entry, &entry->msg);
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
+	pci_msi_update_mask(entry, 0, 0);
+	control &= ~PCI_MSI_FLAGS_QSIZE;
+	control |= (entry->pci.msi_attrib.multiple << 4) | PCI_MSI_FLAGS_ENABLE;
+	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
+}
+
+static void pci_msix_clear_and_set_ctrl(struct pci_dev *dev, u16 clear, u16 set)
+{
+	u16 ctrl;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
+	ctrl &= ~clear;
+	ctrl |= set;
+	pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, ctrl);
+}
+
+static void __pci_restore_msix_state(struct pci_dev *dev)
+{
+	struct msi_desc *entry;
+	bool write_msg;
+
+	if (!dev->msix_enabled)
+		return;
+	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
+
+	/* route the table */
+	pci_intx_for_msi(dev, 0);
+	pci_msix_clear_and_set_ctrl(dev, 0,
+				PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
+
+	write_msg = arch_restore_msi_irqs(dev);
+
+	for_each_pci_msi_entry(entry, dev) {
+		if (write_msg)
+			__pci_write_msi_msg(entry, &entry->msg);
+		pci_msix_write_vector_ctrl(entry, entry->pci.msix_ctrl);
+	}
+
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
+}
+
+void pci_restore_msi_state(struct pci_dev *dev)
+{
+	__pci_restore_msi_state(dev);
+	__pci_restore_msix_state(dev);
+}
+EXPORT_SYMBOL_GPL(pci_restore_msi_state);
+
+static struct msi_desc *
+msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
+{
+	struct irq_affinity_desc *masks = NULL;
+	struct msi_desc *entry;
+	u16 control;
+
+	if (affd)
+		masks = irq_create_affinity_masks(nvec, affd);
+
+	/* MSI Entry Initialization */
+	entry = alloc_msi_entry(&dev->dev, nvec, masks);
+	if (!entry)
+		goto out;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
+	/* Lies, damned lies, and MSIs */
+	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
+		control |= PCI_MSI_FLAGS_MASKBIT;
+
+	entry->pci.msi_attrib.is_msix	= 0;
+	entry->pci.msi_attrib.is_64		= !!(control & PCI_MSI_FLAGS_64BIT);
+	entry->pci.msi_attrib.is_virtual    = 0;
+	entry->pci.msi_attrib.entry_nr	= 0;
+	entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+					  !!(control & PCI_MSI_FLAGS_MASKBIT);
+	entry->pci.msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
+	entry->pci.msi_attrib.multi_cap	= (control & PCI_MSI_FLAGS_QMASK) >> 1;
+	entry->pci.msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
+
+	if (control & PCI_MSI_FLAGS_64BIT)
+		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
+	else
+		entry->pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
+
+	/* Save the initial mask status */
+	if (entry->pci.msi_attrib.can_mask)
+		pci_read_config_dword(dev, entry->pci.mask_pos, &entry->pci.msi_mask);
+
+out:
+	kfree(masks);
+	return entry;
+}
+
+static int msi_verify_entries(struct pci_dev *dev)
+{
+	struct msi_desc *entry;
+
+	if (!dev->no_64bit_msi)
+		return 0;
+
+	for_each_pci_msi_entry(entry, dev) {
+		if (entry->msg.address_hi) {
+			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
+				entry->msg.address_hi, entry->msg.address_lo);
+			return -EIO;
+		}
+	}
+	return 0;
+}
+
+/**
+ * msi_capability_init - configure device's MSI capability structure
+ * @dev: pointer to the pci_dev data structure of MSI device function
+ * @nvec: number of interrupts to allocate
+ * @affd: description of automatic IRQ affinity assignments (may be %NULL)
+ *
+ * Setup the MSI capability structure of the device with the requested
+ * number of interrupts.  A return value of zero indicates the successful
+ * setup of an entry with the new MSI IRQ.  A negative return value indicates
+ * an error, and a positive return value indicates the number of interrupts
+ * which could have been allocated.
+ */
+static int msi_capability_init(struct pci_dev *dev, int nvec,
+			       struct irq_affinity *affd)
+{
+	const struct attribute_group **groups;
+	struct msi_desc *entry;
+	int ret;
+
+	pci_msi_set_enable(dev, 0);	/* Disable MSI during set up */
+
+	entry = msi_setup_entry(dev, nvec, affd);
+	if (!entry)
+		return -ENOMEM;
+
+	/* All MSIs are unmasked by default; mask them all */
+	pci_msi_mask(entry, msi_multi_mask(entry));
+
+	list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
+
+	/* Configure MSI capability structure */
+	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSI);
+	if (ret)
+		goto err;
+
+	ret = msi_verify_entries(dev);
+	if (ret)
+		goto err;
+
+	groups = msi_populate_sysfs(&dev->dev);
+	if (IS_ERR(groups)) {
+		ret = PTR_ERR(groups);
+		goto err;
+	}
+
+	dev->msi_irq_groups = groups;
+
+	/* Set MSI enabled bits	*/
+	pci_intx_for_msi(dev, 0);
+	pci_msi_set_enable(dev, 1);
+	dev->msi_enabled = 1;
+
+	pcibios_free_irq(dev);
+	dev->irq = entry->irq;
+	return 0;
+
+err:
+	pci_msi_unmask(entry, msi_multi_mask(entry));
+	free_msi_irqs(dev);
+	return ret;
+}
+
+static void __iomem *msix_map_region(struct pci_dev *dev,
+				     unsigned int nr_entries)
+{
+	resource_size_t phys_addr;
+	u32 table_offset;
+	unsigned long flags;
+	u8 bir;
+
+	pci_read_config_dword(dev, dev->msix_cap + PCI_MSIX_TABLE,
+			      &table_offset);
+	bir = (u8)(table_offset & PCI_MSIX_TABLE_BIR);
+	flags = pci_resource_flags(dev, bir);
+	if (!flags || (flags & IORESOURCE_UNSET))
+		return NULL;
+
+	table_offset &= PCI_MSIX_TABLE_OFFSET;
+	phys_addr = pci_resource_start(dev, bir) + table_offset;
+
+	return ioremap(phys_addr, nr_entries * PCI_MSIX_ENTRY_SIZE);
+}
+
+static int msix_setup_entries(struct pci_dev *dev, void __iomem *base,
+			      struct msix_entry *entries, int nvec,
+			      struct irq_affinity *affd)
+{
+	struct irq_affinity_desc *curmsk, *masks = NULL;
+	struct msi_desc *entry;
+	void __iomem *addr;
+	int ret, i;
+	int vec_count = pci_msix_vec_count(dev);
+
+	if (affd)
+		masks = irq_create_affinity_masks(nvec, affd);
+
+	for (i = 0, curmsk = masks; i < nvec; i++) {
+		entry = alloc_msi_entry(&dev->dev, 1, curmsk);
+		if (!entry) {
+			if (!i)
+				iounmap(base);
+			else
+				free_msi_irqs(dev);
+			/* No enough memory. Don't try again */
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		entry->pci.msi_attrib.is_msix	= 1;
+		entry->pci.msi_attrib.is_64	= 1;
+
+		if (entries)
+			entry->pci.msi_attrib.entry_nr = entries[i].entry;
+		else
+			entry->pci.msi_attrib.entry_nr = i;
+
+		entry->pci.msi_attrib.is_virtual =
+			entry->pci.msi_attrib.entry_nr >= vec_count;
+
+		entry->pci.msi_attrib.can_mask	= !pci_msi_ignore_mask &&
+						  !entry->pci.msi_attrib.is_virtual;
+
+		entry->pci.msi_attrib.default_irq	= dev->irq;
+		entry->pci.mask_base			= base;
+
+		if (entry->pci.msi_attrib.can_mask) {
+			addr = pci_msix_desc_addr(entry);
+			entry->pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
+		}
+
+		list_add_tail(&entry->list, dev_to_msi_list(&dev->dev));
+		if (masks)
+			curmsk++;
+	}
+	ret = 0;
+out:
+	kfree(masks);
+	return ret;
+}
+
+static void msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
+{
+	struct msi_desc *entry;
+
+	if (entries) {
+		for_each_pci_msi_entry(entry, dev) {
+			entries->vector = entry->irq;
+			entries++;
+		}
+	}
+}
+
+static void msix_mask_all(void __iomem *base, int tsize)
+{
+	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	int i;
+
+	if (pci_msi_ignore_mask)
+		return;
+
+	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
+		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
+}
+
+/**
+ * msix_capability_init - configure device's MSI-X capability
+ * @dev: pointer to the pci_dev data structure of MSI-X device function
+ * @entries: pointer to an array of struct msix_entry entries
+ * @nvec: number of @entries
+ * @affd: Optional pointer to enable automatic affinity assignment
+ *
+ * Setup the MSI-X capability structure of device function with a
+ * single MSI-X IRQ. A return of zero indicates the successful setup of
+ * requested MSI-X entries with allocated IRQs or non-zero for otherwise.
+ **/
+static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
+				int nvec, struct irq_affinity *affd)
+{
+	const struct attribute_group **groups;
+	void __iomem *base;
+	int ret, tsize;
+	u16 control;
+
+	/*
+	 * Some devices require MSI-X to be enabled before the MSI-X
+	 * registers can be accessed.  Mask all the vectors to prevent
+	 * interrupts coming in before they're fully set up.
+	 */
+	pci_msix_clear_and_set_ctrl(dev, 0, PCI_MSIX_FLAGS_MASKALL |
+				    PCI_MSIX_FLAGS_ENABLE);
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
+	/* Request & Map MSI-X table region */
+	tsize = msix_table_size(control);
+	base = msix_map_region(dev, tsize);
+	if (!base) {
+		ret = -ENOMEM;
+		goto out_disable;
+	}
+
+	/* Ensure that all table entries are masked. */
+	msix_mask_all(base, tsize);
+
+	ret = msix_setup_entries(dev, base, entries, nvec, affd);
+	if (ret)
+		goto out_disable;
+
+	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
+	if (ret)
+		goto out_avail;
+
+	/* Check if all MSI entries honor device restrictions */
+	ret = msi_verify_entries(dev);
+	if (ret)
+		goto out_free;
+
+	msix_update_entries(dev, entries);
+
+	groups = msi_populate_sysfs(&dev->dev);
+	if (IS_ERR(groups)) {
+		ret = PTR_ERR(groups);
+		goto out_free;
+	}
+
+	dev->msi_irq_groups = groups;
+
+	/* Set MSI-X enabled bits and unmask the function */
+	pci_intx_for_msi(dev, 0);
+	dev->msix_enabled = 1;
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
+
+	pcibios_free_irq(dev);
+	return 0;
+
+out_avail:
+	if (ret < 0) {
+		/*
+		 * If we had some success, report the number of IRQs
+		 * we succeeded in setting up.
+		 */
+		struct msi_desc *entry;
+		int avail = 0;
+
+		for_each_pci_msi_entry(entry, dev) {
+			if (entry->irq != 0)
+				avail++;
+		}
+		if (avail != 0)
+			ret = avail;
+	}
+
+out_free:
+	free_msi_irqs(dev);
+
+out_disable:
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
+
+	return ret;
+}
+
+/**
+ * pci_msi_supported - check whether MSI may be enabled on a device
+ * @dev: pointer to the pci_dev data structure of MSI device function
+ * @nvec: how many MSIs have been requested?
+ *
+ * Look at global flags, the device itself, and its parent buses
+ * to determine if MSI/-X are supported for the device. If MSI/-X is
+ * supported return 1, else return 0.
+ **/
+static int pci_msi_supported(struct pci_dev *dev, int nvec)
+{
+	struct pci_bus *bus;
+
+	/* MSI must be globally enabled and supported by the device */
+	if (!pci_msi_enable)
+		return 0;
+
+	if (!dev || dev->no_msi)
+		return 0;
+
+	/*
+	 * You can't ask to have 0 or less MSIs configured.
+	 *  a) it's stupid ..
+	 *  b) the list manipulation code assumes nvec >= 1.
+	 */
+	if (nvec < 1)
+		return 0;
+
+	/*
+	 * Any bridge which does NOT route MSI transactions from its
+	 * secondary bus to its primary bus must set NO_MSI flag on
+	 * the secondary pci_bus.
+	 *
+	 * The NO_MSI flag can either be set directly by:
+	 * - arch-specific PCI host bus controller drivers (deprecated)
+	 * - quirks for specific PCI bridges
+	 *
+	 * or indirectly by platform-specific PCI host bridge drivers by
+	 * advertising the 'msi_domain' property, which results in
+	 * the NO_MSI flag when no MSI domain is found for this bridge
+	 * at probe time.
+	 */
+	for (bus = dev->bus; bus; bus = bus->parent)
+		if (bus->bus_flags & PCI_BUS_FLAGS_NO_MSI)
+			return 0;
+
+	return 1;
+}
+
+/**
+ * pci_msi_vec_count - Return the number of MSI vectors a device can send
+ * @dev: device to report about
+ *
+ * This function returns the number of MSI vectors a device requested via
+ * Multiple Message Capable register. It returns a negative errno if the
+ * device is not capable sending MSI interrupts. Otherwise, the call succeeds
+ * and returns a power of two, up to a maximum of 2^5 (32), according to the
+ * MSI specification.
+ **/
+int pci_msi_vec_count(struct pci_dev *dev)
+{
+	int ret;
+	u16 msgctl;
+
+	if (!dev->msi_cap)
+		return -EINVAL;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &msgctl);
+	ret = 1 << ((msgctl & PCI_MSI_FLAGS_QMASK) >> 1);
+
+	return ret;
+}
+EXPORT_SYMBOL(pci_msi_vec_count);
+
+static void pci_msi_shutdown(struct pci_dev *dev)
+{
+	struct msi_desc *desc;
+
+	if (!pci_msi_enable || !dev || !dev->msi_enabled)
+		return;
+
+	BUG_ON(list_empty(dev_to_msi_list(&dev->dev)));
+	desc = first_pci_msi_entry(dev);
+
+	pci_msi_set_enable(dev, 0);
+	pci_intx_for_msi(dev, 1);
+	dev->msi_enabled = 0;
+
+	/* Return the device with MSI unmasked as initial states */
+	pci_msi_unmask(desc, msi_multi_mask(desc));
+
+	/* Restore dev->irq to its default pin-assertion IRQ */
+	dev->irq = desc->pci.msi_attrib.default_irq;
+	pcibios_alloc_irq(dev);
+}
+
+void pci_disable_msi(struct pci_dev *dev)
+{
+	if (!pci_msi_enable || !dev || !dev->msi_enabled)
+		return;
+
+	pci_msi_shutdown(dev);
+	free_msi_irqs(dev);
+}
+EXPORT_SYMBOL(pci_disable_msi);
+
+/**
+ * pci_msix_vec_count - return the number of device's MSI-X table entries
+ * @dev: pointer to the pci_dev data structure of MSI-X device function
+ * This function returns the number of device's MSI-X table entries and
+ * therefore the number of MSI-X vectors device is capable of sending.
+ * It returns a negative errno if the device is not capable of sending MSI-X
+ * interrupts.
+ **/
+int pci_msix_vec_count(struct pci_dev *dev)
+{
+	u16 control;
+
+	if (!dev->msix_cap)
+		return -EINVAL;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
+	return msix_table_size(control);
+}
+EXPORT_SYMBOL(pci_msix_vec_count);
+
+static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
+			     int nvec, struct irq_affinity *affd, int flags)
+{
+	int nr_entries;
+	int i, j;
+
+	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	nr_entries = pci_msix_vec_count(dev);
+	if (nr_entries < 0)
+		return nr_entries;
+	if (nvec > nr_entries && !(flags & PCI_IRQ_VIRTUAL))
+		return nr_entries;
+
+	if (entries) {
+		/* Check for any invalid entries */
+		for (i = 0; i < nvec; i++) {
+			if (entries[i].entry >= nr_entries)
+				return -EINVAL;		/* invalid entry */
+			for (j = i + 1; j < nvec; j++) {
+				if (entries[i].entry == entries[j].entry)
+					return -EINVAL;	/* duplicate entry */
+			}
+		}
+	}
+
+	/* Check whether driver already requested for MSI IRQ */
+	if (dev->msi_enabled) {
+		pci_info(dev, "can't enable MSI-X (MSI IRQ already assigned)\n");
+		return -EINVAL;
+	}
+	return msix_capability_init(dev, entries, nvec, affd);
+}
+
+static void pci_msix_shutdown(struct pci_dev *dev)
+{
+	struct msi_desc *entry;
+
+	if (!pci_msi_enable || !dev || !dev->msix_enabled)
+		return;
+
+	if (pci_dev_is_disconnected(dev)) {
+		dev->msix_enabled = 0;
+		return;
+	}
+
+	/* Return the device with MSI-X masked as initial states */
+	for_each_pci_msi_entry(entry, dev)
+		pci_msix_mask(entry);
+
+	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_ENABLE, 0);
+	pci_intx_for_msi(dev, 1);
+	dev->msix_enabled = 0;
+	pcibios_alloc_irq(dev);
+}
+
+void pci_disable_msix(struct pci_dev *dev)
+{
+	if (!pci_msi_enable || !dev || !dev->msix_enabled)
+		return;
+
+	pci_msix_shutdown(dev);
+	free_msi_irqs(dev);
+}
+EXPORT_SYMBOL(pci_disable_msix);
+
+void pci_no_msi(void)
+{
+	pci_msi_enable = 0;
+}
+
+/**
+ * pci_msi_enabled - is MSI enabled?
+ *
+ * Returns true if MSI has not been disabled by the command-line option
+ * pci=nomsi.
+ **/
+int pci_msi_enabled(void)
+{
+	return pci_msi_enable;
+}
+EXPORT_SYMBOL(pci_msi_enabled);
+
+static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
+				  struct irq_affinity *affd)
+{
+	int nvec;
+	int rc;
+
+	if (!pci_msi_supported(dev, minvec) || dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	/* Check whether driver already requested MSI-X IRQs */
+	if (dev->msix_enabled) {
+		pci_info(dev, "can't enable MSI (MSI-X already enabled)\n");
+		return -EINVAL;
+	}
+
+	if (maxvec < minvec)
+		return -ERANGE;
+
+	if (WARN_ON_ONCE(dev->msi_enabled))
+		return -EINVAL;
+
+	nvec = pci_msi_vec_count(dev);
+	if (nvec < 0)
+		return nvec;
+	if (nvec < minvec)
+		return -ENOSPC;
+
+	if (nvec > maxvec)
+		nvec = maxvec;
+
+	for (;;) {
+		if (affd) {
+			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
+			if (nvec < minvec)
+				return -ENOSPC;
+		}
+
+		rc = msi_capability_init(dev, nvec, affd);
+		if (rc == 0)
+			return nvec;
+
+		if (rc < 0)
+			return rc;
+		if (rc < minvec)
+			return -ENOSPC;
+
+		nvec = rc;
+	}
+}
+
+/* deprecated, don't use */
+int pci_enable_msi(struct pci_dev *dev)
+{
+	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+EXPORT_SYMBOL(pci_enable_msi);
+
+static int __pci_enable_msix_range(struct pci_dev *dev,
+				   struct msix_entry *entries, int minvec,
+				   int maxvec, struct irq_affinity *affd,
+				   int flags)
+{
+	int rc, nvec = maxvec;
+
+	if (maxvec < minvec)
+		return -ERANGE;
+
+	if (WARN_ON_ONCE(dev->msix_enabled))
+		return -EINVAL;
+
+	for (;;) {
+		if (affd) {
+			nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
+			if (nvec < minvec)
+				return -ENOSPC;
+		}
+
+		rc = __pci_enable_msix(dev, entries, nvec, affd, flags);
+		if (rc == 0)
+			return nvec;
+
+		if (rc < 0)
+			return rc;
+		if (rc < minvec)
+			return -ENOSPC;
+
+		nvec = rc;
+	}
+}
+
+/**
+ * pci_enable_msix_range - configure device's MSI-X capability structure
+ * @dev: pointer to the pci_dev data structure of MSI-X device function
+ * @entries: pointer to an array of MSI-X entries
+ * @minvec: minimum number of MSI-X IRQs requested
+ * @maxvec: maximum number of MSI-X IRQs requested
+ *
+ * Setup the MSI-X capability structure of device function with a maximum
+ * possible number of interrupts in the range between @minvec and @maxvec
+ * upon its software driver call to request for MSI-X mode enabled on its
+ * hardware device function. It returns a negative errno if an error occurs.
+ * If it succeeds, it returns the actual number of interrupts allocated and
+ * indicates the successful configuration of MSI-X capability structure
+ * with new allocated MSI-X interrupts.
+ **/
+int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
+		int minvec, int maxvec)
+{
+	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
+}
+EXPORT_SYMBOL(pci_enable_msix_range);
+
+/**
+ * pci_alloc_irq_vectors_affinity - allocate multiple IRQs for a device
+ * @dev:		PCI device to operate on
+ * @min_vecs:		minimum number of vectors required (must be >= 1)
+ * @max_vecs:		maximum (desired) number of vectors
+ * @flags:		flags or quirks for the allocation
+ * @affd:		optional description of the affinity requirements
+ *
+ * Allocate up to @max_vecs interrupt vectors for @dev, using MSI-X or MSI
+ * vectors if available, and fall back to a single legacy vector
+ * if neither is available.  Return the number of vectors allocated,
+ * (which might be smaller than @max_vecs) if successful, or a negative
+ * error code on error. If less than @min_vecs interrupt vectors are
+ * available for @dev the function will fail with -ENOSPC.
+ *
+ * To get the Linux IRQ number used for a vector that can be passed to
+ * request_irq() use the pci_irq_vector() helper.
+ */
+int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
+				   unsigned int max_vecs, unsigned int flags,
+				   struct irq_affinity *affd)
+{
+	struct irq_affinity msi_default_affd = {0};
+	int nvecs = -ENOSPC;
+
+	if (flags & PCI_IRQ_AFFINITY) {
+		if (!affd)
+			affd = &msi_default_affd;
+	} else {
+		if (WARN_ON(affd))
+			affd = NULL;
+	}
+
+	if (flags & PCI_IRQ_MSIX) {
+		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
+						affd, flags);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	if (flags & PCI_IRQ_MSI) {
+		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
+		if (nvecs > 0)
+			return nvecs;
+	}
+
+	/* use legacy IRQ if allowed */
+	if (flags & PCI_IRQ_LEGACY) {
+		if (min_vecs == 1 && dev->irq) {
+			/*
+			 * Invoke the affinity spreading logic to ensure that
+			 * the device driver can adjust queue configuration
+			 * for the single interrupt case.
+			 */
+			if (affd)
+				irq_create_affinity_masks(1, affd);
+			pci_intx(dev, 1);
+			return 1;
+		}
+	}
+
+	return nvecs;
+}
+EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
+
+/**
+ * pci_free_irq_vectors - free previously allocated IRQs for a device
+ * @dev:		PCI device to operate on
+ *
+ * Undoes the allocations and enabling in pci_alloc_irq_vectors().
+ */
+void pci_free_irq_vectors(struct pci_dev *dev)
+{
+	pci_disable_msix(dev);
+	pci_disable_msi(dev);
+}
+EXPORT_SYMBOL(pci_free_irq_vectors);
+
+/**
+ * pci_irq_vector - return Linux IRQ number of a device vector
+ * @dev:	PCI device to operate on
+ * @nr:		Interrupt vector index (0-based)
+ *
+ * @nr has the following meanings depending on the interrupt mode:
+ *   MSI-X:	The index in the MSI-X vector table
+ *   MSI:	The index of the enabled MSI vectors
+ *   INTx:	Must be 0
+ *
+ * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
+ */
+int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
+{
+	if (dev->msix_enabled) {
+		struct msi_desc *entry;
+
+		for_each_pci_msi_entry(entry, dev) {
+			if (entry->pci.msi_attrib.entry_nr == nr)
+				return entry->irq;
+		}
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	if (dev->msi_enabled) {
+		struct msi_desc *entry = first_pci_msi_entry(dev);
+
+		if (WARN_ON_ONCE(nr >= entry->nvec_used))
+			return -EINVAL;
+	} else {
+		if (WARN_ON_ONCE(nr > 0))
+			return -EINVAL;
+	}
+
+	return dev->irq + nr;
+}
+EXPORT_SYMBOL(pci_irq_vector);
+
+/**
+ * pci_irq_get_affinity - return the affinity of a particular MSI vector
+ * @dev:	PCI device to operate on
+ * @nr:		device-relative interrupt vector index (0-based).
+ *
+ * @nr has the following meanings depending on the interrupt mode:
+ *   MSI-X:	The index in the MSI-X vector table
+ *   MSI:	The index of the enabled MSI vectors
+ *   INTx:	Must be 0
+ *
+ * Return: A cpumask pointer or NULL if @nr is out of range
+ */
+const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
+{
+	if (dev->msix_enabled) {
+		struct msi_desc *entry;
+
+		for_each_pci_msi_entry(entry, dev) {
+			if (entry->pci.msi_attrib.entry_nr == nr)
+				return &entry->affinity->mask;
+		}
+		WARN_ON_ONCE(1);
+		return NULL;
+	} else if (dev->msi_enabled) {
+		struct msi_desc *entry = first_pci_msi_entry(dev);
+
+		if (WARN_ON_ONCE(!entry || !entry->affinity ||
+				 nr >= entry->nvec_used))
+			return NULL;
+
+		return &entry->affinity[nr].mask;
+	} else {
+		return cpu_possible_mask;
+	}
+}
+EXPORT_SYMBOL(pci_irq_get_affinity);
+
+struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
+{
+	return to_pci_dev(desc->dev);
+}
+EXPORT_SYMBOL(msi_desc_to_pci_dev);
+
+#ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
+/**
+ * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
+ * @irq_data:	Pointer to interrupt data of the MSI interrupt
+ * @msg:	Pointer to the message
+ */
+static void pci_msi_domain_write_msg(struct irq_data *irq_data, struct msi_msg *msg)
+{
+	struct msi_desc *desc = irq_data_get_msi_desc(irq_data);
+
+	/*
+	 * For MSI-X desc->irq is always equal to irq_data->irq. For
+	 * MSI only the first interrupt of MULTI MSI passes the test.
+	 */
+	if (desc->irq == irq_data->irq)
+		__pci_write_msi_msg(desc, msg);
+}
+
+/**
+ * pci_msi_domain_calc_hwirq - Generate a unique ID for an MSI source
+ * @desc:	Pointer to the MSI descriptor
+ *
+ * The ID number is only used within the irqdomain.
+ */
+static irq_hw_number_t pci_msi_domain_calc_hwirq(struct msi_desc *desc)
+{
+	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
+
+	return (irq_hw_number_t)desc->pci.msi_attrib.entry_nr |
+		pci_dev_id(dev) << 11 |
+		(pci_domain_nr(dev->bus) & 0xFFFFFFFF) << 27;
+}
+
+static inline bool pci_msi_desc_is_multi_msi(struct msi_desc *desc)
+{
+	return !desc->pci.msi_attrib.is_msix && desc->nvec_used > 1;
+}
+
+/**
+ * pci_msi_domain_check_cap - Verify that @domain supports the capabilities
+ * 			      for @dev
+ * @domain:	The interrupt domain to check
+ * @info:	The domain info for verification
+ * @dev:	The device to check
+ *
+ * Returns:
+ *  0 if the functionality is supported
+ *  1 if Multi MSI is requested, but the domain does not support it
+ *  -ENOTSUPP otherwise
+ */
+int pci_msi_domain_check_cap(struct irq_domain *domain,
+			     struct msi_domain_info *info, struct device *dev)
+{
+	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
+
+	/* Special handling to support __pci_enable_msi_range() */
+	if (pci_msi_desc_is_multi_msi(desc) &&
+	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
+		return 1;
+	else if (desc->pci.msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static int pci_msi_domain_handle_error(struct irq_domain *domain,
+				       struct msi_desc *desc, int error)
+{
+	/* Special handling to support __pci_enable_msi_range() */
+	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
+		return 1;
+
+	return error;
+}
+
+static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
+				    struct msi_desc *desc)
+{
+	arg->desc = desc;
+	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
+}
+
+static struct msi_domain_ops pci_msi_domain_ops_default = {
+	.set_desc	= pci_msi_domain_set_desc,
+	.msi_check	= pci_msi_domain_check_cap,
+	.handle_error	= pci_msi_domain_handle_error,
+};
+
+static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
+{
+	struct msi_domain_ops *ops = info->ops;
+
+	if (ops == NULL) {
+		info->ops = &pci_msi_domain_ops_default;
+	} else {
+		if (ops->set_desc == NULL)
+			ops->set_desc = pci_msi_domain_set_desc;
+		if (ops->msi_check == NULL)
+			ops->msi_check = pci_msi_domain_check_cap;
+		if (ops->handle_error == NULL)
+			ops->handle_error = pci_msi_domain_handle_error;
+	}
+}
+
+static void pci_msi_domain_update_chip_ops(struct msi_domain_info *info)
+{
+	struct irq_chip *chip = info->chip;
+
+	BUG_ON(!chip);
+	if (!chip->irq_write_msi_msg)
+		chip->irq_write_msi_msg = pci_msi_domain_write_msg;
+	if (!chip->irq_mask)
+		chip->irq_mask = pci_msi_mask_irq;
+	if (!chip->irq_unmask)
+		chip->irq_unmask = pci_msi_unmask_irq;
+}
+
+/**
+ * pci_msi_create_irq_domain - Create a MSI interrupt domain
+ * @fwnode:	Optional fwnode of the interrupt controller
+ * @info:	MSI domain info
+ * @parent:	Parent irq domain
+ *
+ * Updates the domain and chip ops and creates a MSI interrupt domain.
+ *
+ * Returns:
+ * A domain pointer or NULL in case of failure.
+ */
+struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
+					     struct msi_domain_info *info,
+					     struct irq_domain *parent)
+{
+	struct irq_domain *domain;
+
+	if (WARN_ON(info->flags & MSI_FLAG_LEVEL_CAPABLE))
+		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
+
+	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
+		pci_msi_domain_update_dom_ops(info);
+	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
+		pci_msi_domain_update_chip_ops(info);
+
+	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
+	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
+		info->flags |= MSI_FLAG_MUST_REACTIVATE;
+
+	/* PCI-MSI is oneshot-safe */
+	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+
+	domain = msi_create_irq_domain(fwnode, info, parent);
+	if (!domain)
+		return NULL;
+
+	irq_domain_update_bus_token(domain, DOMAIN_BUS_PCI_MSI);
+	return domain;
+}
+EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
+
+/*
+ * Users of the generic MSI infrastructure expect a device to have a single ID,
+ * so with DMA aliases we have to pick the least-worst compromise. Devices with
+ * DMA phantom functions tend to still emit MSIs from the real function number,
+ * so we ignore those and only consider topological aliases where either the
+ * alias device or RID appears on a different bus number. We also make the
+ * reasonable assumption that bridges are walked in an upstream direction (so
+ * the last one seen wins), and the much braver assumption that the most likely
+ * case is that of PCI->PCIe so we should always use the alias RID. This echoes
+ * the logic from intel_irq_remapping's set_msi_sid(), which presumably works
+ * well enough in practice; in the face of the horrible PCIe<->PCI-X conditions
+ * for taking ownership all we can really do is close our eyes and hope...
+ */
+static int get_msi_id_cb(struct pci_dev *pdev, u16 alias, void *data)
+{
+	u32 *pa = data;
+	u8 bus = PCI_BUS_NUM(*pa);
+
+	if (pdev->bus->number != bus || PCI_BUS_NUM(alias) != bus)
+		*pa = alias;
+
+	return 0;
+}
+
+/**
+ * pci_msi_domain_get_msi_rid - Get the MSI requester id (RID)
+ * @domain:	The interrupt domain
+ * @pdev:	The PCI device.
+ *
+ * The RID for a device is formed from the alias, with a firmware
+ * supplied mapping applied
+ *
+ * Returns: The RID.
+ */
+u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
+{
+	struct device_node *of_node;
+	u32 rid = pci_dev_id(pdev);
+
+	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
+
+	of_node = irq_domain_get_of_node(domain);
+	rid = of_node ? of_msi_map_id(&pdev->dev, of_node, rid) :
+			iort_msi_map_id(&pdev->dev, rid);
+
+	return rid;
+}
+
+/**
+ * pci_msi_get_device_domain - Get the MSI domain for a given PCI device
+ * @pdev:	The PCI device
+ *
+ * Use the firmware data to find a device-specific MSI domain
+ * (i.e. not one that is set as a default).
+ *
+ * Returns: The corresponding MSI domain or NULL if none has been found.
+ */
+struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
+{
+	struct irq_domain *dom;
+	u32 rid = pci_dev_id(pdev);
+
+	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
+	dom = of_msi_map_get_device_domain(&pdev->dev, rid, DOMAIN_BUS_PCI_MSI);
+	if (!dom)
+		dom = iort_get_device_domain(&pdev->dev, rid,
+					     DOMAIN_BUS_PCI_MSI);
+	return dom;
+}
+
+/**
+ * pci_dev_has_special_msi_domain - Check whether the device is handled by
+ *				    a non-standard PCI-MSI domain
+ * @pdev:	The PCI device to check.
+ *
+ * Returns: True if the device irqdomain or the bus irqdomain is
+ * non-standard PCI/MSI.
+ */
+bool pci_dev_has_special_msi_domain(struct pci_dev *pdev)
+{
+	struct irq_domain *dom = dev_get_msi_domain(&pdev->dev);
+
+	if (!dom)
+		dom = dev_get_msi_domain(&pdev->bus->dev);
+
+	if (!dom)
+		return true;
+
+	return dom->bus_token != DOMAIN_BUS_PCI_MSI;
+}
+
+#endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
+#endif /* CONFIG_PCI_MSI */
+
+void pci_msi_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	/*
+	 * Disable the MSI hardware to avoid screaming interrupts
+	 * during boot.  This is the power on reset default so
+	 * usually this should be a noop.
+	 */
+	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
+	if (!dev->msi_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
+	if (ctrl & PCI_MSI_FLAGS_ENABLE)
+		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
+				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
+
+	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
+		dev->no_64bit_msi = 1;
+}
+
+void pci_msix_init(struct pci_dev *dev)
+{
+	u16 ctrl;
+
+	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
+	if (!dev->msix_cap)
+		return;
+
+	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
+	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
+		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
+				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
+}

