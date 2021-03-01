Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A505328300
	for <lists+sparclinux@lfdr.de>; Mon,  1 Mar 2021 17:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbhCAQFt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 1 Mar 2021 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbhCAQE0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 1 Mar 2021 11:04:26 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465FEC061756
        for <sparclinux@vger.kernel.org>; Mon,  1 Mar 2021 08:03:29 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 133so17453987ybd.5
        for <sparclinux@vger.kernel.org>; Mon, 01 Mar 2021 08:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pvSSnynmcS3I2aYuBY6W9v+UnSVfL9yBap251Opttns=;
        b=gMeZMkqDeWCPEGevPgPu6xzvpOeABbl+EXifXeh/N18Ybv+dacp/zQjNhw+uIOwA/u
         5b9il6lsaGoIsDnPG3ZrVP7PsBqBBvja/JfrFkfQUnKs+GYvqXGSETskXZY7XL7Zne/n
         OwKt9WvbQZd0i3jCydeJL79mmYpheoGKpfTjDGm0otRIg1FXhv8UoMc0cVHu+kNN6ABV
         xUimYLpM/gJiGCh3fyozII8jNdzGmtLzAvwiS9dSXXpePkmQG2yfRJL70WwkN1v4egHL
         MjzW1/hmSVPlJCvqEKLl65ni0NqlZVjM1HxyCtvhpdTB0xhFmaHEXfPSl4suk7CvEAr7
         YoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pvSSnynmcS3I2aYuBY6W9v+UnSVfL9yBap251Opttns=;
        b=Uy/8m8mbcdmnCIJR8/9kReE2YbH5BWQquGhSczymcfC2hZJCMX5FXsZKN1QJwwRSuk
         VeYwmn9xvplIqok2eGGojUKnkuy+qj3wQtuqH56UuVmqtpqqUqy67riOV+xwM2wyiXg8
         gdORKhzemmvMdHhpyQA7a7GaKvZNs93ic3wfIP9rwNpQsIdXFPay1JsCJBN1lUZiQIa1
         AyoxRh4uxoiP6L8QkHvM9zpUg0ffsxN3KkSerswXUQnW/RRG41H6w9geCN5QGAnz8reY
         Xed63k+PnyXuAlCbQ1cpwaWRYRRRFQkCTCg87li1mAv5OgyZHCCfUnO6MZRZSnUXQ19a
         CcCw==
X-Gm-Message-State: AOAM533NmOkosEXfCOezb8dHY+s8gWn7oXXnDnsvsvLwZCySx1X3bBQV
        pw2NJLziwEku1pX+F18tYGNWt3FaVcdJaIes1gfBX+FB8MH/DA==
X-Google-Smtp-Source: ABdhPJxQpNCjc75/CUnBIWof+9X4Mlxwl0eu4BnF+f6ymu0IBkIAp2ySCOJe5eKfdqXkUQehwyUiFixHnT7uX2mAzLs=
X-Received: by 2002:a5b:ac2:: with SMTP id a2mr23755775ybr.81.1614614608650;
 Mon, 01 Mar 2021 08:03:28 -0800 (PST)
MIME-Version: 1.0
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
In-Reply-To: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Mon, 1 Mar 2021 19:03:18 +0300
Message-ID: <CADxRZqw2yFxEh0ZB-LgJrwBwG0Rxd5ocwDafK1yi5hDEGNC75g@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault loads
To:     Rob Gardner <rob.gardner@oracle.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
>
> is_no_fault_exception() has two bugs which were discovered via random
> opcode testing with stress-ng. Both are caused by improper filtering
> of opcodes.

fixes the issue for me. thanks again

Tested-by: Anatoly Pugachev <matorola@gmail.com>
