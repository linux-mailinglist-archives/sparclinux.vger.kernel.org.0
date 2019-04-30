Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35365F9C0
	for <lists+sparclinux@lfdr.de>; Tue, 30 Apr 2019 15:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfD3NR0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 30 Apr 2019 09:17:26 -0400
Received: from verein.lst.de ([213.95.11.211]:46380 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbfD3NRZ (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 30 Apr 2019 09:17:25 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 1FDCE67358; Tue, 30 Apr 2019 15:17:09 +0200 (CEST)
Date:   Tue, 30 Apr 2019 15:17:08 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Guenter Roeck <linux@roeck-us.net>, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: fix SG list handling in the sparc32 iommu driver
Message-ID: <20190430131708.GA23346@lst.de>
References: <20190416182347.18441-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416182347.18441-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Dave,

can you pick this series up?
