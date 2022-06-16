Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40CE154D4E0
	for <lists+sparclinux@lfdr.de>; Thu, 16 Jun 2022 00:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238630AbiFOW4g (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 15 Jun 2022 18:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349807AbiFOW4f (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 15 Jun 2022 18:56:35 -0400
Received: from mail-vs1-xe68.google.com (mail-vs1-xe68.google.com [IPv6:2607:f8b0:4864:20::e68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8B12AD3
        for <sparclinux@vger.kernel.org>; Wed, 15 Jun 2022 15:56:34 -0700 (PDT)
Received: by mail-vs1-xe68.google.com with SMTP id r12so13170929vsg.8
        for <sparclinux@vger.kernel.org>; Wed, 15 Jun 2022 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rachmadbagus-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=PojBdEXHZ8rzVaM72fh3gUXF7qKQqZdA90U6AbN86kE=;
        b=U9MTFaTllvrGnifBbvMuvy8inVbJGxSuoFHQBZDBKDeBD2k4wP8pa32xnZGyjM33Rt
         VTLOteWxGcda1vSDr2JMXUMrABPoZi3nAuyuhHUpmHkc/Mhh6GdBSudKa7JViVnp6OCk
         rWhWxl/hrHEYEBkTxGfoMTJxlSA3exFL6ADnYBtQlfL81m4QlxUAbtyX/tx5JSDNeFUn
         Br5N+9LJIKJgH9s8ubdh2RPa69mb6VifkMtL7DqhLSsIUYB8ZcPkI4JiAOExeJm1f2lW
         xDHU1XpuEjlxAB72uj+Ldx8v4e3iQ50F37T2qy80duhE8hBoZrpI48Q9l8stuoZ+68T/
         TO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=PojBdEXHZ8rzVaM72fh3gUXF7qKQqZdA90U6AbN86kE=;
        b=lP3BW6r08SIBqtB7sovhE6q6fdROqp8+ms2ye0648pn/1wSc08tBxQzzYSWHJ1bnWc
         WdIYciOrlc+B9sSsmlRuA8pxjzbEHbB8NvAoDBwTE0ll8UaM6zukt/v+JrGt5cHtN6g5
         XAp0jNAsL2rYpPpGKo+l/kpWZ85L+d46Vn9M9RPlnOD6tW3bRilzywFpWwC5pVhzbigo
         iOtjzLFwEQmxYD4nNQHcYdhRrMu/JfjrSNotYsL3HxFWi871dAmtAPsXqK5mm/qMCTez
         mMcZt+grFNPJNoLsAXwPZDb5YasNoLZAKPQaAtWH+mJF9V02yWJq1qGv0BiZLx7jzHXj
         hxLA==
X-Gm-Message-State: AJIora9dvLdFeG2j0lk4QfD61Xz/bf/EkNe81R1wpzb/084xCpB//eqk
        vMgpfFilQlSk64limsTouRc+ct4zbgDanBM1c27EcPPJbK/8PQ==
X-Google-Smtp-Source: AGRyM1seufqDgDNKR+iLXJf9dqp/xnPQPPXhU7zkSf/zM8ca8HN8BTHQdlI/boOL1FjpwIb4wXF+YuIn3FJS
X-Received: by 2002:a67:c20f:0:b0:349:d296:26b0 with SMTP id i15-20020a67c20f000000b00349d29626b0mr1259367vsj.48.1655333793209;
        Wed, 15 Jun 2022 15:56:33 -0700 (PDT)
Received: from [103.114.217.161] ([103.114.217.161])
        by smtp-relay.gmail.com with ESMTPS id q8-20020ab02b88000000b003626f896607sm23153uar.6.2022.06.15.15.56.33
        for <sparclinux@vger.kernel.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2022 15:56:33 -0700 (PDT)
X-Relaying-Domain: rachmadbagus.com
Message-ID: <62aa63a1.1c69fb81.7f95d.14e7SMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: URGENT RESPONSE NEEDED
To:     sparclinux@vger.kernel.org
From:   Mr <admin5@rachmadbagus.com>
Date:   Wed, 15 Jun 2022 22:56:25 -0700
Reply-To: yingyong@winghang.accountant
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DATE_IN_FUTURE_06_12,DKIM_SIGNED,DKIM_VALID,HK_NAME_MR_MRS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e68 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received:
        *      date
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.8 HK_NAME_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  2.3 ADVANCE_FEE_4_NEW Appears to be advance fee fraud (Nigerian
        *      419)
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

I'm sorry for sending you this e-mail that ended up in your junk folder as =
unsolicited e-mail. Do you have some time to exchange emails? I want to dis=
cuss a business proposal with you? I know that this business proposal would=
 be of interest to you. For more information please contact me.
