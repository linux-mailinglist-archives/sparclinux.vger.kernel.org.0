Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A41E64C555
	for <lists+sparclinux@lfdr.de>; Wed, 14 Dec 2022 09:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237821AbiLNIyg (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 14 Dec 2022 03:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237818AbiLNIyf (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 14 Dec 2022 03:54:35 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C493E201A1
        for <sparclinux@vger.kernel.org>; Wed, 14 Dec 2022 00:54:33 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id tz12so20206179ejc.9
        for <sparclinux@vger.kernel.org>; Wed, 14 Dec 2022 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nuvBIf2lT6ew8E3Gonh9xI5Qgd+TLMqmI33+g9gdqOQ=;
        b=bXfQSWappV+oMt2zOE3D04ORvc8ThhcUJxSxqRQ4gCHBSw/1+N7zmTvjjQ7ai5RC3w
         LMpdn6X/ooh4wvUMAPVWFiswrqQ45GCXDOSZqrdV1UdxCGZMboYohVMo3w9MBqyLurwq
         LEeaCc9vw1uCdCKHiCN8HntOoTrWypJA/otzP+2HoMNV/fcBr/uMLib0MEQHePf4zJ1x
         +ziEnuNMJkUFiYQUUU3Q7g+BHWdiwHFHZp4XiB2b6heLPVMJCXjHrVyrPlQMkZRcbURu
         urjUNs/WevVoq90XxNM4AA+oodji8Wnh6TPRq3Y8zPzWWHrhG9UzXw96nAxEPF++Gyfs
         AlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuvBIf2lT6ew8E3Gonh9xI5Qgd+TLMqmI33+g9gdqOQ=;
        b=eAio+nrr5q2GB26/fk4sqVYS4CkCiFT+jdS5w94Zgg4uc4/jQvvgY9XWaDFhy8hoIq
         G5bMfjYAu5+HfwXVl6YHZenxuCFVa4AyeG2LSyUW/FJuf8g6Js6g59K6dqryVKEEhTNy
         mG8UuEvK0WqYcUtS6wXioBp5ypfMBlF1lCk5WICpVjIv6Cj9KDDrzKN1N12ROUJXVikr
         CaaxpNXCm9d9IpNjlJazVkmdACtkCQv/RvhG2FvXWfalD17nHGhnYsSG0cFIKLkr40Iy
         ltfGbjFdpZ4C134Oy2oc/YBxHSwOAzYfSCdZ70nUFi65zZm5zTDinCrjPq5wOdH509I/
         E/qw==
X-Gm-Message-State: ANoB5plbnRmisC1MoBREk6kbFzaRFnHpX6ZC4QUqc1SwrOsd6fs/uMnV
        w1Bj6OK1526G8iPP5LwPLwsHjRIdCEV6+dwApXk=
X-Google-Smtp-Source: AA0mqf6pibOZ2TQg1vu59P3kuuPg1G3kivHuCyYckjMgWXKI6Htbs787eHUVcx4yxB6kcrwHULCA4YSGOHjlC1Mfj6E=
X-Received: by 2002:a17:906:52c8:b0:7ad:ba1e:1bac with SMTP id
 w8-20020a17090652c800b007adba1e1bacmr82867865ejn.528.1671008072266; Wed, 14
 Dec 2022 00:54:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:3b6:b0:27:90e6:e1d1 with HTTP; Wed, 14 Dec 2022
 00:54:31 -0800 (PST)
Reply-To: plml47@hotmail.com
From:   Philip Manul <alomassou1972@gmail.com>
Date:   Wed, 14 Dec 2022 00:54:31 -0800
Message-ID: <CA+_U6tiP-MF=py7x22n-YPNUasJK19kieMgXxQ-mSY1ZSX35mQ@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.5 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNCLAIMED_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:631 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [plml47[at]hotmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alomassou1972[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alomassou1972[at]gmail.com]
        *  2.4 UNCLAIMED_MONEY BODY: People just leave money laying around
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.

***************************************************

Good day,
My name is Philip Manul. I am a lawyer by profession. I have a
deceased client who happens to share the same surname with you. I have
all paper documents in my possession. Your relative my late client
left an unclaimed fund here in my country. I await your reply for
Procedure.
Philip Manul.
