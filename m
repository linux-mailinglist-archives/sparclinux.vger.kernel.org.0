Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E6953E995
	for <lists+sparclinux@lfdr.de>; Mon,  6 Jun 2022 19:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239593AbiFFOTT (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 6 Jun 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239522AbiFFOTT (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 6 Jun 2022 10:19:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA4B5EDD3
        for <sparclinux@vger.kernel.org>; Mon,  6 Jun 2022 07:19:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so19034625edf.5
        for <sparclinux@vger.kernel.org>; Mon, 06 Jun 2022 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=JSP3Nyto88U/eqZE0wozz+0CwwhWvr/JhHHcvKOPgH5lfy6fZOeid6Jr65t//arUyg
         j4nYw7TaLqhLepSygyUN9zLJ7vPyin77QUbKWmDOrY4BMH5VhAMxlleIh8c8/Zvk3ScE
         YvL/v6Ga52yX+m7ezHGsZIEsPsPr3F4Zz/Tq6x1BAME7L1gtT9LbOKUIeG5+2z6kkO7X
         ovEF/H9Vj2AbsD5MIwFaBcP8OQVBB9vgP6ZqvyezGEbUTtCiC081RIdbJbtE/6g41MvS
         2VPUxLU/BvlZbhANsOKjPdvmuMX18WpGu04yZcL0gqhmxSYitaYxNFWM8Fhh0KKuXqa3
         ApCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=DBXVr+2yQA4Yc+mJwCPapHs1PcqJSd/+SbzdjhsE7eQ=;
        b=llbdtsF3HeVCpRAC+4otIvJRTjCIH+GLSPiCcNKMGV2wlrnf31+4Dzph+bTYzVhYZl
         mVlkvhoXmoajGZ/Y0WAjDvwoUoBBabj1Cr449FrRfmcZFW+JgoLyN7yzUjCLei6dturU
         qdI5yk/7QYkyfrlsaX+zQguvYLA9nUa1wlVcuU47Q/alspdy1fhDhBRCgXEv4CWz3O78
         EwYziUG8OYzrAhyPNLvvbw+CvyANGz+GZHy5aoA2FZmqOfxcjxIgJdRZVdxFYFXm+2mV
         psYyKlr/7xxvCebsK/wyhg3bTaFU2+WsOWWXYZYm+L81zpTawVEFsHWN90kHx7xn9LYF
         A1Yg==
X-Gm-Message-State: AOAM530eOOzNsWV2jIlOHseG1tCrpLfSdqgbygFcPpNC3NNjrV0KMF+l
        CQmlCeY0b/9/IPnZdMGGLEnOFnA3nXTepiPQGgQ=
X-Google-Smtp-Source: ABdhPJykT/UyGI86dL7L9Klc3DHGi07zmieX2PLBv1ozkQXCNdoMH/OWNoD3WIiTvsl4A+KqYLkPObcPND4ZoWN4wJQ=
X-Received: by 2002:a05:6402:195:b0:431:5499:35eb with SMTP id
 r21-20020a056402019500b00431549935ebmr7802915edv.346.1654525155357; Mon, 06
 Jun 2022 07:19:15 -0700 (PDT)
MIME-Version: 1.0
Sender: barr.chrisdickson@gmail.com
Received: by 2002:a54:2448:0:0:0:0:0 with HTTP; Mon, 6 Jun 2022 07:19:14 -0700 (PDT)
From:   Chevronoil Corporation <corporationchevronoil@gmail.com>
Date:   Mon, 6 Jun 2022 15:19:14 +0100
X-Google-Sender-Auth: NiKF2NWLeHfo9H7_vDj4j058vV4
Message-ID: <CAKzjU5YiNAW48-Au4uAyRf_nDknnXSvp2TLnU1C+DiNmqStBrA@mail.gmail.com>
Subject: inform if interested
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

BEWARE, Real company doesn't ask for money, Chevron Oil and Gas United
States is employing now free flight ticket, if you are interested
reply with your Resume/CV.

Regards,
Mr Jack McDonald.
Chevron Corporation United USA.
