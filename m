Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485BC752A10
	for <lists+sparclinux@lfdr.de>; Thu, 13 Jul 2023 19:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbjGMRzl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 13 Jul 2023 13:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjGMRzk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 13 Jul 2023 13:55:40 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2532723
        for <sparclinux@vger.kernel.org>; Thu, 13 Jul 2023 10:55:39 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-55c85b5321dso617046a12.3
        for <sparclinux@vger.kernel.org>; Thu, 13 Jul 2023 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689270939; x=1691862939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lcuq+6kjo4mMWqUyVwg1wc/5NDWoQqDRDI/cikwpMs0=;
        b=l+RUf9Sk1CRCyytEozXVY9Zh9d+5T2wtWB6i64A9tVvsjRLq53C8QWmIkid+xfjOBm
         FVrc/hxHiBHVvJNqbXXjO7H0OSyHNWJLO0Lw5POjXgWqFhp3PJ1BWCnQoJDZOqKaTXcM
         clsQhopvW5e8UTjlJT5c40ztVAWNyqOutqXWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689270939; x=1691862939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lcuq+6kjo4mMWqUyVwg1wc/5NDWoQqDRDI/cikwpMs0=;
        b=XwI1GkjFENr4voTiR9BPgolXKHN43Rme8bzz1XQ8tNzJxqIBAtUdFvltbV84VqoGT5
         F5DsHZIJDas9OOgcDY/LkdZRQxzohjgpTw2e4Z0dF2TPaoOGzyIp3TZnkFVuTRq1RqSL
         YzROK+87pfMWRDByqUHabDVa9abbKaQfp6Ww1iYBdcedUZS+b04bLmT1WoOBOYQiJ/S8
         sJ0fBc7Uq/OE/tCDxnrCOE1j7Nns0GiIxRdRfNgC7NXp5dh2G91OBe3DiSMLkpIed3bi
         I8HBgRmZ8Tq1muxvavnXX/M5d3Whe25/+xZQ+7fZLPxABwrg3fDN8ncI0W4CTNlolYx+
         Mm6w==
X-Gm-Message-State: ABy/qLa5kSHblSOaH6V3iDaULV+49eVKnox+jHDzulbUJ7gILtB+Q9zR
        SJTgzGPcEAOaC791mA7QeGZS1Q==
X-Google-Smtp-Source: APBJJlFYHuKuEyqMWU/5SUeyvRpObuEo7v28zKwULVZ+sKf0xVgPOHJPiIADeKbsuK6TyNC7Pu4/aw==
X-Received: by 2002:a17:90a:cb04:b0:263:3386:9da8 with SMTP id z4-20020a17090acb0400b0026333869da8mr1265390pjt.49.1689270939075;
        Thu, 13 Jul 2023 10:55:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w4-20020a17090a6b8400b00263fd82106asm6166532pjj.35.2023.07.13.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:55:38 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Mark Rutland <mark.rutland@arm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc: mark __arch_xchg() as __always_inline
Date:   Thu, 13 Jul 2023 10:55:24 -0700
Message-Id: <168927092021.199206.6500280471313894142.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628094938.2318171-1-arnd@kernel.org>
References: <20230628094938.2318171-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org


On Wed, 28 Jun 2023 11:49:18 +0200, Arnd Bergmann wrote:
> An otherwise correct change to the atomic operations uncovered an
> existing bug in the sparc __arch_xchg() function, which is calls
> __xchg_called_with_bad_pointer() when its arguments are unknown at
> compile time:
> 
> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko] undefined!
> 
> [...]

Applied, thanks!

[1/1] sparc: mark __arch_xchg() as __always_inline
      https://git.kernel.org/kees/c/ec7633de404e

Best regards,
-- 
Kees Cook

