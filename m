Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E29660B31
	for <lists+sparclinux@lfdr.de>; Sat,  7 Jan 2023 02:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbjAGBEG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 6 Jan 2023 20:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbjAGBEA (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 6 Jan 2023 20:04:00 -0500
Received: from mail-oa1-x43.google.com (mail-oa1-x43.google.com [IPv6:2001:4860:4864:20::43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E611E7FEF1
        for <sparclinux@vger.kernel.org>; Fri,  6 Jan 2023 17:03:59 -0800 (PST)
Received: by mail-oa1-x43.google.com with SMTP id 586e51a60fabf-14455716674so3418568fac.7
        for <sparclinux@vger.kernel.org>; Fri, 06 Jan 2023 17:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=Ui1nZAQwen1JZHhk/UNb1oDDJUikJKWwSFDQT7fDxIdrjTsFTfnr65aD0MQpJxZuMF
         RmyXYHMc9Ky4LUKKCV35cfXeVKg9kcUaSr4tiVZgaqF5EFPOnEzUzKBi95ahnFWEJuB/
         wikAeNAEQCrGUuHayT33w+2rQ4+HBUUxhxKBasC1xNVeOOKwbrPJi4n0XGoiGNV0Ta5k
         CclCoy5QAcIdpNT2BCRseJKd9epac9YGs66Cgc9nZMojVBhKvtImHmE+ZbhBIfigRiBi
         98nZh86gtiJqweGJlylRyzSsCuKNMTFPzlfmr38W444ZCFDfVUVeCB+li6CwVFx/Asvw
         l86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C56Q+YV0i1VwzqpPgsaApjf/2tDIDNvnJyLhwVpmM08=;
        b=fOz7ZpJ75DUbmb2nj/lpXd6QIk+mv+Ewasj5k/XnXS9uT8xjrFp98a3ycueuAkuu9v
         2S4qAAWIPBO521tb3hnYjvoeTgcxdiPMhlLPxM7sRzc3mrWPXENJqYtaHWncw8q/wAt2
         HCJ5/PXMe5Z14IiKnsnC6XyTDryFBswBKFdi0sWgj5j6s764LBxCi1tHYu/7S26/N08j
         9dZ8CGpJU4MHDuVs3bqDCZkWAJla6I5QwXN9oHlm0MDfNa+3vA27hfO6x+KscMIz/m+M
         AbQ/1qWnrIkqqkBRlfDhn8+UCPlkKYkhyddIKQSvJ3qIKVmcDu8ZChFr2FNyDU9YaW4f
         9GLg==
X-Gm-Message-State: AFqh2kpyxb4HoGByAeQNHwI09+/88ZnNRDZa6DE6TYaO32IVaMf3qjax
        xFijaBxzEmJcThF4X9D3i9JTOlJSCn/3orPY674=
X-Google-Smtp-Source: AMrXdXuy6RV5DBW3idauFhx1utsKIy/tzX1PwuIHZiENrh5zCMKQgqD9oBX+tZBveG7/3LbSFusOjNssMxTFlJ2Y1NU=
X-Received: by 2002:a05:6870:4b8d:b0:14f:d35e:b7fa with SMTP id
 lx13-20020a0568704b8d00b0014fd35eb7famr3510003oab.222.1673053439258; Fri, 06
 Jan 2023 17:03:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6808:2387:0:0:0:0 with HTTP; Fri, 6 Jan 2023 17:03:58
 -0800 (PST)
Reply-To: jamesaissy13@gmail.com
From:   James AISSY <samueltia200@gmail.com>
Date:   Fri, 6 Jan 2023 17:03:58 -0800
Message-ID: <CAOD2y7mxfJEiJcw8zGx8n6ktU0yeDj2shbDio9PsogOVj9NGZQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hello My Dear,

I hope this message finds you in good Health.

My name is Mr. James AISSY. I am looking for a partner who is willing to
team up with me for potential investment opportunities. I shall provide the
FUND for the investment, and upon your acknowledgment of receiving this
Message I will therefore enlighten you with the Full Details of my
investment proposal.

I'm awaiting your Response.

My regards,
Mr. James AISSY.
