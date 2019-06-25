Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0B055220
	for <lists+sparclinux@lfdr.de>; Tue, 25 Jun 2019 16:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731148AbfFYOhq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 25 Jun 2019 10:37:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52512 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730701AbfFYOhp (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 25 Jun 2019 10:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=f4+tMQltbicxd4ALT4Rx3OQZpZ5MP+Ju7Cl4XLKLtrM=; b=X5F7mPiW6V3GpB2Dzy0uuiLcr
        Q1nr0Z/bXKkYgiYtfSjd+rSbKATjF3Gdgd0mN3/vYrEMO/Wc/SRIgcRhLlvYadt94BdYFq6jdw/nP
        AwhtIbzcbLCYlOTHif1Um8TqdW1pmhZSHImvIPJZMwHU/da3RXnjCfqDaWAe3BVBdltBFNznvQFOb
        sRb3NYKvhSFrwhB734qJDCQWStHZJ257YIrBp8b33Xces5frH9sCRfyV0D74Bszew9YprhF9rXvKm
        VWnBYQKDFqJSt5VR8xllP4qXZjXg2ARWfiP1d9zuj7aazxYYWmVgGyU3SQUIS3Xwx2oVWJEAJo7C7
        SL9QNydbA==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfmZR-0007x9-Ll; Tue, 25 Jun 2019 14:37:18 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: switch the remaining architectures to use generic GUP v4
Date:   Tue, 25 Jun 2019 16:36:59 +0200
Message-Id: <20190625143715.1689-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Linus and maintainers,

below is a series to switch mips, sh and sparc64 to use the generic
GUP code so that we only have one codebase to touch for further
improvements to this code.  I don't have hardware for any of these
architectures, and generally no clue about their page table
management, so handle with care.

Changes since v3:
 - improve a few commit messages
 - clean up gup_fast_permitted a bit more
 - split the code reordering in gup.c into a separate patch
 - drop the patch to pass argument in a structure for now

Changes since v2:
 - rebase to mainline to pick up the untagged_addr definition
 - fix the gup range check to be start <= end to catch the 0 length case
 - use pfn based version for the missing pud_page/pgd_page definitions
 - fix a wrong check in the sparc64 version of pte_access_permitted

Changes since v1:
 - fix various issues found by the build bot
 - cherry pick and use the untagged_addr helper form Andrey
 - add various refactoring patches to share more code over architectures
 - move the powerpc hugepd code to mm/gup.c and sync it with the generic
   hup semantics
