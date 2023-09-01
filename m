Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886C978FC57
	for <lists+sparclinux@lfdr.de>; Fri,  1 Sep 2023 13:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349194AbjIALfk (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 1 Sep 2023 07:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjIALfk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 1 Sep 2023 07:35:40 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA61E10FE
        for <sparclinux@vger.kernel.org>; Fri,  1 Sep 2023 04:35:34 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401b393df02so19418785e9.1
        for <sparclinux@vger.kernel.org>; Fri, 01 Sep 2023 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693568133; x=1694172933; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9kydyMnwD//o0quRqImkimRYfrWW9k+FT8t/oHoxyE8=;
        b=Y8waq5/QqJTRXI2KLW8v1Amkv912sPy5ZWhi3vkjLolc18KkbqipKxHoe9/OkWL2WF
         fJaFLvP3yFNaJL40Orqqdd3wGh01suNrbul08zjRFhv974AhEMOxv8S9WPaKcfG9IS6J
         rIb/zszzcJhSJJBk0lPFDqgx/WfCMCM7c3/f22gwUfDZuRkBJRmivEO/iPmFMOh4wlBg
         LV8F7RsOvi0h8xHVCqkamA7hgLzi9s1IsUpKG9eWk3pnBiR+qwSLC8wDbSTQDgZ1KtR4
         tQeWQByZTthImmK2iZ8+xEhl/uB1KDkcP6BxPzVZl3Ipr478P1o1HIc9XwuEPzAytag9
         hmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693568133; x=1694172933;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kydyMnwD//o0quRqImkimRYfrWW9k+FT8t/oHoxyE8=;
        b=CQJPYSiQYyJxuS4pb8c6riNfhyMyXm4Ds7pgJ53KK0sz3AheZud/c7TufTROMhOnhE
         4rA0UjSxE5nrgXmKXySZO8qFUNv2pswTLEaNTmETXAaSkAdte4DYRU/BNcnYAXsRLysN
         gZjERmqlwEO6rs/nv5xLM0ikAbnUax2TpmLuW2OdhK+t1h6256gq05V1w1+VpFnLAnQv
         m9YEr6G9VzAv/Xy/02H6ZqyePF4E93neWxUs8G2UXZp4YvGgo8HBI37H01HSTW9ifXIG
         iEqRjJJjkhnh3yqR1Ft1yjaAQcSm6BINHHVroUfX3pz6w2hNCy83yEPFnPFbVAAQYWZP
         vw2w==
X-Gm-Message-State: AOJu0YyurbuHvAZadOCQcO/Ega+p6BfnCKoEqVFgTyUQPDgj4VSzMLR4
        pSS2hCJG9bxn+FPhcsz75aUq5qfk3C2b+VGVV/4=
X-Google-Smtp-Source: AGHT+IEC7W8DVcoFQ6w8yFFLoQjzjFa6x9QSZec9fUXkX1ySagEEUp8PeLVQ350FoveitWpFEJ44Em3k4lpuT7Pfazo=
X-Received: by 2002:a7b:c8d1:0:b0:401:d258:ad3d with SMTP id
 f17-20020a7bc8d1000000b00401d258ad3dmr1716577wml.2.1693568133145; Fri, 01 Sep
 2023 04:35:33 -0700 (PDT)
MIME-Version: 1.0
Reply-To: razumkoykhailo@gmail.com
Sender: mrmaxwelljohn@gmail.com
Received: by 2002:adf:d0c4:0:b0:31a:d3d8:8de4 with HTTP; Fri, 1 Sep 2023
 04:35:32 -0700 (PDT)
From:   "Mr.Razum Khailo" <razumkoykhailo@gmail.com>
Date:   Fri, 1 Sep 2023 04:35:32 -0700
X-Google-Sender-Auth: UtCXIS9vNI7VsWicBoNsUkWJuy0
Message-ID: <CACqMf7AWeA3+SqB76j9YLqJyjL9w71yE3oaMD67Ccaw1BJiJ6Q@mail.gmail.com>
Subject: Greetings from Ukraine,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_USD,MONEY_FREEMAIL_REPTO,MONEY_NOHTML,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

R3JlZXRpbmdzwqBmcm9twqBVa3JhaW5lLA0KDQpNci7CoFJhenVta292wqBNeWtoYWlsbyzCoGFu
wqBlbnRyZXByZW5ldXLCoGJ1c2luZXNzbWFuwqBmcm9twqBPZGVzc2ENClVrcmFpbmUuwqBXaXRo
aW7CoGHCoHllYXLCoHBsdXPCoHNvbWXCoG1vbnRoc8Kgbm93LMKgbW9yZcKgdGhhbsKgOC4ywqBt
aWxsaW9uDQpwZW9wbGXCoGFyb3VuZMKgdGhlwqBjaXRpZXPCoG9mwqBtecKgY291bnRyecKgVWty
YWluZcKgaGF2ZcKgYmVlbsKgZXZhY3VhdGVkwqB0bw0KYcKgc2FmZcKgbG9jYXRpb27CoGFuZMKg
b3V0wqBvZsKgdGhlwqBjb3VudHJ5LMKgbW9zdMKgZXNwZWNpYWxsecKgY2hpbGRyZW7CoHdpdGgN
CnRoZWlywqBwYXJlbnRzLMKgbnVyc2luZ8KgbW90aGVyc8KgYW5kwqBwcmVnbmFudMKgd29tZW4s
wqBhbmTCoHRob3NlwqB3aG/CoGhhdmUNCmJlZW7CoHNlcmlvdXNsecKgd291bmRlZMKgYW5kwqBu
ZWVkwqB1cmdlbnTCoG1lZGljYWzCoGF0dGVudGlvbi7CoEnCoHdhc8KgYW1vbmcNCnRob3NlwqB0
aGF0wqB3ZXJlwqBhYmxlwqB0b8KgZXZhY3VhdGXCoHRvwqBvdXLCoG5laWdoYm91cmluZ8KgY291
bnRyaWVzwqBhbmTCoEnigJltDQpub3fCoGluwqB0aGXCoHJlZnVnZWXCoGNhbXDCoG9mwqBUZXLC
oEFwZWzCoEdyb25pbmdlbsKgaW7CoHRoZcKgTmV0aGVybGFuZHMuDQoNCknCoG5lZWTCoGHCoGZv
cmVpZ27CoHBhcnRuZXLCoHRvwqBlbmFibGXCoG1lwqB0b8KgdHJhbnNwb3J0wqBtecKgaW52ZXN0
bWVudA0KY2FwaXRhbMKgYW5kwqB0aGVuwqByZWxvY2F0ZcKgd2l0aMKgbXnCoGZhbWlseSzCoGhv
bmVzdGx5wqBpwqB3aXNowqBJwqB3aWxsDQpkaXNjdXNzwqBtb3JlwqBhbmTCoGdldMKgYWxvbmcu
wqBJwqBuZWVkwqBhwqBwYXJ0bmVywqBiZWNhdXNlwqBtecKgaW52ZXN0bWVudA0KY2FwaXRhbMKg
aXPCoGluwqBtecKgaW50ZXJuYXRpb25hbMKgYWNjb3VudC7CoEnigJltwqBpbnRlcmVzdGVkwqBp
bsKgYnV5aW5nDQpwcm9wZXJ0aWVzLMKgaG91c2VzLMKgYnVpbGRpbmfCoHJlYWzCoGVzdGF0ZXMs
wqBtecKgY2FwaXRhbMKgZm9ywqBpbnZlc3RtZW50DQppc8KgKCQzMMKgTWlsbGlvbsKgVVNEKcKg
LsKgVGhlwqBmaW5hbmNpYWzCoGluc3RpdHV0aW9uc8KgaW7CoG15wqBjb3VudHJ5DQpVa3JhaW5l
wqBhcmXCoGFsbMKgc2hvdMKgZG93bsKgZHVlwqB0b8KgdGhlwqBjcmlzaXPCoG9mwqB0aGlzwqB3
YXLCoG9uwqBVa3JhaW5lDQpzb2lswqBiecKgdGhlwqBSdXNzaWFuwqBmb3JjZXMuwqBNZWFud2hp
bGUswqBpZsKgdGhlcmXCoGlzwqBhbnnCoHByb2ZpdGFibGUNCmludmVzdG1lbnTCoHRoYXTCoHlv
dcKgaGF2ZcKgc2/CoG11Y2jCoGV4cGVyaWVuY2XCoGluwqB5b3VywqBjb3VudHJ5LMKgdGhlbsKg
d2UNCmNhbsKgam9pbsKgdG9nZXRoZXLCoGFzwqBwYXJ0bmVyc8Kgc2luY2XCoEnigJltwqBhwqBm
b3JlaWduZXIuDQoNCknCoGNhbWXCoGFjcm9zc8KgeW91csKgZS1tYWlswqBjb250YWN0wqB0aHJv
dWdowqBwcml2YXRlwqBzZWFyY2jCoHdoaWxlwqBpbsKgbmVlZA0Kb2bCoHlvdXLCoGFzc2lzdGFu
Y2XCoGFuZMKgScKgZGVjaWRlZMKgdG/CoGNvbnRhY3TCoHlvdcKgZGlyZWN0bHnCoHRvwqBhc2vC
oHlvdcKgaWYNCnlvdcKga25vd8KgYW55wqBsdWNyYXRpdmXCoGJ1c2luZXNzwqBpbnZlc3RtZW50
wqBpbsKgeW91csKgY291bnRyecKgacKgY2FuDQppbnZlc3TCoG15wqBtb25lecKgc2luY2XCoG15
wqBjb3VudHJ5wqBVa3JhaW5lwqBzZWN1cml0ecKgYW5kwqBlY29ub21pYw0KaW5kZXBlbmRlbnTC
oGhhc8KgbG9zdMKgdG/CoHRoZcKgZ3JlYXRlc3TCoGxvd2VywqBsZXZlbCzCoGFuZMKgb3VywqBj
dWx0dXJlwqBoYXMNCmxvc3TCoGluY2x1ZGluZ8Kgb3VywqBoYXBwaW5lc3PCoGhhc8KgYmVlbsKg
dGFrZW7CoGF3YXnCoGZyb23CoHVzLsKgT3VywqBjb3VudHJ5DQpoYXPCoGJlZW7CoG9uwqBmaXJl
wqBmb3LCoG1vcmXCoHRoYW7CoGHCoHllYXLCoG5vdy4NCg0KSWbCoHlvdcKgYXJlwqBjYXBhYmxl
wqBvZsKgaGFuZGxpbmfCoHRoaXPCoGJ1c2luZXNzwqBwYXJ0bmVyc2hpcCzCoGNvbnRhY3TCoG1l
DQpmb3LCoG1vcmXCoGRldGFpbHMswqBJwqB3aWxswqBhcHByZWNpYXRlwqBpdMKgaWbCoHlvdcKg
Y2FuwqBjb250YWN0wqBtZQ0KaW1tZWRpYXRlbHkuwqBZb3XCoG1hecKgYXPCoHdlbGzCoHRlbGzC
oG1lwqBhwqBsaXR0bGXCoG1vcmXCoGFib3V0wqB5b3Vyc2VsZi4NCkNvbnRhY3TCoG1lwqB1cmdl
bnRsecKgdG/CoGVuYWJsZcKgdXPCoHRvwqBwcm9jZWVkwqB3aXRowqB0aGXCoGJ1c2luZXNzLsKg
ScKgd2lsbA0KYmXCoHdhaXRpbmfCoGZvcsKgeW91csKgcmVzcG9uc2UuwqBNecKgc2luY2VyZcKg
YXBvbG9naWVzwqBmb3LCoHRoZQ0KaW5jb252ZW5pZW5jZS4NCg0KDQpUaGFua8KgeW91IQ0KDQpN
ci4gUmF6dW1rb3bCoE15a2hhaWxvLg0K
