Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50380BA172
	for <lists+sparclinux@lfdr.de>; Sun, 22 Sep 2019 10:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfIVINU (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 22 Sep 2019 04:13:20 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33571 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbfIVINU (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 22 Sep 2019 04:13:20 -0400
Received: by mail-ed1-f67.google.com with SMTP id c4so10023294edl.0
        for <sparclinux@vger.kernel.org>; Sun, 22 Sep 2019 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UbCpGmWOjW8T45hzY5nXEmZ3i6KSPrVZH6kPqBGGZEo=;
        b=F9mJvDFfAtKKpdpDxxYCaFS9T37t5Sa9kLx2tsc+qL18MIx4oJnzb2VGrMjUXXmfQ6
         Y71+sO0KhpF0pO0/qQQRoTA/IZF8UQD45tNJpKJpDEmofCHaxTsnLYyE2JnbzvvaZr1W
         6kYBwsvzwF48H6q5pcRvYdtJ+KCGPP1mXpsIObCDmI7c2AJofidaPNPZoCa57hujnLR1
         cVginyWgOTp/2YIB4WB7PaD71NfTtpAv0eISEsf2N/hEhLOOtt8TVGyV4N2lIpO1i3iQ
         s+jIGJFwYusYz7uBAKBrp1wOJFMmYfSx0IeRmGWBzbj3CkelGNA6KvsWWHutCynqR7hK
         ofyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UbCpGmWOjW8T45hzY5nXEmZ3i6KSPrVZH6kPqBGGZEo=;
        b=kmFqSk3STDuO2xMjEzdPzyl8WAowOlfQ9ARHsa9fPhcM2vSVjAOrASsq0Cdab9vFFC
         Y9ljSdYeNdNnhKuJSC7jdfmij6lkI9IyvT+JGcrLb0EPku1SYpOe8/oLHraR7+gwyMQu
         lp9LwFFoC6R3Yuh6OS1Ggy5yG6sGZbKFIazQUewoOCmB/3ojy9c8CFLYJF1lYALbIbG0
         Ql0ZwBWl6bQAi12EU00hTbG4PPpufvqugaHwVXNNt1aoR70Qbkxy0bH9dFZehvIe7udK
         mwvW+In896lb2klpLUWO7uvIA8KNKMFXvV3hfAWjLudoGo6Xvg38GNnIGQstPSit492C
         4caQ==
X-Gm-Message-State: APjAAAXhsmxvMRjRV02086yjt30/atJM3AXZ+8IwajZUkxUvYf5fApwM
        51nOqLDp2i40FzieRicfhR1N55OuRQ6+9Irw3jUgAwcs
X-Google-Smtp-Source: APXvYqwGGl9/oQfi9wpox7cp8NL1+1d4JOZLqsrbibBH8u7buP7d4hQJbfaxQrDolsLh/pXgJa0Gz2SGZgIbEN/Olvk=
X-Received: by 2002:a17:906:a84d:: with SMTP id dx13mr26113317ejb.230.1569139998431;
 Sun, 22 Sep 2019 01:13:18 -0700 (PDT)
MIME-Version: 1.0
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Sun, 22 Sep 2019 11:13:11 +0300
Message-ID: <CADxRZqwizJ2HXdiU7aSH9t=ecBEHnxdVVsQ4wUpTYRpCgdXf=w@mail.gmail.com>
Subject: latest git kernel (v5.3-11506-gf7c3bf8fa7e5) does not compile
To:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello!

Latest git kernel does not compile for me:

~/linux-2.6$ git desc
v5.3-11506-gf7c3bf8fa7e5

~/linux-2.6$ make
  CALL    scripts/checksyscalls.sh
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
  CALL    scripts/atomic/check-atomics.sh
  CHK     include/generated/compile.h
  CC      arch/sparc/vdso/vdso32/vclock_gettime.o
unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
arch/sparc/vdso/vdso32/vclock_gettime.o: failed
make[2]: *** [scripts/Makefile.build:266:
arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
make[1]: *** [scripts/Makefile.build:509: arch/sparc/vdso] Error 2
make: *** [Makefile:1667: arch/sparc] Error

but I was able to compile successfully v5.3-10169-g574cc4539762

Not sure my bisect log is right, but here it is:

$ git bisect good
54b8ae66ae1a3454a7645d159a482c31cd89ab33 is the first bad commit
commit 54b8ae66ae1a3454a7645d159a482c31cd89ab33
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri Aug 30 13:34:01 2019 +0900

    kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)

    Kbuild provides per-file compiler flag addition/removal:

      CFLAGS_<basetarget>.o
      CFLAGS_REMOVE_<basetarget>.o
      AFLAGS_<basetarget>.o
      AFLAGS_REMOVE_<basetarget>.o
      CPPFLAGS_<basetarget>.lds
      HOSTCFLAGS_<basetarget>.o
      HOSTCXXFLAGS_<basetarget>.o

    The <basetarget> is the filename of the target with its directory and
    suffix stripped.

    This syntax comes into a trouble when two files with the same basename
    appear in one Makefile, for example:

      obj-y += foo.o
      obj-y += dir/foo.o
      CFLAGS_foo.o := <some-flags>

    Here, the <some-flags> applies to both foo.o and dir/foo.o

    The real world problem is:

      scripts/kconfig/util.c
      scripts/kconfig/lxdialog/util.c

    Both files are compiled into scripts/kconfig/mconf, but only the
    latter should be given with the ncurses flags.

    It is more sensible to use the relative path to the Makefile, like this:

      obj-y += foo.o
      CFLAGS_foo.o := <some-flags>
      obj-y += dir/foo.o
      CFLAGS_dir/foo.o := <other-flags>

    At first, I attempted to replace $(basetarget) with $*. The $* variable
    is replaced with the stem ('%') part in a pattern rule. This works with
    most of cases, but does not for explicit rules.

    For example, arch/ia64/lib/Makefile reuses rule_as_o_S in its own
    explicit rules, so $* will be empty, resulting in ignoring the per-file
    AFLAGS.

    I introduced a new variable, target-stem, which can be used also from
    explicit rules.

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
    Acked-by: Marc Zyngier <maz@kernel.org>

 arch/arm/kvm/Makefile                         |  5 +++--
 arch/x86/entry/vdso/Makefile                  |  3 ++-
 drivers/gpu/drm/amd/display/dc/calcs/Makefile |  6 +++---
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  2 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 17 +++++++----------
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  7 +++----
 drivers/gpu/drm/i915/Makefile                 |  2 +-
 scripts/Makefile.host                         | 22 +++++++++++-----------
 scripts/Makefile.lib                          | 13 ++++++++-----
 scripts/kconfig/Makefile                      |  8 ++++----
 10 files changed, 43 insertions(+), 42 deletions(-)
mator@ttip:~/linux-2.6$


If someone wants to check how kernel compiles on sparc64, could use
gcc compile farm machine (gcc202) to try on.

Thanks.
