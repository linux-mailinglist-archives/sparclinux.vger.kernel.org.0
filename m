Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1912750A5
	for <lists+sparclinux@lfdr.de>; Wed, 23 Sep 2020 08:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgIWGGD (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 23 Sep 2020 02:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgIWGGC (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 23 Sep 2020 02:06:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C292C061755;
        Tue, 22 Sep 2020 23:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=tfXqHGtFwgmM6UcSRx58+EM7ODTSdMOtwKoRg1u1yAY=; b=uvDI5uJjUUyytfSIz9Fh9itDBb
        timhA1QL0/NVl3J6u5M2HW3nARnp+nrUU6+ecCci6CsZKmYqfYuR8gyHxpqyVNqrn3MdPeOsJJWvy
        950qhPb+/2DfbCQgKlhKDtU5vmvNF+PDbFkHMp1mkRP3rWH8u6qUenY44fQojX6Uqtm4THbw20WLL
        GWMBkRDZ1GR/JQbS9MCzRO2VxzTVrNvmchBhMbPURHpWCdmaGljvUGEu39WuHYi9z2ZiSxt+gaQQ+
        D4nj+9YtljE0KpYVnHjo1Gui3cPa2uMIL3iJJ7yzazD7tzFlk3mevDknnUo1gBGah7VrboHOaGe8J
        //9F2Zlw==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKxua-0003TG-5D; Wed, 23 Sep 2020 06:05:52 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        David Laight <David.Laight@aculab.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-aio@kvack.org, io-uring@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        netdev@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: [PATCH 1/9] compat.h: fix a spelling error in <linux/compat.h>
Date:   Wed, 23 Sep 2020 08:05:39 +0200
Message-Id: <20200923060547.16903-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923060547.16903-1-hch@lst.de>
References: <20200923060547.16903-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

There is no compat_sys_readv64v2 syscall, only a compat_sys_preadv64v2
one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index b354ce58966e2d..654c1ec36671a4 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -812,7 +812,7 @@ asmlinkage ssize_t compat_sys_pwritev2(compat_ulong_t fd,
 		const struct compat_iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high, rwf_t flags);
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64V2
-asmlinkage long  compat_sys_readv64v2(unsigned long fd,
+asmlinkage long  compat_sys_preadv64v2(unsigned long fd,
 		const struct compat_iovec __user *vec,
 		unsigned long vlen, loff_t pos, rwf_t flags);
 #endif
-- 
2.28.0

