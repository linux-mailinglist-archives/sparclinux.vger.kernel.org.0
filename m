Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67507522B63
	for <lists+sparclinux@lfdr.de>; Wed, 11 May 2022 06:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiEKEnf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 11 May 2022 00:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbiEKEnd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 11 May 2022 00:43:33 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F128FA0D09
        for <sparclinux@vger.kernel.org>; Tue, 10 May 2022 21:43:31 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d17so798263plg.0
        for <sparclinux@vger.kernel.org>; Tue, 10 May 2022 21:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=cATSTZkJ3ihDr7kmGJT5peIk4WzATgziNlLDQUaQF0UjlDqgoEEuGaUrbUqldJ31oR
         vabmbeFahRwl3lPbxxDBTmLTUVgtoY1muM2STFJtAzdS2/uSXQL/RgxLgwTMgi6wZC5y
         9jgvSsXhPDebEC+KeA4Yp5ZuYqS0IZCNAwEYvRF90XYQCKM/5RYtpKtYGDwmBfroTwaV
         1kjYRadfleXzzdkACPIOP5V24SpiU9H+uY4/l89+6jdTamZt/dBupBOYqgZ1ZOGcp0Kc
         rHgsvHxiWrGCkefizlgJ1/E5wTpZjYmPWzkULzoPVy/TUF5Wl3VJLwp8t2mpFTdixXxi
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=o9uJcJ/iOJA3KFEqTObwVLmUSVGJJrnoKJ88nwIQDVz6Aw3EDXtZv3DXqVLcKT17Ip
         XoFHLJUMqe9iBWBbA/0ZcBOA5q4PRExfNASGW1w7tx0yHxCofIDWwVC06kzTArdI/Jib
         cFinKfgA+LjfBQNNfXjo9hVePPwM1TzFF+JGNC2mMOjXpISvLr75b0JOoUIZpQU7HTJh
         QwJG+gg/S6xNN1DjF7x7CbvFrCkcu1LZhzed4GO9Evsk61LR60Sh5RlV3N296LXzb4oW
         rgaEhiw8ifftbifh/ySegb/Z+7y3InQ2iDhgKVMqgpf23qY+NSxROmX/EIgs/57ELRyh
         ddPA==
X-Gm-Message-State: AOAM530IbwmdZh95iMZWcgKVS64/9KbK8+ogWUIS7ZuDMvwkfepZoUOX
        5jhmPLuSzfDCF96J2DspwIFjd9vQ/v20AuFxHrM=
X-Google-Smtp-Source: ABdhPJxm5feB8ZFgWHkCEpggtBzqg6dLDwsr8iBU2Yy9cypEMDQj02HE7vMvH1ARhebCA2i8QIBvAnFPu1l+uxcE0Lc=
X-Received: by 2002:a17:903:2287:b0:15e:99b4:9b0a with SMTP id
 b7-20020a170903228700b0015e99b49b0amr23702716plh.43.1652244211258; Tue, 10
 May 2022 21:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:319:0:0:0:0 with HTTP; Tue, 10 May 2022 21:43:30
 -0700 (PDT)
From:   Private Mail <privatemail1961@gmail.com>
Date:   Tue, 10 May 2022 21:43:30 -0700
Message-ID: <CANjAOAjhJ4ieJMmzRZUBxfOb_bWq+QvWGKAj5_rzjwB5+n510w@mail.gmail.com>
Subject: Have you had this? It is for your Benefit
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Our Ref: BG/WA0151/2022

Dear Beneficiary

Subject: An Estate of US$15.8 Million

Blount and Griffin Genealogical Investigators specializes in probate
research to locate missing heirs and beneficiaries to estates in the
United Kingdom and Europe.

We can also help you find wills, obtain copies of certificates, help
you to administer an estate, as well as calculating how an estate,
intestacy or trust should be distributed.

You may be entitled to a large pay out for an inheritance in Europe
worth US$15.8 million. We have discovered an estate belonging to the
late Depositor has remained unclaimed since he died in 2011 and we
have strong reasons to believe you are the closest living relative to
the deceased we can find.

You may unknowingly be the heir of this person who died without
leaving a will (intestate). We will conduct a probate research to
prove your entitlement, and can submit a claim on your behalf all at
no risk to yourselves.

Our service fee of 10% will be paid to us after you have received the estate.

The estate transfer process should take just a matter of days as we
have the mechanism and expertise to get this done very quickly. This
message may come to you as a shock, however we hope to work with you
to transfer the estate to you as quickly as possible.

Feel free to email our senior case worker Mr. Malcolm Casey on email:
malcolmcasey68@yahoo.com for further discussions.

With warm regards,

Mr. Blount W. Gort, CEO.
Blount and Griffin Associates Inc
