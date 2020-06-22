Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4135A203B6D
	for <lists+sparclinux@lfdr.de>; Mon, 22 Jun 2020 17:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgFVPra (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 22 Jun 2020 11:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729266AbgFVPr3 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 22 Jun 2020 11:47:29 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F86C061573
        for <sparclinux@vger.kernel.org>; Mon, 22 Jun 2020 08:47:29 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w6so7173806ejq.6
        for <sparclinux@vger.kernel.org>; Mon, 22 Jun 2020 08:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yK80q4JUU2kWeJjrY/lj3+c9EAOp3RYrgS4EYZyWvWE=;
        b=E09kgO9hkUAX8PL0IQLYcH7xcNfsttagtHmilWhkr54vVqqqVpjgesi+bVaPb3F23d
         YtKxAlnapxmL9+NzC/EYsuCkx7NvrRQShk+CLF9N9MtlHpsems7iVS3rsc+dMHtNIMt+
         52TSdJn7cDuLnPDvBkW180zK5E8wJb0/Z6LXbwKZj1MGzEzofZ9XQMUk6r/YAeLZXBD4
         Jkt0GRhoi5+H67LjsBBWar+/OeDluYTonvdoe955kqxOK1t5odtTpOjPXc5dNXlrLi0U
         9EHQFN1eLs10lX5Piwcs7g4efIEBP8QTOV8cu/HBwWmp8tWYpc/fadjRfkfYNEFoTj1F
         5hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yK80q4JUU2kWeJjrY/lj3+c9EAOp3RYrgS4EYZyWvWE=;
        b=dnpckNsrQbZlwK9Z9sP7mvCSH6GvbKCLkJBbc0wEmAZuWl0C9YAWQBl/pPe+mZJtZ5
         yZDe0+cNqC0Fj7W7V+be90xOtAi+0ZYbKCXNaEK5DF3iESJ09E04BmEsStheJ2E6o1iS
         A3TOpoYiJZg25EqR9ASNZ5L7dMCpVzQJklfngV4n5P3kTXuYr+1q3b+hkCKGZjd5kcHl
         JBDGlQAHFx/8MIoAIvs0pKG8Nae8Mufe03fCf50KzCILdsLsj6MO6Vquzv5XnLPNyWQo
         jAnoHoR3zoTX6x1UgyO33GpnrVdxmVWZ2ySHK2mAsejSqmtnwFosPXQfBp94L5N+C3NV
         sR7w==
X-Gm-Message-State: AOAM533nPXrA0ZmJDbutDVmm1rdSEy7D0Msy7ApmmbiHUGWUA9E5pXZb
        Ayvdy/jr6F/3RESF7q0IkLBALxC8MfxwqsM/D/9hNw==
X-Google-Smtp-Source: ABdhPJzT0SPwmP7PRK+zbzos7rwUMTXGBULkfO5rphJVkVt4UsrUsR/QvDxd/FKdh0aljjRKrRAvfFBqEx3yozMJ3z4=
X-Received: by 2002:a17:906:7c54:: with SMTP id g20mr3108ejp.460.1592840848339;
 Mon, 22 Jun 2020 08:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <891EE081-6AE6-441C-8163-8EB561BAC5DB@stellarcore.net>
 <c858883a-3944-4f32-6d63-1e5b51517126@web.de> <8b91900b-aa5c-7000-ba47-f769e3e09e0d@physik.fu-berlin.de>
 <8180A86A-A655-434F-9740-99D292A6D6C0@stellarcore.net> <bca9ba19-47cc-56b0-e76b-aa9859a2c534@physik.fu-berlin.de>
 <9FAF4F07-A879-4724-A23D-FB3C3B3C6AB0@stellarcore.net> <530000DD-ED60-4716-85F0-394FD5719013@stellarcore.net>
 <a835795e-3514-da2a-9225-97486c0b93cc@web.de> <143bd4cc-3e58-acbc-2ef5-10a6a54426d8@gmail.com>
 <7227d533-a2ed-0ee7-20c3-f950729c826d@web.de> <CABo1Du7VQyaZjhBWpNRPBgOEHmRcvm+gx=1xxvXHMGcoW1UcfA@mail.gmail.com>
In-Reply-To: <CABo1Du7VQyaZjhBWpNRPBgOEHmRcvm+gx=1xxvXHMGcoW1UcfA@mail.gmail.com>
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Mon, 22 Jun 2020 18:47:18 +0300
Message-ID: <CADxRZqwDV339PQt8qQWMOq22Pv5quAaNo3UHOiMn3VUr7q9Luw@mail.gmail.com>
Subject: Re: mkfs.ext2 - state D partitioning stops at 33% /boot
To:     Connor McLaughlan <cont6pro3@gmail.com>
Cc:     Frank Scheiner <frank.scheiner@web.de>,
        Gregor Riepl <onitake@gmail.com>,
        debian-sparc <debian-sparc@lists.debian.org>,
        Mike Tremaine <mgt@stellarcore.net>,
        Sparc kernel list <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, Jun 22, 2020 at 6:37 PM Connor McLaughlan <cont6pro3@gmail.com> wrote:
>
> Can you by any chance tell me how i could obtain a list of all PCI
> cards that are possibly supported  and might work on debian sparc?

Probably most PCI cards supported by kernel ?
