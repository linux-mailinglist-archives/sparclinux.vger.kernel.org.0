Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5453E4156E2
	for <lists+sparclinux@lfdr.de>; Thu, 23 Sep 2021 05:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239722AbhIWDo3 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 22 Sep 2021 23:44:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239467AbhIWDmP (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 22 Sep 2021 23:42:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B30C561373;
        Thu, 23 Sep 2021 03:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368413;
        bh=THXQOpyiCBG0lmMlyE/NXcty+U4u7ME3T/dh2T+KQ4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aXPrYbTB5RTpXWoocAiGUCP5wwqIew9/19O8ACBMFxqLjWbjmWUX16D14E9WnZ1Qv
         tI+effzTErX/KVX5RNGcq4n7nU8U2bpJa8cmvlJCG/1bsfo/1kSaNsE4rbDau1h3ch
         Qfo/mKknpB62kUUE0CZyetQZaLY7CLIqYY2lcejvuDdEJQ4m8Z/uiS0RCu8sQRwNvU
         ydLT/Nn1pe3Vv1eiHC+skDCTufxESuxkFCiOTCYqolHFzshM7ul+Lf3KyAYwr3Je4y
         57kIVBL6gkOOGH5NpPb/GeTbeYjWJa8nPSpSCeZ6NtebAZ4alQjxlmCToBZtdGBeCG
         gYLRK5+IhgLqw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, sparclinux@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 07/13] sparc: avoid stringop-overread errors
Date:   Wed, 22 Sep 2021 23:39:53 -0400
Message-Id: <20210923033959.1421662-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923033959.1421662-1-sashal@kernel.org>
References: <20210923033959.1421662-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit fc7c028dcdbfe981bca75d2a7b95f363eb691ef3 ]

The sparc mdesc code does pointer games with 'struct mdesc_hdr', but
didn't describe to the compiler how that header is then followed by the
data that the header describes.

As a result, gcc is now unhappy since it does stricter pointer range
tracking, and doesn't understand about how these things work.  This
results in various errors like:

    arch/sparc/kernel/mdesc.c: In function ‘mdesc_node_by_name’:
    arch/sparc/kernel/mdesc.c:647:22: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
      647 |                 if (!strcmp(names + ep[ret].name_offset, name))
          |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which are easily avoided by just describing 'struct mdesc_hdr' better,
and making the node_block() helper function look into that unsized
data[] that follows the header.

This makes the sparc64 build happy again at least for my cross-compiler
version (gcc version 11.2.1).

Link: https://lore.kernel.org/lkml/CAHk-=wi4NW3NC0xWykkw=6LnjQD6D_rtRtxY9g8gQAJXtQMi8A@mail.gmail.com/
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/sparc/kernel/mdesc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
index 8f24f3d60b8c..bfc30439a41d 100644
--- a/arch/sparc/kernel/mdesc.c
+++ b/arch/sparc/kernel/mdesc.c
@@ -38,6 +38,7 @@ struct mdesc_hdr {
 	u32	node_sz; /* node block size */
 	u32	name_sz; /* name block size */
 	u32	data_sz; /* data block size */
+	char	data[];
 } __attribute__((aligned(16)));
 
 struct mdesc_elem {
@@ -611,7 +612,7 @@ EXPORT_SYMBOL(mdesc_get_node_info);
 
 static struct mdesc_elem *node_block(struct mdesc_hdr *mdesc)
 {
-	return (struct mdesc_elem *) (mdesc + 1);
+	return (struct mdesc_elem *) mdesc->data;
 }
 
 static void *name_block(struct mdesc_hdr *mdesc)
-- 
2.30.2

