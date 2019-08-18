Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E994F91546
	for <lists+sparclinux@lfdr.de>; Sun, 18 Aug 2019 09:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfHRHBl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 18 Aug 2019 03:01:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55624 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfHRHBl (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 18 Aug 2019 03:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2Dbz5bVEZANvQjWNCvygQmXIwCLAbRJz/V/RyPf8jpM=; b=CUeMDMkEl9OfUOascO3eGZcwK
        lujWSSpt7Wj2DuCI/I/mjMil6oXUO5cBxHS5dQPQferHQtvmme/x28ssFEGuPG+wBhY/pAvQdCL/Q
        bUnyN/WvXSwMtz/gzQt/YDVXUg47SxLQbQH4bnptQ8xsdC7bHODxdvaDAdr6OzaadVjytzcopltwZ
        2s3ps05JCd8O13qBnVz+PSDAJIqB2DJmEn/Jy2e+PMlGcdr+czTo8BMTKu+MHacO6gIh6ORWq8ofY
        tArk+kATQdgoL7JNCs5F/qIMPRisBAfYvPM53T2iXitsKcMXhNFR2swBXHPTL1hgtEyV4CgALkqeV
        Z0z821tlw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hzFC6-0007Da-5F; Sun, 18 Aug 2019 07:01:38 +0000
Date:   Sun, 18 Aug 2019 00:01:37 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Meelis Roos <mroos@linux.ee>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dave Miller <davem@davemloft.net>
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
Message-ID: <20190818070137.GA22731@infradead.org>
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I think for now we'll simply have to disable HAVE_FAST_GUP for sparc,
until someone who really knows low-level sparc page table handling
finds some time to audit the generic fast gup code and arch hooks.
