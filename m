Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06D7707D86
	for <lists+sparclinux@lfdr.de>; Thu, 18 May 2023 12:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjERKHt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 18 May 2023 06:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjERKHs (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 18 May 2023 06:07:48 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FC81716
        for <sparclinux@vger.kernel.org>; Thu, 18 May 2023 03:07:48 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2535d86a41bso463146a91.3
        for <sparclinux@vger.kernel.org>; Thu, 18 May 2023 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684404467; x=1686996467;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=gFd1I1rBwPnySs0/HEJEh+2y3LOZuptJeO6utUrjEuWW7aSojcIuJMSDhICRFcy959
         YE6KmeXXEosT0qw8hBmfxXxzAEHlDp7Z/8NlQ/LSET8ogd3IaJy3f/oCn9AJUdHuqO+I
         CnSfOCtBxdP4jXczLpVjz0Hsb20KdEiTlt8n//sV5bK+aeyxGbmkBu8CvtGR3OKJC9WM
         nnV/YGxJchFQiaEHLkUq8RAxm5rGckxg5m4hPsEyBpl2UsWzMqmbnGMUNWKBGaMg0iSw
         0j4BQLrB5HlCjFXMUCTtDxVCdEbwHTyDWwonfByvPTfII34zhO+n1Xy+fY9/uaer0mNa
         3Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404467; x=1686996467;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=Ss5IryfQqftjNR64shnAT4GsvSBkFVWO5fCuKsxwa5HmuwPljoMLeg4XBc+qQo/DvI
         JUyGMCwb1D8cnu3M41gaJp0ckUuVTAU8eu7nigbOodCkQMs4IUE7eTLH746dp2+0PlDm
         8TztQbhq6Ka2xA+1jEm4+6X278NWUQNIxGgfUQhNKe8ZHnuw/W2jVe1VbjE5cBjYrPCr
         18s3ulrR+uhrBRfmdItOJH9jRdhcbLVLtwmbX4sGLqaIXLThTy30J+FThsT2p9BsLHxw
         wiG05GbRBndsdFLKWexu7dC5Wzy1UR5Jp2TRVVpdYrpxh1NNv9h2ySXKJX0qDp2OznHI
         9GTA==
X-Gm-Message-State: AC+VfDw8O3uU0VAj+fwWNmU0m3qGh82pIYe1dnR3fbtuyjYwIy4YkK6L
        JkoBjaa0ZsYzDgk6I5gsqKb7n58h77Bux5lRJks=
X-Google-Smtp-Source: ACHHUZ7oz2xwHc+ZkwngVzZTDjYikhU3irAyv7oLfbZO4QkuD8hNt6SuWIsIMtSLXjcdqdCx2JTeE/WG2riySM0syJk=
X-Received: by 2002:a17:90a:728f:b0:253:2f58:fe62 with SMTP id
 e15-20020a17090a728f00b002532f58fe62mr2006496pjg.19.1684404467448; Thu, 18
 May 2023 03:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:1481:b0:bc:c778:1d6d with HTTP; Thu, 18 May 2023
 03:07:47 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly213@gmail.com>
Date:   Thu, 18 May 2023 03:07:47 -0700
Message-ID: <CAL52byYe_NPFWgRKY2+wWtJq5=kMKGb3Uzg0GuHBU2i+pSJXvg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
