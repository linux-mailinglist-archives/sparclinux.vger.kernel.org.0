Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB41EC6D9
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgFCBig (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:38:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55223 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726894AbgFCBif (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RkQEoUrk48nEAPyxTcrsxp91BbjkEvOwu97PLv19cTI=;
        b=D1DAAiVvCbj3aev3qdp5BG/VX/s6OUu0A8zL2gXIRvA8cqoLmJQ4yNqXPENwJoTk+UNSf6
        sjiJpdynbqa/9zF9qCFdHDNzpLWtYmiPxgIvRFPq+Ct2TSMx2EjmlyqMDfTXTUTEsg3xw8
        TwCk0B5RLPCToXm+R5L7z9DB0jaAri8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-ZPHQVyW0M0CU9cP_r0eIYQ-1; Tue, 02 Jun 2020 21:38:32 -0400
X-MC-Unique: ZPHQVyW0M0CU9cP_r0eIYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E301800053;
        Wed,  3 Jun 2020 01:38:31 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F4FE78EFB;
        Wed,  3 Jun 2020 01:38:30 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:38:29 -0700 (PDT)
Message-Id: <20200602.183829.1942625976276786676.davem@redhat.com>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCHv2 4/5] second: Fix typo'd operator
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200523202650.3063421-1-mattst88@gmail.com>
References: <20200523202233.3063074-4-mattst88@gmail.com>
        <20200523202650.3063421-1-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Sat, 23 May 2020 13:26:50 -0700

> Note that this does change the behavior of the code. After the patch
> only < 2.6 PROMs will fail (which is probably correct), instead of every
> 2.* like now.
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied.

