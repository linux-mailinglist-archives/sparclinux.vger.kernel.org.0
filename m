Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6495D1CBFAE
	for <lists+sparclinux@lfdr.de>; Sat,  9 May 2020 11:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgEIJPI (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 9 May 2020 05:15:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4373 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbgEIJPH (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Sat, 9 May 2020 05:15:07 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 37D554A99A968E9739DD;
        Sat,  9 May 2020 17:15:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 17:14:59 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <davem@davemloft.net>
CC:     <sparclinux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>
Subject: [PATCH -next 0/2] sparc: use snprintf() in show() methods
Date:   Sat, 9 May 2020 17:18:47 +0800
Message-ID: <20200509091849.116954-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

snprintf() returns the number of bytes that would be written,
which may be greater than the the actual length to be written.
	    
show() methods should return the number of bytes printed into the
buffer. This is the return value of scnprintf().

Chen Zhou (2):
  sparc: use snprintf() in show_pciobppath_attr() in pci.c
  sparc: use snprintf() in show_pciobppath_attr() in vio.c

 arch/sparc/kernel/pci.c | 2 +-
 arch/sparc/kernel/vio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1

