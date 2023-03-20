Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336976C15F6
	for <lists+sparclinux@lfdr.de>; Mon, 20 Mar 2023 16:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCTPAY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 20 Mar 2023 11:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjCTO7z (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 20 Mar 2023 10:59:55 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81F3BB81
        for <sparclinux@vger.kernel.org>; Mon, 20 Mar 2023 07:56:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l22so12392630ljc.11
        for <sparclinux@vger.kernel.org>; Mon, 20 Mar 2023 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679324211;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=p86t/W7cT1QEncgoZirIATaAqCpK/20889rb782FPWYVtXYn0K/sR1h2eKurq2Rl8a
         SH7Cgdaz79L8I4AzszJz4sSEycx220ZgXJUvBEchwdULL2zqXfQ3FZKUYyfs+ju0WMzQ
         OQkCvyb0TZS9Kk01fh2l0zdOf/AGD/ZuNuOTy473cSS/ANf585wXKkoCoJNi+A9sIcde
         nGO6YpXVHPK6QMw+EXaYcFzgAMVWc75SO5bsjunkBA82Y1z9MF9L5yFzEyUSheL51aKW
         TJsB5Bx9bAX9gT5icKJZYo0ydFEhvfV4HU3vgwEok1Uq0y6Y2ZRAQGdFviiJuPG0BVWm
         rRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679324211;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=VeZ/KgVNzs/ZqQTamI2KNT76kFOMEIAD4pqWyrQdbyXwcjV2d/VD6DFJ4dq9Na61i/
         ZYO9dzo7WYiRoKTwISSUYO/OmyfEH0dp1AwKvd8ciuzF/ZH7JXVPWjoZsF3KAZr8swCR
         gKwmFSg21FvRQ31v+S3EOIHB5zA96mxlBKNZeYACWFYWSlwPjVJ9bqx4qFdNW0f9GUL5
         P0/Q585bPHooo2bJsOflqAn/QkmUlDEIYh+TJpXnP9p9MqVR5skP0NaVRYvP3g1I/tlK
         wbr5wj6/DRVzZrbpYWQL9I1Dli4lUG7IAcQQ84DM0hAD9H1l+sjU6YK8sxujj4foIBR1
         sIHw==
X-Gm-Message-State: AO0yUKVOX0xagV7KBJ+Y6RzwP5oqxT4aSIFuHlSyOv15+Ttxf08Ub+Up
        aU6phw1E6Nr1QDcZh99px6+x5JwvDlChOlaVsGU=
X-Google-Smtp-Source: AK7set8G1z5bbYVOyuJfvjOncS7s6OmGD2mwG4vIB4B5PJYCM8ZSPf8h2dvfB87fzQ/Gr1XZ/qs+jrGJOXvjsYOUHMI=
X-Received: by 2002:a05:651c:54e:b0:299:6e0e:3a1b with SMTP id
 q14-20020a05651c054e00b002996e0e3a1bmr146032ljp.4.1679324210642; Mon, 20 Mar
 2023 07:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8744:0:b0:295:a96c:61d8 with HTTP; Mon, 20 Mar 2023
 07:56:50 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly021@gmail.com>
Date:   Mon, 20 Mar 2023 07:56:50 -0700
Message-ID: <CAJaQ5HvYPtedb116Shv3w4Y_qrdHoSGM9uQF1WFYUeKrhXPzig@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Dear,

Please grant me the permission to share important discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Best Regards.

Mrs Nina Coulibaly
