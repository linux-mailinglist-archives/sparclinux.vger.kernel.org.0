Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41B5532370
	for <lists+sparclinux@lfdr.de>; Tue, 24 May 2022 08:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbiEXGni (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 24 May 2022 02:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiEXGng (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 24 May 2022 02:43:36 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8967CB20
        for <sparclinux@vger.kernel.org>; Mon, 23 May 2022 23:43:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso1366624pjg.0
        for <sparclinux@vger.kernel.org>; Mon, 23 May 2022 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=+/ObZQdcudoKPi9EHyxehxS+g8fV78JSk4u1MMEObnU=;
        b=l6dksmQB7s6MszatDdzemlsyOONhqnnxMnDVtf1CHDWbI4VuHiO9rD6WvwD3cXUmBk
         nb6vwWaexuIQT5tFHnD71Wc0duuGlSW7tndaBYhiKzcm7eUgLxWDMkgk1tVxsgUC5f49
         LB8FQ922bVijrxDYxZeo7DVcjbW/GHYJjAhCo0nrZzmsHZUA6e2kjr7DPQFiay/z1rh+
         Go9FXm2iKe6EfFSLDV4ND+83LeMqODpr+YqPM9HoTgtC9/ny77NeZtxRSL5HWYUA56V2
         dYzNgjZ7aZRvRhYXCb6XwORp90jULFZjm1i0eQmgD1gy/fN9se6Nt92n0lz0vgaVwqUW
         gOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=+/ObZQdcudoKPi9EHyxehxS+g8fV78JSk4u1MMEObnU=;
        b=vBsvT80OG+krrWThbbt9E6TgxodeDJWTUohJKLALq9I1jURWvEzOe3JPLO5gjqDA7G
         pSGvFqsssWK5DIREPAYdahN9YPDZQl8iqC4LP1gWSJOz2shw7ajvrEyWETYhTdyVC9Gx
         PW/WrBhjQ5P45ysK5xV1k30XJIzqk6yut7ZJZorxaFZFnKx8BbELOMc3JXADB0BvqgZ2
         Hb6QuJo4FLiL7uocgoey5bdUikbfeMoT9mfoq7P0z91bx1e3k0JiR1ItxQ5RuYELnpbh
         Rh/5MQF/W+6ideIx02VuqfEDVXywh/l9ASq1U3tBRlgtbfC5lkXIWGMYInfCRHTVDGEB
         YUCQ==
X-Gm-Message-State: AOAM531WyxxaorkYaeOnLviE9FsBHjuifQ21vkOxtVeDViu5ePV9Ucn8
        HFfDTu0XEYYLPyCDMdHgFboAzf22pe7as1CQ07I=
X-Google-Smtp-Source: ABdhPJyhF0NWUbidoBvOsnZHnrsHh1fRWlTNX6NN9Z2ToYKq5/wEDH6M63T3qBiZ2zAKBmU+o/J07UuEiDvZnx8010M=
X-Received: by 2002:a17:90b:1808:b0:1e0:4dbc:8781 with SMTP id
 lw8-20020a17090b180800b001e04dbc8781mr3095046pjb.58.1653374615208; Mon, 23
 May 2022 23:43:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:e7ce:0:0:0:0 with HTTP; Mon, 23 May 2022 23:43:34
 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <davidabula9077@gmail.com>
Date:   Tue, 24 May 2022 06:43:34 +0000
Message-ID: <CABMMw37TgUedhoEf6vR2w2v=rprxUpadDivp741TDpLd0Zo8vw@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4945]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidabula9077[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidabula9077[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Morning Dear,

How are you, Please my previous mail you did not reply it
