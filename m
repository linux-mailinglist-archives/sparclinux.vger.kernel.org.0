Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9349E91C40
	for <lists+sparclinux@lfdr.de>; Mon, 19 Aug 2019 07:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfHSFK7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 19 Aug 2019 01:10:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49656 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfHSFK7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 19 Aug 2019 01:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0bULyuWTYGVbzFWHTq7CJrPWX1kQ4+AdpFah5RaKvCg=; b=fTQnQKjyig7PdtJPrgZuzY5ed
        MRYbFCQ5HDkJBJpgx0h2sJHq5txn6D0Hj8oljp9akcEvxwze47eJzxF/+hqFU3S7U8eI7+F0jzilx
        P7/fMCx2O5pCHGT4j76ZHuKPjV9YeP6YAEspmHCRswlu4NcLZna1UxW6ILCmFZ0l9PIiL+gV6or4K
        ou+zT3JEsB1QAD1ZQ0G3tzu5/XgTjq99ldKfSw02fgobQxi0K07B2oX2p5ZlbJW8hZA15GrntiVGA
        xAv4KgvaQd5tgIO7qI5KZe9TJRnTvp73Z9JQd5z4h2W634x6l3JbtzyDmVais8lHQT6XVAHLSKP7B
        wPOMUS90w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hzZwV-0001Cz-42; Mon, 19 Aug 2019 05:10:55 +0000
Date:   Sun, 18 Aug 2019 22:10:55 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     David Miller <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     hch@infradead.org, mroos@linux.ee, sparclinux@vger.kernel.org
Subject: Re: sparc64: hang from BUG: Bad page state, on older CPU & compiler
Message-ID: <20190819051055.GA32118@infradead.org>
References: <d2a51bfb-84e4-3ce7-ac48-7200b3a8d722@linux.ee>
 <20190818070137.GA22731@infradead.org>
 <20190818.123943.1491620523133670968.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818.123943.1491620523133670968.davem@davemloft.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, Aug 18, 2019 at 12:39:43PM -0700, David Miller wrote:
> From: Christoph Hellwig <hch@infradead.org>
> Date: Sun, 18 Aug 2019 00:01:37 -0700
> 
> > I think for now we'll simply have to disable HAVE_FAST_GUP for sparc,
> > until someone who really knows low-level sparc page table handling
> > finds some time to audit the generic fast gup code and arch hooks.
> 
> It's a regression, we don't disable features in those circumstances
> usually right?

Well, it isn't exactly a feature we lost, but an optimization that makes
operations go faster vs not allowing them.  Them other option would be
to revert the whole stack of patches, which is the groundwork for
fixing the get_user_pages vs truncate and co races, so I'm not very
eager to do that for sparc64.

But in the end Linus will have to decice.
