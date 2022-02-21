Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C7C4BDEFA
	for <lists+sparclinux@lfdr.de>; Mon, 21 Feb 2022 18:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359007AbiBUNWv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 21 Feb 2022 08:22:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358991AbiBUNWk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 21 Feb 2022 08:22:40 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81FD21E17
        for <sparclinux@vger.kernel.org>; Mon, 21 Feb 2022 05:22:17 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id b8so15214097pjb.4
        for <sparclinux@vger.kernel.org>; Mon, 21 Feb 2022 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=mADrFrQ+ZaM0TTq14DVXo+gL51+p2NcBjrN5ntCAKNfmsIAoFYM5Vg05TATz1Ho3Mp
         QntpqOZN3naiWGycPE6mYfwtwAPtneL7Rw/9nMeZB7wOOnN7+w2ZC1J+VfjucP6dvjgH
         lTknf1/DqWRCd1lnEY8XJSo0sGGNKAN/Q2AhiiVd+kM3VozUxI+7uzBPycoXp1Vaqj8M
         p4xbfkLFbWc6MBQeg7cIzVnUHjQm0cWUH2jqTe7+s4ph8qXwOHR43B1LSf5Ms39DYX6u
         tw+yyEkJLsVPXxfaTvunyjyvU9BKx7n8SvP6JAiSZnaM93bNVM1/BrqWWs2xeZURVai0
         iuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=yVHB5oKSVW9Y8epgZH8asyuAYuFl6nOiB+tQla+d2ewpdAWSBM6nnnfX9GaDpK+d7L
         3ZKOGOu4kjs6Ic0Ok2E+uU0+yQ/lM4/uYnGFQobsfqpaHQzKekX/JgOY6yGiDsd31stI
         Z8mdJ4kqIZEbQo9gDLKPP9Xh+hYaWRs5TKabtFB4DzXKfoKXiv9jc2RnGEnpVyVajjmS
         RZMVUe51ySDgpuwLhogrDFATJz8vnxQFpCjozN8qIT8aUHIH7SvC7qhAB9FkSdWC3OSz
         LokfqJjbJuXrd130g1qArXEOk9V33UKphc+bQ1s+y24LwVqWmvMi15D1bdbUq41VyU9W
         CF+w==
X-Gm-Message-State: AOAM533pykzrg/7XOSdMT7UVQ/fETkxJhqdstJdlvmjHxYUBoZctTBbH
        90J9sIhLH8K2qSGwbBIC+IKwvu5Sme6jq/mbDTOzkw+CM2Pa9Q==
X-Google-Smtp-Source: ABdhPJzY3uRVFinJaUL83lROLKmjYUZ+TZRkDI5fVeFEVDRnDD4++VfHZ1wYicaoN9REPkmsXvaggGijHkcU6zzfCJU=
X-Received: by 2002:a05:6122:c9f:b0:330:e2ed:4786 with SMTP id
 ba31-20020a0561220c9f00b00330e2ed4786mr7735605vkb.29.1645449726641; Mon, 21
 Feb 2022 05:22:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d8cd:0:b0:28c:6bb4:8918 with HTTP; Mon, 21 Feb 2022
 05:22:06 -0800 (PST)
From:   Anders Pedersen <ousmanebarkissou@gmail.com>
Date:   Mon, 21 Feb 2022 13:22:06 +0000
Message-ID: <CAE0fZ3d1A2trQ_6K_TKOtuh1imki0Bk2BNv+2OWiPjRVVrO41A@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Greeting, I'm Anders Pedersen, from Norway. I want to know if this
email is valid? Thanks.
