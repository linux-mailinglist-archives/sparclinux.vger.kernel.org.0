Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA47770DD9
	for <lists+sparclinux@lfdr.de>; Sat,  5 Aug 2023 07:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjHEFIl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 5 Aug 2023 01:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHEFIk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 5 Aug 2023 01:08:40 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E423F4ED8
        for <sparclinux@vger.kernel.org>; Fri,  4 Aug 2023 22:08:39 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-585fd99ed8bso55645747b3.1
        for <sparclinux@vger.kernel.org>; Fri, 04 Aug 2023 22:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691212119; x=1691816919;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=lHpxs7Mwc9rtpDwYj1Jofg7DiVt5V/6/frN2hvz1fe9OAhY/6nWjCsI9ULm5L7dQX7
         /xaI6s7LuirLqfzmvxm9229YNSr5KI0HJxzgaCakRy5kbIzZbsi/nueC1+kzyvB4OxQY
         jrhJw5t2O0GLygSHk1DrJd9Hg20EFB/8i+E9fU+3nESRaHGcBFBkDH7wu3xmnDLAJFEx
         nMB2LF9T6+F3gxLj0DMv0nkvr8GZow2Pj7TshAEBzIWPD82OtIju+cjwWa/IifeN3MnK
         hAv9sEntDUPfVMr1a4PgfCxaX66DkrLoGr6t3MYf6cpwE2z+winp5BmTOR5P4UUgfLrC
         hpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691212119; x=1691816919;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=EZC4vTxdhotaCqdGsojEmDNp5VljOVNNM14VOpV+cW4cTulOh5jFg0NKa8eCvlF6Te
         Sl5T6F4flBUQEQoR3a2uK7hjg+V9/gEjl+kN9+5UPCJVlO4JwYvTMVrUxquT1sSx7qWL
         HZOhuvmEHIpWjBpm/IZ2jNNOJW/tZ7+cqhaZVYpxwTUCCa8eZK/hKcD2jxK4wPKADWUF
         +PZ8awOIRWz/4cOX0nxwp2/ZgtO43WbaM7qGMKiiw4YVfF0YuKl1pR0Eg9IGSB/uAgc1
         w8ZWj5HpatCC3gEMfS8VJ92B9uc4byglRvWBhzVBaA5AqT5x5G1euPJjK28u7JHT5e+G
         9puA==
X-Gm-Message-State: AOJu0YwSWhB0TPqMaab+33SP4w1b7aYPbvHVbvaR0IENQNTGq093G7+7
        VPTajKfqyYRZQxQCUc3sFzTTH69XXfuGLcI7srg=
X-Google-Smtp-Source: AGHT+IGC51iH5lLkgsdf+GEBJ0ZJq55wYKAK1z0tTqNd4aH8aIYSGJHy/3p9B2Jhle/ajfLf6Hl+CUi2WyuGD3MfkPM=
X-Received: by 2002:a0d:dd08:0:b0:583:9db5:7e89 with SMTP id
 g8-20020a0ddd08000000b005839db57e89mr1823041ywe.24.1691212119124; Fri, 04 Aug
 2023 22:08:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6254:b0:377:d5d4:4eb0 with HTTP; Fri, 4 Aug 2023
 22:08:38 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <gatotusb@gmail.com>
Date:   Sat, 5 Aug 2023 06:08:38 +0100
Message-ID: <CALyoYrNxMECyZtc8ch_Xpad9Td7RjJePNDVvotgv9i0LHSQRpQ@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
