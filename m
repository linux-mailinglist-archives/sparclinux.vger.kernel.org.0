Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C95870976C
	for <lists+sparclinux@lfdr.de>; Fri, 19 May 2023 14:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjESMmm (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 19 May 2023 08:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjESMmm (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 19 May 2023 08:42:42 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D355114
        for <sparclinux@vger.kernel.org>; Fri, 19 May 2023 05:42:40 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-56187339d6eso42365437b3.2
        for <sparclinux@vger.kernel.org>; Fri, 19 May 2023 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684500159; x=1687092159;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIDs2kxktlKTTEJ6a5vNk/gXg/KBrPoTQlY4dW6WTl0=;
        b=KEW/Ok9adg4Ef8WP6EsPRIV7dX7uj6XPDv8CdkvQY/9oxbdZdHSJXnYtMjxVeVodP5
         iRN8fXYONgn5h7ydTjqS1KgK/EbKbLnLJTb32urVzTSoiFpkr400LOoBDx1XFSVhR6pN
         n78vSpT1SFmzeuJ2szzAx9voun0mBHvDp9uFBfwu94NQuAwGrC4s/SpQ5yakFZxORWvl
         XoyHeqb8p5sIHNWgtmH74LV0PRoaCd2+he+HneLbe8UZ4tS2Ox5/Fo+31dk40z80gDsU
         QGGkME+8+Lw5Xf6bxTgsVS7jgKI5bsPxhnwg6K0zkgWU9ihGI2RRuZwTJ3FFoLYaACLN
         aIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500159; x=1687092159;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIDs2kxktlKTTEJ6a5vNk/gXg/KBrPoTQlY4dW6WTl0=;
        b=hNaG8X8noK/oWVwtsGiRFdrO6WOifZ4OsULMd4sfMgC3+ZaGWwKNQjyYTPg0Xa4S0H
         cWi//UyOdpnSGXCnLlz/ES8pM2td22xUNkrdGYDhSRbodciUs1dUhKYY8P7XqcLdI/Kd
         47n7KyUnmK6Xr4QXcHYz6wvO4O7r3BBFFDBdQq4xWRR1LGQaKeD/e0S/QqckLdQjGSUC
         yLiqTrH5JDQh4OZhB+rJ/shI7l1D77d3/zZ75dlcUAodo0whOcWOjfocsfHyRqjx38MV
         phG8XgCxflohEc/9ThsHwlQzvdbY5HQImBVvLR3P8FNorBWrEDyhJV6MV+XI7k8IhtDt
         yvCg==
X-Gm-Message-State: AC+VfDz4QLG3y+KQZp5LO1feSGmhU0qIrghuU0medrQmxLfvvEwFTtTQ
        iAntsAMV1M2xzaDVc8Rf8k+pmT8MhoMd0im0Qg==
X-Google-Smtp-Source: ACHHUZ7UhO5X87mX7u7xoiMJ0xSFrzt0rnncATFLpBM0nhsJUFgrpioAzYB3/LhjRPoKV8ba9w5Qy45VwJpJNRJkEUc=
X-Received: by 2002:a0d:d74a:0:b0:561:7dd2:6ba0 with SMTP id
 z71-20020a0dd74a000000b005617dd26ba0mr2234584ywd.6.1684500159590; Fri, 19 May
 2023 05:42:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:8418:b0:357:f46f:ec7c with HTTP; Fri, 19 May 2023
 05:42:39 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info2020@gmail.com>
Date:   Fri, 19 May 2023 05:42:39 -0700
Message-ID: <CAC4KtEQfHLOTqaWNtbaS0bvnpwoqy7ophu5EHJU-rUr1W1e6kA@mail.gmail.com>
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

Dear ,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs. Nina Coulibaly
