Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700B6321DFC
	for <lists+sparclinux@lfdr.de>; Mon, 22 Feb 2021 18:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhBVRW0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Feb 2021 12:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhBVRWX (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Feb 2021 12:22:23 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243B7C06178B
        for <sparclinux@vger.kernel.org>; Mon, 22 Feb 2021 09:21:43 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 133so13659489ybd.5
        for <sparclinux@vger.kernel.org>; Mon, 22 Feb 2021 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrR/DupvzBe3IN7Ck59v6QBxsNZUlrEhlzhMbx/Ypek=;
        b=UWDF27wLgtn93q+PH+fjSc6WWWodqBlvN17I24G5BwhdKaKP20b+wCnJ3EsrgmAvZ0
         GbgW5QymVlUcEdc8mfBLKgL6J4M5dfTercasLDBpSxXBHlv/ZPPMVZbbu/cJd/l/1E3C
         lOAnFzKIiepWztttFwK4wzIDXe4nz8OKwf2hHTLT/Nqfrhtsu3hivTaQZ4MnknZwRxAH
         6aSJ7Aeo53iPBPvFxMNpVTYShccBqt5cOk37Sa4ZpvozWh2WnwChx/6Jpbmwtp2woj0u
         lDMBnOsVlTHX70iL8Q8arOiLojkg8l0/Jj0r3MFNP42Z4kzwjAedsDidISovpGTIVzzi
         f89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrR/DupvzBe3IN7Ck59v6QBxsNZUlrEhlzhMbx/Ypek=;
        b=ZSbTeVviDlQu1/+PitgltYErwOOCnNT39JQA513/TOGFCEjF1ER9RfE+P2P/mr+G7K
         bWk7U3KhWzLltAjAFf+w67qhhI+5Rs/CRJsVX8I3KrVFj1HgwG0hDmrjKMlK9Z6vWe7S
         q525a8695zKfOHDEc+AvzpDlIuVIOnR2n9COkfbgWhZHZtqp5Yf9vCpR5dA4ApdqIPvy
         VVuKdByjXwNVr8NESFYppcrJhiA6VvxLh8FInGCvGWiPXpuaY1wx0N7HyzGt1wpYt7yc
         cERwGPStWPW1Fri5cpyOdUH78CDH3OFC12uiC5uujm8EPEf5BULbEKepEviMKA1dqIuG
         UrRA==
X-Gm-Message-State: AOAM531AnwYEW79zdzEtVsLrldtFQhMA1NlRQeOAarZbWQEbDSipVPQ1
        xjhNmPgD+oI/tvL+9/4W1kt6a1gwmXRX9UkYIV+8qKHJC0KUAw==
X-Google-Smtp-Source: ABdhPJwtiWa7yBLSNUURzN7J31PSn+iXdowsRGbxgr/J+LJYBH8fqB2WVmdcVnMIjn3RqDgGN8btRi3tpxnnawJ9zs0=
X-Received: by 2002:a5b:ac2:: with SMTP id a2mr32907879ybr.81.1614014502458;
 Mon, 22 Feb 2021 09:21:42 -0800 (PST)
MIME-Version: 1.0
References: <b7fbbf94-2ac8-8043-b59f-195a3716977f@linux.ee> <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
In-Reply-To: <11c6400a-c331-bcef-2bac-9bad39349eb4@oracle.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Mon, 22 Feb 2021 20:21:31 +0300
Message-ID: <CADxRZqy8Mhv8EMhDjXLf3npLb14inqPf9Mr-0fVtBg_TPz2XTA@mail.gmail.com>
Subject: Re: bisected kernel crash on sparc64 with stress-ng
To:     Rob Gardner <rob.gardner@oracle.com>
Cc:     Meelis Roos <mroos@linux.ee>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Feb 22, 2021 at 7:21 PM Rob Gardner <rob.gardner@oracle.com> wrote:
>
> Can you have stress-ng print out the random opcodes as it runs? That
> might give a hint about where things are going wrong.

Rob,

there's quite a few different ones on my tests, please see [1], [2]

1. https://www.spinics.net/lists/sparclinux/msg25915.html
2. https://www.spinics.net/lists/sparclinux/msg25917.html
