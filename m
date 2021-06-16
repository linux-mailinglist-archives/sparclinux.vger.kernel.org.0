Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829BC3A9801
	for <lists+sparclinux@lfdr.de>; Wed, 16 Jun 2021 12:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhFPKrr (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 16 Jun 2021 06:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhFPKrq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 16 Jun 2021 06:47:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657E8C061574
        for <sparclinux@vger.kernel.org>; Wed, 16 Jun 2021 03:45:40 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id x19so920456pln.2
        for <sparclinux@vger.kernel.org>; Wed, 16 Jun 2021 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cL0z04MoIuU3DhnpT7qPDYno1SAi/d+kJd/UfCfTcBY=;
        b=X1z8dwdPBmZ76un8PJTAfhmu4ZREVCwyktEuYAcMNrZ3hqQBfnbsF+MYNoX21K6odw
         jj3CxW/4W9TKr/vhaEZpuojvQWPEEnImoVjhH2261T4hQoCPTGKg5N1f6F0RU/qos9OZ
         wooAmVj5gYYfys+BZ+wR6m5F8T5RE9UzJZ1t3uDOauG6aNNSCUaGTpWtmkGlMTLhl8cJ
         /g8zyY+jx+3XY/Bp/aPjmEg2v/FfJr2+4FcPGpZxFamqwp6n9f0Y52QiiiofQyKXDcEL
         URGgnyEO0/rLbS0ovlEeQMCmPhI1uH56kCbBnK55k1+jyLEmjJWQCOe16RyboAiAka1b
         0/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cL0z04MoIuU3DhnpT7qPDYno1SAi/d+kJd/UfCfTcBY=;
        b=icr2gRIRB8DiSe+g6Yj1PjHZ9ykKy3+GU6EoljbepfHIsQgwQXx4uL9yPVDSJikvsm
         Z/sJAdqAqpnFpdU3wd1Y/QBRaC0GMXEidNsiyoSZLLRsHr9rvC2Ea4yUaFEAvJg9Pftn
         9BEqncg+I+F+vjY0sC5pa8pW/45Fsi1XENMVeIVtmJdbRssqV6qA3JOUayhTIpLqR8LS
         ja4AzbXqTz3zrlNvedQGzrMY8zBKHD2mnz8kIz/6j6Ag12CPl6bHSJtPQCZkNTCQaP0X
         KF0wEdmOfN+x6BCPty8TZomoHN0krI3MbBkw2PN4UIQJVkviCbctTLOvCZ1m3XunmoAy
         wi+A==
X-Gm-Message-State: AOAM531ozF8wGIXb7OQ8JkPytqc66pfhxZKt5zfx2n9NROR2VxX1hbpR
        ypUitUNB2iWwNzd1kmlaaX8=
X-Google-Smtp-Source: ABdhPJwpNJhMjjs+QHN/g+7LWAMQTpzscUv8f2y7+zDM2xbihSlErjNH5QII/ruaqLcJ4CjFddXamw==
X-Received: by 2002:a17:90a:d598:: with SMTP id v24mr4133734pju.185.1623840339996;
        Wed, 16 Jun 2021 03:45:39 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
        by smtp.gmail.com with ESMTPSA id d22sm1937614pgb.15.2021.06.16.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 03:45:39 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org
Subject: [PATCH 0/2] couple of sparc 32 mm fixes
Date:   Wed, 16 Jun 2021 20:45:32 +1000
Message-Id: <20210616104534.1614087-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I was able to test patch 2 in SMP qemu and verify there were cases
where a cpu's active_mm does not have that CPU set in the mm_cpumask
before the patch, and do not observe it afterwards.

I haven't observed any actual corruption from the bugs, but I didn't
stress it much, and only what qemu can do.

Thanks,
Nick

Nicholas Piggin (2):
  sparc32: remove mm_cpumask clearing to fix kthread_use_mm race
  sparc32: fix mm_cpumask maintenance causing missing TLB flushing

 arch/sparc/include/asm/switch_to_32.h | 1 -
 arch/sparc/mm/srmmu.c                 | 9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.23.0

