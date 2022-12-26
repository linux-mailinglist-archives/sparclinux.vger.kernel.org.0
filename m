Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E407C65635C
	for <lists+sparclinux@lfdr.de>; Mon, 26 Dec 2022 15:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiLZO3s (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 26 Dec 2022 09:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiLZO3U (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 26 Dec 2022 09:29:20 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F3D398
        for <sparclinux@vger.kernel.org>; Mon, 26 Dec 2022 06:28:47 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1447c7aa004so12716867fac.11
        for <sparclinux@vger.kernel.org>; Mon, 26 Dec 2022 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAQ0rRgOIwazw63pnDUatro7Veua3gmC+nk5pGTehhY=;
        b=dS8oxJpO2/k69hMSwhoU/j3obHixW1sy7OkTCOMM5q7Bbb+YJDPOaTT/Ea+7qee6Ak
         /a8N8eMg6lUpJqRb9tRH/QqI9rJfwL4Mo8yC8FV/YB9IH7RBiC68Tzl89VXkodg3nBNw
         03Xxw0Uy7rE1MYyPoFYWfsRds9iWqju4/yzZqP8By9eEgaEprCVnNG/5ZiWvdt0pz5ZX
         +/SoF9IvERdwGrwTST9y1v0fqQKyyX79xrrx75y4WRH1ko4KATqz7wAl1qJOuiMufL+2
         1AOvIol9Y4E7Pxz3yUQmLe549S5FzD3q4cRB4sFn/fkCip3Qaan64tFvCNqshhwm+a1u
         IGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAQ0rRgOIwazw63pnDUatro7Veua3gmC+nk5pGTehhY=;
        b=zYudASejfKlblzXScazrKp6pj8QfCY51celPksSj9Qetm2I5TGKI0x3Tveyn8+EJ4a
         3BgT8eTa7pEO1VlIKis5ym3IdWWqH2GAUSku+Vf39X934XT9KktXIgNTAO61HNyfOYMi
         8c3mALTV8vrdraR+X/HVLaKu/zEbMzOM9C34JM2MPJIDO/8sM+r5G2snwYh7V0Xkog8D
         92BPI0TboB2ykxAugppdkN2Q0aTC3zrmaCPbPHvf+Hk+3LSIeTqzL5ocTQr8PgglMdG0
         Q6krj9w1XGMqWILRQooMHSJri2QnwM2mR7I7PwlQDqMGGpaq/i9wjgmg96wPY9Fj8pGS
         RxTQ==
X-Gm-Message-State: AFqh2kpI0EZL/otxylba3hVxcsacRoyWq6UEtf78xlmByEecQg0ECttS
        yx2h7KErga4nTqjOt1Fda0oHQibN9uJu+DYOhd8=
X-Google-Smtp-Source: AMrXdXtVW5m+Z/PIxR6DcPEB2oOZTJBtgvCujfG/gBhB48tlHGiYiS8v1tLK8rU5X57GYhFHmqOvJuLx0l7k9dGzbWw=
X-Received: by 2002:a05:6870:4b98:b0:144:d3fe:48ad with SMTP id
 lx24-20020a0568704b9800b00144d3fe48admr1329830oab.209.1672064926505; Mon, 26
 Dec 2022 06:28:46 -0800 (PST)
MIME-Version: 1.0
Sender: jamilacompaore91@gmail.com
Received: by 2002:a05:6358:b00f:b0:df:e198:d53e with HTTP; Mon, 26 Dec 2022
 06:28:46 -0800 (PST)
From:   Hamza Kabore <mr.hamzak252@gmail.com>
Date:   Mon, 26 Dec 2022 06:28:46 -0800
X-Google-Sender-Auth: K646_EN7k9tBMUX5n-6J1O8AUxs
Message-ID: <CANeeueLRSxFW7Lae0OPwnrrPvyjhVSCtEPhQF7PHR7DC+oGvrQ@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,NA_DOLLARS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello, dear friend,

This is Hamza Kabore, I'm a Banker and I want you to cooperate with me
for the transfer of a deceased customer's funds which is to the ton of
Twenty Five Million Five Hundred Thousand US Dollars.  Please contact
me for more details.

Kind Regards
