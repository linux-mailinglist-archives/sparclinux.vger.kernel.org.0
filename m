Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78EC615A710
	for <lists+sparclinux@lfdr.de>; Wed, 12 Feb 2020 11:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgBLKxg (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 12 Feb 2020 05:53:36 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37772 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgBLKxg (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 12 Feb 2020 05:53:36 -0500
Received: by mail-wr1-f67.google.com with SMTP id w15so1656916wru.4
        for <sparclinux@vger.kernel.org>; Wed, 12 Feb 2020 02:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCxaKYylUaTagw0CiACoN5PmGBZhgyb9phU3hhP0tOU=;
        b=cfEHKyCzPVV+G0Ct3fk+e76eZPGNTeImhNiFGDVimPzL4uYn8zjyFG9WyB0koRR2qN
         EwMnN8vjUGQ2wbhjgaIjph2vjfhe8yjFmu9ClTKqCx2OtRi5VsZHinaDNjSlIBmgdAxy
         wxZcB8m80XRXcoyEYhnoHyLx5c4HUKj1j5ketT2WaaEFRPaldEWGCoEuAfq2/3tjkHap
         8wX1V3Fo/iwSy3etqyDyJk14F8tfP9OcXDnIFVgeOxj2H0AcSvMFus1GiH7Bo5SBr38M
         +OGCJMD8zbYUhdsAjqZ8LRFVbVVV0cBL4zfH47rlbg/l3/sDFnDyyciz4KUYMzOvm7Ic
         iHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=iCxaKYylUaTagw0CiACoN5PmGBZhgyb9phU3hhP0tOU=;
        b=ZNFypQ9l1ykKrQEIZFBDK31gUdqQT3rnsz0FP/uanTEkTZxXPXAfGA50HE5sMgO2ca
         uG3G5prGtoxvbg6ABP3EuRbvaN2B0n3Rb+lMigkEdYeEy3i4rs/QJgxXTzvx975lm8M0
         eIcXzTo6JK6kfiagF37I5XWcE1hedpp5SqI8J9vopwOFO71Bj4j7rT3iBo6qGBrJPQ0H
         sVk/ToS8wiidSYGDHQKYCCXcZ5fMiW6PB0b4CVYXnRDhzEnwXLzXApnHWSvLdYN27XaW
         KgEhesyUwNlxtJG89k6PBdJuU1Uc/19A/TC78oRgI6Rq9+GQD3xXqJf2cuHtx1km8RQC
         Tdrw==
X-Gm-Message-State: APjAAAU+IDlLkKY98Biz2GL9/GwOGnpu4jcarr9sbwVqtxwO4HA7oSSq
        54LEJf6M70QI/xtwkZbnQiw1Rw==
X-Google-Smtp-Source: APXvYqxgTVJqQTyquzXfMccEeyNdAmwRbsVgVjP0iCL7Yk3Bd8yKTybDkb7CTMq7CHnJcPN3jls9ZA==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr15503626wrc.175.1581504812588;
        Wed, 12 Feb 2020 02:53:32 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id b10sm123284wrw.61.2020.02.12.02.53.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 02:53:30 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com, arnd@arndb.de,
        akpm@linux-foundation.org
Cc:     Stefan Asserhall <stefan.asserhall@xilinx.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Chris Zankel <chris@zankel.net>,
        "David S. Miller" <davem@davemloft.net>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Helge Deller <deller@gmx.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matt Turner <mattst88@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paulburton@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Tony Luck <tony.luck@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: [PATCH v3] asm-generic: Fix unistd_32.h generation format
Date:   Wed, 12 Feb 2020 11:53:29 +0100
Message-Id: <4d32ab4e1fb2edb691d2e1687e8fb303c09fd023.1581504803.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Generated files are also checked by sparse that's why add newline
to remove sparse (C=1) warning.

The issue was found on Microblaze and reported like this:
./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
warning: no newline at end of file

Mips and PowerPC have it already but let's align with style used by m68k.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com> (xtensa)
---

Changes in v3:
- Add notes about mips/ppc and m68 - Max/Geert

Changes in v2:
- Update also others archs not just microblaze - Arnd
- Align subject and description to match multiarch change

 arch/alpha/kernel/syscalls/syscallhdr.sh      | 2 +-
 arch/ia64/kernel/syscalls/syscallhdr.sh       | 2 +-
 arch/microblaze/kernel/syscalls/syscallhdr.sh | 2 +-
 arch/mips/kernel/syscalls/syscallhdr.sh       | 3 +--
 arch/parisc/kernel/syscalls/syscallhdr.sh     | 2 +-
 arch/powerpc/kernel/syscalls/syscallhdr.sh    | 3 +--
 arch/sh/kernel/syscalls/syscallhdr.sh         | 2 +-
 arch/sparc/kernel/syscalls/syscallhdr.sh      | 2 +-
 arch/xtensa/kernel/syscalls/syscallhdr.sh     | 2 +-
 9 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscallhdr.sh b/arch/alpha/kernel/syscalls/syscallhdr.sh
index e5b99bd2e5e7..1780e861492a 100644
--- a/arch/alpha/kernel/syscalls/syscallhdr.sh
+++ b/arch/alpha/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/ia64/kernel/syscalls/syscallhdr.sh b/arch/ia64/kernel/syscalls/syscallhdr.sh
index 0c2d2c748565..f407b6e53283 100644
--- a/arch/ia64/kernel/syscalls/syscallhdr.sh
+++ b/arch/ia64/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/microblaze/kernel/syscalls/syscallhdr.sh b/arch/microblaze/kernel/syscalls/syscallhdr.sh
index 2e9062a926a3..a914854f8d9f 100644
--- a/arch/microblaze/kernel/syscalls/syscallhdr.sh
+++ b/arch/microblaze/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/mips/kernel/syscalls/syscallhdr.sh b/arch/mips/kernel/syscalls/syscallhdr.sh
index d2bcfa8f4d1a..2e241e713a7d 100644
--- a/arch/mips/kernel/syscalls/syscallhdr.sh
+++ b/arch/mips/kernel/syscalls/syscallhdr.sh
@@ -32,6 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/parisc/kernel/syscalls/syscallhdr.sh b/arch/parisc/kernel/syscalls/syscallhdr.sh
index 50242b747d7c..730db288fe54 100644
--- a/arch/parisc/kernel/syscalls/syscallhdr.sh
+++ b/arch/parisc/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/powerpc/kernel/syscalls/syscallhdr.sh b/arch/powerpc/kernel/syscalls/syscallhdr.sh
index c0a9a32937f1..02d6751f3be3 100644
--- a/arch/powerpc/kernel/syscalls/syscallhdr.sh
+++ b/arch/powerpc/kernel/syscalls/syscallhdr.sh
@@ -32,6 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/sh/kernel/syscalls/syscallhdr.sh b/arch/sh/kernel/syscalls/syscallhdr.sh
index 1de0334e577f..4c0519861e97 100644
--- a/arch/sh/kernel/syscalls/syscallhdr.sh
+++ b/arch/sh/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/sparc/kernel/syscalls/syscallhdr.sh b/arch/sparc/kernel/syscalls/syscallhdr.sh
index 626b5740a9f1..cf50a75cc0bb 100644
--- a/arch/sparc/kernel/syscalls/syscallhdr.sh
+++ b/arch/sparc/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
diff --git a/arch/xtensa/kernel/syscalls/syscallhdr.sh b/arch/xtensa/kernel/syscalls/syscallhdr.sh
index d37db641ca31..eebfb8a8ace6 100644
--- a/arch/xtensa/kernel/syscalls/syscallhdr.sh
+++ b/arch/xtensa/kernel/syscalls/syscallhdr.sh
@@ -32,5 +32,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
 	printf "#define __NR_syscalls\t%s\n" "${nxt}"
 	printf "#endif\n"
 	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
+	printf "#endif /* %s */\n" "${fileguard}"
 ) > "$out"
-- 
2.25.0

