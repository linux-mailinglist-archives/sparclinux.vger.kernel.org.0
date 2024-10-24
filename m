Return-Path: <sparclinux+bounces-2458-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A69ADEEB
	for <lists+sparclinux@lfdr.de>; Thu, 24 Oct 2024 10:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CFA01F2395A
	for <lists+sparclinux@lfdr.de>; Thu, 24 Oct 2024 08:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8541C4A01;
	Thu, 24 Oct 2024 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUYTT8Tx"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EAC1C1753;
	Thu, 24 Oct 2024 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757850; cv=none; b=iVCPWxqAnsujoZZVTrLA9XoEh8jY+P+Y4FRKL9RwSHCfJzhElR55hGw18j4QhIkvySr6DIWKmPB2o74qxyrolG4YFRbMGUmrpqf+wISDiAJ5R0OKuROFoer5YB0zmA8xk6/2f1HyajhCrr/7tAb/UxKlHoQtpnv1lhooIgUGhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757850; c=relaxed/simple;
	bh=Ox/ZYsBrrmbPK3A2QSUcQ8QfXoa69FGJYXDNNRcdBnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYHTSMJeMw6+i3oRT/+mzh6oStFV+NEaxc1JpjnyaoZ3xql9AaiFDVtmjVyf93aKXxocZPK10yYFpy5TDBs4jJDoeW953iR2cCJvQYXPNdoDZ1en6MvWbqkbgV4WIA2ROdQ7WO7c8hLjoUqjonmemb32zkAgyV1WMYSuQyqipBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUYTT8Tx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612D5C4CEC7;
	Thu, 24 Oct 2024 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729757849;
	bh=Ox/ZYsBrrmbPK3A2QSUcQ8QfXoa69FGJYXDNNRcdBnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUYTT8Tx/x5v0ueXFlaIbTgM/tC1LFzcQH/Bk/9E/G27ofyIbDJ7VnB94NYJst0cv
	 rwM3dJS8U0ddWOUUXyYJ5U2DbjwqikH39DsU8Z9vNeIPIaGV5iltmAX+1Y07CtyHuu
	 qjH8xAIYsTm3k2jYsPE3Yg78rgh4kjznfSO7VPR6GqKUwnNvv6GGqa5UsKhK6x1lWv
	 w5QasDDvCUMmBgmW/lX8F5rn9hH0iBupLlusSquog8hp4ocLfovmnzNHmy5eiFqmmK
	 d1E2Of3Az/DoYE4MNq3gGFDCWEofW+6fRLAOpgssfQgrtruzoRtxJno9OxgV2pJlkI
	 Cl6tQ0r75+5yg==
Date: Thu, 24 Oct 2024 11:13:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <ZxoBlwkh528r-vef@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-7-rppt@kernel.org>
 <20241021221519.GA3567210@thelio-3990X>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021221519.GA3567210@thelio-3990X>

Hi Nathan,

On Mon, Oct 21, 2024 at 03:15:19PM -0700, Nathan Chancellor wrote:
> Hi Mike,
> 
> On Wed, Oct 16, 2024 at 03:24:22PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > When module text memory will be allocated with ROX permissions, the
> > memory at the actual address where the module will live will contain
> > invalid instructions and there will be a writable copy that contains the
> > actual module code.
> > 
> > Update relocations and alternatives patching to deal with it.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Sorry that you have to hear from me again :) It seems that module
> loading is still broken with this version of the patch, which is
> something that I missed in my earlier testing since I only test a
> monolithic kernel with my regular virtual machine testing. If I build
> and install the kernel and modules in the VM via a distribution package,
> I get the following splat at boot:
>
>   Starting systemd-udevd version 256.7-1-arch
>   [    0.882312] SMP alternatives: Something went horribly wrong trying to rewrite the CFI implementation.
>   [    0.883526] CFI failure at do_one_initcall+0x128/0x380 (target: init_module+0x0/0xff0 [crc32c_intel]; expected type: 0x0c7a3a22)
>   [    0.884802] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>   [    0.885434] CPU: 3 UID: 0 PID: 157 Comm: modprobe Tainted: G        W          6.12.0-rc3-debug-next-20241021-06324-g63b3ff03d91a #1 291f0fd70f293827edec681d3c5304f5807a3c7b
>   [    0.887084] Tainted: [W]=WARN
>   [    0.887409] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 2/2/2022
>   [    0.888241] RIP: 0010:do_one_initcall+0x128/0x380
>   [    0.888720] Code: f3 0f 1e fa 41 be ff ff ff ff e9 0f 01 00 00 0f 1f 44 00 00 41 81 e7 ff ff ff 7f 49 89 db 41 ba de c5 85 f3 45 03 53 f1 74 02 <0f> 0b 41 ff d3 0f 1f 00 41 89 c6 0f 1f 44 00 00 c6 04 24 00 65 8b
>   [    0.890598] RSP: 0018:ff3f93e5c052f970 EFLAGS: 00010217
>   [    0.891129] RAX: ffffffffb4c105b8 RBX: ffffffffc0602010 RCX: 0000000000000000
>   [    0.891850] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffc0602010
>   [    0.892588] RBP: ff3f93e5c052fc88 R08: 0000000000000020 R09: 0000000000000000
>   [    0.893305] R10: 000000002a378b84 R11: ffffffffc0602010 R12: 00000000000069c6
>   [    0.894003] R13: ff1f0090c5596900 R14: ff1f0090c15a55c0 R15: 0000000000000000
>   [    0.894693] FS:  00007ffb712c0740(0000) GS:ff1f00942fb80000(0000) knlGS:0000000000000000
>   [    0.895453] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   [    0.896020] CR2: 00007ffffc4424c8 CR3: 0000000100af4002 CR4: 0000000000771ef0
>   [    0.896698] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   [    0.897391] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   [    0.898077] PKRU: 55555554
>   [    0.898337] Call Trace:
>   [    0.898577]  <TASK>
>   [    0.898784]  ? __die_body+0x6a/0xb0
>   [    0.899132]  ? die+0xa4/0xd0
>   [    0.899413]  ? do_trap+0xa6/0x180
>   [    0.899740]  ? do_one_initcall+0x128/0x380
>   [    0.900130]  ? do_one_initcall+0x128/0x380
>   [    0.900523]  ? handle_invalid_op+0x6a/0x90
>   [    0.900917]  ? do_one_initcall+0x128/0x380
>   [    0.901311]  ? exc_invalid_op+0x38/0x60
>   [    0.901679]  ? asm_exc_invalid_op+0x1a/0x20
>   [    0.902081]  ? __cfi_init_module+0x10/0x10 [crc32c_intel 5331566c5540f82df397056699bc4ddac8be1306]
>   [    0.902933]  ? __cfi_init_module+0x10/0x10 [crc32c_intel 5331566c5540f82df397056699bc4ddac8be1306]
>   [    0.903781]  ? __cfi_init_module+0x10/0x10 [crc32c_intel 5331566c5540f82df397056699bc4ddac8be1306]
>   [    0.904634]  ? do_one_initcall+0x128/0x380
>   [    0.905028]  ? idr_alloc_cyclic+0x139/0x1d0
>   [    0.905437]  ? security_kernfs_init_security+0x54/0x190
>   [    0.905958]  ? __kernfs_new_node+0x1ba/0x240
>   [    0.906377]  ? sysfs_create_dir_ns+0x8f/0x140
>   [    0.906795]  ? kernfs_link_sibling+0xf2/0x110
>   [    0.907211]  ? kernfs_activate+0x2c/0x110
>   [    0.907599]  ? kernfs_add_one+0x108/0x150
>   [    0.907981]  ? __kernfs_create_file+0x75/0xa0
>   [    0.908407]  ? sysfs_create_bin_file+0xc6/0x120
>   [    0.908853]  ? __vunmap_range_noflush+0x347/0x420
>   [    0.909313]  ? _raw_spin_unlock+0xe/0x30
>   [    0.909692]  ? free_unref_page+0x22c/0x4c0
>   [    0.910097]  ? __kmalloc_cache_noprof+0x1a8/0x360
>   [    0.910546]  do_init_module+0x60/0x250
>   [    0.910910]  __se_sys_finit_module+0x316/0x420
>   [    0.911351]  do_syscall_64+0x88/0x170
>   [    0.911699]  ? __x64_sys_lseek+0x68/0xb0
>   [    0.912077]  ? syscall_exit_to_user_mode+0x97/0xc0
>   [    0.912538]  ? do_syscall_64+0x94/0x170
>   [    0.912902]  ? syscall_exit_to_user_mode+0x97/0xc0
>   [    0.913353]  ? do_syscall_64+0x94/0x170
>   [    0.913709]  ? clear_bhb_loop+0x45/0xa0
>   [    0.914071]  ? clear_bhb_loop+0x45/0xa0
>   [    0.914428]  ? clear_bhb_loop+0x45/0xa0
>   [    0.914767]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>   [    0.915089] RIP: 0033:0x7ffb713dc1fd
>   [    0.915316] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 fa 0c 00 f7 d8 64 89 01 48
>   [    0.916491] RSP: 002b:00007ffffc4454a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>   [    0.916964] RAX: ffffffffffffffda RBX: 000055f28c6a5420 RCX: 00007ffb713dc1fd
>   [    0.917413] RDX: 0000000000000000 RSI: 000055f26c40cc03 RDI: 0000000000000003
>   [    0.917858] RBP: 00007ffffc445560 R08: 0000000000000001 R09: 00007ffffc4454f0
>   [    0.918302] R10: 0000000000000040 R11: 0000000000000246 R12: 000055f26c40cc03
>   [    0.918748] R13: 0000000000060000 R14: 000055f28c6a4b50 R15: 000055f28c6ac5b0
>   [    0.919211]  </TASK>
>   [    0.919356] Modules linked in: crc32c_intel(+)
>   [    0.919661] ---[ end trace 0000000000000000 ]---
> 
> I also see some other WARNs interleaved along the lines of
> 
>   [    0.982759] no CFI hash found at: 0xffffffffc0608000 ffffffffc0608000 cc cc cc cc cc
>   [    0.982767] WARNING: CPU: 5 PID: 170 at arch/x86/kernel/alternative.c:1204 __apply_fineibt+0xa6d/0xab0
> 
> The console appears to be a bit of a mess after that initial message.
> 
> If there is any more information I can provide or patches I can test, I
> am more than happy to do so.
 
I've got similar report from kbuild bot a few days ago:
https://lore.kernel.org/all/202410202257.b7edc376-lkp@intel.com

I fixed fineibt handling in v7:
https://lore.kernel.org/linux-mm/20241023162711.2579610-1-rppt@kernel.org

> Cheers,
> Nathan
> 

-- 
Sincerely yours,
Mike.

