Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EAB330A92
	for <lists+sparclinux@lfdr.de>; Mon,  8 Mar 2021 10:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhCHJv7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 8 Mar 2021 04:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhCHJvd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 8 Mar 2021 04:51:33 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041ABC06174A
        for <sparclinux@vger.kernel.org>; Mon,  8 Mar 2021 01:51:32 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id b18so10726683wrn.6
        for <sparclinux@vger.kernel.org>; Mon, 08 Mar 2021 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=+G3FrRFu9LNWKFjF3mvuFBF1Z6whzll6UPpQw6o1RMU=;
        b=oCZDuwnfC5NL1NcfVpNUQIqILApB7oIaVDsflwsOvwcQfVpYuQvcM4FIc0AVtS7MB7
         FAtZS7ukGqo0f6Cp1P7/MNTkA9JGH3U28o0RVXJzA65vuzhA4XrWUwVk+jZ0EQURMgXY
         gKe6IqX7naHflMZZN8hpm8hjPCSa9e0qETlBvN19JDLdcnQkHNejkmxaBmzumOsmWUcy
         vVvMQW9O41B107+zof6PZ/yGpJuasl48S/WHPkLjJV59fFNvvUq0LHd2rdJ6zFiTL1WW
         go9jT+qI6HcUkd3fGuU2WcbM5QQoRdbjpkqsGWzh6TKJRtXmwrLQU6EucPDIn7Wczzxf
         uN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+G3FrRFu9LNWKFjF3mvuFBF1Z6whzll6UPpQw6o1RMU=;
        b=AklGzG0fHCSpNMV4AkkkPm1psMchTQy/dMf5tDX4xPf1SGNMq9SI5i8Cbt3gCKDxsN
         ZkwX0doYEsqiZbQdRuAT6SmVvSYhrd87JBTB1UlR2v7JNejOSstRCW6h1748MMZCb4P/
         E8AytQAVIa3u2+VqvK6Asf68JUZa9/lKV1mXLgqyyPZQ3ua/NdSTXxVdkmd4LOvqnpgu
         dM996EFTZAsr835teuWxN8OHWgzlijkLoR9TV69asub4Z/Sdi4wNSei8XwHGaw0ugCpw
         GFIyQZRYODcpgF5jRGvbxF2UwNKsojmFZDusFG0jogU7ZmdTWGh4T3tXQodKxZoNcx0M
         jEJg==
X-Gm-Message-State: AOAM533ptWwcbs2f8RUW4qZQL+n4JuNTbHMHooYRKXtL5ev0Z+p4/BYo
        yANp8DOskeY/2aWs0bYzD6cb2w==
X-Google-Smtp-Source: ABdhPJz973dd9NFengBsgLpznb3kVDIH97oR/FBBHDWMYkQVfUGweDOcnZzz7l812eO2itwBV4p2Lg==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr22137267wrv.194.1615197091528;
        Mon, 08 Mar 2021 01:51:31 -0800 (PST)
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.googlemail.com with ESMTPSA id 12sm18187731wmw.43.2021.03.08.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:51:31 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] sparc: sparc64_defconfig: remove duplicate CONFIGs
Date:   Mon,  8 Mar 2021 09:51:26 +0000
Message-Id: <20210308095126.8514-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

After my patch there is CONFIG_ATA defined twice.
Remove the duplicate one.
Same problem for CONFIG_HAPPYMEAL, except I added as builtin for boot
test with NFS.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: a57cdeb369ef ("sparc: sparc64_defconfig: add necessary configs for qemu")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/sparc/configs/sparc64_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index 148f44b33890..12a4fb0bd52a 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -93,7 +93,7 @@ CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_MII=m
 CONFIG_SUNLANCE=m
-CONFIG_HAPPYMEAL=m
+CONFIG_HAPPYMEAL=y
 CONFIG_SUNGEM=m
 CONFIG_SUNVNET=m
 CONFIG_LDMVSW=m
@@ -234,9 +234,7 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRC16=m
 CONFIG_LIBCRC32C=m
 CONFIG_VCC=m
-CONFIG_ATA=y
 CONFIG_PATA_CMD64X=y
-CONFIG_HAPPYMEAL=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_DEVTMPFS=y
-- 
2.26.2

