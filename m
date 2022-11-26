Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD35639604
	for <lists+sparclinux@lfdr.de>; Sat, 26 Nov 2022 14:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiKZNFg (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 26 Nov 2022 08:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKZNFg (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 26 Nov 2022 08:05:36 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D0318346
        for <sparclinux@vger.kernel.org>; Sat, 26 Nov 2022 05:05:35 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id g7so10679653lfv.5
        for <sparclinux@vger.kernel.org>; Sat, 26 Nov 2022 05:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wlb4SYlCkKFrC3vDbrNKcnlsbFr9aWDknzVh2AdUFE=;
        b=JbhyNt4U66Yw4JpKNEI24OopNiQfz4MgA8Q2mEX7WZPcUtLt81q5OvHcSqrvPbmGBv
         FbFzAJSjEwgateJpYTAiiOGEYnebq5EeR08QlmJRDTmF+MahB0hWsV3ryeNM9rFjA7pf
         CI7bnaA+Z5FMXKq85DOcQi0tVwjkpxT2m33C9OKgP0isiYfHMOfY+cHxItyApyzZWBgS
         rxLHZkjorF1cp06h8D8wpXQHZc5bdK+c7t99MMNs9geOCW4ufiSO8Vm3fWnv9A+XHF+b
         X0UtHQvmyHBfowgi1vAiUgvg/QPiHA2zncRPTyQF7Ap186EtDK4FuI9mO5Rzg1IZD3Vp
         /QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wlb4SYlCkKFrC3vDbrNKcnlsbFr9aWDknzVh2AdUFE=;
        b=lYmDhQEUF+iqYqhqkwU5x0wrCwZguw6mA6rOh9P7siPNCX4ePs7LnG0ZcIizG6W/ic
         CTrXGR662V7OecBWUU+J1PXfCyjLkbhnDtS9vERVQyD603MF2RHBEFDoVp5agZ/JW3tG
         cEb9Rej/eQI4r6YS6yVFTcmaQL6SvPLc8n7/WSZXNa29JKRkEM7wj5Gh+ybcC3iSg5iy
         W9pfQFFyziSMaW/93vbfMpMa1FiQ0GOe0RUmtoSB77MFY/sN4Aci2iHhUn/PKRnHp4js
         Nqiq7ngJ8eVUGVWNNJyWObcWr5o2RKKYWt1K4o+vykE/aS3Ru/py1OW4cFNQ9TlaP3F7
         UlhQ==
X-Gm-Message-State: ANoB5pl16O999PNL8AwZ4rxR0JMmu8oLIIRxvl3jSyFUs8iED1CUOtWt
        38W2V8kFzShEt2txpJA+hVXpPmK5Y0qpHEekpwE=
X-Google-Smtp-Source: AA0mqf7YwfnTLMnI1UzxOBiKvLVJ5SMRBAN30J/IOt/1UYdw33/nvWEddXUBEetPPV0ZIhSk/3eoZdtszDRQEke426Q=
X-Received: by 2002:a05:6512:34c6:b0:4a4:71b5:cbd3 with SMTP id
 w6-20020a05651234c600b004a471b5cbd3mr15365122lfr.518.1669467932694; Sat, 26
 Nov 2022 05:05:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:9256:0:0:0:0:0 with HTTP; Sat, 26 Nov 2022 05:05:32
 -0800 (PST)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <info.ninacoulibaly11@gmail.com>
Date:   Sat, 26 Nov 2022 13:05:32 +0000
Message-ID: <CAKjR=UTLjO6-h=RKAO+am6=SeEEOF+D8G1j90OJuwHvTUp96VQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

-- 
Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
