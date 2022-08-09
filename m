Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202C958E21C
	for <lists+sparclinux@lfdr.de>; Tue,  9 Aug 2022 23:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiHIVso (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Aug 2022 17:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiHIVsZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 9 Aug 2022 17:48:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70CD6BD50
        for <sparclinux@vger.kernel.org>; Tue,  9 Aug 2022 14:48:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bq11so18790741lfb.5
        for <sparclinux@vger.kernel.org>; Tue, 09 Aug 2022 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=hnUM0lzwulX2q1QwimZooJGSc8HzCb0oOd/8o0YSo68=;
        b=d5iXNMRSR7DdwL+4b1EIe35BeltYfbYpKYRkgqKuUtbv0iGW+B2UONtvUHqeMPzuh4
         1fO9irpcAnzgZgFgVpZY8wBE9iquJMoecud/wmnUXWdmdosKm3ZMjRr48VemhiSm8N1n
         rSGV339f33mBmAMDwA6koFBIGp2l5Hs/il8VNMIHLW5umFjOFgjkFmS+LhGxUX2bVqBk
         fboM8herKzjFXpi7nr0L+aiie8ZMkh8svWmfj3S92qly4st+29EOt/lYgHZqF4204Txb
         x+wf9kUSJA6R9lrlDo+3yHm5RCxCJrZUANwiZQvVBVntvQINJRrizx2CaHkRGh/aN9Zl
         M1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=hnUM0lzwulX2q1QwimZooJGSc8HzCb0oOd/8o0YSo68=;
        b=3P+uHbD2zST8fZJWdv5/5romkfCoMNH+DxTK8xKscD14H9kudAmO2eslCu4ws3dnZN
         qVqWknNLYshkzHEMPvMR1wsBDTehS//jzFqwCl9T/AkR1EthZ5McrBDxaV+IMmOV/US3
         TBxUTh/2t7FnjN/qU6TLQtxbkPvOQVmF2kVFHCCM5rb533sgZuNiYvF4auQNNimeTY4f
         lg6nZmNzmlJ/FQk3Jv3nhBbBThI9WebKVmAi/lFrfDMC9H3NcXdhtXczkOhnvE0/pKKa
         M82vPNRMB7m9afU/aIvG+W1sR0GAxelSVwxjGzYTJzOqWnhV/OqKdNDtx1lYL08VZNXE
         vzhw==
X-Gm-Message-State: ACgBeo1la3SkS3/dJW7tmzUgzc7fORrSPyM1qUiigR7IlB0izF4pSu4d
        bsREaPztkkhIbvmD9SvA3LmC7GPWm6i7O7f8TVE=
X-Google-Smtp-Source: AA6agR7fkJ/PLa9Ggrmw42Od/I3tnNtghRru02NLcOokPXUhlCEwVqOXv9r7fKOZj4+dF9ofJIp6IUCPywLlRzmsq8c=
X-Received: by 2002:a05:6512:304b:b0:48b:4a82:4d3f with SMTP id
 b11-20020a056512304b00b0048b4a824d3fmr7062991lfb.314.1660081701973; Tue, 09
 Aug 2022 14:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:1985:b0:1d9:6119:6b37 with HTTP; Tue, 9 Aug 2022
 14:48:21 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Mr. Yakubu Abubakar," <yakubuabubakar1884@gmail.com>
Date:   Tue, 9 Aug 2022 14:48:21 -0700
Message-ID: <CANt38euj1Ts2NZB-55isqC-sMDQ04cd2XnTngVrbGmy3Mpjiiw@mail.gmail.com>
Subject: Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [yakubuabubakar1884[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yakubuabubakar1884[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
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

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

My regards,
Dr. Yakubu Abubakar..

Sincerely,
Prof. Chin Guang
