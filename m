Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8EE63C931
	for <lists+sparclinux@lfdr.de>; Tue, 29 Nov 2022 21:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbiK2UVa (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 29 Nov 2022 15:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbiK2UV3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 29 Nov 2022 15:21:29 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1912662
        for <sparclinux@vger.kernel.org>; Tue, 29 Nov 2022 12:21:29 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id fy37so36501891ejc.11
        for <sparclinux@vger.kernel.org>; Tue, 29 Nov 2022 12:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=NCdvtJveHDYFqzUSKnhMRlpxiMaloDGt/VpZEwPBQhjQMXUBWdnaYDjqlXrbg+Bikl
         FKSgttC7iaOmfhSEF008UFCXLlQxo2EwPt/Fad2W2xWj6oKPBSnTPaxqLrPTiomtnKtO
         ur0+U8h7iHUwHaycqReg0t0CMc1Dszu/SLG/8eCgpoN0USvRyjwqzLuOEKoI8t0f9mlg
         g3elQGqk8d8B1w5+Y32fux/b7kFF0/QD3IBevKg59D9gi88gbe5N8cT3zu85UD9r7W0V
         tJEyBOSuRU7DlkfVm7ySxjJTo33yivwbsJhjNcGj2jUbOR5AB2zC5zYVa95MlVRrZbr3
         DwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=gwxX5jvZGldRqkWZW9F+xkk+x5x3KQH7coTCHGwkm/HvHdBm/19VLsSb+n8e2Sfg9g
         a0Yyj0z8hZGIIUvpZDb9UOotWFnv10GFxH9P67ZdPZovvGckaUkj/RdNOPJZRSZEcoX7
         733ybF9zQXzJOoyWt5+jfz41VuK7yBtLWLFLFlvWHn1uE9XnOttzPfygxph8qIZJVz1Y
         FOTFSGVlRYKDRTvtPpfzDEoAONiiwLBqqgo5Adqb5WE6BZ0GNcJ6SDYjWmUl/tbcXDuQ
         yEAjaSx0OOwmNtDLfjRWB8b0tqJrM7ElSkLVkZWCKhQYj8UPxbrxwldgphnsu17PRqbR
         NF9g==
X-Gm-Message-State: ANoB5pl6DGjdhcgS0sRqhOzoPR7s+Ukv0dT6696twwn5VfU3sq6PMZJd
        l8TzXvDnmBJKtoBnmTXlV8eInDstzh1Dh+C4AJ8=
X-Google-Smtp-Source: AA0mqf5+auc+byiHC0rSIpN0xdxvm0HS8q7hFcXAT+IBk2Hh61ZU8jPNCbiXQ9nYEoYcn4h0bcsglNpWmAPyV5wo+0E=
X-Received: by 2002:a17:906:1d59:b0:7c0:5496:4f1b with SMTP id
 o25-20020a1709061d5900b007c054964f1bmr8915717ejh.715.1669753287568; Tue, 29
 Nov 2022 12:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:bfe7:b0:78c:cad3:6a2f with HTTP; Tue, 29 Nov 2022
 12:21:26 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <chiogb003@gmail.com>
Date:   Tue, 29 Nov 2022 20:21:26 +0000
Message-ID: <CABa6Gn=-hQGaeUozi=1PmGLoywO6sMGqRWVc8NVxm7AkJKYXBg@mail.gmail.com>
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
