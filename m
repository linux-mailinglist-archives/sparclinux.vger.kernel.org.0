Return-Path: <sparclinux+bounces-5013-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90EB5793B
	for <lists+sparclinux@lfdr.de>; Mon, 15 Sep 2025 13:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9255D188BAF1
	for <lists+sparclinux@lfdr.de>; Mon, 15 Sep 2025 11:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F650305076;
	Mon, 15 Sep 2025 11:50:56 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC10304BAF;
	Mon, 15 Sep 2025 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937056; cv=none; b=t9l+W3lt8e3IqCtSOKQbqKJN7FvvigH/XerqeUZQ+vAAhDJDnmsrbMRWpXalbC5JfIPmAc1ONrD9a130XmS6Rzvr3lvvJpD8eACAqJmTTRLHD7bpn+lQCsuqfnkNR1Yi5NusUP5ioDYB1/nefR7QW5QVn9LdGlkV05c79Q2qT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937056; c=relaxed/simple;
	bh=8Z5zmYLUV+4ZrO5EHC1XTvy0sirc64JgGyrM0lTrX/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HysQ689iKwpGPonDrCdYyDAkjzBUSGbP5UyMcgAHj8gOgLtZUJp37dsFzqbAsF01w6QVKnvQpC6M1AMOE3Y2sxEos5jNW4VVFovd5aXQfJAKdsRfSh4/EyTZwN4Gvj8gUW4RaLoXHNg2xLCtv+XQ9bGmG11O+gmTyliWJKGI8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQMtV5Jlbz9sxc;
	Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZVVkhWHgxQ4; Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQMtV3yTGz9sxZ;
	Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BA448B765;
	Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id guosnhabo8gg; Mon, 15 Sep 2025 13:16:50 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B33B28B763;
	Mon, 15 Sep 2025 13:16:49 +0200 (CEST)
Message-ID: <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
Date: Mon, 15 Sep 2025 13:16:49 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk"
 command line parameter, which does nothing
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org,
 initramfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-3-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-3-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This is preparation for initrd removal

Squash patch 1 and patch 2 together and say this is cleanup of two 
options deprecated by commit c8376994c86c ("initrd: remove support for 
multiple floppies") with the documentation by commit 6b99e6e6aa62 
("Documentation/admin-guide: blockdev/ramdisk: remove use of "rdev"")

Christophe

> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 2 --
>   arch/arm/configs/neponset_defconfig             | 2 +-
>   init/do_mounts_rd.c                             | 7 -------
>   3 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d3b05ce249ff..f940c1184912 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5229,8 +5229,6 @@
>                          Param: <number> - step/bucket size as a power of 2 for
>                                  statistical time based profiling.
> 
> -       prompt_ramdisk= [RAM] [Deprecated]
> -
>          prot_virt=      [S390] enable hosting protected virtual machines
>                          isolated from the hypervisor (if hardware supports
>                          that). If enabled, the default kernel base address
> diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
> index 16f7300239da..4d720001c12e 100644
> --- a/arch/arm/configs/neponset_defconfig
> +++ b/arch/arm/configs/neponset_defconfig
> @@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
>   CONFIG_ZBOOT_ROM_TEXT=0x80000
>   CONFIG_ZBOOT_ROM_BSS=0xc1000000
>   CONFIG_ZBOOT_ROM=y
> -CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
> +CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M noinitrd initrd=0xc0800000,3M"
>   CONFIG_FPE_NWFPE=y
>   CONFIG_PM=y
>   CONFIG_MODULES=y
> diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
> index ac021ae6e6fa..f7d53bc21e41 100644
> --- a/init/do_mounts_rd.c
> +++ b/init/do_mounts_rd.c
> @@ -17,13 +17,6 @@
>   static struct file *in_file, *out_file;
>   static loff_t in_pos, out_pos;
> 
> -static int __init prompt_ramdisk(char *str)
> -{
> -       pr_warn("ignoring the deprecated prompt_ramdisk= option\n");
> -       return 1;
> -}
> -__setup("prompt_ramdisk=", prompt_ramdisk);
> -
>   int __initdata rd_image_start;         /* starting block # of image */
> 
>   static int __init ramdisk_start_setup(char *str)
> --
> 2.47.2
> 
> 


