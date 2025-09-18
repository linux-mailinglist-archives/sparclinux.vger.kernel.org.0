Return-Path: <sparclinux+bounces-5021-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A88B57A80
	for <lists+sparclinux@lfdr.de>; Mon, 15 Sep 2025 14:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A1963AA407
	for <lists+sparclinux@lfdr.de>; Mon, 15 Sep 2025 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520593090C6;
	Mon, 15 Sep 2025 12:20:57 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5E8305074;
	Mon, 15 Sep 2025 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938857; cv=none; b=aPFVi+m+t95gXRC7WLIpnTLWX1ru+8gC9dBG/Unnr0wQWYz4WLe0pumdCHJgEB123VotFOrNczeM51ajS6yUTgDszdE9VJKA2Z4ImRDk1YTl2ypXZvkKDXHyBMgugs1TWMA9ClOzQBtCQ7VxCDZCVtTfTSSmi8nsJqINUBx6KmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938857; c=relaxed/simple;
	bh=uNIo1cAabwzE9IPA0cfQV0YWz9JkTnjDxgf5F6VCJ0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhiKTFYIBDlt8xCpp2ggISqUmRvXaCLn32q6WsnDam50ETXqOiTgwKi48euBb6U2/fEReTfOoT3xj9WTOEr5PaoDHeQ/vBJ4MjFkIkg7+BnenEwyAvSUcZbEOqg1Sk9VCjlea1iN5130M9UqI8QMZcG6rxHKx451pmNr55FOmiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cQNZd627cz9syx;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mf1sNH2VtTYE; Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cQNZd4q5Tz9syv;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7972E8B765;
	Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id eB2t50EqXouC; Mon, 15 Sep 2025 13:48:09 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6128B763;
	Mon, 15 Sep 2025 13:48:08 +0200 (CEST)
Message-ID: <fe3aea1c-24eb-49f4-9ce3-8f132d8814be@csgroup.eu>
Date: Mon, 15 Sep 2025 13:48:08 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 05/62] init: remove "ramdisk_start" command line
 parameter, which controls starting block number of initrd
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
 <20250913003842.41944-6-safinaskar@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250913003842.41944-6-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Have a simpler subject,

Le 13/09/2025 à 02:37, Askar Safin a écrit :
> [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This is preparation for initrd removal

and make a more interesting message.


For me it would make more sense to remove ramdisk_start and ramdisk_size 
at the same time.

Christophe

> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>   Documentation/admin-guide/blockdev/ramdisk.rst  | 3 +--
>   Documentation/admin-guide/kernel-parameters.txt | 2 --
>   init/do_mounts_rd.c                             | 7 -------
>   3 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
> index 9ce6101e8dd9..e57c61108dbc 100644
> --- a/Documentation/admin-guide/blockdev/ramdisk.rst
> +++ b/Documentation/admin-guide/blockdev/ramdisk.rst
> @@ -74,12 +74,11 @@ arch/x86/boot/Makefile.
> 
>   Some of the kernel command line boot options that may apply here are::
> 
> -  ramdisk_start=N
>     ramdisk_size=M
> 
>   If you make a boot disk that has LILO, then for the above, you would use::
> 
> -       append = "ramdisk_start=N ramdisk_size=M"
> +       append = "ramdisk_size=M"
> 
>   4) An Example of Creating a Compressed RAM Disk
>   -----------------------------------------------
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f940c1184912..07e8878f1e13 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5285,8 +5285,6 @@
>          ramdisk_size=   [RAM] Sizes of RAM disks in kilobytes
>                          See Documentation/admin-guide/blockdev/ramdisk.rst.
> 
> -       ramdisk_start=  [RAM] RAM disk image start address
> -
>          random.trust_cpu=off
>                          [KNL,EARLY] Disable trusting the use of the CPU's
>                          random number generator (if available) to
> diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
> index 8e0a774a9c6f..864fa88d9f89 100644
> --- a/init/do_mounts_rd.c
> +++ b/init/do_mounts_rd.c
> @@ -17,13 +17,6 @@
>   static struct file *in_file, *out_file;
>   static loff_t in_pos, out_pos;
> 
> -static int __init ramdisk_start_setup(char *str)
> -{
> -       /* will be removed in next commit */
> -       return 1;
> -}
> -__setup("ramdisk_start=", ramdisk_start_setup);
> -
>   static int __init crd_load(decompress_fn deco);
> 
>   /*
> --
> 2.47.2
> 
> 


