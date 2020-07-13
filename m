Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3453218D39
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jul 2020 18:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbgGHQke (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 8 Jul 2020 12:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730736AbgGHQkd (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 8 Jul 2020 12:40:33 -0400
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FC932078D;
        Wed,  8 Jul 2020 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594226432;
        bh=rE+uvyPJsx8rFIs6khWUJUiQ/J5nt2exnTaDySam3F4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2AdOv2ojkr5ZbL0vrz8iP22badDVJXNqokKsVwP6sOfodzMgiWpzAoAlmr5rO5RZm
         Prmrsra9KPKdnKtIEc726U5NOchmXKi17+4uSRRoXnAfJcKiU0pEJF50TLhG1xgFJd
         GYqnMHph6bl0BxWv6K4yr1q0HIsXrYa5cFF0t1b8=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        sparclinux@vger.kernel.org, linux-efi@vger.kernel.org,
        mptcp@lists.01.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v2 2/5] crypto: lib/sha256 - add sha256() function
Date:   Wed,  8 Jul 2020 09:39:40 -0700
Message-Id: <20200708163943.52071-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708163943.52071-1-ebiggers@kernel.org>
References: <20200708163943.52071-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Add a function sha256() which computes a SHA-256 digest in one step,
combining sha256_init() + sha256_update() + sha256_final().

This is similar to how we also have blake2s().

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha.h |  1 +
 lib/crypto/sha256.c  | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/crypto/sha.h b/include/crypto/sha.h
index 10753ff71d46..4ff3da816630 100644
--- a/include/crypto/sha.h
+++ b/include/crypto/sha.h
@@ -147,6 +147,7 @@ static inline void sha256_init(struct sha256_state *sctx)
 }
 void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len);
 void sha256_final(struct sha256_state *sctx, u8 *out);
+void sha256(const u8 *data, unsigned int len, u8 *out);
 
 static inline void sha224_init(struct sha256_state *sctx)
 {
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 2e621697c5c3..2321f6cb322f 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -280,4 +280,14 @@ void sha224_final(struct sha256_state *sctx, u8 *out)
 }
 EXPORT_SYMBOL(sha224_final);
 
+void sha256(const u8 *data, unsigned int len, u8 *out)
+{
+	struct sha256_state sctx;
+
+	sha256_init(&sctx);
+	sha256_update(&sctx, data, len);
+	sha256_final(&sctx, out);
+}
+EXPORT_SYMBOL(sha256);
+
 MODULE_LICENSE("GPL");
-- 
2.27.0

