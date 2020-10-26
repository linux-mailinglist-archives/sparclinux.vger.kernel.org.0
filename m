Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150202999FC
	for <lists+sparclinux@lfdr.de>; Mon, 26 Oct 2020 23:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394903AbgJZWz1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Oct 2020 18:55:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37658 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394907AbgJZWz1 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 26 Oct 2020 18:55:27 -0400
Received: by mail-ed1-f65.google.com with SMTP id o18so11434606edq.4
        for <sparclinux@vger.kernel.org>; Mon, 26 Oct 2020 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=J/+n1x0TPOHJCTfSVoXlG/q+OLrGnnNxrysZ0ZyIy+Y=;
        b=JQw5fA5cqXZCTLCd2xkURV07bnYrA8gTT/8l9H7r6P+PgM37GQ7tblZcETghImepsU
         AcI0oUILLNpw7+Lob5wOxm8oxXKZgdxlvk1iOdkoLk31eLVc1crb3sEhxCSb6bD2V31l
         b7OGa6zHv0zDl28Z8OMcIxY0WvmVK7pWJSrW3Zs4sWifuxNiQ2iEW7pkdOAgHIEek3Fp
         L3yESbOX+0gb8ueK46K6rtDj34b55Vtmz8U4fPoQ/Dv2vqBsFOJNMTpbG7mznOfR5TaL
         kpOlREDICaBo0Xi3+x/a4pHYfGgO73EI5dQFmBZNKgKh2ry9/Y+FL54IAgbsbpnA0Xzm
         BeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=J/+n1x0TPOHJCTfSVoXlG/q+OLrGnnNxrysZ0ZyIy+Y=;
        b=GlBk3PuWUh6jbeDAS51WTNKsa9L0Ne0k2S7sUxoV4q0J+micNz/6O8bIuID849aW5Z
         ey9cbqQypXcheAP9Iw9hEobYfySuNHSDhdjENjs4w4gJKi3UZgOvbqHZbRn5Xd+3Tror
         SjDRyADh3KQcbqUHtIa4xLFTgUO7mZntIlhfuDHDXLy7JXGfjLtmk6wbj1s8gJcNz+TE
         G5B75kJZY07M05LWTK2ii/dhD1KeD2Li+7nq79tzAgaDIhcXzGsOQGLomhC5roVD7PpI
         qB5yJtnoUeXZQy0Vg8oqQkqiItfupnOQFatJZgVjrMV73IOVo4prSIifx7ADPf8sPUUi
         Bmcg==
X-Gm-Message-State: AOAM531xGCYVnPOGiZmYB9klHwMiaSj6NA3dcZRKsO39nJAlW/0RHOjF
        Fh7Nl+ocBBRw33cHI3cfOJsA7SyxcsRfObD/LY6w/g==
X-Google-Smtp-Source: ABdhPJyAci+5cM2zXs7C2dh5O8VDIKXSp+LVa6rVM/MPlgy6tZLvyXi43c6iWM9w5BW9l3CIsdr5O5Od75OK4rN9ByQ=
X-Received: by 2002:aa7:d9ce:: with SMTP id v14mr12828586eds.203.1603752924617;
 Mon, 26 Oct 2020 15:55:24 -0700 (PDT)
MIME-Version: 1.0
From:   Kyle Huey <me@kylehuey.com>
Date:   Mon, 26 Oct 2020 15:55:13 -0700
Message-ID: <CAP045Aqrsb=CXHDHx4nS-pgg+MUDj14r-kN8_Jcbn-NAUziVag@mail.gmail.com>
Subject: [REGRESSION] mm: process_vm_readv testcase no longer works after
 compat_prcoess_vm_readv removed
To:     open list <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     "Robert O'Callahan" <robert@ocallahan.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        "open list:FILESYSTEMS (VFS and infrastructure)" 
        <linux-fsdevel@vger.kernel.org>, linux-aio@kvack.org,
        io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

A test program from the rr[0] test suite, vm_readv_writev[1], no
longer works on 5.10-rc1 when compiled as a 32 bit binary and executed
on a 64 bit kernel. The first process_vm_readv call (on line 35) now
fails with EFAULT. I have bisected this to
c3973b401ef2b0b8005f8074a10e96e3ea093823.

It should be fairly straightforward to extract the test case from our
repository into a standalone program.

- Kyle

[0] https://rr-project.org/
[1] https://github.com/mozilla/rr/blob/master/src/test/vm_readv_writev.c
