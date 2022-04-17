Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E605046EA
	for <lists+sparclinux@lfdr.de>; Sun, 17 Apr 2022 09:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiDQHRb (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 17 Apr 2022 03:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiDQHRa (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 17 Apr 2022 03:17:30 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13C8D8B
        for <sparclinux@vger.kernel.org>; Sun, 17 Apr 2022 00:14:55 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id i186so10269162vsc.9
        for <sparclinux@vger.kernel.org>; Sun, 17 Apr 2022 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=q5F9wkYMr2QKAPGSP6GH7n27Fqaoor5/Cjz7t/IZ9uDhM1CGHpgVKE45edtoJc1B5E
         REo7GdQFPEmAa4I4ZO7aVsFAk3EVNTV4U+ElAca67XljUpoAqR5Pih7ZMjR2owaLVeg8
         3LPrxnaHexf6P6wiTv5olDcCHY9PhWlAtuDyH+OeY6V5Pa4lArc88HWHxra3CuOmjrQr
         XyLodNi2XCbS8ztUWkZTOqAulfXZTAOLPw/BKn+cqo6XZtcl/sPm9SR4VypX8a7O/kQy
         U+ikjXpz7MskdgX9p6NO2UtetL2NS33E0ef9hXGGYXfJeF6SwzzsMRLMtJVImuJ2+9JL
         vfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=Uxfdp7jAielwTbyNgvpIxw6HidfogkOzdvmRtsCQ2mgyJYS4FlO8cdZpt6wf3XYblX
         02h2/SAZj3oAYlz1zctzk/DIGLOlN8Y0n/yjj/UYTpDYjpcYTjcP915uGOc83JLJ9th3
         P0FJRPCbjIJWU8YVUvWhC30HGzJQrorPbiggfYjmYOSSGrYvAITyiy1wLoHWGrVoncnK
         t97t5aIaDDtZXhb5J5KJjaP8vKt4Niwb555nvtx3HCQ8IsZLfsfKswKEo6XnD2bZwNJT
         PNo7ObxVd3T26EPNt91TKBtiPqHxVTrHJCckW8jJkFcnUetTB3qFgm4YNFOOLCDDYjcY
         yfjQ==
X-Gm-Message-State: AOAM533JDYvFZFLoii8Z3CKZXNEOxFdY3cYm+K8dupwG+eeoKtALeQNg
        3Ijmuc3345dF0oABBWC8SvLOAtGBsouJSFf0Z3k=
X-Google-Smtp-Source: ABdhPJykAsXCgtQ8Exy3tI7WE2JV+WJoAC89mojOr0CuklqZ64J3IfLT60D62Qq8O69akcLf20lMizfoaWC1UGkPXNw=
X-Received: by 2002:a67:2d51:0:b0:32a:c2b:78c4 with SMTP id
 t78-20020a672d51000000b0032a0c2b78c4mr1475477vst.36.1650179694506; Sun, 17
 Apr 2022 00:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:76d9:0:0:0:0:0 with HTTP; Sun, 17 Apr 2022 00:14:54
 -0700 (PDT)
Reply-To: daniel.seyba@yahoo.com
From:   Seyba Daniel <hadissawilliams@gmail.com>
Date:   Sun, 17 Apr 2022 09:14:54 +0200
Message-ID: <CAAC2S9k6A3ihjn1OWRX7rdMMFJxJNPARMyE+sf0t1cjDpB53Pw@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e41 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hadissawilliams[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
