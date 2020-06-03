Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF291EC6D6
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgFCBiV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:38:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58024 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726894AbgFCBiU (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/AXwuPFLPMP81l/fChq18UohRplVeYyoNlEDweetqZQ=;
        b=NOkYzEJ+i9/MXcFF9eN6GRbKKy/oq4vMJcza/E2MoIoMbMPbPGmTwSxl8mb/eD6rnXLqeu
        Y9uWAU3XLFGGM6lEUVZ2A4jt/qE2XP3vvEV6ArWIs6PQ5eD/lL6LMAqfpS/6wj2Q8e5jIr
        4MPUwY5QIv2xc6fRpKcFmYHEN+gcrFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-HrdnzEmgMJe4YiNpyz9uzQ-1; Tue, 02 Jun 2020 21:38:15 -0400
X-MC-Unique: HrdnzEmgMJe4YiNpyz9uzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37AF8800053;
        Wed,  3 Jun 2020 01:38:14 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CB4A5C583;
        Wed,  3 Jun 2020 01:38:12 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:38:11 -0700 (PDT)
Message-Id: <20200602.183811.2280702224470805284.davem@redhat.com>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCH 1/5] silo: Build with -fno-PIC to reduce size
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200523202233.3063074-1-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Sat, 23 May 2020 13:22:29 -0700

> Otherwise the resulting image will be too large:
> 
> | ./util second.map second.aout second2.aout second.b second.b2
> | Distance between two changes larger than 63K 3 84553 0
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied.

