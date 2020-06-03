Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15651EC6DA
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgFCBir (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:38:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40800 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726894AbgFCBiq (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wo053C1uhXiqsYTBdDydhgxbaDMOd4O3V98k+j+hKmk=;
        b=UYT9Lc293wA/w0SSqPQPA76qNBeEXLJwCE8zmraDfozvLUr5H0rMFMNT18RGafFw8mWcoB
        5L8LwfVrIorjWVAI4gbZG/OCcfmBAjJmrqCFE5VM+7kwwMyIVAGvAJowj2SGHqtygc97/Z
        S0dBKx+TMwTQbckA7x0reSDELKcRuxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-aAQvV7JsNp66ZkMC6UPzXg-1; Tue, 02 Jun 2020 21:38:38 -0400
X-MC-Unique: aAQvV7JsNp66ZkMC6UPzXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4EF801503;
        Wed,  3 Jun 2020 01:38:37 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F7B760BEC;
        Wed,  3 Jun 2020 01:38:36 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:38:35 -0700 (PDT)
Message-Id: <20200602.183835.499993471598886452.davem@redhat.com>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCH 5/5] second/util: Remove unused shadowed variables
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200523202233.3063074-5-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
        <20200523202233.3063074-5-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Sat, 23 May 2020 13:22:33 -0700

> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied.

