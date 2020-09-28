Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3A327AD98
	for <lists+sparclinux@lfdr.de>; Mon, 28 Sep 2020 14:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgI1MOj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 28 Sep 2020 08:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1MOj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 28 Sep 2020 08:14:39 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF79C061755
        for <sparclinux@vger.kernel.org>; Mon, 28 Sep 2020 05:14:39 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so8158189ejb.8
        for <sparclinux@vger.kernel.org>; Mon, 28 Sep 2020 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ULrSf82cVDYxU3BYbb7m6MDttIpV3C4Y47Llm1GUmmM=;
        b=RYu5+Otf5FEX6f56j8YIX5wR0ismZYUj9KwUidK4Ky/3nHe91MMusAiJHvYtzUj3ZS
         83Blo43RlqTcu00g7T/v2HJeD7FskeRP5dKU8uqUL7sROkb7zAD4jFpx05gofs/9FmK4
         GoeBfl1scYDfuGddxFU7mhF22O8A3jiCEp7YBrBSkp3TcbfPQqdr+l7cOYHX/trJL9d7
         6IT/QtfYLj3AvCfxnC/ss8B4FceydqW4DLBQ4NAL21+37tB3ZCs7UEJlFStEJHdBV+/m
         oxxi0goCOQHHK6M68btJy2raPmpyXwT9kBNbXdVmrBk5lzSMmHeeFmAPZCk2jTh/f9Ft
         H2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ULrSf82cVDYxU3BYbb7m6MDttIpV3C4Y47Llm1GUmmM=;
        b=T3e45gFBncP52I39tInZAE5+wrWdh52T9KPHiAImsxRwWKp70kD+bGUywp8QZnEZOL
         mfn1FwlkaKUuJcpNAffe2d1mzQiMa61NMerTCa4nooiOeVERKjBPYIcTMZ4uUiF6R1ja
         4ogIR7+RAF9lCF4dAFNHOIT1zaFMJ43gBhcT4eqr6WscOwmEou0UOKU3xokEbhiJj2Io
         BRRJJ4vEJPFTzPY89cq6FYjakeTsMvbDCx01QqCmKVYSEbcVuo2NgNU4GIzG0C5QmiCH
         77L2RrGJSx1JCesyAPROIxOLzu9fcxJPSk5UgXspjYgUaCTgfL5lPXzY6XhPYHhMAGTx
         lWnw==
X-Gm-Message-State: AOAM533KSOE9BK5zyCkndjuh0Xyw5ha40nBSjzm1v8DWMuy9sJnSE9oN
        sdYD15KPerHGe87J5/1hQUSCWtWtI5Su2IV+ZGS+GQ==
X-Google-Smtp-Source: ABdhPJzyXErbSkHAJICjNnqPWiqQnKU0mMtCMTF0AauvxqADR4UegaiDlNtrxhZJCdOOpXcvF6uv/dIltrwioMVI26E=
X-Received: by 2002:a17:906:f6c9:: with SMTP id jo9mr1312638ejb.233.1601295277452;
 Mon, 28 Sep 2020 05:14:37 -0700 (PDT)
MIME-Version: 1.0
From:   Jann Horn <jannh@google.com>
Date:   Mon, 28 Sep 2020 14:14:11 +0200
Message-ID: <CAG48ez3YsfTfOFKa-Po58e4PNp7FK54MFbkK3aUPSRt3LWtxQA@mail.gmail.com>
Subject: SPARC version of arch_validate_prot() looks broken (UAF read)
To:     "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Khalid Aziz <khalid@gonehiking.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Anthony Yznaga <anthony.yznaga@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From what I can tell from looking at the code:

SPARC's arch_validate_prot() looks up the VMA and peeks at it; that's
not permitted though. do_mprotect_pkey() calls arch_validate_prot()
before taking the mmap lock, so we can hit use-after-free reads if
someone concurrently deletes a VMA we're looking at.

Additionally, arch_validate_prot() currently only accepts the start
address as a parameter, but the SPARC code probably should be checking
the entire given range, which might consist of multiple VMAs?

I'm not sure what the best fix is here; it kinda seems like what SPARC
really wants is a separate hook that is called from inside the loop in
do_mprotect_pkey() that iterates over the VMAs? So maybe commit
9035cf9a97e4 ("mm: Add address parameter to arch_validate_prot()")
should be reverted, and a separate hook should be created?

(Luckily the ordering of the vmacache operations works out such that
AFAICS, despite calling find_vma() without holding the mmap_sem, we
can never end up establishing a vmacache entry with a dangling pointer
that might be considered valid on a subsequent call. So this should be
limited to a rather boring UAF data read, and not be exploitable for a
UAF write or UAF function pointer read.)
