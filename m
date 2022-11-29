Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F26C63C92F
	for <lists+sparclinux@lfdr.de>; Tue, 29 Nov 2022 21:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbiK2UU1 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 29 Nov 2022 15:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235356AbiK2UU0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 29 Nov 2022 15:20:26 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B46111173
        for <sparclinux@vger.kernel.org>; Tue, 29 Nov 2022 12:20:26 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id d6so23797762lfs.10
        for <sparclinux@vger.kernel.org>; Tue, 29 Nov 2022 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=khQUKJy5QTqMS02ZgUug6ZvJpGPRzKhqnVKP/ihMew714Twm4Vt0bJ1RDH7JkJx1vK
         QPIr+wY5mJdKsp4MTVnvr62BKuSqhUlw9YzOiwc6aSZn3RyMpwZRV8rPzsz02lndF6l8
         Z44IieKGZ9+wKPcb6Y9KU+TVD9LogV6bWt7ooUjlujuOtVx1m6gZG7ojogSZH0uNQ+Cj
         MpXwGwdcJbOjIH8AbYeYeHV03C2zw0NJI4DmUKbpFT+ixW0z/Kh2VFy58SxfviLi0BUQ
         KgVTqGuPZkNigtujnhrgPLmx9tpZAbOM+IF0FKtRRWJNP1sqB0c1+eg9FFvpZwFir8AW
         D7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=SQQJRK3GvmzX1mfvvItj89l6eWRVQel1c3s5lSzQrB8+/O3CtIdW+2yH2xksxphXIo
         JYIOtO2DoX4Va4bHqzaXpOiuxahJeNFrN4vnktSkHX6/wEGgkl7AbT+HrZpRP2rsd9AU
         32uKUWltcO6G1EQ2PNTCXTl58It55Z/MaO+2yDmvr1SriQcbS7PaPLGouXDhwm/wlQZd
         woscGbxOfRisxW4QKhPoeIN02vJ+gn1OcVqo7dTutiHgYDseY7CFvX7ySjUzELIJCj+v
         HsVVvtOK9I8KrjdWvFUf2L9NfKxsKpGfTg04gOFtbDb6nf1eYtq6fLJtWESJaaPJO5D+
         q4kA==
X-Gm-Message-State: ANoB5pkRHB7NmEwMtvUNHTvFndQzT0DyFZ98AbKJdGN1B314KZiUNJgp
        FLMSHocJjbPeap2iNDDbzkNdaR/fPOy7HnkRHqo=
X-Google-Smtp-Source: AA0mqf5lvI1ZDLITXh5wnUbdaaVhInlvl0S8nDoSQ5168883B7Eghk1zoYL79Emt0arAXgVojWBZdZToEFXHFH434hQ=
X-Received: by 2002:ac2:4e0a:0:b0:4a2:2aab:5460 with SMTP id
 e10-20020ac24e0a000000b004a22aab5460mr13813732lfr.62.1669753224182; Tue, 29
 Nov 2022 12:20:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6520:1d6:b0:22e:e610:6979 with HTTP; Tue, 29 Nov 2022
 12:20:23 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <chiogb002@gmail.com>
Date:   Tue, 29 Nov 2022 20:20:23 +0000
Message-ID: <CAHoLJnkGu+S8DpzcYVkTJt-WQCbZ2RHr9n1SS2ht3g44tusinQ@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
