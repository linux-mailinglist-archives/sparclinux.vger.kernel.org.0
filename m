Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08B729344A
	for <lists+sparclinux@lfdr.de>; Tue, 20 Oct 2020 07:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391632AbgJTFdj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 20 Oct 2020 01:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbgJTFdj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 20 Oct 2020 01:33:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08D9C0613CE
        for <sparclinux@vger.kernel.org>; Mon, 19 Oct 2020 22:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nCa9o5VjiCJgNOkmNLaWCX+FLMqiMx339DNspLn0DNM=; b=S+Q0/85fjknIaiWZqHDxBbIMZi
        pP3Gtbzod6Pdq+mAVbSFHVYTEzpg6W1JqoqAycsHq9XhtCzGztNlK6Vs3YQd5q6Ba7D0niXlmrSXD
        Rn3Fr03o3CF2F91ZpaGpGa71IbrEf3VBkXkQfo1+WU14YekE/S2RwFv9z9+7Eg+WUfQP/0VpRvxn8
        enlappVFBWQenoBVZn+rWVlk9YUMNPu0B9GppCqw7q0lrZkApRwfWpbaRr1uW7xg4m9Zs5lbBPS45
        juXjT0VjI0WACTtBPu2i2RjZTsTu17rCqnjrZp7dB2Hg6pOyySj4nksBRT1zHUj1rj803qNMfdSe2
        Gn/ugqQw==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kUkH6-0005Jl-85; Tue, 20 Oct 2020 05:33:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH] sparc: make xchg() into a statement expression
Date:   Mon, 19 Oct 2020 22:33:28 -0700
Message-Id: <20201020053328.17332-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Fix several of the same warning by using a GCC statement expression
(extension):

../arch/sparc/include/asm/cmpxchg_32.h:28:22: warning: value computed is not used [-Wunused-value]
   28 | #define xchg(ptr,x) ((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))

Passes sparc32 allmodconfig with no xchg warnings.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
This is similar to a patch from Arnd for m68k:
  https://lore.kernel.org/linux-m68k/20201008123429.1133896-1-arnd@arndb.de/

 arch/sparc/include/asm/cmpxchg_32.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20201009.orig/arch/sparc/include/asm/cmpxchg_32.h
+++ linux-next-20201009/arch/sparc/include/asm/cmpxchg_32.h
@@ -25,7 +25,7 @@ static inline unsigned long __xchg(unsig
 	return x;
 }
 
-#define xchg(ptr,x) ((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
+#define xchg(ptr,x) ({(__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr)));})
 
 /* Emulate cmpxchg() the same way we emulate atomics,
  * by hashing the object address and indexing into an array
