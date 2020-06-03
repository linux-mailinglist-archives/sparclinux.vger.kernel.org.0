Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27731EC6E9
	for <lists+sparclinux@lfdr.de>; Wed,  3 Jun 2020 03:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFCBqQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Jun 2020 21:46:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23980 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727921AbgFCBqQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 2 Jun 2020 21:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591148775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c2MAXgliaplJ68nQU8H/dBTpmxbn3DqQ8QfGl6JNyrU=;
        b=U3MGenICjdqf8t+hS3WB9Y5/3hjHVRU87LyLJegOggfkcuHxKTd9r6YTAlSACSyLqLLCbh
        fP3pOsHVFFM/tcxGs8qbanlvXq60Xa2IdHnSwGz4ffik+i1f6Ilf0BYCghQ4BmlppUvtUE
        3NwdTk5ueRpCot2ZvwgAsaSTbq4pNaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-mcGd2caDOxmIAJbXRh-kxw-1; Tue, 02 Jun 2020 21:46:13 -0400
X-MC-Unique: mcGd2caDOxmIAJbXRh-kxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3192800053;
        Wed,  3 Jun 2020 01:46:11 +0000 (UTC)
Received: from localhost (unknown [10.10.110.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A6E2360BEC;
        Wed,  3 Jun 2020 01:46:09 +0000 (UTC)
Date:   Tue, 02 Jun 2020 18:46:08 -0700 (PDT)
Message-Id: <20200602.184608.797176631158669285.davem@redhat.com>
To:     will@kernel.org
Cc:     linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        peterz@infradead.org, linux@roeck-us.net, rppt@kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 0/3] sparc32 SRMMU fixes for SMP
From:   David Miller <davem@redhat.com>
In-Reply-To: <20200526173302.377-1-will@kernel.org>
References: <20200526173302.377-1-will@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Will Deacon <will@kernel.org>
Date: Tue, 26 May 2020 18:32:59 +0100

> Hi folks,
> 
> Enabling SMP for sparc32 uncovered some issues in the SRMMU page-table
> allocation code. One of these was introduced by me, but the other two
> seem to have been there a while and are probably just exposed more
> easily by my recent changes.
> 
> Tested on QEMU. I'm assuming these will go via David's tree.

Series applied, thanks Will.

