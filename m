Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB5166E082
	for <lists+sparclinux@lfdr.de>; Tue, 17 Jan 2023 15:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbjAQOZy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+sparclinux@lfdr.de>); Tue, 17 Jan 2023 09:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjAQOZ2 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 17 Jan 2023 09:25:28 -0500
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3007A3D088
        for <sparclinux@vger.kernel.org>; Tue, 17 Jan 2023 06:23:42 -0800 (PST)
X-QQ-mid: bizesmtp69t1673965337tgo5yqwg
Received: from smtpclient.apple ( [111.201.151.239])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 17 Jan 2023 22:22:14 +0800 (CST)
X-QQ-SSF: 00000000002000709000B00A0000000
X-QQ-FEAT: Y6Kc/cQg3lZltfW1E4WaLfeRfH8T1tGbgOPH+twRYhWbw8NLi+J+L5Wt0eqi7
        Z+SX7pHUnUiHyjBPzhczQd2QJuJj4V4VLr8VS6ar/0O79PEUv17TGbRCTYoA+S4TKIlOSP5
        uZDqtvVj21Dc585vnOd7vWJs/OSwD0MCTCulGQaMV4TXU3EMK7LKE5ugsUxu4jVdJxGj3c/
        ZQV16r1fDHtEshit7Zq1Gh0jJshR6VPWjQevguu23nq50tw7i2tGWJr8BgYo71zR6r7czA7
        B6fdAvDJAXZlSHoejwTKl20ANC0QdNzlVFI0jUJC/Sw5WKkrqdIaNDvD1DMggU0R0DZh6Fo
        iNByJWo7D3AN/gcyr06o6vDtdNC5BAQrJofjb8GD1oevYa5RuBx0MAX39HQW+vRFogn0iRS
        Q4LvJzcLVpI=
X-QQ-GoodBg: 0
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
From:   Tonghao Zhang <tong@infragraf.org>
In-Reply-To: <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
Date:   Tue, 17 Jan 2023 22:22:13 +0800
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.or" 
        <linux-arm-kernel@lists.infradead.or>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        Hao Luo <haoluo@google.com>,
        John Fastabend <john.fastabend@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Song Liu <song@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>,
        KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Content-Transfer-Encoding: 8BIT
Message-Id: <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:infragraf.org:qybglogicsvr:qybglogicsvr5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



> On Jan 17, 2023, at 3:30 PM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> 
> 
> Le 17/01/2023 à 06:30, Tonghao Zhang a écrit :
>> 
>> 
>>> On Jan 9, 2023, at 4:15 PM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>> 
>>> 
>>> 
>>> Le 06/01/2023 à 16:37, Daniel Borkmann a écrit :
>>>> On 1/5/23 6:53 PM, Christophe Leroy wrote:
>>>>> Le 05/01/2023 à 04:06, tong@infragraf.org a écrit :
>>>>>> From: Tonghao Zhang <tong@infragraf.org>
>>>>>> 
>>>>>> The x86_64 can't dump the valid insn in this way. A test BPF prog
>>>>>> which include subprog:
>>>>>> 
>>>>>> $ llvm-objdump -d subprog.o
>>>>>> Disassembly of section .text:
>>>>>> 0000000000000000 <subprog>:
>>>>>>          0:       18 01 00 00 73 75 62 70 00 00 00 00 72 6f 67 00 r1
>>>>>> = 29114459903653235 ll
>>>>>>          2:       7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) = r1
>>>>>>          3:       bf a1 00 00 00 00 00 00 r1 = r10
>>>>>>          4:       07 01 00 00 f8 ff ff ff r1 += -8
>>>>>>          5:       b7 02 00 00 08 00 00 00 r2 = 8
>>>>>>          6:       85 00 00 00 06 00 00 00 call 6
>>>>>>          7:       95 00 00 00 00 00 00 00 exit
>>>>>> Disassembly of section raw_tp/sys_enter:
>>>>>> 0000000000000000 <entry>:
>>>>>>          0:       85 10 00 00 ff ff ff ff call -1
>>>>>>          1:       b7 00 00 00 00 00 00 00 r0 = 0
>>>>>>          2:       95 00 00 00 00 00 00 00 exit
>>>>>> 
>>>>>> kernel print message:
>>>>>> [  580.775387] flen=8 proglen=51 pass=3 image=ffffffffa000c20c
>>>>>> from=kprobe-load pid=1643
>>>>>> [  580.777236] JIT code: 00000000: cc cc cc cc cc cc cc cc cc cc cc
>>>>>> cc cc cc cc cc
>>>>>> [  580.779037] JIT code: 00000010: cc cc cc cc cc cc cc cc cc cc cc
>>>>>> cc cc cc cc cc
>>>>>> [  580.780767] JIT code: 00000020: cc cc cc cc cc cc cc cc cc cc cc
>>>>>> cc cc cc cc cc
>>>>>> [  580.782568] JIT code: 00000030: cc cc cc
>>>>>> 
>>>>>> $ bpf_jit_disasm
>>>>>> 51 bytes emitted from JIT compiler (pass:3, flen:8)
>>>>>> ffffffffa000c20c + <x>:
>>>>>>      0:   int3
>>>>>>      1:   int3
>>>>>>      2:   int3
>>>>>>      3:   int3
>>>>>>      4:   int3
>>>>>>      5:   int3
>>>>>>      ...
>>>>>> 
>>>>>> Until bpf_jit_binary_pack_finalize is invoked, we copy rw_header to
>>>>>> header
>>>>>> and then image/insn is valid. BTW, we can use the "bpftool prog dump"
>>>>>> JITed instructions.
>>>>> 
>>>>> NACK.
>>>>> 
>>>>> Because the feature is buggy on x86_64, you remove it for all
>>>>> architectures ?
>>>>> 
>>>>> On powerpc bpf_jit_enable == 2 works and is very usefull.
>>>>> 
>>>>> Last time I tried to use bpftool on powerpc/32 it didn't work. I don't
>>>>> remember the details, I think it was an issue with endianess. Maybe it
>>>>> is fixed now, but it needs to be verified.
>>>>> 
>>>>> So please, before removing a working and usefull feature, make sure
>>>>> there is an alternative available to it for all architectures in all
>>>>> configurations.
>>>>> 
>>>>> Also, I don't think bpftool is usable to dump kernel BPF selftests.
>>>>> That's vital when a selftest fails if you want to have a chance to
>>>>> understand why it fails.
>>>> 
>>>> If this is actively used by JIT developers and considered useful, I'd be
>>>> ok to leave it for the time being. Overall goal is to reach feature parity
>>>> among (at least major arch) JITs and not just have most functionality only
>>>> available on x86-64 JIT. Could you however check what is not working with
>>>> bpftool on powerpc/32? Perhaps it's not too much effort to just fix it,
>>>> but details would be useful otherwise 'it didn't work' is too fuzzy.
>>> 
>>> Sure I will try to test bpftool again in the coming days.
>>> 
>>> Previous discussion about that subject is here:
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20210415093250.3391257-1-Jianlin.Lv@arm.com/#24176847=
>> Hi Christophe
>> Any progress? We discuss to deprecate the bpf_jit_enable == 2 in 2021, but bpftool can not run on powerpc.
>> Now can we fix this issue?
> 
> Hi Tong,
> 
> I have started to look at it but I don't have any fruitfull feedback yet.
> 
> In the meantime, were you able to confirm that bpftool can also be used 
> to dump jitted tests from test_bpf.ko module on x86_64 ? In that can you 
> tell me how to proceed ?
Now I do not test, but we can dump the insn after bpf_prog_select_runtime in test_bpf.ko. bpf_map_get_info_by_fd can copy the insn to userspace, but we can
dump them in test_bpf.ko in the same way.

> Thanks
> Christophe
> 
>>> 
>>>> 
>>>> Also, with regards to the last statement that bpftool is not usable to
>>>> dump kernel BPF selftests. Could you elaborate some more? I haven't used
>>>> bpf_jit_enable == 2 in a long time and for debugging always relied on
>>>> bpftool to dump xlated insns or JIT. Or do you mean by BPF selftests
>>>> the test_bpf.ko module? Given it has a big batch with kernel-only tests,
>>>> there I can see it's probably still useful.
>>> 
>>> Yes I mean test_bpf.ko
>>> 
>>> I used it as the test basis when I implemented eBPF for powerpc/32. And
>>> not so long ago it helped decover and fix a bug, see
>>> https://github.com/torvalds/linux/commit/89d21e259a94f7d5582ec675aa445f5a79f347e4
>>> 
>>>> 
>>>> Cheers,
>>>> Daniel

