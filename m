Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF331F1AB0
	for <lists+sparclinux@lfdr.de>; Wed,  6 Nov 2019 17:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbfKFQCN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 6 Nov 2019 11:02:13 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39306 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKFQCN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 6 Nov 2019 11:02:13 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so16027903pfo.6
        for <sparclinux@vger.kernel.org>; Wed, 06 Nov 2019 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WP6brivH9UJZbax2EaHo6KZDTan65jr7aTNdyCpmUdg=;
        b=lAaIfPXwP6bzV7BqADV+PIyQjPp4XeFFxY3CqaLwJlb25CRVvrI1IlEzB4TFq+OpSe
         S8RcWEudBQD4AkJcBBbzgVP0CGE7BfqH8sfO3NOWhJCm0eQmiCorBE0/46DHj4rmL6BT
         R3gEfoAPPOLwcp+rhdH01A5cW2aqPf0BG33wpZYMlz+z3T8nO7/oJDOBowcE45DHmo6d
         ZLkOCedUv8hcvLHBfcGtyGLbS3IYou/fMI+gNSiUImnkJMMwvnXSoPxiZZdZHjQeUzzz
         zGNBwwwCpAGi3GCa0JJKPnsd/kxD8viNJNEajWAJ6VHFFqzg+omC0+VrWnITGqcoizHi
         +IRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WP6brivH9UJZbax2EaHo6KZDTan65jr7aTNdyCpmUdg=;
        b=QX+QPjPdmTM6KiShe7m9J7xBjGfVGbrS6Ujtl25HjqS3GsXqg6yvjlUrDoXt/6Fjey
         4cOXj750kqNFFY9BPZuM3YdmcP/wDV6oE5qlZBI/mMF38e2rrDj+QWVjvy0l+A8JeDBz
         cDd+UELtecJNL9eGVN0HzpJQnUVPEUPJSm9WB/UmkO++UYRnDI3iUzjNxhVv7IvU5/Ui
         5pCDc7WOdaxNNoWHxO9MI8e393w5vDi8MqW+s9uJoXTIH0U01Jl4Ugf4GDru+dR8UyVr
         JQugah8nnPQ5ajrgquG+Lh3/99TsqkXXKXWJGYrEM5U+cgtzEsyX9Qp+AU5QYTig+1p1
         MC0A==
X-Gm-Message-State: APjAAAUovx+40ZZf99Wm5sG5URt1WBrj4xKKpyIoMVpoZ3WbHhiMQYNG
        I+sN4v9lOIA1MwC9Jkkl77901Ryd/Ho=
X-Google-Smtp-Source: APXvYqwgi+f6hLzBO0f8hreRraheVRkdSgLPYnouRwSWaXLfWdFMrwsHFakjGnWrLSVvrBHqso+2GA==
X-Received: by 2002:a62:6d41:: with SMTP id i62mr4363482pfc.38.1573056132252;
        Wed, 06 Nov 2019 08:02:12 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id j24sm23080179pff.71.2019.11.06.08.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 08:02:11 -0800 (PST)
Subject: Re: [PATCH 34/50] sparc: Add show_stack_loglvl()
To:     David Miller <davem@davemloft.net>
Cc:     linux-kernel@vger.kernel.org, 0x7f454c46@gmail.com,
        akpm@linux-foundation.org, gregkh@linuxfoundation.org,
        mingo@kernel.org, jslaby@suse.com, pmladek@suse.com,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        penguin-kernel@I-love.SAKURA.ne.jp, sparclinux@vger.kernel.org
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-35-dima@arista.com>
 <20191105.193327.1393649190609263166.davem@davemloft.net>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <40f70e6b-c3c6-34ee-45c9-573331851534@arista.com>
Date:   Wed, 6 Nov 2019 16:02:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105.193327.1393649190609263166.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 11/6/19 3:33 AM, David Miller wrote:
> From: Dmitry Safonov <dima@arista.com>
> Date: Wed,  6 Nov 2019 03:05:25 +0000
> 
>> Currently, the log-level of show_stack() depends on a platform
>> realization. It creates situations where the headers are printed with
>> lower log level or higher than the stacktrace (depending on
>> a platform or user).
>>
>> Furthermore, it forces the logic decision from user to an architecture
>> side. In result, some users as sysrq/kdb/etc are doing tricks with
>> temporary rising console_loglevel while printing their messages.
>> And in result it not only may print unwanted messages from other CPUs,
>> but also omit printing at all in the unlucky case where the printk()
>> was deferred.
>>
>> Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
>> an easier approach than introducing more printk buffers.
>> Also, it will consolidate printings with headers.
>>
>> Introduce show_stack_loglvl(), that eventually will substitute
>> show_stack().
>>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: sparclinux@vger.kernel.org
>> [1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
>> Signed-off-by: Dmitry Safonov <dima@arista.com>
> 
> Acked-by: David S. Miller <davem@davemloft.net>

Thanks for the review and time, David!

-- 
          Dmitry
