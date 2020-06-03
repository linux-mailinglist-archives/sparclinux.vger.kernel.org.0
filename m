Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9E1EC6D7
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgFCBiZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:38:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41370 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726894AbgFCBiZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oeBZJ65n0A2NdKTkz+/lDpRL4BYo8Y6RW63JrEnd/2I=;
        b=ZKEvzKKz8btihwTVOLlr0HyjnZKNI+DnDE4cE6APcAi7YqCWzSl7II+ZvhifJXH8wodUgO
        7xbEyNYTv4wfkozX3ikJDtcNWuV1Lnld/Iy0i22pY6YvxfBkV2fhObO1lP2vK2OAU81bKt
        EHScVrKt/BHNNNqBueAr8wbdcSyMn7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-OmZ-Nog1Oe-0L3oWMoyw4g-1; Tue, 02 Jun 2020 21:38:20 -0400
X-MC-Unique: OmZ-Nog1Oe-0L3oWMoyw4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278EB461;
        Wed,  3 Jun 2020 01:38:19 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09FC81BCBE;
        Wed,  3 Jun 2020 01:38:17 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:38:16 -0700 (PDT)
Message-Id: <20200602.183816.25711110268130552.davem@redhat.com>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCH 2/5] silo: Build with -U_FORTIFY_SOURCE
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200523202233.3063074-2-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
        <20200523202233.3063074-2-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Sat, 23 May 2020 13:22:30 -0700

> Otherwise the build will fail:
> 
> | ld: decompnet.o: in function `error':
> | decomp.c:(.text+0x4dc): undefined reference to `__longjmp_chk'
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied.

