Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1F2859C5
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 09:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgJGHpA (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 03:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbgJGHo7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 03:44:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37218C0613D2;
        Wed,  7 Oct 2020 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=8PDPxZGFdTlulh1Dc8hG8EbgqFx7l+HkH+132R7/yDM=; b=MoUq/23hamxspjKlJ/gC6SgERo
        1mwjL5MDyzmaKSpQt74JuBbaBk39DXMRo2zTiWqh8krhv9oCG2qa53Tm5umvTZ5p14U3TOl9y+/Y0
        Ph+i9HSzJSLoQ/omuVPuZ7vjGKzapMydxMhJQRSzj4QxtgaOHaR4s35+bG+ZtPrrHqRU+MWZlKPmh
        b4eCbe5kxjEdH3+8MysJNJxlt1DSlEP9UqBHcOvvIpKb0z7tZnLZo+0YN41BeMC7PXdO/DvlHkoSh
        6+5QMsgSpr3zGXgJA7OT4plB3qqjg8B5RGPDjTQEaocNV1I/lfh/XMA+1u8N+vetunxYQnoTmJvFR
        dTXY5JSQ==;
Received: from [2001:4bb8:184:92a2:f749:31f9:6664:a99d] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQ481-00032q-OI; Wed, 07 Oct 2020 07:44:50 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: fbdev sbuslib cleanups
Date:   Wed,  7 Oct 2020 09:44:44 +0200
Message-Id: <20201007074447.797968-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi all,

this series cleans up the fbdev sbuslib support, most importantly by
removing usage of the deprecated compat_alloc_user_space API.
