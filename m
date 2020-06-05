Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696671EF619
	for <lists+sparclinux@lfdr.de>; Fri,  5 Jun 2020 13:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgFELGT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 5 Jun 2020 07:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgFELGN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 5 Jun 2020 07:06:13 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6F4C08C5C2;
        Fri,  5 Jun 2020 04:05:39 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x14so9323703wrp.2;
        Fri, 05 Jun 2020 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=79WkwIDyqMiX32euMiWXXxC5SiRfx2kHzXerVEMHJjs=;
        b=sYTZ6YdgN1/Sbp6SOZVZyHY8MCy2iGnmI/oTKmBJXvTbh1W3iYrxkGHPnNBzqIci55
         7E//pIMpiOlxA0YgiAhyqj9dJdzUpMrhVBCwKxlayIKCHcN4hcoNd98lKBFsth9L3N9s
         8/QNalT/mv2w0kX2AMj0a/ETLmx8R+28y/IQJ11xfOurh/YD7l5/KqFYSnrdPlstINWK
         uaroFYmvBHrZvIr59E4NktiM/HXOeebmkgj4eo7L4R8e0lAA1Ep0NO2yW0vYLd5pN8D0
         J/MV+tFOr4kb2aSIn+qnv2wGr+/isoues/LsuxVeNDLnk0sYBCuv8ofN8uuL7C3GhDKy
         qSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=79WkwIDyqMiX32euMiWXXxC5SiRfx2kHzXerVEMHJjs=;
        b=HoJT1EPm19JAEOmar1ww9OHBjQ+iuGIM1QbwvhNS6rEIeR9x+0RBYUalXhvUgUfP63
         9VgjZtW/9lHOq5VfkcwNYLy8AUxTl+lAqP9j/915yq18sO35k86R7ztxDzbtWEHQa6hF
         tuiUPOsbYIiF3osmZ9fR1Th8BtQhARWb/slo99Awld2na+1uLrV3LC5DrU2UhXZos9B8
         vPMH7JMAml1XfvokS6Ggvl9YmriVvWQniGPQ8owL6VdTer6+p3A3slLcmqSxfM9bn+/K
         iJPgkDSfzcXXmYeHgamiQI7iNT+EBR3Z9Dg4UiPNVEC/QwZjGnc9GLLPuAiQPX2r62i5
         HZLQ==
X-Gm-Message-State: AOAM530sApEP2urH0/PnqtqyySyCMlrubEeKMuXW1w097cIF89HhkxTR
        m8h1IeukVUVd3Y8JFRC4VNaDihZy
X-Google-Smtp-Source: ABdhPJwH9qoXN/4AI5aIZz4mwTcaxFGasA4tRMeBaSNWUBNVfiqh3elNUjOpJJ+knPG3GEEH0uRaUA==
X-Received: by 2002:adf:cd08:: with SMTP id w8mr8861357wrm.36.1591355137981;
        Fri, 05 Jun 2020 04:05:37 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id h12sm11364322wro.80.2020.06.05.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 04:05:37 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:05:35 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     davem@davemloft.net, sparclinux@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Fail to build tftpboot.img
Message-ID: <20200605110535.GA9025@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello

For reinstalling an old SPARC machine , I need a netboot image.
I tried to create it via make tftpboot.img but got:
BUILD: sparc to /home/compile/crossbuild/next/sparc/sparc64/defconfig
make[1]: Entering directory '/usr/src/crossbuild/next/sparc/sparc64/defconfig'
  GEN     Makefile
scripts/kconfig/conf  --syncconfig Kconfig
  GEN     Makefile
  CALL    /linux-next/scripts/atomic/check-atomics.sh
  CALL    /linux-next/scripts/checksyscalls.sh
<stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
  CHK     include/generated/compile.h
  GZIP    kernel/config_data.gz
  CC      kernel/configs.o
  AR      kernel/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
  KSYM    .tmp_vmlinux.kallsyms1.o
  LD      .tmp_vmlinux.kallsyms2
  KSYM    .tmp_vmlinux.kallsyms2.o
  LD      vmlinux
  SYSMAP  System.map
  MODPOST Module.symvers
  STRIP   arch/sparc/boot/image
  kernel: arch/sparc/boot/image is ready
  ELFTOAOUT arch/sparc/boot/tftpboot.img
PT 0 Entry: Loadable to 0x400000[0x5288d0] from 0x0[0x4ca694] align 0x100000
PT 1 Entry: Note
PT 2 Entry: unknown
  PIGGY   arch/sparc/boot/tftpboot.img
lseek: Invalid argument
make[2]: *** [/linux-next/arch/sparc/boot/Makefile:72: arch/sparc/boot/tftpboot.img] Error 1
make[2]: *** Deleting file 'arch/sparc/boot/tftpboot.img'
make[1]: *** [arch/sparc/Makefile:76: tftpboot.img] Error 2
make[1]: Leaving directory '/usr/src/crossbuild/next/sparc/sparc64/defconfig'
make: *** [Makefile:185: __sub-make] Error 2

I got this result on both linux-next and 5.6.15

I have straced the process:
22495 openat(AT_FDCWD, "arch/sparc/boot/tftpboot.img", O_RDWR) = 3              
22495 read(3, "\1\3\1\7\0\0\0\0\0Lf\224\0\0\0\0\0\0\0\0\0\0\0\0\0\5\342<\0\0\0\0"..., 512) = 512
22495 lseek(3, 0, SEEK_SET)             = 0                                     
22495 read(3, "\1\3\1\7\0\0\0\0\0Lf\224\0\0\0\0\0\0\0\0\0\0\0\0\0\5\342<\0\0\0\0"..., 1024) = 1024
22495 lseek(3, -480, SEEK_SET)          = -1 EINVAL (Argument invalide)         
22495 dup(2)                            = 4                                     
22495 fcntl(4, F_GETFL)                 = 0x402 (flags O_RDWR|O_APPEND)         
22495 fstat(4, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x1a), ...}) = 0    
22495 write(4, "lseek: Invalid argument\n", 24) = 24                            
22495 close(4)                          = 0                                     

Regards
