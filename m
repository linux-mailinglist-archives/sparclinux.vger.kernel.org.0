Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B06F4A605E
	for <lists+sparclinux@lfdr.de>; Tue,  1 Feb 2022 16:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240482AbiBAPpK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 1 Feb 2022 10:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234655AbiBAPpJ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 1 Feb 2022 10:45:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F57BC061714
        for <sparclinux@vger.kernel.org>; Tue,  1 Feb 2022 07:45:09 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o30-20020a05600c511e00b0034f4c3186f4so2304784wms.3
        for <sparclinux@vger.kernel.org>; Tue, 01 Feb 2022 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
        b=dNCxlG7n/ZWCDBHispxymrFtrSs4c9YqEglHxbiG1ucYsKtBOTQqyfDQwy3eotCMjP
         uLM2L/H5EOfuyuixCibGBeRPuEqC7JcUChO4/5W88/l97mdNAgNvT/xqYmtLFgbKxh5n
         w5nISZOS0HKXiiexKQd+CqHtqM0kejpiHufa6rVenmJHxnYBkcSCvAZ+K0lfDvYe8v8/
         paGmxHQs3RqMpJLOQQe5QQ5vAOhsHvaHBxJGkYOele0OKszptBqf8ga7cK7KXkXhM0iv
         Gsb4gJ97geGtk3lJlPWcjuPmCn1m0Qbge+0Fy+Y8HGop/fCzxMmzbROs7ofYWtG8VEDd
         mjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
        b=wFcTtYoaTGIJ6kvS8hHy97ZffFl7rfbMEjv56ScelKzIK5AywD/jl5Wqj201ZmKVWE
         KqgwIILT/O+9ASi12Amx2kfqDyf545m1JF9jKIEQGdBuc7QT+xnmfHIeQpMNP7+wRD3J
         ukl6keN/FF+3SElLki5gpnkkThtOxpNC2Tp1XZ8q5v7b+SHuIvzQsRji6kX8Bo7+O8/6
         giDltwwdG4GhJ4UOewOXj9FHTnKWpC6274m8GHFW9MfaxIfFyyXLmapiD+l9F+uMbkBZ
         OssOdV8i+bP0NQAqmsjTR03qcVX+J+oR+yfpgpmdb9j7gu+R0ytdJWl2WlSDEamWaUNk
         FmAQ==
X-Gm-Message-State: AOAM530yqYhoqO8DGTzilbNqfUn7+w+H6gd0/pfFP7FqtLPjiFMhuFFN
        oBARtZXMjQ9h/mV1lSGo0Ghk96ZllPlSDpMpxKY20g==
X-Google-Smtp-Source: ABdhPJzLJXIjzEoU+zr9xqvCLUKq64QKzCzT5/D/E4v9iXKOT2PZW4bgO0vZKGKExLFNyrBqW6Lzx4h6BrcWo4/kvAI=
X-Received: by 2002:a7b:c929:: with SMTP id h9mr2237691wml.176.1643730307764;
 Tue, 01 Feb 2022 07:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org> <20220201150545.1512822-22-guoren@kernel.org>
In-Reply-To: <20220201150545.1512822-22-guoren@kernel.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 1 Feb 2022 21:14:56 +0530
Message-ID: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To:     Guo Ren <guoren@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

+Paolo

On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>

This looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
>  config HAVE_KVM_IRQ_BYPASS
>         bool
> --
> 2.25.1
>
