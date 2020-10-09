Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54404288A9C
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 16:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388707AbgJIOTX (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 10:19:23 -0400
Received: from mout.gmx.net ([212.227.17.20]:35139 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388703AbgJIOTV (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 9 Oct 2020 10:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602253159;
        bh=HHcI1v4okiSUBMLB5u7FpkASofSAAfOMvc6d9raHlo8=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=CPJL1Kh1+cy+Mh6fpved/ti5Nj0agsSqL6gIbARgWwcKIF2QxkJYGRYAm9FbgqWeP
         31gmjFYDK4sa/KbHKC0LzfF/QLDdzHmGV5jNOumOFk5xXGtuAUVR8JbJ2lslDexeSl
         yLL7cuGuL579CrcQVtS8jBwvbv8bLxf8VjrbOeHM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from dpc-001.office.wrs-network.de ([92.116.56.173]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MxUrx-1kGE181Hlx-00xojD for <sparclinux@vger.kernel.org>; Fri, 09 Oct 2020
 16:19:19 +0200
Date:   Fri, 9 Oct 2020 16:19:24 +0200
From:   Wolf Ruediger Spielmann <RSpielmann@gmx.de>
To:     sparclinux@vger.kernel.org
Subject: SMP is broken on sparc64 with kernel 4.x/5.x
Message-Id: <20201009161924.c8f031c079dd852941307870@gmx.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cdVQJdAZ78APdNqXqM8gmZN8+v1hXwaV4ybpripgatj+UnmmaAX
 FTEVu7x/C5GB+S/qfI1XXsmR8ed9FQmA8dArPPj2Qct2gMJWV4CIQBSfSXvxI4IhPuzA2IX
 M4ZjHG/M1V7J0dQxrXVqm4nXS/+M3UDaplH03lMuyBuTAEQI7VzPKjM5aSOhm089u7GWmbf
 EH3cqfrvTlFHptbo1FxsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8h4S2/o8Euo=:2OQhMmbdWFkGjGxB+70eYr
 gK+4DTD9xiO/uvQIA54APO0ORafB9LuSvuFbrWlCux+pWidYatBxbcGcJuwjJrcynhq8mRKcL
 y1KjkKC02DUb2f9EsTY/jv3eeXVqAsd4WgQTsOPzcg1k11kVxyZeflFfQZ8wpd9mcacv32kKk
 s/jehN8VvxWo+outDzUKUmUctq4Fft9Q8MHP4bnlMjEqGwPoqevEC9cqphknekz1+fVvKFx8M
 vP5xGZzVkOh0ZBA3ajQ6mguWZkBThtGmB3FXChGArfCaFcsREn9qClxmps8VdHreAW4PWOrIQ
 QHl5nkshtJiCao2WPEi7VBIYJYKpTGGo/y3q3KOvEESyHNY356ZlBmWTm6RT0nQo3WhFWeJcS
 8KqPp8GnIoYTrDbVLtf8TRvE0/m2XzVtbN89MOgfcMtu7ldBdC+hV8pF0ajCUuODgky3rer6Y
 gBuVTnrgMyLQGg65JGiXhX3GlCkpPbA2Pp6gqVjEU2KmSkof0bpBO9+EIdU3GG5j2zj/u9bBK
 07LhE7Q3VcvJ8Uq3HYCMLLlY6D3t0XkwJzgM6wMj8mlU3y6kZex6sWER2ontQ3NIZsgQsXKi3
 u3ta6vwSVlV/ohctuF+tEX+kH5UzKJOUCtw2CFM5Cn05vF/oBCM6ThTtH431AbWPAXfOY9cgQ
 qKj5uGXKZj2E1EXwJUseRD9hhVrydYVUaiepA23pe/hIBIfnpnFclGMF1M8YWW1+UA4dC3N+J
 3j3lPlP05Ghu3+58DykG5pDfY6QVkttjCiWcDr9AYgnPaSty2uTPmrManxX7vbFdz+6b/z2GE
 y5ZcWV/UHFbBQKgx11l2GIeEeNRh5J6jLIMVcdsvK2ARh5jmZeihY2tdg2Gf0Uh9u18Pb86A3
 vJeDdD6+d7Z+PVgueDi9UvBjgTFtSHGz8ueT1Z8i/Z9ktozYCVY+ktq8DitvfX5Xs7dRbSgI9
 lX8vI3JdD9K+pRkJdZVlDo8zIMgr+sQntsJk0GMXjFH5tMh1e3ZaVldStAKNWuVMdV04NoKXU
 mUmMcSHgUQaZMSi/hVMzMKhMOoUlwJRO8u7FnvEsGwVpHk1jL0FXKcPwLBHb8WpMwrKWYVO7u
 osz5h0eaTlYLZHQzuLacKkExLg7H1COxNENm9qmdHw2Hf1JALCZ4V98ExYssG3RhMDt8D+QVX
 qleI0+jUzmHdms5ZHVoJpDdApH5XvWHG8gJ25LJXe+rbKUThYPutjB2gVIkcoYz5DLp7AP16B
 IpDwoD5Wx927HpEIs3MJt9KUwA0euHlQmh5Fklw==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi @all,

I freshly installed linux on my SUN Ultra 60 /w 2x 450MHz CPUs.

First I tested kernel 5.8.x and couldn't get SMP to work on both CPUs - jus=
t the first CPU will be activated.
Same results with kernel 4.19.146 .
Kernel 3.18.140 runs perfectly on both CPUs.

Might be the problem that the CPUs numbering scheme is not linear:
CPU1 is #0 and CPU2 is #2 (NOT #1)

Below you find some infos.

With kernel 5.8.14 (also tested 5.4.66 and 4.19.146) :

dmesg (cutted)

[    0.000335] Linux version 5.8.14-gentoo (root@compilenode1) (sparc64-unk=
nown-linux-gnu-gcc (Gentoo Hardened 9.3.0-r1 p3) 9.3.0, GNU ld (Gentoo 2.34=
 p6) 2.34.0) #2 SMP Thu Oct 8 10:40:33 CEST 2020
...
[    0.918138] percpu: Embedded 10 pages/cpu s42648 r8192 d31080 u2097152
[    0.942080] pcpu-alloc: s42648 r8192 d31080 u2097152 alloc=3D1*4194304
[    0.942090] pcpu-alloc: [0] 0 1=20
...
[    1.252126] rcu: Hierarchical RCU implementation.
[    1.268124] rcu:     RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=
=3D2.
[    1.288896] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    1.312586] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    1.334035] NR_IRQS: 2048, nr_irqs: 2048, preallocated irqs: 1
...
[    1.532316] Calibrating delay using timer specific routine.. 905.89 Bogo=
MIPS (lpj=3D452945)
...
[    1.539394] rcu: Hierarchical SRCU implementation.
[    1.540102] smp: Bringing up secondary CPUs ...
[    1.540120] smp: Brought up 1 node, 1 CPU

########

ultra60-1 ~ # lscpu
Architecture:        sparc64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Big Endian
CPU(s):              1
On-line CPU(s) list: 0
Thread(s) per core:  1
Core(s) per socket:  1
Socket(s):           1
NUMA node(s):        1
Model name:          TI UltraSparc II  (BlackBird)
NUMA node0 CPU(s):   0
Flags:               sun4u

########

ultra60-1 ~ # cat /proc/cpuinfo=20
cpu		: TI UltraSparc II  (BlackBird)
fpu		: UltraSparc II integrated FPU
pmu		: ultra12
prom		: OBP 3.31.0 2001/07/25 20:31
type		: sun4u
ncpus probed	: 2
ncpus active	: 1
D$ parity tl1	: 0
I$ parity tl1	: 0
cpucaps		: flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
Cpu0ClkTck	: 000000001ad38c39
MMU Type	: Spitfire
MMU PGSZs	: 8K,64K,512K,4MB
State:
CPU0:		online

########

ultra60-1 ~ # cat /sys/devices/system/cpu/offline=20
1
ultra60-1 ~ # cat /sys/devices/system/cpu/online
0

#################################################################

With kernel 3.18.140

dmesg (cutted)

[    0.000000] PROMLIB: Sun IEEE Boot Prom 'OBP 3.31.0 2001/07/25 20:31'
...
[    0.000000] Linux version 3.18.140 (root@compilenode1) (gcc version 9.3.=
0 (Gentoo Hardened 9.3.0-r1 p3) ) #7 SMP Thu Oct 8 15:37:47 CEST 2020
...
[    0.000000] PERCPU: Embedded 8 pages/cpu @fffff800bf800000 s21760 r8192 =
d35584 u2097152
[    0.000000] pcpu-alloc: s21760 r8192 d35584 u2097152 alloc=3D1*4194304
[    0.000000] pcpu-alloc: [0] 0 2=20
...
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D3.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D3
[    0.000000] NR_IRQS:2048 nr_irqs:2048 1
...
[   82.644201] CPU 2: synchronized TICK with master CPU (last diff 0 cycles=
, maxerr 535 cycles)
[   82.644302] Brought up 2 CPUs

########

ultra60-1 ~ # lscpu
Architecture:        sparc64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Big Endian
CPU(s):              2
On-line CPU(s) list: 0,2
Thread(s) per core:  1
Core(s) per socket:  1
Socket(s):           2
NUMA node(s):        1
Model name:          TI UltraSparc II  (BlackBird)
NUMA node0 CPU(s):   0-3
Flags:               sun4u

########

ultra60-1 ~ # cat /proc/cpuinfo=20
cpu		: TI UltraSparc II  (BlackBird)
fpu		: UltraSparc II integrated FPU
pmu		: ultra12
prom		: OBP 3.31.0 2001/07/25 20:31
type		: sun4u
ncpus probed	: 2
ncpus active	: 2
D$ parity tl1	: 0
I$ parity tl1	: 0
cpucaps		: flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
Cpu0ClkTck	: 000000001ad37db2
Cpu2ClkTck	: 000000001ad37db2
MMU Type	: Spitfire
MMU PGSZs	: 8K,64K,512K,4MB
State:
CPU0:		online
CPU2:		online

########

ultra60-1 ~ # cat /sys/devices/system/cpu/offline=20

ultra60-1 ~ # cat /sys/devices/system/cpu/online
0,2

best regards,
R=FCdiger
