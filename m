Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C984C5507D4
	for <lists+sparclinux@lfdr.de>; Sun, 19 Jun 2022 03:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbiFSBKS (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 18 Jun 2022 21:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSBKR (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 18 Jun 2022 21:10:17 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3E8E096
        for <sparclinux@vger.kernel.org>; Sat, 18 Jun 2022 18:10:16 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id k5so532853vkd.8
        for <sparclinux@vger.kernel.org>; Sat, 18 Jun 2022 18:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=Yber1q4yh6ni2nLdd9KGeMx0PTFZFvCbqjsvq28C5/6s2oueoVELbyox2au110GcAG
         tuWyvC+HhXiEcFw+EFOkZyhpir7p1fAJb2Go+wVYSfQK3b/xR3+ON6e9QIU2WEnNRtzN
         5imACl3fmkc4g1INvd/pCUpfuYg9ELyoQbmrINgVw8AlAE+vTf9QNeR9j8pAjpfXW8g4
         Z8RyolNzalXQUGuZI5XN529/jMVULm1GXXgaMXu1P6nQb4pssCdCnPpFTeIyNFQ2uiGU
         l7+ComVEQdt7QwdvFJ9NSAYkMg/H3XvnQodwl8nFgmlxecaosNWj/WcKlbAOqI1U7x5o
         +m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=0SgUN2LcyG5S90k4WpBufg2KzrE/iPMGVIKSoX7tGRuqV2btfqJRGHXlidGGbNqe0L
         6h3W0IOQuzexWPY4mI0GV6rdMbMuYOKQbVZG03piDxLNUzqtLTvCqAtdU6wmy5UuyqzO
         s6bTw2xfU4wXQIxhk0OTCB5CZteTMiJ04xpW+4WVzqSxgrFXpkDCXXVDKI19ls6u5Rgl
         jFqkdAmamVY/ZxdUlcdPBi6fwC76U91SiKhglZ6UvsxaZn66aIhacXjj87NKf18Hn41P
         d2oZ2IQjKpkC85heoZrpt9Cnm7EG2IL7a6FQVP6NIr1XiFkg1arCBGT3Lhgm8gwWJNR8
         KWOA==
X-Gm-Message-State: AJIora9epqU1K2LNOexJN0rw0RTB3j+vQ1DdDqylMJylZuw2IXbgIuK8
        eBe1N8R69m6Dk/Dc/MmlWO6GWxpZ/SxNuPqVfWY=
X-Google-Smtp-Source: AGRyM1v5AViNdrTwmiEQi7fry6C2MgXWWiagDUI1144i4G6Hu/GiaPIvbVer3OFLqjTZ9mMyb88Ft8+WLgbosxLrudU=
X-Received: by 2002:a05:6122:4f:b0:365:2b10:5b1e with SMTP id
 q15-20020a056122004f00b003652b105b1emr6875044vkn.40.1655601015529; Sat, 18
 Jun 2022 18:10:15 -0700 (PDT)
MIME-Version: 1.0
Sender: hamzaafarizaa@gmail.com
Received: by 2002:a05:612c:2220:b0:2cd:51e8:669d with HTTP; Sat, 18 Jun 2022
 18:10:15 -0700 (PDT)
From:   "Mrs. Hamza Farizaa" <hamzmrsfari@gmail.com>
Date:   Sat, 18 Jun 2022 18:10:15 -0700
X-Google-Sender-Auth: u_69MpIaid8ODr3WMouv69_BNvc
Message-ID: <CAHw4SCWGPYnUA8R7rU+-cGTd3hOV-fC9vAUsKxdWm7h+-hE5nA@mail.gmail.com>
Subject: I think you can
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.0 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_60,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a44 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6182]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hamzaafarizaa[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 HK_SCAM No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

May peace be with you,

My Greetings in the name of our family, This is the second time i am
contacting you with regards to the charity work. I am Mrs. Fariza
Hamza, an aging widow suffering from longtime illness. I am currently
admitted in a private hospital here in the capital city of
Coted=E2=80=99Ivoire.

I have sum amounts of US$17.500 Million dollars i inherited from my
late husband Late Mr. Mohamed Hamza, the sum will be disclosed to you
for security purpose which he deposited in one of a Bank here and I
need a very honest and God fearing person that can use this funds for
God's work and purpose, 15% out of the total funds will be for your
compensation for doing this work of God. I found your email address
and i decided to contact you.

Please if you would be able to use these funds for the purpose and
God's work kindly reply me back. on ( hamzamrs027@gmail.com )

Yours Sister.

Mrs. Fariza Hamza.
