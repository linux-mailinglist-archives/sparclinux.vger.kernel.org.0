Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A025F366F1A
	for <lists+sparclinux@lfdr.de>; Wed, 21 Apr 2021 17:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243419AbhDUP1n (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 21 Apr 2021 11:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237667AbhDUP1n (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 21 Apr 2021 11:27:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF6AC06138E
        for <sparclinux@vger.kernel.org>; Wed, 21 Apr 2021 08:27:09 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so1547755wmg.0
        for <sparclinux@vger.kernel.org>; Wed, 21 Apr 2021 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gKdt8Wk+0o9N/o4Eeh7jFivsYAp+6odRUk2hDoOYTNE=;
        b=Ld1STCnsE1eouA8OovEt+JR3kvLhy+38SIeXNlwIkDlOiLq05bK7Xtf0K9jrzy0JBg
         l7Vv9cqjwitQLtZanAgbC4FHzf0jZYrRiLFa1aiMF+HviBubCWXTbitrlhIeZgclqfrr
         rNSiHWguSr/4GVnfTLurIDqrGY85zcHBi1fjyNVIwnwt04M07BxCWghuUhWyyCRBw0PQ
         kODch46wzB/NfbSZH3OkAXLF7Scy075Euz1AgKCdsC/jqLZFujuUsUSTB9qK2x31ltBH
         td1grGFzAsMrRdOHHH0QYY+3dvXwt//4U27ImWFpSaFnt7wVbc0SpT/Y+WZBQRPuwY4A
         rcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gKdt8Wk+0o9N/o4Eeh7jFivsYAp+6odRUk2hDoOYTNE=;
        b=JJOFXe6WrTTDQHL42Gkb4aqk5IrChRQu/TfFfxVghx0kByiPlSxUrCvyIgA/o6vzzM
         2Y2PjjojL7wRYe9G4uNSJVgyhMTqINta9Zi9RL71Y/cJSn+3VEfIb7uy0A7YlL/n/lQ0
         PQnUSqC314W0+RDPvRO5z94FGcbRCVK6GVY7hE+DvMPOPi5o4PIfzL+r6ga7crQUM27v
         7wXvGWXh31z0RKRbdyBa1GKO5P72lIPaqFAYpn0tEGQhAmvIE3tvY8qWTl7A9My44xHc
         JtJFDCeaSlC4Pl3Oez/s+WGE2adttJk7/g04BmNgE4juRzN3ud8MU9KoySlhv/tFxEkD
         eohA==
X-Gm-Message-State: AOAM532Fi9qR5hUoMslzFJv6G124ZevHdWtRXrI3iXPsJMyxNoE5uoRr
        r9sp7Bv9l2P+9xf96W3vJTxzSg==
X-Google-Smtp-Source: ABdhPJx/Z4/wH0IczXzrpu1/+CHFDyPCB4UahTsagrUa+vs9LV/LiT8hoPliplY5euRpNBomq4NZqQ==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr10451672wmf.17.1619018828018;
        Wed, 21 Apr 2021 08:27:08 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.81.177])
        by smtp.gmail.com with ESMTPSA id n2sm3159970wmb.32.2021.04.21.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 08:27:07 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Zi Shen Lim <zlim.lnx@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Sandipan Das <sandipan@linux.ibm.com>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Shubham Bansal <illusionist.neo@gmail.com>,
        Mahesh Bandewar <maheshb@google.com>,
        Will Deacon <will@kernel.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Ilya Leoshkevich <iii@linux.ibm.com>, paulburton@kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        X86 ML <x86@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-mips@vger.kernel.org, grantseltzer@gmail.com,
        Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Kees Cook <keescook@chromium.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Luke Nelson <luke.r.nels@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        ppc-dev <linuxppc-dev@lists.ozlabs.org>,
        KP Singh <kpsingh@kernel.org>, iecedge@gmail.com,
        Simon Horman <horms@verge.net.au>,
        Borislav Petkov <bp@alien8.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Yonghong Song <yhs@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dmitry Vyukov <dvyukov@google.com>, tsbogend@alpha.franken.de,
        Daniel Borkmann <daniel@iogearbox.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Network Development <netdev@vger.kernel.org>,
        David Ahern <dsahern@kernel.org>,
        Wang YanQing <udknight@gmail.com>,
        Martin KaFai Lau <kafai@fb.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>,
        Jianlin Lv <Jianlin.Lv@arm.com>,
        "David S. Miller" <davem@davemloft.net>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
 <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
From:   Quentin Monnet <quentin@isovalent.com>
Message-ID: <c84445eb-8621-9ac2-2e8a-b58b8241903a@isovalent.com>
Date:   Wed, 21 Apr 2021 16:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

2021-04-21 15:10 UTC+0200 ~ Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> 
> Le 20/04/2021 à 05:28, Alexei Starovoitov a écrit :
>> On Sat, Apr 17, 2021 at 1:16 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>>
>>>
>>> Le 16/04/2021 à 01:49, Alexei Starovoitov a écrit :
>>>> On Thu, Apr 15, 2021 at 8:41 AM Quentin Monnet
>>>> <quentin@isovalent.com> wrote:
>>>>>
>>>>> 2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
>>>>>> On 4/15/21 11:32 AM, Jianlin Lv wrote:
>>>>>>> For debugging JITs, dumping the JITed image to kernel log is
>>>>>>> discouraged,
>>>>>>> "bpftool prog dump jited" is much better way to examine JITed dumps.
>>>>>>> This patch get rid of the code related to bpf_jit_enable=2 mode and
>>>>>>> update the proc handler of bpf_jit_enable, also added auxiliary
>>>>>>> information to explain how to use bpf_jit_disasm tool after this
>>>>>>> change.
>>>>>>>
>>>>>>> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
>>>>>
>>>>> Hello,
>>>>>
>>>>> For what it's worth, I have already seen people dump the JIT image in
>>>>> kernel logs in Qemu VMs running with just a busybox, not for kernel
>>>>> development, but in a context where buiding/using bpftool was not
>>>>> possible.
>>>>
>>>> If building/using bpftool is not possible then majority of selftests
>>>> won't
>>>> be exercised. I don't think such environment is suitable for any kind
>>>> of bpf development. Much so for JIT debugging.
>>>> While bpf_jit_enable=2 is nothing but the debugging tool for JIT
>>>> developers.
>>>> I'd rather nuke that code instead of carrying it from kernel to kernel.
>>>>
>>>
>>> When I implemented JIT for PPC32, it was extremely helpfull.
>>>
>>> As far as I understand, for the time being bpftool is not usable in
>>> my environment because it
>>> doesn't support cross compilation when the target's endianess differs
>>> from the building host
>>> endianess, see discussion at
>>> https://lore.kernel.org/bpf/21e66a09-514f-f426-b9e2-13baab0b938b@csgroup.eu/
>>>
>>>
>>> That's right that selftests can't be exercised because they don't build.
>>>
>>> The question might be candid as I didn't investigate much about the
>>> replacement of "bpf_jit_enable=2
>>> debugging mode" by bpftool, how do we use bpftool exactly for that ?
>>> Especially when using the BPF
>>> test module ?
>>
>> the kernel developers can add any amount of printk and dumps to debug
>> their code,
>> but such debugging aid should not be part of the production kernel.
>> That sysctl was two things at once: debugging tool for kernel devs and
>> introspection for users.
>> bpftool jit dump solves the 2nd part. It provides JIT introspection to
>> users.
>> Debugging of the kernel can be done with any amount of auxiliary code
>> including calling print_hex_dump() during jiting.
>>
> 
> I get the following message when trying the command suggested in the
> patch message:
> 
> root@vgoip:~# ./bpftool prog dump jited
> Error: No libbfd support
> 
> Christophe

Hi Christophe,

Bpftool relies on libbfd to disassemble the JIT-ed instructions, but
this is an optional dependency and your version of bpftool has been
compiled without it.

You could try to install it on your system (it is usually shipped with
binutils, package "binutils-dev" on Ubuntu for example). If you want to
cross-compile bpftool, the libbfd version provided by your distribution
may not include support for the target architecture. In that case you
would have to build libbfd yourself to make sure it supports it.

Then you can clean up the results from the libbfd probing:

    $ make -C tools/build/feature/ clean

and recompile bpftool.

I hope this helps,
Quentin
