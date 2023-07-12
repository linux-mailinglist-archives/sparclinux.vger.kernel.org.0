Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6B974FFDE
	for <lists+sparclinux@lfdr.de>; Wed, 12 Jul 2023 09:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjGLHHT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 12 Jul 2023 03:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjGLHHS (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 12 Jul 2023 03:07:18 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA57B1
        for <sparclinux@vger.kernel.org>; Wed, 12 Jul 2023 00:07:17 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1b38121a011so5390102fac.2
        for <sparclinux@vger.kernel.org>; Wed, 12 Jul 2023 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689145637; x=1691737637;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1ViolND3wkoes1QthBmyxMEvqbmFO9WyQp/Qum2Iq0=;
        b=rCxPRY/IeD9aKMr8U1YLGrmnsi6QwoGQ14NaLnByZWuAgEANbotIPvEh5ChacWj2Wk
         iaH+gAG9dsyOzipBq80G10RAaHHkJ01IxbQJhJ/cl6mmPp3xkLuDNKxgVtMWENOCT2fS
         yYJ5iJV+WiskE/31iuYGuJDMyvHD8aRJfYvx9kR6Ci+U2+v7oEVn72Il5TU1SQNE7yEd
         E7fjgJSZbdKdIP2C3iIVQwi+HtF0Jm1F85V8hcVXLbMhaofULOEzEh8xr4SqDSb9PfuH
         m9VxwcUOVUw52ISL2+ZDUrI2bJatepnPtu6ZeAZTRV0oAKaLB+kb9KfS584NyMkWysXr
         q+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689145637; x=1691737637;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ViolND3wkoes1QthBmyxMEvqbmFO9WyQp/Qum2Iq0=;
        b=RALUVRy8xEBoA0HorH80dtN0FRp9o462/AmMbJB4Tc518ssDyzileIVPKq+J/0p0c3
         6j5RPz0gBCtItWxaE1lhyuN4kt643x3T+lGMsiS8YBG4837BG/0rCdbW8QzVgHUVEnvz
         lqw4P6mEpIzzPneIi+5F5KRvEgo3xyN+/nEpqtUXCaURrUDyhif+jGlJ0bJFoCPpwXgD
         dQZGf6H99H6XkcbfNNO1zv4eyVpaZreFkYNmANtJKRr1eLJvPb6aKpe+U2blWd7jWgzm
         EttH8VujZJzAa+g8b6LnWRyGnT3EXaYISrGWt5z8x8ZgHDNzzTWuAOrsp7SWUS4g5j7U
         soUg==
X-Gm-Message-State: ABy/qLYXclOG0ah/NHPch9yUO21C3qDufOLVe0HcA9h2WtDNmzgsV9DF
        OY5GMg6Jp/lBYDRUw7knLx6kAFnIiBg33lT9czQ=
X-Google-Smtp-Source: APBJJlHYdQ48NZb3UJ6sTzYPV9FNC4iexCPvVgysjtlmcCMDLydfGKKsLRXRj4p5nb67/0dPKdUNy5E6Q+YpwwutiiA=
X-Received: by 2002:a05:6870:5692:b0:1b0:3821:f09e with SMTP id
 p18-20020a056870569200b001b03821f09emr16209545oao.18.1689145636899; Wed, 12
 Jul 2023 00:07:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6359:6086:b0:134:74b6:809c with HTTP; Wed, 12 Jul 2023
 00:07:16 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly10.info@gmail.com>
Date:   Wed, 12 Jul 2023 07:07:16 +0000
Message-ID: <CAMnOr-oh8vUZoXn7nr554WSx-B61-=pWKeY=wPSyfyyP2rU2vg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Dear ,

Please grant me the permission to share important discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Best Regards.

Mrs Nina Coulibaly
