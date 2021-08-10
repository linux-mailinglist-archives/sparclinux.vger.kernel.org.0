Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643933D68DD
	for <lists+sparclinux@lfdr.de>; Mon, 26 Jul 2021 23:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhGZVDT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Jul 2021 17:03:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:44758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231787AbhGZVDS (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 26 Jul 2021 17:03:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4E5260F94;
        Mon, 26 Jul 2021 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627335827;
        bh=dBX7fIHWCiOh57pPoZiCCdXb5SlCraznstvQ/Ghyeyk=;
        h=Date:From:To:Cc:Subject:From;
        b=BGxbg+DkR9D1cy3KQhuXS5YzIIzwWDlpwvuudr9Nnj65VZHe5NxXX/rB98+XUf1y7
         ABdnFs5TWlxBHlqAy5NMV5xi/a5JrGgESy96kDBNXB11Ea620/9t3SuD2AdTAA4SNJ
         ccctpJ63SGBfdmsS+4AAK92Sjh1xOXZkTLMzVFV7Kzna/QjXua8f2QRi8lLDm5Qyhf
         NRVE3aUYn+fBGGzXAxBBNYmIrmEYk3GPxa82THGXisiQQNBXXluEDKeD9BzNhu5auw
         fVnNnYPrTguCBtp4otVvyLNZtpS1eb2ahXtRqcBYT24Qg+KhvIIR5AQB8e49mxdh7i
         3Ok+urmkpYDwA==
Date:   Mon, 26 Jul 2021 16:43:45 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Guo Ren <guoren@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [helgaas@kernel.org: Re: aarch64 efi boot failures with qemu 6.0+]
Message-ID: <20210726214345.GA645499@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Just FYI.

Guenter tripped over a problem with an I/O BAR set to zero.  I think
your arches allow that (at least they "#define PCIBIOS_MIN_IO 0"), and
some drivers don't handle such BARs.  More details below.

Note that I didn't actually cc you on the thread, mostly because I
forgot but partly to avoid exploding the cc list with people who
probably don't care.  If you want to respond directly to the thread,
you can use this:

https://lore.kernel.org/qemu-devel/20210724185234.GA2265457@roeck-us.net/

----- Forwarded message from Bjorn Helgaas <helgaas@kernel.org> -----

Date: Mon, 26 Jul 2021 16:16:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Philippe Mathieu-Daud� <philmd@redhat.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Jiahui Cen <cenjiahui@huawei.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, Guenter
	Roeck <linux@roeck-us.net>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210726211628.GA640636@bjorn-Precision-5520>

On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> (cc Bjorn)
> 
> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud� <philmd@redhat.com> wrote:
> > On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > >> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > >>> Hi all,
> > >>>
> > >>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > >>> work. Analysis shows that PCI devices with IO ports do not instantiate
> > >>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > >>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > >>> affects
> > >>> aarch64, not x86/x86_64.
> > >>>
> > >>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > >>> keep firmware resource map"). Since this commit, PCI device BAR
> > >>> allocation has changed. Taking tulip as example, the kernel reports
> > >>> the following PCI bar assignments when running qemu v5.2.
> > >>>
> > >>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> 
> IIUC, these lines are read back from the BARs
> 
> > >>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > >>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > >>> 0x10000000-0x1000007f]
> > >>>
> 
> ... and this is the assignment created by the kernel.
> 
> > >>> With qemu v6.0, the assignment is reported as follows.
> > >>>
> > >>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> 
> The problem here is that Linux, for legacy reasons, does not support
> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> rejected.
> 
> This might make sense on x86, where legacy I/O ports may exist, but on
> other architectures, this makes no sense.

I guess this is the "#define PCIBIOS_MIN_IO 0x1000" in
arm64/include/asm/pci.h.  From a PCI point of view, I'm not opposed to
changing that to 0, as it is on csky, riscv, sh, sparc, um.  But it's
really an arch question, so the arm64 folks would have to weigh in.

But I don't think that would fix this.  PCIBIOS_MIN_IO is mainly used
when we assign or reassign resources to a BAR, and if firmware tells
us to preserve the assignments done by firmware, Linux shouldn't be
doing any assignment or reassignment.

Linux received 00:01.0 BAR 0 as [io 0x0000-0x007f], and Guenter didn't
report any reassignment, so I assume Linux saw the
DSM_PCI_PRESERVE_BOOT_CONFIG [1] and didn't change anything.

Could this be due to drivers assuming that an I/O BAR of 0 is invalid?
I see that at least ne2k_pci_init_one() [2] seems to assume that.  And
tulip_init_one() [3] and pci_esp_probe_one() (am53c974.c, [4]) use
pci_iomap() [5], which fails if the resource starts at 0.

So pci_iomap() is probably already broken on the arches above that
allow I/O BARs to be zero.  Maybe pci_iomap() should only fail on
"!start" for *memory* BARs, e.g.,

diff --git a/lib/pci_iomap.c b/lib/pci_iomap.c
index 2d3eb1cb73b8..77455e702a3e 100644
--- a/lib/pci_iomap.c
+++ b/lib/pci_iomap.c
@@ -34,7 +34,9 @@ void __iomem *pci_iomap_range(struct pci_dev *dev,
 	resource_size_t len = pci_resource_len(dev, bar);
 	unsigned long flags = pci_resource_flags(dev, bar);
 
-	if (len <= offset || !start)
+	if (flags & IORESOURCE_MEM && !start)
+		return NULL;
+	if (len <= offset)
 		return NULL;
 	len -= offset;
 	start += offset;


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/pci_root.c?id=v5.13#n915
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/8390/ne2k-pci.c?id=v5.13#n247
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/dec/tulip/tulip_core.c?id=v5.13#n1418
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/am53c974.c?id=v5.13#n431
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/pci_iomap.c?id=v5.13#n37

> > >>> and the controller does not instantiate. The problem disapears after
> > >>> reverting commit 0cf8882fd0.
> > >>>
> > >>> Attached is a summary of test runs with various devices and qemu v5.2
> > >>> as well as qemu v6.0, and the command line I use for efi boots.
> > >>>
> > >>> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
> > >>> command line to instantiate PCI devices with io ports, or are such
> > >>> devices
> > >>> simply no longer supported if the system is booted with efi support ?
> > >>>
> > >>> Thanks,
> > >>> Guenter
> > >>
> > >>
> > >> So that commit basically just says don't ignore what efi did.
> > >>
> > >> The issue's thus likely efi.
> > >>
> > >
> > > I don't see the problem with efi boots on x86 and x86_64.
> > > Any idea why that might be the case ?
> > >
> > > Thanks,
> > > Guenter
> > >
> > >> Cc the maintainer. Philippe can you comment pls?
> >
> > I'll have a look. Cc'ing Ard for EDK2/Aarch64.
> 
> So a potential workaround would be to use a different I/O resource
> window for ArmVirtPkg, that starts at 0x1000. But I would prefer to
> fix Linux instead.
> 
> 
> > >>
> > >>> ---
> > >>> Command line (tulip network interface):
> > >>>
> > >>> CMDLINE="root=/dev/vda console=ttyAMA0"
> > >>> ROOTFS="rootfs.ext2"
> > >>>
> > >>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
> > >>>          -m 512 -cpu cortex-a57 -no-reboot \
> > >>>          -device tulip,netdev=net0 -netdev user,id=net0 \
> > >>>          -bios QEMU_EFI-aarch64.fd \
> > >>>          -snapshot \
> > >>>          -device virtio-blk-device,drive=d0 \
> > >>>          -drive file=${ROOTFS},if=none,id=d0,format=raw \
> > >>>          -nographic -serial stdio -monitor none \
> > >>>          --append "${CMDLINE}"
> > >>>
> > >>> ---
> > >>> Boot tests with various devices known to work in qemu v5.2.
> > >>>
> > >>>         v5.2    v6.0    v6.0
> > >>>         efi    non-efi    efi
> > >>> e1000        pass    pass    pass
> > >>> e1000-82544gc    pass    pass    pass
> > >>> e1000-82545em    pass    pass    pass
> > >>> e1000e        pass    pass    pass
> > >>> i82550        pass    pass    pass
> > >>> i82557a        pass    pass    pass
> > >>> i82557b        pass    pass    pass
> > >>> i82557c        pass    pass    pass
> > >>> i82558a        pass    pass    pass
> > >>> i82559b        pass    pass    pass
> > >>> i82559c        pass    pass    pass
> > >>> i82559er    pass    pass    pass
> > >>> i82562        pass    pass    pass
> > >>> i82801        pass    pass    pass
> > >>> ne2k_pci    pass    pass    fail    <--
> > >>> pcnet        pass    pass    pass
> > >>> rtl8139        pass    pass    pass
> > >>> tulip        pass    pass    fail    <--
> > >>> usb-net        pass    pass    pass
> > >>> virtio-net-device
> > >>>         pass    pass    pass
> > >>> virtio-net-pci    pass    pass    pass
> > >>> virtio-net-pci-non-transitional
> > >>>         pass    pass    pass
> > >>>
> > >>> usb-xhci    pass    pass    pass
> > >>> usb-ehci    pass    pass    pass
> > >>> usb-ohci    pass    pass    pass
> > >>> usb-uas-xhci    pass    pass    pass
> > >>> virtio        pass    pass    pass
> > >>> virtio-blk-pci    pass    pass    pass
> > >>> virtio-blk-device
> > >>>         pass    pass    pass
> > >>> nvme        pass    pass    pass
> > >>> sdhci        pass    pass    pass
> > >>> dc390        pass    pass    fail    <--
> > >>> am53c974    pass    pass    fail    <--
> > >>> lsi53c895ai    pass    pass    pass
> > >>> mptsas1068    pass    pass    pass
> > >>> lsi53c810    pass    pass    pass
> > >>> megasas        pass    pass    pass
> > >>> megasas-gen2    pass    pass    pass
> > >>> virtio-scsi-device
> > >>>         pass    pass    pass
> > >>> virtio-scsi-pci    pass    pass    pass
> > >>
> > >
> >
> 

----- End forwarded message -----
