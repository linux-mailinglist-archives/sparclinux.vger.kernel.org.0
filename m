Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D52538455
	for <lists+sparclinux@lfdr.de>; Mon, 30 May 2022 17:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237675AbiE3PNZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 30 May 2022 11:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbiE3PMv (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 30 May 2022 11:12:51 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A056EC4A
        for <sparclinux@vger.kernel.org>; Mon, 30 May 2022 07:13:05 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id s1so3188805ilj.0
        for <sparclinux@vger.kernel.org>; Mon, 30 May 2022 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=cJEr7VdiC+FRp3zrTiHj5XaFGJG0luxn5UlydnTKu3PsEhnZSz4dMACWyrhJ10O26q
         tUoqhJyqq/bAsTkkYbv7KsqwY0ea03U3axmaTlD601xtAu6Bduh5QHGRr9+vIEJckYNH
         u/LM5fG8WkH4ZdroweMYrvyhvyYiKb7Cqwvc0OMrsdxCMPNFzaMg+VH7LnOjQSfUeztw
         Bd/c/o7reWNK8LUeL784IIba/fSrobhvBU3xLtOYztDSQNB3Prs6ieJnHdYoBJFcs0TX
         I8ZkOOM7S7noAZAv5RsNpUgP+wIuU8tqEYOxkm61mgulGTF1vyA2/iWtJZmZt18E9UEv
         JkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=C8PncJXPelRA9GeodvlvtGOc8Gmi7wnXoM5NpJJ16swIzAGmROm5FxNmGIYJUrzBLr
         o57tCRk5BVWnyznr4s2yiwJzTsNrGzDDkqnFiOu7VVIulYgmRh6+KOk788w+3bcQMNS7
         CbaIz6kxMN9sTuE/Ab34wTKq0dX7EbKvEKMiNOdhmaKW2vE90KFbI07V3Xiy5RrC70KP
         5R3ldun5p2oaq3sIaUH8k9wzWiRWBG2y/o+0f+6kUF9xIhk+rshZDzC7NYmA/ThzqOWp
         kgWkDy5XkNZ0bW/PxT4iuBo6cesvkEZogSwHbiqDqWwqFjpnxRRRc+07o/hz6TJGLMly
         Ky6A==
X-Gm-Message-State: AOAM532W7YVlM8mJKGKryeE/+kCntLRKnZL8hHlIMSUkN3vzSVgFsHVI
        aqDZ96gguw4PJzY3UJ8/NvkTnOKrDaJBFU8WbWE=
X-Google-Smtp-Source: ABdhPJyybXrd6EarMnQYJNy17DWIuTbYoc0qhgZeV4IhBAZL8O2gFm61LT+FH50H4x2rcAoizgJF0efjr98r44SNhyU=
X-Received: by 2002:a92:ddcb:0:b0:2cd:95b6:bede with SMTP id
 d11-20020a92ddcb000000b002cd95b6bedemr27986306ilr.280.1653919984723; Mon, 30
 May 2022 07:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6622:f06:0:0:0:0 with HTTP; Mon, 30 May 2022 07:13:04
 -0700 (PDT)
Reply-To: barristerbenjamin221@gmail.com
From:   Attorney Amadou <koadaidrissa1@gmail.com>
Date:   Mon, 30 May 2022 07:13:04 -0700
Message-ID: <CAOh7+P_rLGWYK1vsh7e900xXB+FAKJPnhz08Eh2vGw3YV9kG0w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:144 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [koadaidrissa1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [barristerbenjamin221[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [koadaidrissa1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

SGVsbG8gZGVhciBmcmllbmQuDQoNClBsZWFzZSBJIHdpbGwgbG92ZSB0byBkaXNjdXNzIHNvbWV0
aGluZyB2ZXJ5IGltcG9ydGFudCB3aXRoIHlvdSwgSQ0Kd2lsbCBhcHByZWNpYXRlIGl0IGlmIHlv
dSBncmFudCBtZSBhdWRpZW5jZS4NCg0KU2luY2VyZWx5Lg0KQmFycmlzdGVyIEFtYWRvdSBCZW5q
YW1pbiBFc3EuDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCuimquaEm+OB
quOCi+WPi+S6uuOAgeOBk+OCk+OBq+OBoeOBr+OAgg0KDQrnp4Hjga/jgYLjgarjgZ/jgajpnZ7l
uLjjgavph43opoHjgarjgZPjgajjgavjgaTjgYTjgaboqbHjgZflkIjjgYbjga7jgYzlpKflpb3j
gY3jgafjgZnjgIHjgYLjgarjgZ/jgYznp4HjgavogbTooYbjgpLkuI7jgYjjgabjgY/jgozjgozj
gbDnp4Hjga/jgZ3jgozjgpLmhJ/orJ3jgZfjgb7jgZnjgIINCg0K5b+D44GL44KJ44CCDQrjg5Dj
g6rjgrnjgr/jg7zjgqLjg57jg4njgqXjg5njg7Pjgrjjg6Pjg5/jg7NFc3HjgIINCg==
