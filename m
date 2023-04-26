Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B5B6EFB54
	for <lists+sparclinux@lfdr.de>; Wed, 26 Apr 2023 21:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbjDZTuU (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 26 Apr 2023 15:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbjDZTuR (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 26 Apr 2023 15:50:17 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC5530C6
        for <sparclinux@vger.kernel.org>; Wed, 26 Apr 2023 12:50:11 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id 6a1803df08f44-5ed99ebe076so74188456d6.2
        for <sparclinux@vger.kernel.org>; Wed, 26 Apr 2023 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682538610; x=1685130610;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=FZjww1LHVfAOWPSmAL/ff1aBCkz6JvfZJ8YFtXqb2zM4iRXssE83FT2DPpKMoHui3x
         0g0X83BdQjNmVae4/mQVTWx3Nx8s8egeyI9kIpZmpBQpzY1N3FjZhqqja1SoKU+B5BRg
         1TIJO/MpAyMvf453J6M7EkIxlKm7deBbcVEKPTsGk6gWXuNVAu2theqhshZKRVQ2zOZU
         F7kdet5ArWxW31Cu8XdseGknC+cTUGsYcoi0eOWll3hSdj5odACxbb/EvmcvP6QPk9EE
         dw7s54IAplYGKi4fD8q1Ee+FhSSOI4mlJF+uAxf8AMxHuo4YJyljLzgMEBeJJGYfbC2j
         SkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682538610; x=1685130610;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=TMMoBoWzpi6AKpLnaxx6/4czKz0EA69tgby4qnwE08/bBgwP7K10tm3G8TZAgRqTPP
         OVlWM0+1g982+fLKtLZ29UKj3uohSR9MYqXe09P3e2KbIvQxEqBWi1ZbGVoVzj8nazmu
         Uac8lxFkEYZ7KE42fIc/tUl+S1ivA4i1Q2cU1bohQN4O/heg7EcuqwXsyNJ6RAv+tGRv
         LNWzYqCw6Nvp5RzWQmCHFD0KBeGpzixeZ/74GdXy7kQVEFW7vceavMmo3UNQN1MEAI3j
         suCJJtzxI3Cdjfy/YRQmSegLQ+iB4YKU6k57rVrsKLqHAJmZSnMPbEwRewzis2P7g/C3
         vUag==
X-Gm-Message-State: AAQBX9eyAlgFZ6mIMyqKpcgcbKDA4HvKvVq/QgMWblfPez34DPffSTRt
        HhPy9Orc67cPEM3TCYDfNWO2RjLPx0C4hpEY8x0=
X-Google-Smtp-Source: AKy350bczEg/MDY6Q4Uedzzq7O1MZJPu+st2crMlSwkzuytzIpEm2RvQlsxquBsig9DO5tA+VJqi3Sn816ZlCiDd8qw=
X-Received: by 2002:a05:6214:258d:b0:5b4:1d9a:75e7 with SMTP id
 fq13-20020a056214258d00b005b41d9a75e7mr38271288qvb.13.1682538610120; Wed, 26
 Apr 2023 12:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:da90:0:b0:5ea:ecc1:879c with HTTP; Wed, 26 Apr 2023
 12:50:09 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <yentrhdghi@gmail.com>
Date:   Wed, 26 Apr 2023 19:50:09 +0000
Message-ID: <CAGA=xqt8bM9txZpYZpArPKLykoxEBJJH-9DbrjxJJOLz7ouEww@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
