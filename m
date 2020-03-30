Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7C1198467
	for <lists+sparclinux@lfdr.de>; Mon, 30 Mar 2020 21:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbgC3T0w (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 Mar 2020 15:26:52 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40696 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgC3T0w (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 30 Mar 2020 15:26:52 -0400
Received: by mail-qk1-f196.google.com with SMTP id l25so20410569qki.7
        for <sparclinux@vger.kernel.org>; Mon, 30 Mar 2020 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l1KivSXfJ7wf0jkbBAPflHP5V6SuujGVves3IQlKSdk=;
        b=IYNuBG0xaivyUR3fTZ873iUu6eQUeNZ6WuUKg+HP7ClOkVu3+B4h7kUbdJ9Curt3/8
         lS25GYIDzdlJ38nbcMTVph/MIlFg6XWXP4qE3m+LT4lYO9/QZl72KiJZ2OrR3c4pshMC
         Bui4wczpyJLTkobGav5yHCF5dOgYGJOg8jykvAWolWqrlT3zclk4l8+u2trd9AFMk9a5
         MUcFM9sIIBM9uKxoJxVhS+zwt1npeQCz47fFVoVf9mECkPPpiH0TKhk0T0pRq1RN8H1w
         GN7+gxehG6zaIhxqI/G8kBODioeCl3OYbTxPOFlybUlE+9ixB4iLO4THKuaIqHOvn5Fl
         Vv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=l1KivSXfJ7wf0jkbBAPflHP5V6SuujGVves3IQlKSdk=;
        b=mmzJs8F/fiuv1e0Bt1vr6A5Q/VigNKx8MqGtTt8hV/pdVQhMaHnqzZ5cposaQyQm5m
         hvveFeG4tyA3OJi+VC1lG4S4LQUTFa6FKvQqvMA28nNNf7jGLqIqXA4zCuwVqaQ5wesk
         wqyaQQyLJ9M4wuAK3jU4PncV2RtoDemoPU/XPCyQcUwnuZQhWsYw6Y4dr2KAr0C8EA6b
         pz/XtIYssohpmv6gbJUS42ZhJQYF7Px610xNgjth15Er4PHa9hcnwGJ+LI6uy3/MiCp7
         p+rm1+rC0CBPtfI2FahFpJ9UaqI6+iHXAf2X107Vlg+un1ZIrc6qVF4KcE/2rsjdAJ9p
         ddcg==
X-Gm-Message-State: ANhLgQ1mDEokOOmT7sqFJWknD9cWKlolavP9MHPVcyT8aJ8JSY0E7xLv
        f+sCsmUqZF/OzdP1WqyWCS8gSCJ/Dmg=
X-Google-Smtp-Source: ADFU+vvTboNNOiZCUWYc79CovSFWIIZX0C9vm7jbfM3Z9fD43YJwPmPvoRjHcOCWB29ito/aJyVSyg==
X-Received: by 2002:a37:a6d4:: with SMTP id p203mr1715244qke.184.1585596409331;
        Mon, 30 Mar 2020 12:26:49 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
        by smtp.googlemail.com with ESMTPSA id c27sm11086720qkk.0.2020.03.30.12.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 12:26:48 -0700 (PDT)
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     sparclinux@vger.kernel.org
References: <1848982.8N1hjUtedq@eto.sf-tec.de>
 <1ce66ac3-17cf-0b74-8111-ae0b917e65b3@physik.fu-berlin.de>
From:   Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: Suspected bug in wait syscall or similar
Message-ID: <31e71908-3508-5f71-01c8-49f861257835@linaro.org>
Date:   Mon, 30 Mar 2020 16:26:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1ce66ac3-17cf-0b74-8111-ae0b917e65b3@physik.fu-berlin.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



On 30/03/2020 07:18, John Paul Adrian Glaubitz wrote:
> Hi Rolf!
> 
> On 3/30/20 10:41 AM, Rolf Eike Beer wrote:
>> I run a 32 bit Gentoo userspace on my T5120 with a 64 bit kernel (5.5.7 at the 
>> moment). This is nothing really new, I see this for a while, but it seems to 
>> got a bit worse lately.
> 
> Debian's glibc maintainer told me that the glibc testsuite on SPARC has more failures
> on 32-bit than on 64-bit. Maybe we should look into trying to get some of these failures
> fixed first. CC'ing Adhemerval from glibc upstream who has done a lot of bug fixing
> on SPARC in glibc.

I have been seeing some sparc32 issues on 64-bit kernels as well. I have
documented some on glibc release wiki [1].  I noted the wait and nanosleep
issue on 2.31 and after the changes required for y2038 safeness and some
refactoring in syscall handling on master branch I didn't see them anymore.
So I am not sure if they are related to kernel, code generation or glibc
itself.

The sparc32 master still show some issues:

FAIL: nptl/tst-cancel24-static
FAIL: nptl/tst-cancelx20
FAIL: nptl/tst-cancelx21
FAIL: nptl/tst-cond8-static
FAIL: nptl/tst-mutex8-static
FAIL: nptl/tst-mutexpi8-static

> 
> It could be useful in this context if Gentoo could provide a small Gentoo SPARC LDOM
> running 32-bit userland for the GCC Compile Farm. This way upstream developers get
> easy access to a Gentoo SPARC instance to be able to reproduce issues like this.
> 
>> When I read about https://sourceware.org/git/?
>> p=glibc.git;a=commit;h=b33e946fbb1659d2c5937c4dd756a7c49a132dff I thought that 
>> this may solve the issue, but I rebuild my glibc in a chroot with that patch 
>> and at least the fish testsuite hangs are unchanged.
>>
>> Has anyone a clue what's going on there?

Funny thing about b33e946fbb1659d2c5937c4dd756a7c49a132dff is the original code
has been working for age (in fact since the port has been included), meaning
that gcc used to *not* generate a stack frame for:

static void
__rt_sigreturn_stub (void)
{
  __asm__ ("mov %0, %%g1\n\t"
	   "ta	0x6d\n\t"
	   : /* no outputs */
	   : "i" (__NR_rt_sigreturn));
}

static void
__sigreturn_stub (void)
{
  __asm__ ("mov %0, %%g1\n\t"
	   "ta	0x6d\n\t"
	   : /* no outputs */
	   : "i" (__NR_sigreturn));
}

The only recent change prior the move to assembly was on 2.25 where we had
to disable the stack protector.  For 2.31 release, for instance, I used the
gcc 7.5.0 since it didn't trigger this issue.

> I know that there have been some stability issues with the Linux kernel on SPARC
> with older hardware like the UltraSPARC IIIi. The T5120 we have and newer machines
> seem to run relatively fine with a 64-bit userland.

Not only stability issues, but I noticed that kernel developers had 
fixed a SysV IPC kernel issue on 32-bits kernels that has been 
lingering for years.  So I am not sure how well maintained is
32-bit sparc is in general.

[1] https://sourceware.org/glibc/wiki/Release/2.31
