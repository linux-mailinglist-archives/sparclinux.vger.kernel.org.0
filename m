Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1A74A60E2
	for <lists+sparclinux@lfdr.de>; Tue,  1 Feb 2022 17:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240758AbiBAQBA (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 1 Feb 2022 11:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237158AbiBAQA7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 1 Feb 2022 11:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643731259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
        b=BSmVh5+dDwgsRNDEWCtOEeHo6eIhcqUU3ULmfGd8XAN74cuc+y3vN2/HpiTRBSXh0LfdnT
        3m+PsddiJbZSBbtSZwvywlw4JxaxPtOLz27lCRvaDZpOmkItJwbYmukX4jE7C9Az3ucCFE
        PS/NEEEog/G7jImOLxKt3qmDsHefOk0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-vLcqAEnVPyqPRr5IRRy57w-1; Tue, 01 Feb 2022 11:00:58 -0500
X-MC-Unique: vLcqAEnVPyqPRr5IRRy57w-1
Received: by mail-ej1-f71.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so6690185ejn.13
        for <sparclinux@vger.kernel.org>; Tue, 01 Feb 2022 08:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
        b=MdGQHYcQLzc3c+cCIMpb+J/GP25/fgTJuflFS6NaqaxkJ01/DvKMFQtTbZ65m7yMYX
         KrDfvbvTuMpceZwiHbOWUZNV8abL2fkUmKT7XROvHhg4VuXhHQrYVwcE6xE+PKAphIOT
         XpK/pmqUhGnhAci+1+95i6BVdmNtCd7XkiiSaX66PTU0ma/WTwT7V74qrkkuTsW2SUFg
         2VxGRuewAyxKTdw91Q66T8QbumPKyeLbEPdecbS5ne3C6n45Mty1CkHQ+MSYGo3xFlAt
         HewhQj+R6gbY/GjyqvHJKrrEy2oXcYxfblhcdIg4gyZzNKt89wqWAFWhui1tiyBa/DGV
         swyQ==
X-Gm-Message-State: AOAM5337npFzQlF8XM39QVW6FgKaJ50GXTzol6CeKJzcgzJTqR7Nbk6I
        KiZJUcwQ+8xU15AFGhfphN5Ts0MGAcmYX5FNe48ojCcKVy7S+O52h4gGwTiRXLDA1XuWfBbzpgL
        rFnP7lO6rLQPLXi9cm1eRdA==
X-Received: by 2002:a17:907:72d6:: with SMTP id du22mr21767237ejc.179.1643731257027;
        Tue, 01 Feb 2022 08:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi6gqf6sTZV2adqJ/EwU8K0kh4yabr0HjJDqz0uGv4IXAxFUKBb//nn4tH0Br/W6v0yRG1zw==
X-Received: by 2002:a17:907:72d6:: with SMTP id du22mr21767209ejc.179.1643731256826;
        Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id gh33sm14883510ejc.17.2022.02.01.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Message-ID: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
Date:   Tue, 1 Feb 2022 17:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
Content-Language: en-US
To:     Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 2/1/22 16:44, Anup Patel wrote:
> +Paolo
> 
> On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> Current riscv doesn't support the 32bit KVM API. Let's make it
>> clear by not selecting KVM_COMPAT.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Anup Patel <anup@brainfault.org>
> 
> This looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>

Hi Anup,

feel free to send this via a pull request (perhaps together with Mark 
Rutland's entry/exit rework).

Paolo

