Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18CC7AC771
	for <lists+sparclinux@lfdr.de>; Sun, 24 Sep 2023 12:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjIXKJR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 24 Sep 2023 06:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjIXKJR (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 24 Sep 2023 06:09:17 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8149107
        for <sparclinux@vger.kernel.org>; Sun, 24 Sep 2023 03:09:10 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49334907238so1373151e0c.3
        for <sparclinux@vger.kernel.org>; Sun, 24 Sep 2023 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695550150; x=1696154950; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4WQYH8wKFCCHTXrK1Zk61Xzuiy6SVyBtq7SxIFkJbxM=;
        b=nM5n+ROyozyNSx83Wn74uynu1qPqdp2QqFso0GWOlT5nMQZsrmsjHowcxqGlH0xfIA
         mL5ZPDYSAjW8aA0AwiksFEa9bbnfWMUxMQN6wBl32z8q+Ru4Vf3kIKv9R/2j5Oba8svY
         dbxUT5qds5im1ct0iq838J+vPChTt2tbdIIkkAlvm2R8105Wey7SLfkL4MNRyG5cei4a
         W8uUK6whx0qZzAAWW6adgH+0+sVsO7yHpdWdX4qHXNCoD5Nzghg3HsFBKbokEI5HpEAC
         +tvhiimIQZTDbGXRJOqS39vOfoKElopYqgv6G19//iRgkwEyYcQKDOWMGE38R9EjVffJ
         cXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695550150; x=1696154950;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WQYH8wKFCCHTXrK1Zk61Xzuiy6SVyBtq7SxIFkJbxM=;
        b=uifiCfGre9eIg2SrAK57M2V6EAzggpxxJvmndgrEjxnz7Aypbwt5q3qe/4xeH0TRbp
         WWopR/dagT5hNPR2hHIww9PgiLo/QgnEhMVZEhu7veex4M8aNaAB6C+XJ0MwcNY3hRR/
         a2QUvY5fTXDidDJu/TLrximmIKxUrwUaGJjSnsvvNicKOPfWQ/wAiX6Z2kgbI7U2niDz
         cgFXDSWCT0cnYHR9dFQ2o5bk+6G4bPuJFaDiIoOdGkQwO+/1RmIB55llZOeruhi0NC1V
         KgRMzMeZ1XVzjdDwSrRWPF7lhprEvpMMFb8pJ0uvUkx5ADkFSfwggULYC/83FFduzexb
         hKPw==
X-Gm-Message-State: AOJu0YxX+a1DCcDms14tuHxdep1tb7K0+j135SVQZ26nthKp+vIC7gJz
        axFoOQWOsA+UXpSj0F0cLiTugp8DljE2VOYwqfE=
X-Google-Smtp-Source: AGHT+IGU/JEPiQoCBjYOL10PYGjopJnuUpBjwshH2M0JWTuPV7WlRq/MR4WiuZv8kIrHfqBDc+3ZXK8VAqgw2wDN1/k=
X-Received: by 2002:a67:fb18:0:b0:44e:89bd:9a5c with SMTP id
 d24-20020a67fb18000000b0044e89bd9a5cmr1798913vsr.10.1695550149920; Sun, 24
 Sep 2023 03:09:09 -0700 (PDT)
MIME-Version: 1.0
Reply-To: razumkoykhailo@gmail.com
Sender: mrs.awabello305@gmail.com
Received: by 2002:a05:6124:1f23:b0:384:b127:1fc5 with HTTP; Sun, 24 Sep 2023
 03:09:09 -0700 (PDT)
From:   "Mr.Razum Khailo" <razumkoykhailo@gmail.com>
Date:   Sun, 24 Sep 2023 03:09:09 -0700
X-Google-Sender-Auth: SBhFuGuf38OKN20CQPFiT_oEfz0
Message-ID: <CAJpGuB8Fodx4a6_VEPGW-F9o5_k4VA8ANM=GNHO=g0k+3eLYNA@mail.gmail.com>
Subject: Greetings from Ukraine,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_USD,MONEY_FRAUD_5,
        MONEY_FREEMAIL_REPTO,MONEY_NOHTML,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:a32 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrs.awabello305[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrs.awabello305[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.4 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_NOHTML Lots of money in plain text
        *  2.4 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Greetings from Ukraine,

Mr. Razumkov Mykhailo, an entrepreneur businessman from Odessa
Ukraine. Within a year plus some months now, more than 8.2 million
people around the cities of my country Ukraine have been evacuated to
a safe location and out of the country, most especially children with
their parents, nursing mothers and pregnant women, and those who have
been seriously wounded and need urgent medical attention. I was among
those that were able to evacuate to our neighbouring countries and I=E2=80=
=99m
now in the refugee camp of Ter Apel Groningen in the Netherlands.

I need a foreign partner to enable me to transport my investment
capital and then relocate with my family, honestly i wish I will
discuss more and get along. I need a partner because my investment
capital is in my international account. I=E2=80=99m interested in buying
properties, houses, building real estates, my capital for investment
is ($30 Million USD) . The financial institutions in my country
Ukraine are all shot down due to the crisis of this war on Ukraine
soil by the Russian forces. Meanwhile, if there is any profitable
investment that you have so much experience in your country, then we
can join together as partners since I=E2=80=99m a foreigner.

I came across your e-mail contact through private search while in need
of your assistance and I decided to contact you directly to ask you if
you know any lucrative business investment in your country i can
invest my money since my country Ukraine security and economic
independent has lost to the greatest lower level, and our culture has
lost including our happiness has been taken away from us. Our country
has been on fire for more than a year now.

If you are capable of handling this business partnership, contact me
for more details, I will appreciate it if you can contact me
immediately. You may as well tell me a little more about yourself.
Contact me urgently to enable us to proceed with the business. I will
be waiting for your response. My sincere apologies for the
inconvenience.


Thank you!

Mr. Razumkov Mykhailo.
