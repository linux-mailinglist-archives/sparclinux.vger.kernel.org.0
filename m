Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C99E591FD4
	for <lists+sparclinux@lfdr.de>; Sun, 14 Aug 2022 15:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiHNNFR (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 14 Aug 2022 09:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiHNNFQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 14 Aug 2022 09:05:16 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8148CDE
        for <sparclinux@vger.kernel.org>; Sun, 14 Aug 2022 06:05:13 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id c22so2598938vko.7
        for <sparclinux@vger.kernel.org>; Sun, 14 Aug 2022 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=KcJZiL45yzQDEShEJd1Ul6gAMZyt0zyOXPhDRSlmEsUux04a3A9PPE4bLA1l0bdF/2
         He/UaQamPIjKiKjT03/Oh6JTQJDiZ1nHJVy25QK1DmLtB7gWzuwEcmdJ0k1RSUhnC4LK
         6EbUwAnskx+i1C/aX9jwvMqOQDBZyhuRrxpXakQ3ksDPAMMmIdbGSWMMLJxZ5h1RavMs
         R4VUujdrO0CbLgCYhOw7UThh9rluHSkz1AOWC+jyANQNPg4gfnihy1rZ3wbdCIariZO/
         yLU692pa4Nn0mB8st/zmaAc+TByKxMucbLg4Lmytl7XFiiXsH7+lvtabnHW56rQJchtc
         GfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=Hz6OV8XaNKDJH94pdCnx9i5DaZEk1zBc6JYLZPcIPqw84qbmRDjI5wEcSI1OgEBUOB
         IGlbdakmNLSt7MCKhNzQ2crQE31+i4XQJowB5j9JkqQ6Lw80NkmvMfJ676iXtnipm8+d
         VH9yf3hrYarJsuNrmtZb5KUcAZ0DadOQbvTpf9tD/Z7Z8PHwP0Mb7T/LOo5S7Khq63Od
         MRT9n6sxvbanPT7IZYoOL7pG6vbLljEZHmbM9fT576AFov03KL538i09S/6X6X6VG+R8
         pN1i1BDjcB/WB9i79FVVllTwYGlnaTPUyO+6jYmcr1fknxNVYi4649csw93AmyCMN4dq
         xF+A==
X-Gm-Message-State: ACgBeo2xNCPJxxm3N4RE41XPR718NNgIiGAt4B4/hM0QunTjJ8bCkY3i
        OEBLs0IH5LEkRAJBtBCdEAOUdUmztu0BS6JXozY=
X-Google-Smtp-Source: AA6agR40jta7AflgO97ob2p3FMeRVYfptfYHtORrNAdeWR2zTPWcE8HWSrj6iIfimUR0ipeLkNCuq6edZz/1n0C/YDk=
X-Received: by 2002:ac5:cdd4:0:b0:377:2e13:3512 with SMTP id
 u20-20020ac5cdd4000000b003772e133512mr4840252vkn.3.1660482312396; Sun, 14 Aug
 2022 06:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:bccb:0:b0:2e3:2993:9240 with HTTP; Sun, 14 Aug 2022
 06:05:11 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <tw44015@gmail.com>
Date:   Sun, 14 Aug 2022 05:05:11 -0800
Message-ID: <CABtpmn0dmDhQf9G-EPCpDv=YzaPstdAKJwzZ2pc1Mu4nMFJUXQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tw44015[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tw44015[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
