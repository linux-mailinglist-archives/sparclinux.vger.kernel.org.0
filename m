Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDE3218D3A
	for <lists+sparclinux@lfdr.de>; Wed,  8 Jul 2020 18:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbgGHQkf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 8 Jul 2020 12:40:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730730AbgGHQkc (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 8 Jul 2020 12:40:32 -0400
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E850E207F9;
        Wed,  8 Jul 2020 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594226432;
        bh=sUpB5f7/2tTS/Pxep7GYcTBxGpCFVx12p8NvO3zEd2g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VlSikpcU/re8GREdmigMjUF1bRuINgkNxcQVGBsaJ4cG8oLVQ7R6YIW3/Bx4yK8by
         C1AlgMUKQdhYiv5pjiEyVVQP/ghcfV31ULqPmdzxTvMAj8JGpiHTRrnnO5f7J7t+Q2
         qjl4d2Jwr5WOSgtm7dFPc0ElIQXOnRpk/SNUrG/o=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     sparclinux@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/5] crypto: sparc - rename sha256 to sha256_alg
Date:   Wed,  8 Jul 2020 09:39:39 -0700
Message-Id: <20200708163943.52071-2-ebiggers@kernel.org>
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

To avoid a naming collision when we add a sha256() library function,
rename the "sha256" static variable in sha256_glue.c to "sha256_alg".
For consistency, also rename "sha224" to "sha224_alg".

Reported-by: kernel test robot <lkp@intel.com>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/crypto/sha256_glue.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
index 286bc8ecf15b..ca2547df9652 100644
--- a/arch/sparc/crypto/sha256_glue.c
+++ b/arch/sparc/crypto/sha256_glue.c
@@ -156,7 +156,7 @@ static int sha256_sparc64_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
-static struct shash_alg sha256 = {
+static struct shash_alg sha256_alg = {
 	.digestsize	=	SHA256_DIGEST_SIZE,
 	.init		=	sha256_sparc64_init,
 	.update		=	sha256_sparc64_update,
@@ -174,7 +174,7 @@ static struct shash_alg sha256 = {
 	}
 };
 
-static struct shash_alg sha224 = {
+static struct shash_alg sha224_alg = {
 	.digestsize	=	SHA224_DIGEST_SIZE,
 	.init		=	sha224_sparc64_init,
 	.update		=	sha256_sparc64_update,
@@ -206,13 +206,13 @@ static bool __init sparc64_has_sha256_opcode(void)
 static int __init sha256_sparc64_mod_init(void)
 {
 	if (sparc64_has_sha256_opcode()) {
-		int ret = crypto_register_shash(&sha224);
+		int ret = crypto_register_shash(&sha224_alg);
 		if (ret < 0)
 			return ret;
 
-		ret = crypto_register_shash(&sha256);
+		ret = crypto_register_shash(&sha256_alg);
 		if (ret < 0) {
-			crypto_unregister_shash(&sha224);
+			crypto_unregister_shash(&sha224_alg);
 			return ret;
 		}
 
@@ -225,8 +225,8 @@ static int __init sha256_sparc64_mod_init(void)
 
 static void __exit sha256_sparc64_mod_fini(void)
 {
-	crypto_unregister_shash(&sha224);
-	crypto_unregister_shash(&sha256);
+	crypto_unregister_shash(&sha224_alg);
+	crypto_unregister_shash(&sha256_alg);
 }
 
 module_init(sha256_sparc64_mod_init);
-- 
2.27.0

