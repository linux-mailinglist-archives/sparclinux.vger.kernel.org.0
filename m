Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4870428EAF2
	for <lists+sparclinux@lfdr.de>; Thu, 15 Oct 2020 04:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732584AbgJOCJu (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 14 Oct 2020 22:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729842AbgJOCJh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 14 Oct 2020 22:09:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12F8C05BD11
        for <sparclinux@vger.kernel.org>; Wed, 14 Oct 2020 15:30:10 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a5so1054622ljj.11
        for <sparclinux@vger.kernel.org>; Wed, 14 Oct 2020 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjl4waKkIn07fAHZxpQYfL1cJey++l2ULCvo+NpmtTI=;
        b=AoTo3+pYyDr0w6VWhfEzWtgMAa6u5EqUtIbZQ2wdSG8KrCn9aVrqk/7yhPB35QnD2m
         JalK+SeaQ3hXLo+S8bYDoNpWfnWxpQB/o00c26w91a14/A6mI5fG/jqus5sDeNFJLDuf
         BsNxJpUzCDXQHeObfZmnVJDuNlP1hv7yxDec4f6BOhh0CaTaty/5CVDrrONvhaHafpy3
         WWTj3p+df5fee81/4WgRdKVsueCgR7C+1tyNM57ZEFJuZcNf1kD37XwCnPAbjSh/vXPz
         6/Tp/AIlfr9HFwxC0w941Ocrco7hY/ksvJfhYETS8inE9HqwSVgikBfXguqBqfsPqKay
         3D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjl4waKkIn07fAHZxpQYfL1cJey++l2ULCvo+NpmtTI=;
        b=sExsNV9ujmRyTFMEsNRVK+p/QVu8dKc6TSAt0eEY3TIvP0V+0LiCX0WpqFHBrUENUe
         zlFQVjBVTDcySbO+9Q9sHumc/0hxOODSzlq4WX1q5KMbFShujLhVvqo6/Wm1GeMKlDmp
         UBUtn2owQ3Gt/KxC6hBFEVf73YwHPzg/jzm1N9sF8lczca6519JeQxofGnlXzZzds2kN
         Ach+6H6j79KQy4E0nDNpzeiT0sRsPoe7wjt5GPuk+tM0d7bZ7JQp4Q8FaOZoZa1nzuDN
         fyKI8KOX81ilzQd8jtPRBHo6eTa56O90EEkgE8fyD/pYju7YGeTpO7CzxvQvjkVG1YDr
         YWAA==
X-Gm-Message-State: AOAM5323jt0z3683Gp4GwAfoAX/MfTsw2GfWVlldQgxFTDUf+iNF8/GK
        /uT4xYNiUVrPefgppUJ1ktjltxJn6cAG9n/1U+b57w==
X-Google-Smtp-Source: ABdhPJzccfdlAK+SRaf7zIcMIaXsyDc7g+LulQbCIaLDti9pJSokw7/xfAWa5vfRRrUMlssMAS3ed5P4pPE1EvYM4fA=
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr119925ljk.160.1602714609293;
 Wed, 14 Oct 2020 15:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201007073932.865218-1-jannh@google.com> <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia> <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
 <20201012172218.GE6493@gaia> <20c85633-b559-c299-3e57-ae136b201526@oracle.com>
 <20201013091638.GA10778@gaia> <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
In-Reply-To: <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 15 Oct 2020 00:29:42 +0200
Message-ID: <CAG48ez0hoNb+DsMtzanGMXWdU63GwSvpzFCx5CkQa3Xxxo+Abg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 14, 2020 at 11:24 PM Khalid Aziz <khalid.aziz@oracle.com> wrote:
[...]
> current code? What FreeBSD does seems like a reasonable thing to do. Any
> way first thing to do is to update sparc to use arch_validate_flags()
> and update sparc_validate_prot() to not peek into vma without lock. I
> can do that unless Jann wants to rework this 2 patch series with these
> changes.

Ah, if you're willing to take care of that, that'd be nice, please do. :)
