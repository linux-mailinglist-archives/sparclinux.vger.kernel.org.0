Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1121240C
	for <lists+sparclinux@lfdr.de>; Thu,  2 Jul 2020 15:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgGBNDD (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Jul 2020 09:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbgGBNDD (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 2 Jul 2020 09:03:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB78C08C5DC
        for <sparclinux@vger.kernel.org>; Thu,  2 Jul 2020 06:03:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s10so28185658wrw.12
        for <sparclinux@vger.kernel.org>; Thu, 02 Jul 2020 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=x2lA0vz00OTlAj+9Kz23JP9p077e3dHraXNS67DafIc=;
        b=RVKW46yTAzAtHojQVUDNiUxwnwUcZ4Yd3oySCwHODKzFX/kBHSA+oWKIolTGJ5Rdcx
         S8VpDZgJBbPDAVIUw5yq5Jz3SO/9ehY4wWvunFdmaG2rvxo1t7mcvyo4HUTW/CFK97Zg
         SZ7CvgicqOrQBGx5Sx/uycZZD+w/Go3lHprfvDN3bBZXPJLZ+I1mCCV2zgkIfxUdcCoO
         vtaMnR0JCnRJ+2GF/fXCcFQKb9qCJlVibfIBhQLFFSe3lDuJJOSurDnJhSW3UaJqjOTn
         Vzzo5aBKkKC63uFmDknjlOMlDHX7a/d07akeZ+Zj3JVj51REcX4fQiJQEf8M3NAwwj43
         79VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x2lA0vz00OTlAj+9Kz23JP9p077e3dHraXNS67DafIc=;
        b=ghCj3cjm1GyTsCkmr6y9JUTO3FrZiJS0VFzXH+31TlL1W/5wwoc1LsZ8VFLGe7YHd7
         2+9v728UhCHirS7jFgwmVVUbkEcpaoQEH8BePspQ/NC4H3Dd0s2lkNfousmKpyKdB5LW
         W6vL6XLSHqrGlsc1rQwL4GXW1dMHEGYBTl+3Sa9MWgzm8OveBN6F0tKJqHub7uagYgkr
         Wamo1Eed0ebSsENKufu5TEo26Fhb1Yd+hAtWiJWB6XzGwqxyLfVocjanVt8UE8/h7pNa
         hL0w5Ak4qifvZB/EnFC6smkKBUyAi09t1CZZW1UolEbPAoYg9TBb11eu7c8PqPHSxjAb
         +aEw==
X-Gm-Message-State: AOAM530lDHbvAKqLLurck1va4M1Ec0Ojb/2AZaGYrz4B7pww0t/8LZ7P
        YX4Ux+/VfIFQ72uI2nS8QoxR7w==
X-Google-Smtp-Source: ABdhPJymk3QivoerF/S8PXzgdK1lEnCpMnYEhDUM5z2AAHBc06l8cYm3IQKaua7ZIcfwVS0yy+z5TQ==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr30828663wrv.316.1593694981446;
        Thu, 02 Jul 2020 06:03:01 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id j4sm6255287wrp.51.2020.07.02.06.03.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:03:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] sparc: sparc64_defconfig: add necessary configs for qemu
Date:   Thu,  2 Jul 2020 13:02:53 +0000
Message-Id: <1593694973-34113-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

The sparc64 qemu machines uses pcnet32 network hardware by default, so for
simple boot testing using qemu, having PCNET32 is useful.
Same for its storage which is a PATA_CMD64.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/sparc/configs/sparc64_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index bde4d21a8ac8..61073f48a7a1 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -236,3 +236,6 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRC16=m
 CONFIG_LIBCRC32C=m
 CONFIG_VCC=m
+CONFIG_ATA=y
+CONFIG_PATA_CMD64X=y
+CONFIG_PCNET32=y
-- 
2.26.2

