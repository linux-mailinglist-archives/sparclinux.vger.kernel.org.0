Return-Path: <sparclinux+bounces-4296-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76AB22725
	for <lists+sparclinux@lfdr.de>; Tue, 12 Aug 2025 14:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B456627F6B
	for <lists+sparclinux@lfdr.de>; Tue, 12 Aug 2025 12:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318041917F0;
	Tue, 12 Aug 2025 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="HIh/9xa0"
X-Original-To: sparclinux@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA381E520B;
	Tue, 12 Aug 2025 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002100; cv=none; b=O/bmdBspubjtGNQVy0AYNK/OVmyVpEsfIiNojcg6rEezg/lWBMiiEYTLago8yWOrZqSRXJkkMjAHQgTwbtpvb8SnYrAOpjY6DQJmVKfGVbYqiEFCKDuvg/6qVxNgc3ir+aVmVYXKxrAjmZB1y7lY0cSVsBFw2JMqNZP5frQZR/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002100; c=relaxed/simple;
	bh=p6aPkAG0KYMqaebLsqPtRl9u+7KIFxJrlPHRMDfyeS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAlPKhlrjMrIleU8XJiP/B8VmhCJJIc5ikxlJ7o0swiikllePzyATH6kCatKkHErtJT5wTOckHhtGP7dQEdiS6hCUtuk41YGSvkBIZrzAvPGuw3MMSoCx0vCTm5Kk02VEuTAe4Ii4yjfbZq9uhEO4F9yq8qVWRbui/FBdPsn7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=HIh/9xa0; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=iFbwK0q5RrrcR1jQYMv8x+D/1rRiSdBorl789PCWyZE=; t=1755002096;
	x=1755606896; b=HIh/9xa0NQvFmhX0Qr3dJglUpn436/6ToHrSMrdTlph1kNPHcfUrXTFTa4DwV
	dquMCuI83Zg5O1n55CidLVEcMhR5ktYRtCy/dmrOnaHLrc4R0xZNOVcmMUwdxe/WWeHR9JUfmL1iN
	1356P8cZzAUrI2zq12UIPyxhnNhL2klvPdgXFyGHeM5A/ndVSZTDO55eIWwNGw0sj9gxk7Rf8zvBF
	g6XWimAVvxlc9bscifBit4cnWJekWrh8C/9Wl58cFzD7LtL3IfRf2vQJj6M8z/LM3z8mxEn1QBBC4
	Is5CJPoHAzxqiFzuJ729Bw5G8BafqmoJrCKegHowNZpChRAHGQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uloDO-00000000BiF-1GcP; Tue, 12 Aug 2025 14:34:54 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uloDO-00000002pDN-08gD; Tue, 12 Aug 2025 14:34:54 +0200
Message-ID: <e7a95bc7328b60cca385fb241bc4a7c68c4e2c9b.camel@physik.fu-berlin.de>
Subject: Re: Found it - was: Re: [PATCH] sparc64: fix hugetlb for sun4u
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Anthony Yznaga <anthony.yznaga@oracle.com>, sparclinux@vger.kernel.org, 
	davem@davemloft.net, andreas@gaisler.com
Cc: linux-kernel@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, 
	ryan.roberts@arm.com, david@redhat.com, Oscar Salvador <osalvador@suse.de>
Date: Tue, 12 Aug 2025 14:34:53 +0200
In-Reply-To: <c50091bdbb0556ee74ec501381f1efc14a4e5929.camel@physik.fu-berlin.de>
References: <20250716012446.10357-1-anthony.yznaga@oracle.com>
									 <35f5ec4eda8a7dbeeb7df9ec0be5c0b062c509f7.camel@physik.fu-berlin.de>
									 <7e1e9aa5-0529-4fb5-84fb-557b5cc1cd50@oracle.com>
								 <38f4469f48e6d36fa92b445c8ecef7a440be43e6.camel@physik.fu-berlin.de>
							 <b14f55642207e63e907965e209f6323a0df6dcee.camel@physik.fu-berlin.de>
						 <fc1555550f7a9b3c9aa5fb651769cf41ed859c77.camel@physik.fu-berlin.de>
					 <ff3d87634aedec28e7103f16a35031bfe86ca501.camel@physik.fu-berlin.de>
				 <b5b75976c94b7b46f86a5af4675a1a570aaf20cc.camel@physik.fu-berlin.de>
			 <2bcb018c8b237f7ab2356f4459e14ae81a6fec8b.camel@physik.fu-berlin.de>
		 <2daaa0648e9bcca42bf7a76d90580725f44fb4bc.camel@physik.fu-berlin.de>
	 <c50091bdbb0556ee74ec501381f1efc14a4e5929.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

I accidentally re-added Meelis. Dropping again.

Adrian

On Tue, 2025-08-12 at 14:32 +0200, John Paul Adrian Glaubitz wrote:
> Hi Anthony,
>=20
> On Mon, 2025-08-11 at 12:44 +0200, John Paul Adrian Glaubitz wrote:
> > Hi,
> >=20
> > On Mon, 2025-08-11 at 00:20 +0200, John Paul Adrian Glaubitz wrote:
> > > Hi,
> > >=20
> > > On Sun, 2025-08-10 at 11:52 +0200, John Paul Adrian Glaubitz wrote:
> > > > On Sat, 2025-08-09 at 08:42 +0200, John Paul Adrian Glaubitz wrote:
> > > > > Let me know if you have more suggestions to test. I can also prov=
ide you with full
> > > > > access to this Netra 240 if you send me your public SSH key in a =
private mail.
> > > >=20
> > > > I have narrowed it down to a regression between v6.3 and v6.4 now.
> > > >=20
> > > > The bug can be reproduced with the sparc64_defconfig on a Sun Netra=
 240 by setting
> > > > CONFIG_TRANSPARENT_HUGEPAGE=3Dy and CONFIG_TRANSPARENT_HUGEPAGE_ALW=
AYS=3Dy. When testing
> > > > on a modern systemd-based distribution, it's also necessary to enab=
le CGroup support
> > > > as well as enable support for Sun partition tables with CONFIG_SUN_=
PARTITION=3Dy.
> > > >=20
> > > > Then it should be a matter of bisecting the commits between v6.3 an=
d v6.4.
> > > >=20
> > > > I will do that within the next days as I'm currently a bit busy wit=
h other stuff.
> > >=20
> > > OK, it turns out it's reproducible on older kernels (but not as old a=
s 4.19) as well.
> > > It's just much harder to trigger. I found a reproducer though and wil=
l try to find
> > > the problematic commit next.
> > >=20
> > > [50686.808389] BUG: Bad page map in process sshd-session  pte:0000000=
2 pmd:01448000
> > > [50686.905701] addr:00000100000a0000 vm_flags:00000075 anon_vma:00000=
00000000000 mapping:fff000003c8ca4f8 index:50
> > > [50687.038425] file:sshd-session fault:filemap_fault mmap:ext4_file_m=
map [ext4] read_folio:ext4_read_folio [ext4]
> > > [50687.170246] CPU: 0 PID: 37883 Comm: sshd-session Not tainted 6.3.0=
-2-sparc64 #1  Debian 6.3.11-1
> > > [50687.285751] Call Trace:
> > > [50687.317771] [<0000000000d660b0>] dump_stack+0x8/0x18
> > > [50687.382976] [<000000000064fd1c>] print_bad_pte+0x15c/0x200
> > > [50687.455024] [<0000000000650f84>] unmap_page_range+0x3e4/0xbe0
> > > [50687.530513] [<0000000000651cd8>] unmap_vmas+0xf8/0x1a0
> > > [50687.597993] [<000000000065e674>] exit_mmap+0xb4/0x360
> > > [50687.664331] [<00000000004647dc>] __mmput+0x3c/0x120
> > > [50687.728380] [<00000000004648f4>] mmput+0x34/0x60
> > > [50687.788999] [<000000000046b510>] do_exit+0x250/0xa00
> > > [50687.854194] [<000000000046bea4>] do_group_exit+0x24/0xa0
> > > [50687.923962] [<000000000046bf3c>] sys_exit_group+0x1c/0x40
> > > [50687.994875] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
> > > [50688.071518] Disabling lock debugging due to kernel taint
> > > [50689.484196] Unable to handle kernel paging request at virtual addr=
ess 000c000002400000
> > > [50689.588368] tsk->{mm,active_mm}->context =3D 00000000001815a6
> > > [50689.661677] tsk->{mm,active_mm}->pgd =3D fff000000ae60000
> > > [50689.730374]               \|/ ____ \|/
> > >                              "@'/ .. \`@"
> > >                              /_| \__/ |_\
> > >                                 \__U_/
> > > [50689.923679] sshd-session(37883): Oops [#1]
> > > [50689.977420] CPU: 0 PID: 37883 Comm: sshd-session Tainted: G    B  =
            6.3.0-2-sparc64 #1  Debian 6.3.11-1
> > > [50690.112384] TSTATE: 0000008811001607 TPC: 00000000006510cc TNPC: 0=
0000000006510d0 Y: 00000000    Tainted: G    B            =20
> > > [50690.261089] TPC: <unmap_page_range+0x52c/0xbe0>
> > > [50690.320650] g0: 00000000000004a8 g1: 000c000000000000 g2: 00000000=
00008800 g3: ffffffffffffffff
> > > [50690.435029] g4: fff0000001ef1280 g5: 0000000031200000 g6: fff00000=
01f04000 g7: ffffffffffffffff
> > > [50690.549403] o0: 000c000002400a20 o1: 00000100000a4000 o2: 00000001=
00048290 o3: 0000000000000000
> > > [50690.663779] o4: 0000000000000001 o5: 000000000000000d sp: fff00000=
01f06f61 ret_pc: 0000010000000000
> > > [50690.782728] RPC: <0x10000000000>
> > > [50690.825039] l0: 0000000100048290 l1: 000c000002400a20 l2: 00000100=
000a6000 l3: fff0000000950000
> > > [50690.939419] l4: 00000100000fc000 l5: fff000000196dc20 l6: fff00000=
01f07938 l7: 00000000010f6fd0
> > > [50691.053798] i0: fff0000001f07aa8 i1: 0000000000002000 i2: 00000100=
000a4000 i3: fff0000008311b00
> > > [50691.168170] i4: 0000000000100000 i5: fff0000001448290 i6: fff00000=
01f07081 i7: 0000000000651cd8
> > > [50691.282546] I7: <unmap_vmas+0xf8/0x1a0>
> > > [50691.332867] Call Trace:
> > > [50691.364891] [<0000000000651cd8>] unmap_vmas+0xf8/0x1a0
> > > [50691.432371] [<000000000065e674>] exit_mmap+0xb4/0x360
> > > [50691.498708] [<00000000004647dc>] __mmput+0x3c/0x120
> > > [50691.562759] [<00000000004648f4>] mmput+0x34/0x60
> > > [50691.623376] [<000000000046b510>] do_exit+0x250/0xa00
> > > [50691.688573] [<000000000046bea4>] do_group_exit+0x24/0xa0
> > > [50691.758340] [<000000000046bf3c>] sys_exit_group+0x1c/0x40
> > > [50691.829256] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
> > > [50691.905886] Caller[0000000000651cd8]: unmap_vmas+0xf8/0x1a0
> > > [50691.979085] Caller[000000000065e674]: exit_mmap+0xb4/0x360
> > > [50692.051141] Caller[00000000004647dc]: __mmput+0x3c/0x120
> > > [50692.120911] Caller[00000000004648f4]: mmput+0x34/0x60
> > > [50692.187246] Caller[000000000046b510]: do_exit+0x250/0xa00
> > > [50692.258160] Caller[000000000046bea4]: do_group_exit+0x24/0xa0
> > > [50692.333645] Caller[000000000046bf3c]: sys_exit_group+0x1c/0x40
> > > [50692.410280] Caller[0000000000406174]: linux_sparc_syscall+0x34/0x4=
4
> > > [50692.492629] Caller[fff0000102ad4a74]: 0xfff0000102ad4a74
> > > [50692.562397] Instruction DUMP:
> > > [50692.562399]  ce762010=20
> > > [50692.601281]  02f47fa8=20
> > > [50692.632163]  c4362018=20
> > > [50692.663044] <c45c6008>
> > > [50692.693926]  86100011=20
> > > [50692.724808]  8e08a001=20
> > > [50692.755689]  8400bfff=20
> > > [50692.786569]  8779d402=20
> > > [50692.817451]  c458e018=20
> > >=20
> > > [50692.898656] Fixing recursive fault but reboot is needed!
> >=20
> > So, I was able now to even reproduce it in kernel versions as early as =
5.2:
> >=20
> > [  122.085803] Unable to handle kernel NULL pointer dereference
> > [  122.160227] tsk->{mm,active_mm}->context =3D 000000000000009d
> > [  122.233502] tsk->{mm,active_mm}->pgd =3D fff0000231d14000
> > [  122.302118]               \|/ ____ \|/
> > [  122.302118]               "@'/ .. \`@"
> > [  122.302118]               /_| \__/ |_\
> > [  122.302118]                  \__U_/
> > [  122.495420] systemd(1): Oops [#1]
> > [  122.538874] CPU: 0 PID: 1 Comm: systemd Not tainted 5.2.0-3-sparc64 =
#1 Debian 5.2.17-1
> > [  122.642957] TSTATE: 0000004411001601 TPC: 000000000061cd94 TNPC: 000=
000000061cd98 Y: 00000000    Not tainted
> > [  122.772207] TPC: <vfs_getattr_nosec+0x34/0xc0>
> > [  122.830529] g0: 0000000000000000 g1: 00000000000007ff g2: 0000000000=
000000 g3: 00000000000007df
> > [  122.944902] g4: fff00002381771c0 g5: 0000000000000003 g6: fff0000238=
178000 g7: 0000000000000000
> > [  123.059275] o0: fff000023817be18 o1: 0000000000000000 o2: 0000000000=
000000 o3: fff000023817be18
> > [  123.173658] o4: 0000000000000000 o5: 0000000000000000 sp: fff0000238=
17b341 ret_pc: 000000000061cd7c
> > [  123.292611] RPC: <vfs_getattr_nosec+0x1c/0xc0>
> > [  123.350933] l0: 0000010000204010 l1: fff0000101600e28 l2: e4e45b5b8a=
e44628 l3: 0000000000000000
> > [  123.465311] l4: 0000000000000000 l5: 0000000000000000 l6: 0000000000=
000000 l7: fff0000100bff140
> > [  123.579692] i0: fff000023817bd50 i1: fff000023817be18 i2: 0000000000=
000001 i3: 0000000000000900
> > [  123.694060] i4: 0000000000000000 i5: fff00002320c1210 i6: fff0000238=
17b3f1 i7: 000000000061ce48
> > [  123.808439] I7: <vfs_getattr+0x28/0x40>
> > [  123.858759] Call Trace:
> > [  123.890785]  [000000000061ce48] vfs_getattr+0x28/0x40
> > [  123.957123]  [000000000061cf64] vfs_statx+0x84/0xc0
> > [  124.021173]  [000000000061d918] sys_statx+0x38/0x60
> > [  124.085226]  [0000000000406154] linux_sparc_syscall+0x34/0x44
> > [  124.160708] Disabling lock debugging due to kernel taint
> > [  124.230481] Caller[000000000061ce48]: vfs_getattr+0x28/0x40
> > [  124.303680] Caller[000000000061cf64]: vfs_statx+0x84/0xc0
> > [  124.374593] Caller[000000000061d918]: sys_statx+0x38/0x60
> > [  124.445503] Caller[0000000000406154]: linux_sparc_syscall+0x34/0x44
> > [  124.527857] Caller[fff00001013fde40]: 0xfff00001013fde40
> > [  124.597621] Instruction DUMP:
> > [  124.597623]  c2264000=20
> > [  124.636505]  861027df=20
> > [  124.667386]  c45f6028=20
> > [  124.698267] <c458a050>
> > [  124.729148]  8408a401=20
> > [  124.760031]  83789403=20
> > [  124.790910]  c2264000=20
> > [  124.821801]  c207600c=20
> > [  124.852675]  80886800=20
> > [  124.883556]=20
> > [  124.954015] Kernel panic - not syncing: Attempted to kill init! exit=
code=3D0x00000009
> > [  125.054721] Press Stop-A (L1-A) from sun keyboard or send break
> > [  125.054721] twice on console to return to the boot prom
> > [  125.201103] ---[ end Kernel panic - not syncing: Attempted to kill i=
nit! exitcode=3D0x00000009 ]---
> >=20
> > On v5.6, I'm getting an interesting error mentioning D-cache parity err=
ors:
> >=20
> > [  125.743109] CPU[0]: Cheetah+ D-cache parity error at TPC[00000000005=
6bacc]
> > [  125.833511] TPC<bpf_check+0x18ec/0x3060>
> > [  127.909612] systemd-sysv-generator[1677]: SysV service '/etc/init.d/=
buildd' lacks a native systemd unit file, automatically generating a unit f=
ile for compatibility.
> > [  128.104239] systemd-sysv-generator[1677]: Please update package to i=
nclude a native systemd unit file.
> > [  128.227312] systemd-sysv-generator[1677]: =E2=9A=A0 This compatibili=
ty logic is deprecated, expect removal soon. =E2=9A=A0
> > [  129.638144] Unable to handle kernel NULL pointer dereference
> > [  129.712528] tsk->{mm,active_mm}->context =3D 000000000000009e
> > [  129.785808] tsk->{mm,active_mm}->pgd =3D fff0000233d38000
> > [  129.854522]               \|/ ____ \|/
> > [  129.854522]               "@'/ .. \`@"
> > [  129.854522]               /_| \__/ |_\
> > [  129.854522]                  \__U_/
> > [  130.047827] systemd(1): Oops [#1]
> > [  130.091278] CPU: 0 PID: 1 Comm: systemd Tainted: G            E     =
5.6.0-2-sparc64 #1 Debian 5.6.14-2
> > [  130.213664] TSTATE: 0000009911001604 TPC: 00000000005506d8 TNPC: 000=
00000005506dc Y: 00000000    Tainted: G            E   =20
> > [  130.361222] TPC: <bpf_prog_realloc+0x38/0xe0>
> > [  130.418486] g0: 0000000002000000 g1: 0000000000000000 g2: 0000000000=
000000 g3: 0000000000000002
> > [  130.532867] g4: fff000023c178000 g5: 0000000000657300 g6: fff000023c=
180000 g7: fff000023423e684
> > [  130.647245] o0: ffffffff00002000 o1: 0000000000000001 o2: fff0000234=
168fa0 o3: 0000000000000000
> > [  130.761617] o4: fff0000237761f80 o5: 0000000000000001 sp: fff000023c=
182fd1 ret_pc: 00000000005f2c84
> > [  130.880576] RPC: <__vfree+0x24/0x80>
> > [  130.927456] l0: ffffffffffffffff l1: 0000000000000001 l2: 0000000000=
000400 l3: 0000000002000000
> > [  131.041836] l4: 0000000000debc00 l5: 0000000000000100 l6: 0000000000=
000001 l7: fff000023c005e40
> > [  131.156213] i0: 000000010004e000 i1: 0000000000002000 i2: 0000000000=
100cc0 i3: fff0000237761300
> > [  131.270589] i4: 0000000000000001 i5: 0000000000000001 i6: fff000023c=
183081 i7: 0000000000550a70
> > [  131.384963] I7: <bpf_patch_insn_single+0x70/0x1e0>
> > [  131.447862] Call Trace:
> > [  131.479889]  [0000000000550a70] bpf_patch_insn_single+0x70/0x1e0
> > [  131.558814]  [000000000055fe58] bpf_patch_insn_data+0x18/0x1c0
> > [  131.635442]  [000000000056bed8] bpf_check+0x1cf8/0x3060
> > [  131.704064]  [0000000000559778] bpf_prog_load+0x498/0x8e0
> > [  131.774975]  [0000000000559d10] __do_sys_bpf+0x150/0x1880
> > [  131.845890]  [000000000055b534] sys_bpf+0x14/0x560
> > [  131.908807]  [0000000000406154] linux_sparc_syscall+0x34/0x44
> > [  131.984281] Disabling lock debugging due to kernel taint
> > [  132.054051] Caller[0000000000550a70]: bpf_patch_insn_single+0x70/0x1=
e0
> > [  132.139832] Caller[000000000055fe58]: bpf_patch_insn_data+0x18/0x1c0
> > [  132.223325] Caller[000000000056bed8]: bpf_check+0x1cf8/0x3060
> > [  132.298811] Caller[0000000000559778]: bpf_prog_load+0x498/0x8e0
> > [  132.376588] Caller[0000000000559d10]: __do_sys_bpf+0x150/0x1880
> > [  132.454361] Caller[000000000055b534]: sys_bpf+0x14/0x560
> > [  132.524132] Caller[0000000000406154]: linux_sparc_syscall+0x34/0x44
> > [  132.606483] Caller[fff0000100995b38]: 0xfff0000100995b38
> > [  132.676247] Instruction DUMP:
> > [  132.676249]  c25e2020=20
> > [  132.715134]  92270009=20
> > [  132.746014]  bb326000=20
> > [  132.776895] <d05860e0>
> > [  132.807776]  400021a1=20
> > [  132.838657]  9210001d=20
> > [  132.869540]  80a22000=20
> > [  132.900422]  12400016=20
> > [  132.931303]  03003480=20
> > [  132.962184]=20
> > [  133.020246] systemd-journald[205]: Time jumped backwards, rotating. =
(Dropped 1 similar message(s))
> > [  133.138938] Kernel panic - not syncing: Attempted to kill init! exit=
code=3D0x00000009
> > [  133.239608] Press Stop-A (L1-A) from sun keyboard or send break
> > [  133.239608] twice on console to return to the boot prom
> > [  133.385997] ---[ end Kernel panic - not syncing: Attempted to kill i=
nit! exitcode=3D0x00000009 ]---
> >=20
> > Searching for that error in the archives, yielded this report from 2018=
 [1] which seems to have never
> > been addressed by David Miller.
> >=20
> > @Anthony: Can you see any suspicious in the disassembled code that Meel=
is (CC'ed) posted?
>=20
> OK, bisecting has lead me to the following commit:
>=20
> d53d2f78ceadba081fc7785570798c3c8d50a718 is the first bad commit
> commit d53d2f78ceadba081fc7785570798c3c8d50a718 (HEAD)
> Author: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Date:   Thu Apr 25 17:11:38 2019 -0700
>=20
>     bpf: Use vmalloc special flag
>    =20
>     Use new flag VM_FLUSH_RESET_PERMS for handling freeing of special
>     permissioned memory in vmalloc and remove places where memory was set=
 RW
>     before freeing which is no longer needed. Don't track if the memory i=
s RO
>     anymore because it is now tracked in vmalloc.
>    =20
>     Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Cc: <akpm@linux-foundation.org>
>     Cc: <ard.biesheuvel@linaro.org>
>     Cc: <deneen.t.dock@intel.com>
>     Cc: <kernel-hardening@lists.openwall.com>
>     Cc: <kristen@linux.intel.com>
>     Cc: <linux_dti@icloud.com>
>     Cc: <will.deacon@arm.com>
>     Cc: Alexei Starovoitov <ast@kernel.org>
>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Borislav Petkov <bp@alien8.de>
>     Cc: Daniel Borkmann <daniel@iogearbox.net>
>     Cc: Dave Hansen <dave.hansen@linux.intel.com>
>     Cc: H. Peter Anvin <hpa@zytor.com>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Nadav Amit <nadav.amit@gmail.com>
>     Cc: Rik van Riel <riel@surriel.com>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Link: https://lkml.kernel.org/r/20190426001143.4983-19-namit@vmware.c=
om
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>=20
>  include/linux/filter.h | 17 +++--------------
>  kernel/bpf/core.c      |  1 -
>  2 files changed, 3 insertions(+), 15 deletions(-)
>=20
> I assume it's also related to this change:
>=20
> commit 868b104d7379e28013e9d48bdd2db25e0bdcf751
> Author: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Date:   Thu Apr 25 17:11:36 2019 -0700
>=20
>     mm/vmalloc: Add flag for freeing of special permsissions
>    =20
>     Add a new flag VM_FLUSH_RESET_PERMS, for enabling vfree operations to
>     immediately clear executable TLB entries before freeing pages, and ha=
ndle
>     resetting permissions on the directmap. This flag is useful for any k=
ind
>     of memory with elevated permissions, or where there can be related
>     permissions changes on the directmap. Today this is RO+X and RO memor=
y.
>    =20
>     Although this enables directly vfreeing non-writeable memory now,
>     non-writable memory cannot be freed in an interrupt because the alloc=
ation
>     itself is used as a node on deferred free list. So when RO memory nee=
ds to
>     be freed in an interrupt the code doing the vfree needs to have its o=
wn
>     work queue, as was the case before the deferred vfree list was added =
to
>     vmalloc.
>    =20
>     For architectures with set_direct_map_ implementations this whole ope=
ration
>     can be done with one TLB flush when centralized like this. For others=
 with
>     directmap permissions, currently only arm64, a backup method using
>     set_memory functions is used to reset the directmap. When arm64 adds
>     set_direct_map_ functions, this backup can be removed.
>    =20
>     When the TLB is flushed to both remove TLB entries for the vmalloc ra=
nge
>     mapping and the direct map permissions, the lazy purge operation coul=
d be
>     done to try to save a TLB flush later. However today vm_unmap_aliases
>     could flush a TLB range that does not include the directmap. So a hel=
per
>     is added with extra parameters that can allow both the vmalloc addres=
s and
>     the direct mapping to be flushed during this operation. The behavior =
of the
>     normal vm_unmap_aliases function is unchanged.
>    =20
>     Suggested-by: Dave Hansen <dave.hansen@intel.com>
>     Suggested-by: Andy Lutomirski <luto@kernel.org>
>     Suggested-by: Will Deacon <will.deacon@arm.com>
>     Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Cc: <akpm@linux-foundation.org>
>     Cc: <ard.biesheuvel@linaro.org>
>     Cc: <deneen.t.dock@intel.com>
>     Cc: <kernel-hardening@lists.openwall.com>
>     Cc: <kristen@linux.intel.com>
>     Cc: <linux_dti@icloud.com>
>     Cc: Borislav Petkov <bp@alien8.de>
>     Cc: H. Peter Anvin <hpa@zytor.com>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Nadav Amit <nadav.amit@gmail.com>
>     Cc: Rik van Riel <riel@surriel.com>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Link: https://lkml.kernel.org/r/20190426001143.4983-17-namit@vmware.c=
om
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>=20
> Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

