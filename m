Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37EF3781BC4
	for <lists+sparclinux@lfdr.de>; Sun, 20 Aug 2023 02:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjHTAd3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 19 Aug 2023 20:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjHTAdE (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 19 Aug 2023 20:33:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3F588CE3;
        Sat, 19 Aug 2023 16:34:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20EFC61A5C;
        Sat, 19 Aug 2023 23:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F61C433C8;
        Sat, 19 Aug 2023 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692488039;
        bh=4VzbJWu0rbStCIefyliBH7r4pYxLYwp8vFj3ogFCqcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KoJAUpaFKjfbZ6eNv6DQ0iZJIAn6zSR6nTmV3EFVcSvnG4u/dzDrcD0G8Y1nlqY8U
         aqAfxOwkm4hTJLasNPlEB6Cr/Gz23fxUSbmNvaRyYruedN9obQ1opM3AZe3JAnF7Af
         PfNfDdixHTO0ID0wR7UTFOzjousXzkSLNITMZ3Pw97QDpoem3PdB2B7STm39Ewz/Mx
         6B1jL0ADsgJppaIRhQO/24TkRDvK2lhhK6IWtNbjv69LwImZvjrhvxGFUHLYsiHhaq
         pZfngiVWeTa5Uh02dG6QnUTJF5S7UWGy5tHdPZAWaFnms1s2Y7QzvBdzDAoU0zkqu2
         ULn7K5wJ0f9Xw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-arch@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [PATCH 2/6] sparc: remove <asm/export.h>
Date:   Sun, 20 Aug 2023 08:33:49 +0900
Message-Id: <20230819233353.3683813-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819233353.3683813-1-masahiroy@kernel.org>
References: <20230819233353.3683813-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

All *.S files under arch/sparc/ have been converted to include
<linux/export.h> instead of <asm/export.h>.

Remove <asm/export.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sparc/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 595ca0be286b..43b0ae4c2c21 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -2,6 +2,5 @@
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generic-y += agp.h
-generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
-- 
2.39.2

