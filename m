Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A4C61DA3A
	for <lists+sparclinux@lfdr.de>; Sat,  5 Nov 2022 13:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiKEMjn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 5 Nov 2022 08:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiKEMjZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 5 Nov 2022 08:39:25 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F127175B4
        for <sparclinux@vger.kernel.org>; Sat,  5 Nov 2022 05:39:24 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id h206so5674118iof.10
        for <sparclinux@vger.kernel.org>; Sat, 05 Nov 2022 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=RIHC9n/dKVExSLG73bd8Y0TEFLCe8HTSL+2d7yE6D2NKhaBTGC77yJTmz2n+UQEoLn
         jxE36/CP2zWRsxdrbl6Qipo/1wujKwbWTegmQtKA5KaKY5c5k0uls/46uPweryK1Q/70
         p7KuiiXfJ0vih3FChZlrnOZ0SimajpgL+AXRNjZnSx1jbzFH5llJcPftmYgxT0KBp7aY
         Nvw2mfIN1dkT84jofHnK9dh7XMfTMquPbJMMLMjB0Dp08MAIB2DxhF8xAtCfYFVwsPDo
         kuNK/heTlVtwv9hHFhKrR/b4yxRwRja7vVsRsbB9inWGKh1FmpKXNdm91a1Uu/cF0CiR
         QmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=uxIgWKm6GS1rFIS7I8Mlq4+3m/KF6eCIeGGw1iuIYpFocG0nDXWbAovloP6DyT3FQY
         c8ahrD5LuW+mFzOw0evsglaQSHrRUyXUbI3RnOll3UX1uaIir9BnxU59Pc3NmsFnC/rh
         jnYqzpXX2FHHlF3HggScc7mHaH2fcLQ6RGAoi88E0UW072Le0DsYGnMhbpLSp4wBLU0j
         Kq66ocEMqxP2qVmhLMHusYmf3r3vqA2JVeRwa7XL6rTVd3biyV/q1aySZZqBQZxdNQVc
         mC1w0/zxXIwc5ZcHplrGEjYNXuOe2uxAfiSChcYC/V96Q12hcmwp/pfKg32OupUZcLyL
         ieFw==
X-Gm-Message-State: ACrzQf2JJk5VMw/nl+smvkr/zuF1UWa1X1/EdQlqVPUTmQ2wNX4xMeiw
        mIiSnB8JtV6Cy/2GKE9RG739tk4jIGn1sIpYoWE0fyXDVtc=
X-Google-Smtp-Source: AMsMyM7B0KgO1ePqgiznBJPxBFqW0p1QJVzP9XdnRybtCWEEA1+7r7SGcBMaZXE781qwVCHZ0F/UGDKN4buuMG8EUng=
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr34958534pgd.395.1667651947704; Sat, 05
 Nov 2022 05:39:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:39:06 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:39:06 +0300
Message-ID: <CAN7bvZKFRi6jCy913fp9Nu5T=uorMfPGun5ibm5bYqhSVn2ZFA@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
