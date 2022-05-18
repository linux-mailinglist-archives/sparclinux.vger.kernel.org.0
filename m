Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C6D52C751
	for <lists+sparclinux@lfdr.de>; Thu, 19 May 2022 01:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiERXHc (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 18 May 2022 19:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiERXH3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 18 May 2022 19:07:29 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208628FD7F
        for <sparclinux@vger.kernel.org>; Wed, 18 May 2022 16:07:28 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2ef5380669cso40139167b3.9
        for <sparclinux@vger.kernel.org>; Wed, 18 May 2022 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=IHuIf4EIxXSHvbh9YSLfH3cuq9fp8qJfrVIbbBXlb8kcLSkvX/WB/sYpoXCW5A/L7j
         go/lVSIVUmhhjI+SbqiA1kWVkpMZNoL/6Jcl0OZmKyYpxrcZW1DZjmDfyarEnUFyYWkH
         +BpsxbuSIH6ns0ChgVceCa8AJ5vEf2QoEomcsVh7obwHnPmmseLjP4pwcMeXqBCh0WOh
         bIl0YH1nU9H4ujrnOYDJGWK7qVG6vvT1MPbGoMqxZTPHtOFSFKf0tawu+RGELGv83FRd
         /3sEQrHnkg/N4263b+A806v/dD/pCtT/vhq4U4B7wB00br9BvJ5sl1Qi0eb+PK+KP+wp
         RBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=YNAuU60ZmJSfdnP8wMs/Q/7OILhFUYckfsaCCG2X9VSmdJVerIKTaVBeVJkMlreoWv
         m79KNZxA3xO1p5Z9CHi0qVgzUX4Cyn9nnbkPY0WKSyxOzMun19JAIZocILSH5W9ifJ0S
         IWW96Z9K5Y7xF2i+HA1GaQhZjMzDz9Lz9FQWJNoTFor7E5i3MOyddtjK9hjwssH3wKfp
         i9KLVyFbSr4QENF6B8T00/8SqlaVeYm27fiqiW2fuU7Rwnz0WUF1pr93OKbojMXomObG
         1/BGgo03yZL8a42ysRHzQ7tTYCm7sNF3jIkHHZ1vpTHy/m+D6a/5+SWqvpErCLBs1IW4
         icfQ==
X-Gm-Message-State: AOAM5302Nkut7zGdLN6GZoj1KD1egzF4j/GKrtPuuO3DoBgj4kn6dJIK
        yiza6/bC2eMftuayNUWlOYovrzZDLfHvM5Fv9ys=
X-Google-Smtp-Source: ABdhPJxS8PEoadptK5zqKbFf9Mb0Gh4elzjumj/xLvKPS18HnZIvvGoFcy0PlWlghVJy3h6t5iEZBVd3WfaHC3LuB1g=
X-Received: by 2002:a0d:e444:0:b0:2fb:94f3:73b5 with SMTP id
 n65-20020a0de444000000b002fb94f373b5mr1843227ywe.59.1652915247377; Wed, 18
 May 2022 16:07:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 16:07:26
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 07:07:26 +0800
Message-ID: <CAE2_YrBdO7G_4aQKNsCA0f9Xj9O0oBFqLv4chv5gYhMs8GX22g@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4951]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Can I engage your services?
