Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205B257E6E5
	for <lists+sparclinux@lfdr.de>; Fri, 22 Jul 2022 20:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbiGVS5v (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 22 Jul 2022 14:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbiGVS5s (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 22 Jul 2022 14:57:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23550904D8
        for <sparclinux@vger.kernel.org>; Fri, 22 Jul 2022 11:57:48 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w7so5261471ply.12
        for <sparclinux@vger.kernel.org>; Fri, 22 Jul 2022 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=JPZwoF0aHdGHNH6Rw6Ix8Ukc3P1Vv3OHsX6GLnD1yksAe8dQbHyUE2a0IQizoIPRuD
         X/yS6IhqvUubLWQA1A47AAxIRwaP7gRQYIItgU/2oXoAOSweMQ7GXIu010UyZ29UcSb6
         mmo+mS88XkSo8h2LT002B3LvGRG6fJdzYuF4x7oQdEjSrxrdGosUYchj5EQQQFv8yU/G
         J0jlEurv9emCFWcnOhVAqWtBOk3lqEPyapQoInUAaXky2iN8KOQqA5bYuaYNzslTOZ5W
         EcnRivBskUGVJ09umFavjzEbBIAcjV5hN/nC+wL2rd8XqHtdUIEOkA8OJb51auD+gdmP
         5Ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=a7GhHYZyeuihvy35QfN8uWMRBrM1CSBAGNZptQcRaX4bhtxrF8C0fahZzFZWbJizl3
         QfhujwzhSE/KCSedHK0ho+leFyIMSBbEK65y74n1IgrbRfY082T2qf8X1uc91y99sStB
         tYAK8/AZxFL3zu0E9KOTKWKbU8ZsqB6pDTpLhXP3T42JtJLdsejDzkFT6Z7eXHsEKhOQ
         C9EV+oFgE0eqVPmoN7eKQxf5jHM3wWpyixNS4TinGJmaYTJnp8Pw1heXQIM/9UMxtxIh
         MoUJBimk2FFhNp6xVCgF9Mw0GHNoQ1H5q2xOos4lpudHoftYEHpixPy5L5R/dFoxOmgz
         x27w==
X-Gm-Message-State: AJIora/CZgI0kb33J3zzzgX1EpcT2XgI/e/7KYS9wnw4DOTvGpQ3n1K5
        zf6qvtoT+7xN3av8z16Hb9QNqxlLSeUg9OgRqHo=
X-Google-Smtp-Source: AGRyM1uXw3FWAOkpN9Ju6/cMQmR5i5X++bs9CbwwRkqPsum5plX6Vk8A/5FZbwFwVplhBy83L5XGSheaJX38Zd8Hwis=
X-Received: by 2002:a17:902:ea08:b0:16b:fdc3:8b3b with SMTP id
 s8-20020a170902ea0800b0016bfdc38b3bmr930775plg.68.1658516267680; Fri, 22 Jul
 2022 11:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:5a:0:0:0:0 with HTTP; Fri, 22 Jul 2022 11:57:47
 -0700 (PDT)
From:   Bright Gawayn <gben74325@gmail.com>
Date:   Sat, 23 Jul 2022 00:27:47 +0530
Message-ID: <CA+nOVsbeiDkfGguHC9vCCh9Zsmug6V0UyZfcEdqJDx3XeC1Brg@mail.gmail.com>
Subject: Lucrative business proposal very urgent!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5058]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gben74325[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gben74325[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.5 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello dear My name is Mr Bright Gawayn,  It's my pleasure to contact you today.

We use a certain raw material in our pharmaceutical firm for the
manufacture of animal vaccines and many more.

My intention is to give you the new contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that I am a staff in the company.

Please get back to me as soon as possible for full detail if you are interested.

Thanks and regards
Bright.
