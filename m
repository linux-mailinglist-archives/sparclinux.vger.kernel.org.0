Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF301EC6D8
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFCBi2 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:38:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50208 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726894AbgFCBi2 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+yn28OfcbjmmvkPF/t9r2pz/Lm+b+X9E6veY6D9oAI8=;
        b=Wozt4jMb4/W4iRuyEt4Pmr45lumxkoiqIyKqBghovisxS/aA5bTjvkXMng9ls74F072w+9
        ZurYeTlX8RI5Sui75oCx4Z0YJ5tq5Dly9z5A/zsJdocZkXeLshMaQ1SdeatTVncGDZE+J/
        Y2Kqc1KKWBBp/UT05Pr4svTzdjftkhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-EwhFAByUMfSwRMSHj-xyhg-1; Tue, 02 Jun 2020 21:38:25 -0400
X-MC-Unique: EwhFAByUMfSwRMSHj-xyhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3E6800053;
        Wed,  3 Jun 2020 01:38:23 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C3FA860F8D;
        Wed,  3 Jun 2020 01:38:22 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:38:21 -0700 (PDT)
Message-Id: <20200602.183821.1883934145641704299.davem@redhat.com>
To:     mattst88@gmail.com
Cc:     sparclinux@vger.kernel.org, aaro.koskinen@iki.fi
Subject: Re: [PATCH 3/5] silo: Fix misleading indentation
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200523202233.3063074-3-mattst88@gmail.com>
References: <20200523202233.3063074-1-mattst88@gmail.com>
        <20200523202233.3063074-3-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Matt Turner <mattst88@gmail.com>
Date: Sat, 23 May 2020 13:22:31 -0700

> Signed-off-by: Matt Turner <mattst88@gmail.com>

Applied.

