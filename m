Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC862F1D35
	for <lists+sparclinux@lfdr.de>; Mon, 11 Jan 2021 18:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389710AbhAKR5a (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 11 Jan 2021 12:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389681AbhAKR53 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 11 Jan 2021 12:57:29 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1F1C061795
        for <sparclinux@vger.kernel.org>; Mon, 11 Jan 2021 09:56:49 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s75so240999oih.1
        for <sparclinux@vger.kernel.org>; Mon, 11 Jan 2021 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g4x09ddCEuX5TXOxk4O97CruAZCK5rHe3BiW2J2QEao=;
        b=BWyliKl2BZ+fORedvFUhN2/ZerzWywwzawOKNlp8R8IAFdUKgcKLpEwzt86yK+Yaq0
         vz5Y2/zV/cthheGqY9Dhc7sSKt9md4wPVuUjtPwfSuazVuwuq3sUfVjQSxtum+mX+aso
         ejDRycwm1fYam4OUiZJgH9Xd0kjPOS56dhGU3qmAQdUuGao5VyyU/j9ybLbnNyR7JoEr
         3hm4w0Nz6Y0V98To7Mz8b5/xRIZsoOrJ9ogvheRWkNal2K7BVt30Bm5qd0/YylRglevu
         2D8OLrsvPPfzIHUMIKQrUrX5RdtYRoHMBpEtgagZRB9fSAeAeYOaqr+o65w4hzoP9yXC
         0R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g4x09ddCEuX5TXOxk4O97CruAZCK5rHe3BiW2J2QEao=;
        b=l+FZL9NKceAmjv6LbtzufnrqgFRf6BpQWbyUB8TX0dkuXrebj923ej5Usgkx7VT9sy
         +8eryh6hcQo22qUqxnHl93Hu0v3Xqd1VTRQuM57HsV0oceHuMf/kYx5G/854BkgnUEvd
         cg3Aiu85ClBey5MaIzRg1ye+v1Lup9SaVfnhW/CavPlVMsSjFQZhnlTtXFDL8dqRv18R
         KEiXQ4jLbMsF7POqy6qDZeYhxfOR13j/NQG9DCsX2mF4jTYpvW1T6UBCAEcVnTz08Rw5
         yCXboUWF3ms1RSewZ5/f2ZHVKZ178qTF5uOiKvOVD0FUNRg8duffm4jBdITqLHsTlOGp
         paeg==
X-Gm-Message-State: AOAM531yeo/Uwk+0FH9DITTWGYbmprgu0ubnqhOWfDi+DU/9c2fRcrKK
        txsy4eEZ782Yi63KyyW5ha47ExquxoohwWkL
X-Google-Smtp-Source: ABdhPJznaI7ZaYYbl3n2nOAnbExS2PY35/1NUhjmak9aco6aY0xYs+if6BZ85iCkEjsMcs+P6O8fHA==
X-Received: by 2002:a05:6808:8f0:: with SMTP id d16mr2525oic.47.1610387809040;
        Mon, 11 Jan 2021 09:56:49 -0800 (PST)
Received: from [192.168.86.73] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id t72sm91039oie.47.2021.01.11.09.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 09:56:47 -0800 (PST)
Subject: Re: Old platforms: bring out your dead
To:     Sam Ravnborg <sam@ravnborg.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com>
 <ef1dc21f-694b-2433-e1c6-aa121320173e@physik.fu-berlin.de>
 <20210110214653.GA1693373@ravnborg.org>
From:   Rob Landley <rob@landley.net>
Message-ID: <506e2355-0995-832a-1f9d-79b98a80ceff@landley.net>
Date:   Mon, 11 Jan 2021 12:09:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210110214653.GA1693373@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 1/10/21 3:46 PM, Sam Ravnborg wrote:
> Hi all,
>> Hi Arnd!
>>
>> (Please let's have this cross-posted for more visibility. I only learned about this
>>  while reading Phoronix news)
>>
>>> I also looked at non-ARM platforms while preparing for my article. Some of
>>> these look like they are no longer actively maintained or used, but I'm not
>>> doing anything about those unless the maintainers would like me to:
>>>
> 
>>> * sparc/sun4m: A patch for removing 32-bit Sun sparc support (not LEON)
>>>    is currently under review
>>
>> I don't think this has reached any agreement yet. Multiple people want it to stay.
> 
> None of the people that replied have any real use of the sun4m port,
> they only wanted it to stay because they had some machines or such.
> In other words - people will be sad if we sunset sun4m, but it will not
> hurt anyone as there are no users left.
> 
> I will include the above summary when I post v2 of the patch to sunset
> sun4m and sun4d. Then we will see what we conclude in the end.

I used to regression test it in my cross builds but I switched my
toolchains/userspace from uClibc to musl-libc a couple years back, and musl
never added sparc support.

Rob
