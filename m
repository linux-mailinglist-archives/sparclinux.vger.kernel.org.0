Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA057AF27C
	for <lists+sparclinux@lfdr.de>; Tue, 26 Sep 2023 20:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjIZSPR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 26 Sep 2023 14:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjIZSPQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 26 Sep 2023 14:15:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21658BF
        for <sparclinux@vger.kernel.org>; Tue, 26 Sep 2023 11:15:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50435ad51bbso13296637e87.2
        for <sparclinux@vger.kernel.org>; Tue, 26 Sep 2023 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695752107; x=1696356907; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+Qq0eGOhI+zi0ymRivISEB6qWBQOyhAy8PFG9Qi7CM=;
        b=Z4C0eMr0sycI4Y4yqMW5cw6d95xMSnpUzhY6tCByfBCJyDNNH/T+9kb4NbzRS6gLRL
         OMcXqcO4mBWO15gExmgmGCJVLhtGxHh/G20ZtqKREsf1+vkEiCXxT84AVOvd35YAk0C+
         zYlbtufr8+0CZ9rdJoClCr2Jk64CUcE7DwkV1+KtCHoKkLpaZQ2jLrDzzSylOs8mGBzQ
         6y6V+XJJeOsBgyu+P8b7GWSBB82pRw6o9xJxl6bje99dLa0fMm4jAhrz3PhfM2c25E2r
         T9+wbssQtNGVuWy+CUfUEQACBCmXBbUnPbId+4EPpznmGyX00mEsyJ7FzORJvc5HbCy0
         1afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695752107; x=1696356907;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+Qq0eGOhI+zi0ymRivISEB6qWBQOyhAy8PFG9Qi7CM=;
        b=qNy51oolcm5q3b0IRzAtaoTJ1ufxMENLsjiwRv0MnEFDahqfgnlgFgNeB/EXFpRDKO
         ObNsgM90+hRAXuLoBhnNBCFyHCMViDTrPUKypxBcGbyfszVH6hMqFqhOiSSXAoRhTZKr
         wpwuIeb+UgAQ/qCmLjzmDLFlsM6pbNOHY/HRiUnCAOxSiXy2bXt4MHRt6aiPTijUg0Ru
         oZHPxRRYbNgkwHllEs0NlVQ4Z88b01cUvIghyOqcHxQwsx2dI4LHDUQYRprxTKXc6m0g
         yUCkexqijwp4cvdWOhfIWaiIG8Uf2cpMYnlpIs7hvBWcSxvT0XTOlG+r2xX/h76MtW1F
         xoCQ==
X-Gm-Message-State: AOJu0YzP5UCwImhEEHPzzdB67gK73iG7XMvUNcclB6FNknIx5U/c/iZQ
        fdpPJp8ZDCShrWBZiWAmsYCiVY7qJkg+oU/Gkws=
X-Google-Smtp-Source: AGHT+IFbviyqTM0HxohLmOXYsT+nmbFpd6L7FcCZV2bceQui3Bd9Lk992qO4A8AZIhZodLXDGT77TiLcaxVOnsI279g=
X-Received: by 2002:a19:384b:0:b0:500:c5df:1872 with SMTP id
 d11-20020a19384b000000b00500c5df1872mr8038147lfj.44.1695752106906; Tue, 26
 Sep 2023 11:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:6904:0:b0:235:c216:d483 with HTTP; Tue, 26 Sep 2023
 11:15:06 -0700 (PDT)
Reply-To: ritaj6525@gmail.co
From:   Mrs Rita Johnson <johnsonrita316@gmail.com>
Date:   Tue, 26 Sep 2023 19:15:06 +0100
Message-ID: <CAFTk6QxjjpdfQqYRJuWHrKjPWdX-kCUJ9=V_vKEM9WcEyPR1uw@mail.gmail.com>
Subject: Thanks
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_NOHTML,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello,

My name is Mrs Rita Johnson,I want to donate my money $ 8.6m USD to
you on charity name to help the poor people.As soon as I read from
you,I will give you more details on how to achieve this goal and get
this money transferred into your bank account.

Mrs Rita Johnson.
