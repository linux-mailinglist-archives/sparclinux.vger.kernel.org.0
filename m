Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EACBB57C13F
	for <lists+sparclinux@lfdr.de>; Thu, 21 Jul 2022 01:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbiGTXzi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 20 Jul 2022 19:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbiGTXzh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 20 Jul 2022 19:55:37 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E281A20F4A
        for <sparclinux@vger.kernel.org>; Wed, 20 Jul 2022 16:55:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id w17so22908486ljh.6
        for <sparclinux@vger.kernel.org>; Wed, 20 Jul 2022 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=bZLpU1VZRM6vKW4pxp8UFYkGwAMgUZAXZNk4pBF7NQJ4h4oWkselVRa/ip6Hjbz53/
         lAsCsHvZMYUfheTMwBXe7llD2DoK8qQoc20WnAJngMt7X/o5qSVnae6Ji8pvljAKqGSX
         1Aj7Cun6JtyoeSPGrAxFTuNVU19dMM9qWv3Qs5D733E1zfXHFOTJEzcQ4rqzmRXDrN/X
         Se6/u9VFnPwm0K4iYBk5m/HgoVKU7rYLkRAw1lFtPoOPTI47gDk+etFfFJ83aE4IlAHT
         FZKubtOKz+aS0jySHWsg/jUHl96vB0J7LnwTIMKD22wpBm1TEVlriL+jbs9bVvhFNIru
         9AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=rb7cGf9c+mH3vtN1zi+borzN5Os+p6Y8m4df4E083lXZsOOVklXc/7B0kiqSeSg9jB
         yM8zQgiQoE1/VBPY7i1eSPiMqk3O77F2WgGeUql/N+gUxu3T+3E0yWmhU5tIWHgGiB8c
         ha8Yjq05iyJB50K/dAgSD91vJeibNII7eF2XvL67Qnguh4cILZFkeJhcxxoLtZNdgDdY
         xxcTdpIcWpSPmgPbFYaRqjV/UVNB+qHECcdh9eikXSs430PYP6J7L+RJe7Dvi/huCNLV
         zdI2sfyL4Va/vYZBqJj+E70plppHlN5r0PiOMtt0UVVWzn0jiTQJJGNxR2zb9EeRgPvZ
         TdeA==
X-Gm-Message-State: AJIora/daeNWSfDnFZceGS13Wm+WS8POGERGpTTz/BqVheds4MP1yRCP
        u+uEye2f6bHsUut04mo5nFULCMQjyzCVMGMnn2Y=
X-Google-Smtp-Source: AGRyM1szSyfzYz+26dW81l0JDzaln7GS7vOFYbaID3eX8VOG7ffv7dJY+TqOg5qGO0qhxeHFgQz8bdHutrSX0POf0lQ=
X-Received: by 2002:a05:651c:2c1:b0:25d:79be:8a08 with SMTP id
 f1-20020a05651c02c100b0025d79be8a08mr17885321ljo.499.1658361335125; Wed, 20
 Jul 2022 16:55:35 -0700 (PDT)
MIME-Version: 1.0
Sender: mariametraire@gmail.com
Received: by 2002:aa6:da56:0:b0:1f9:e433:303f with HTTP; Wed, 20 Jul 2022
 16:55:33 -0700 (PDT)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Thu, 21 Jul 2022 00:55:33 +0100
X-Google-Sender-Auth: -lvPvfV8rut3XRCygVuMtBqPWn0
Message-ID: <CAL3rPFsnh0d_aAO1CRijTryYEypVManpQL=SkMUME_j7mx8TcA@mail.gmail.com>
Subject: My name is Dr Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lisa
