Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCAE327EB3
	for <lists+sparclinux@lfdr.de>; Mon,  1 Mar 2021 13:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbhCAM5v (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 1 Mar 2021 07:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbhCAM5p (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 1 Mar 2021 07:57:45 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97611C061788
        for <sparclinux@vger.kernel.org>; Mon,  1 Mar 2021 04:57:05 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id c131so16815094ybf.7
        for <sparclinux@vger.kernel.org>; Mon, 01 Mar 2021 04:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amvIN0iYG0XExlSqU712DBvKm6x/yC7Si9XQCggqkNo=;
        b=bE+cuOLKzgZCEEoK+LMcxIP77fkm8rIeD7M2yEDCiOTOuHncfYTQ+gTy4DZhKpMiN7
         Ds7UQv2NU/eBR/FC6Lnz5matUybFmTtSHm5fySQtNBrgw0D32C98hNza3eH/fNXSB2dj
         SH4ngUBppEjFtjpditmL/4MtsPUOa6GY+EF9kRE3YTCPtYAVBAF4UydSDyNR9N7AgmrJ
         ai8SZKB5fdHXdcu6JSqUrZzX6kMDMFf6ljYC29nI4WdQov+ZE9d0WmcYYBHNi6OnA9lb
         C8DZ9rC+9nr8+MqBNiB7zrUeqOF0g3Cn7DOeSNtc5Ov9ypmuZX9oqt3Km4zioMnRzVBP
         smpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amvIN0iYG0XExlSqU712DBvKm6x/yC7Si9XQCggqkNo=;
        b=lVDbvUGDd4ntVSK2dfHKvQKXysm/hOKVFhVercAaeBFYqW6JMWzdoIWmxbN6gFRymE
         MDdnkrh+OREj5tOmij+yFOWknTUEMva5v+oq3N+eIjsysCYS4fskG9AVL28UGKwJaMfK
         lF0lNiB2jhGGKNVu8dUPpNxV2qUbgBp8AyoBv3w9OSWYh5uz7bnCMwgGWhpoDwnUr195
         ApDZFdCgj8CRjIOB20vYn3kzrqfgy68zAw8DKF9715JiNwmagiCWc1E1ltpUSe+w0Ado
         7wvISQXE5Ua48uI18cx3MjbJjLnOcdajztLHMvPGI/p+9OHTSPnkoR7xxGeMIaTrS27j
         bVdw==
X-Gm-Message-State: AOAM531I9c+JN9nGS6jHsWVM62UYMYdCt9dNpy+lUydgaoDP1x7pIfnC
        zCQql2eQ0uXTnXiCgpLY9Em8et8u30dG6jjLAtQ+dQY6sjc05g==
X-Google-Smtp-Source: ABdhPJzG9T0/uPwXdkuVGivyigMhcOX/WlvTtYAM5SpuLyfE1iA9BxzgEUhZB85JS8T4ShVQ4CpS6gDJnJvvKKuqrM8=
X-Received: by 2002:a25:50e:: with SMTP id 14mr22732147ybf.287.1614603424854;
 Mon, 01 Mar 2021 04:57:04 -0800 (PST)
MIME-Version: 1.0
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
In-Reply-To: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Mon, 1 Mar 2021 15:56:53 +0300
Message-ID: <CADxRZqxScpzebDEh+LjyKmsgoQErqB=Lie=JUX2WWN2NOzqPcQ@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault loads
To:     Rob Gardner <rob.gardner@oracle.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
>
> is_no_fault_exception() has two bugs which were discovered via random
> opcode testing with stress-ng. Both are caused by improper filtering
> of opcodes.

Rob, tested on my ldom, works perfectly now...

$ uname -a
Linux ttip 5.12.0-rc1-dirty #195 SMP Mon Mar 1 15:46:15 MSK 2021
sparc64 GNU/Linux

$ stress-ng --opcode 1 --timeout 60 --metrics-brief
stress-ng: info:  [945] dispatching hogs: 1 opcode
stress-ng: info:  [945] successful run completed in 60.00s (1 min, 0.00 secs)
stress-ng: info:  [945] stressor       bogo ops real time  usr time
sys time   bogo ops/s   bogo ops/s
stress-ng: info:  [945]                           (secs)    (secs)
(secs)   (real time) (usr+sys time)
stress-ng: info:  [945] opcode            17847     60.00     27.45
 34.03       297.45       290.29

Thank you for a quick fix.
