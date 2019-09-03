Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A1BA6067
	for <lists+sparclinux@lfdr.de>; Tue,  3 Sep 2019 07:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfICFCz (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 3 Sep 2019 01:02:55 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:33916 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfICFCz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 3 Sep 2019 01:02:55 -0400
Received: by mail-io1-f44.google.com with SMTP id s21so33078478ioa.1
        for <sparclinux@vger.kernel.org>; Mon, 02 Sep 2019 22:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=a9WijsPBo4tTCArpK4+vB5+XtAlzX3/IQ/ocMHQ8Ws4=;
        b=IOqgUWAiCeUJuIPfuudLoa/ccyhh8hMpflC0tyTNcuKujkKUFBuLbOcUsZjEDQtkfk
         9rKDvbH0CqwIA1lJ0ZyZaIsdm9a3WteySkS0sJ3JlL2ejyqSe5yhIg6ESXqK8wh5Rukc
         dinAV7iS+F/JnxR2cSCt+Sgq9hv6buSEjmcnPu7gi9P8NkcSTme/HyifWvM8rdD7Qz8q
         H3TIGLUB7GAThbNAIi3RbZ0+ElL2b5cLwKZ34W+0Zf1yOBFNbqXzo6GfpIL07FpDrJbd
         U6cltk2VbvOITOu/2xGXatLGZzXwe1XQJ1wiU7DmPFPpMeKqVE/N3eaXUDYg8AxINLNE
         +D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a9WijsPBo4tTCArpK4+vB5+XtAlzX3/IQ/ocMHQ8Ws4=;
        b=sYs65T8L60+AF2kyzgHTUsLcyPW48ao+lLOLWoTvuqwgzQ7wF7TMjwdTx45C9Q3euM
         5tbUhZKE+oouEl3WT0SxtqUmmkRaxTl2WO9El1qZDR2NbYY/g06oFE9OQeIm2XFmtyKF
         6Yl8b1KgOQNa96WNBH6wqCJ0P2U1Zxbavnp/vYlZn/sCPFEa0Q3VluE78jq0Yhccmgbe
         wZ3Erc9Pqnk4dBK71muLYtWXjlydA605KNkl2kf2gjF0f5V8ZOrgnjcLBBBnRTPbjAZH
         NLEe7kY555TDxUkvXBuopSIgrwK8bNeDWeFsIWc5jfvOlVcaT3bIbdgVDm3IO+49/EJ4
         khZg==
X-Gm-Message-State: APjAAAWMkurhRg1cYnjnuY2fr5R/P6G3ERQmLDrjX0044Q9XZaLFT5qV
        0gN4AuE18sxlUuThWQ9sLapX/zxQ5XGEX2U7slmM2A==
X-Google-Smtp-Source: APXvYqybh/N5WUwsLmo0h5uFgIwStLYiJhBR/y+eAVmlk1RK5FhbEE/7r0mZkOIG3O9v1V2G41KkL2HbBSb7MjbWBmI=
X-Received: by 2002:a5d:9f50:: with SMTP id u16mr20337431iot.110.1567486974657;
 Mon, 02 Sep 2019 22:02:54 -0700 (PDT)
MIME-Version: 1.0
From:   Matt Turner <mattst88@gmail.com>
Date:   Mon, 2 Sep 2019 22:02:43 -0700
Message-ID: <CAEdQ38E695mQzoi=cJ2KbqzqHpXjkyBGGj=kLrovZLyM8FybbA@mail.gmail.com>
Subject: [bisected] semctl/shmctl/msgctl broken on sparc64
To:     arndb@arndb.de, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Arnd,

The following commit breaks the semctl/shmctl/msgctl syscalls on
64-bit sparc userland (but not on 32-bit sparc userland)

commit 275f22148e8720e84b180d9e0cdf8abfd69bac5b
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Dec 31 22:22:40 2018 +0100

    ipc: rename old-style shmctl/semctl/msgctl syscalls

The LTP test case semctl01 can quickly reproduce the failure, but I
initially noticed this failure in the Perl test suite. Looks like the
syscalls always return EINVAL now. Funny, the commit doesn't even
touch arch/sparc :)

arch/sparc/include/uapi/asm/unistd.h
    Defines __32bit_syscall_numbers__ if __arch64__

arch/sparc/include/asm/unistd.h
    Includes arch/sparc/include/uapi/asm/unistd.h
    Defines __ARCH_WANT_SYS_IPC if __32bit_syscall_numbers__

ipc/syscall.c
    Looks like it defines different paths for __ARCH_WANT_SYS_IPC vs not

I get lost at this point, but I'm guessing that's where the difference
between 32-bit and 64-bit comes from.

Any ideas? I'm happy to test patches.

Thanks,
Matt
