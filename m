Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB17FBA218
	for <lists+sparclinux@lfdr.de>; Sun, 22 Sep 2019 13:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbfIVLt3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 22 Sep 2019 07:49:29 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:30289 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfIVLt3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 22 Sep 2019 07:49:29 -0400
X-Greylist: delayed 472 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Sep 2019 07:49:27 EDT
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-04.nifty.com with ESMTP id x8MBaGgG016046
        for <sparclinux@vger.kernel.org>; Sun, 22 Sep 2019 20:36:16 +0900
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x8MBYmv4009695;
        Sun, 22 Sep 2019 20:34:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x8MBYmv4009695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569152089;
        bh=7yyatVofTFDMDzxmIITg/C1SE4md6ZFoYRRjarWk/pU=;
        h=From:To:Cc:Subject:Date:From;
        b=UVLCQzlsytsAVkuzRjRvgdZy8VwXuJsnxUgniU6waW3rzE1LwmfcJis9xDlAnfqB9
         +8lBL3JydRMl+bdqumSrAJdvMTTVEMzSbJ8LIEd0ciW46b5ScyzuRLr27wUV/VaDGd
         VUybrtFFli3zoEe1VZjZJ1xqhcmroelBg7LfaoVzzVAeECgj3mtqQKBG0pQTF2cpNm
         4esWw92zbCqMfXW6DbizjVp5+v+JFOlag1Ya2n/BFhJTws7Bw27kYJjQb0JQF8vgo/
         zPzW700rhV2sF8+11AVjArlJ4Zqyfx0i9G+MEzT9c2cYd8d6ns0JyFQT61KdPQ7X3W
         2tK5UHJWFvueQ==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Cc:     Anatoly Pugachev <matorola@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        "ndesaulniers@google.com" <ndesaulniers@google.com>
Subject: [PATCH] sparc: vdso: fix build error of vdso32
Date:   Sun, 22 Sep 2019 20:34:36 +0900
Message-Id: <20190922113436.10396-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Since commit 54b8ae66ae1a ("kbuild: change *FLAGS_<basetarget>.o to
take the path relative to $(obj)"), sparc allmodconfig fails to build
as follows:

  CC      arch/sparc/vdso/vdso32/vclock_gettime.o
unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
arch/sparc/vdso/vdso32/vclock_gettime.o: failed

The cause of the breakage is that -pg flag not being dropped.

The vdso32 files are located in the vdso32/ subdirectory, but I missed
to update the Makefile.

Fixes: 54b8ae66ae1a ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
Reported-by: Anatoly Pugachev <matorola@gmail.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/sparc/vdso/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 324a23947585..399bc22b1cf8 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -67,12 +67,14 @@ $(vobjs): KBUILD_CFLAGS := $(filter-out $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS
 #
 CFLAGS_REMOVE_vdso-note.o = -pg
 CFLAGS_REMOVE_vclock_gettime.o = -pg
+CFLAGS_REMOVE_vdso32/vdso-note.o = -pg
+CFLAGS_REMOVE_vdso32/vclock_gettime.o = -pg
 
 $(obj)/%.so: OBJCOPYFLAGS := -S
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
-CPPFLAGS_vdso32.lds = $(CPPFLAGS_vdso.lds)
+CPPFLAGS_vdso32/vdso32.lds = $(CPPFLAGS_vdso.lds)
 VDSO_LDFLAGS_vdso32.lds = -m elf32_sparc -soname linux-gate.so.1
 
 #This makes sure the $(obj) subdirectory exists even though vdso32/
-- 
2.17.1

