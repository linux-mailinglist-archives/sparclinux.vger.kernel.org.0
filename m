Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865EB62120C
	for <lists+sparclinux@lfdr.de>; Tue,  8 Nov 2022 14:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbiKHNNV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 8 Nov 2022 08:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbiKHNNV (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 8 Nov 2022 08:13:21 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1BC26D0
        for <sparclinux@vger.kernel.org>; Tue,  8 Nov 2022 05:13:20 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so8324348otb.8
        for <sparclinux@vger.kernel.org>; Tue, 08 Nov 2022 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=L+H+LLk3IEl0QUEASJHNzq9jDVQxwg5kFruUMuksofzkgp31CLKSXi+hAlsaX/7dzH
         hhkMOBN40RAIXZ8gnWbbHp/qM1SNIqQEZpDMCrOEC3hKH05C7fJWclPUTJGHQwX44t/w
         pgMlaYQmc6w0IJ0rXBrKV3uYuZg7OK8kIVMQzBZp6aylzwNkWdWaAGTxRb2GsQHvMAL9
         fzmq5NCSpknFaKbSiRi3SQHJB6JKlbxUMVmBfS1a9Aqv5oo5vhOmK/glY1HDYadvZg2r
         752Yqa9xqghSfPIt5wT8xFMKYq8qzoepsq8Kk8GlJbNKKxp2ZXb5yPe2ukGTwgs5bSgL
         /FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=oCstmxspBx48GZaFal/cLOtmjrwO3GCjmsxYYsw6kXnnb3aVKqNj3m2q9UFjvJcJNR
         oDLdmrBqD6V2svINuHByTn9ul0Bf/vYE+eUQos9jjplz24RQjqvzMhgikP5fCwGiRdCm
         cmymEzGcyt/KwvMu62Q6iSrWk9eq+3uLlI0qTfC4c5EApqLFLixQ7zng+dlhTwQ0zgjn
         lE5ha9HolLTyN9GOxPfnVBdU2fB4RZwa2z3N7W1/AYrwsxD6dhMbZAEfnQIh7zGaM9GL
         h9rNX1XVdlzxEMs6Zdj3bKLnODNGVLSfs1Dl9KQbHWqxcMdxfm38E993tSt4oxmSFRiV
         hpUA==
X-Gm-Message-State: ACrzQf1lLzdWEtMYxR+TKmyoQRA9KxODCP1QAlyyaGrbrdaH428bJHRR
        APCFJAtrOVGF6yPYjsExPfSi4sMAasmBi4Tj5/E=
X-Google-Smtp-Source: AMsMyM6wx2JXaNJ8Kk7Ri6D0tKFf5xYtIGvuM8IzPIS1mrRwupsgdylUuFE3hxL2y0Na5lNQsxUweEHThEVxztefPwU=
X-Received: by 2002:a9d:22a5:0:b0:66c:358b:3931 with SMTP id
 y34-20020a9d22a5000000b0066c358b3931mr27097040ota.79.1667913199419; Tue, 08
 Nov 2022 05:13:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6802:1a2:0:0:0:0 with HTTP; Tue, 8 Nov 2022 05:13:18
 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <mrdavidkekeli@gmail.com>
Date:   Tue, 8 Nov 2022 13:13:18 +0000
Message-ID: <CAMqe2pBpX25HKNqfwQ0R2RbcSwBfgnyje1MmkZiNG=3yX2-23A@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
