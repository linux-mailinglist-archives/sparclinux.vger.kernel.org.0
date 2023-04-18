Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389386E5D43
	for <lists+sparclinux@lfdr.de>; Tue, 18 Apr 2023 11:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjDRJZL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 18 Apr 2023 05:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjDRJZG (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 18 Apr 2023 05:25:06 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED963C0E
        for <sparclinux@vger.kernel.org>; Tue, 18 Apr 2023 02:25:03 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-38be7a5ab37so259465b6e.3
        for <sparclinux@vger.kernel.org>; Tue, 18 Apr 2023 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681809903; x=1684401903;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=JGOtaq8cEkAAFxwF8wBGxEn7ojjjUaMcEws/sk5Z3XMz0svT5lC1foQCSNX6ipfbDI
         fmkMga3liEmkNQoNHJtsfEhYvnB+EcixwFaYjGxxedXkQH3Z88pnxMKy+VgQYBZLr5kp
         jXYVYiu8Uw9PGXYch1IU/im58/lL+l8p56TaQ5j7V45EqrBXVA0OX1N1+55ZZTNzbKjU
         6J14EEsR4qP1GnN9v1Sk8zNkAxbuoRsRmwjdo8IWnj/3ybPgWLwz8n6ITzCLpDmj24pf
         Xte5ojITQuAUUDIxQiPx3tNFk3+vVF9Buq3Q/ujUamts/Tki66bPwOO58pS21hnI2nR0
         0e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809903; x=1684401903;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=D3neCxNcse8Nz1cFYgBnRMoQTEpHLyoekJA592NO+tkSabP/xro7Sd3tFsq5dV4d8V
         eqn4rb+P7VJ27I3/WFTRFhfdGOuhfh090aknSsK6KeKyrsHjIymOQzRJbmv7n0R+gpF3
         jsCQdJaAzy39Ci51e80wlMI97cgIpmBZPq4PDBkBo3aWPO0Dox8A9v7krj+fvjXYx1ov
         ZW2nYzXSdWGDTGEOqAqmgmSUW97DalUEKm2vC9Ah4oxiBt1MqO0aAwQ4bEdQ/15Z9i0V
         NWWqVj4DRQr1kRu09sAgmYULjG4iSyE1YYndU8YnqUZOREU3pN2ODTLp8vg8bDaG1JBt
         gfJg==
X-Gm-Message-State: AAQBX9d8fQ80u5mWPRazk4d+fdb1uNQFf6lxyVehF8ORvIT2PPt6oxr1
        ttsE5g3mL6BSkVH+RAEGMPLD7G6T1/7bf5UI73A=
X-Google-Smtp-Source: AKy350YwbDtvoWsqzOl2k5KQ/1yyYwXmwcEdgvF8JX0YX7wTuvfQNlFkQIG+dLcgl+aGCVg6PON3rLQsWeMR/73aIYI=
X-Received: by 2002:aca:d7c3:0:b0:38d:e632:8307 with SMTP id
 o186-20020acad7c3000000b0038de6328307mr334912oig.3.1681809903074; Tue, 18 Apr
 2023 02:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:9223:b0:104:1d78:2dfb with HTTP; Tue, 18 Apr 2023
 02:25:02 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info@gmail.com>
Date:   Tue, 18 Apr 2023 02:25:02 -0700
Message-ID: <CABAHEt5Kr8RW7E0pKpk4wZehroO4t7WYZGeRAggOhvy=a-x5Bw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Dear,

I am interested to invest with you in your  country with total trust
and I hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that I can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
