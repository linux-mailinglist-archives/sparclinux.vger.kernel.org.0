Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2852F8B52
	for <lists+sparclinux@lfdr.de>; Sat, 16 Jan 2021 05:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbhAPEr0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 15 Jan 2021 23:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbhAPEr0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 15 Jan 2021 23:47:26 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5512C061757
        for <sparclinux@vger.kernel.org>; Fri, 15 Jan 2021 20:46:45 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c124so9065233wma.5
        for <sparclinux@vger.kernel.org>; Fri, 15 Jan 2021 20:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=ty8Pzs8YnsPvOci6WSbfq+yaGMF9rXTaArqQK+d4Yss=;
        b=e+Us4Hx16oFYzHQYX3IME/4imE6yYSIRKfmNZeQtfae3cPSOq+G0/mrxGau2VBd30N
         fj5qyq88WzYzm8BrI9S+AgDicB7Q/WIEaz8p4hc7zXala4xqE4rrj7dafD2I2m8UMIOa
         wAryJ8dY0MkwHcw+ov5rdOaskSFTRi+1v9k0TEkwYytkq+wpIRj7goKFqBgeY853Uf8h
         qcl7+e25lSxXvqLgQxYrM2/CMslZHapfEhDmM94uzxuCLyshmZOb3LPrlGBRnse9Oked
         YDkAzgAzqrcYPgDKjGJo5Ms6SW3INLUwuW8fxMGUHiUA6Q+KDke/1iUtaQhS0Soc1m5/
         ow7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=ty8Pzs8YnsPvOci6WSbfq+yaGMF9rXTaArqQK+d4Yss=;
        b=Rc4d3UnLsP2b/BXuZftZayk1AW1bh8ackEs4ibYUY879wx3/42oFmbWpuAhcc0lk6L
         IXej4KU/2f0Pa/6gVpeIGShhs8IpNtBT1HbbpEXe0ym9mma9Rl2QJjjuZ3UmrSNoYpkV
         9aq9Ya9Ym2IniGaCVstS1cjTAnMSTMPlp6Cpyla6jsXEY/s3349OM23FEgK8jg32svZP
         x0jPT+wdFnndW8bSuI0UcUkCGo+KUC6eyjTT7IyWfFU4kZCa1lnNLLtsvwDDzsnXWc2I
         6RQ+2b83cF5z6Zt9HbwkJi/LNnzV0BajbbzuvpgPfKF2CYFOstGL9DHk7oRatMQagivJ
         /4WA==
X-Gm-Message-State: AOAM530i2OHvhAqXBQOnl1qhrTh/fddUz53TV6FECJX30wVOnUR/lAOA
        Uw4tvvs3uEKGOcxyhZ68MoQSjYnb8uP6Zw==
X-Google-Smtp-Source: ABdhPJzQb3fW2BQXQBS7oMvgWpWtlyQaLzvHpUDcOUdIA9EmrZBZjWIdwhhWW47qQ6SWk2V0pfb3iA==
X-Received: by 2002:a05:600c:29cc:: with SMTP id s12mr11597667wmd.180.1610772404618;
        Fri, 15 Jan 2021 20:46:44 -0800 (PST)
Received: from [192.168.1.8] ([154.124.21.107])
        by smtp.gmail.com with ESMTPSA id a24sm8224297wmj.17.2021.01.15.20.46.41
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2021 20:46:44 -0800 (PST)
Message-ID: <60026fb4.1c69fb81.5efe7.9404@mx.google.com>
Sender: Skylar Anderson <khadykasse98@gmail.com>
From:   Skylar Anderson <sgt.skylaranderson876@gmail.com>
X-Google-Original-From: Skylar Anderson
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hi
To:     Recipients <Skylar@vger.kernel.org>
Date:   Sat, 16 Jan 2021 04:46:37 +0000
Reply-To: sgt.skylaranderson876@gmail.com
X-Mailer: cdcaafe51be8cdb99a1c85906066cad3d0e60e273541515a58395093a7c4e1f0eefb01d7fc4e6278706e9fb8c4dad093c3263345202970888b6b4d817f9e998c032e7d59
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

there is something important to tell
