Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06CFF19EDE8
	for <lists+sparclinux@lfdr.de>; Sun,  5 Apr 2020 22:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgDEUTL (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 5 Apr 2020 16:19:11 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40107 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgDEUTL (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 5 Apr 2020 16:19:11 -0400
Received: by mail-ed1-f67.google.com with SMTP id w26so16401161edu.7
        for <sparclinux@vger.kernel.org>; Sun, 05 Apr 2020 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iEZk7U6art2tiy5AhAkA3SUpHJfBRVG8B0TQ9i4RHzE=;
        b=d3J+H6FY5SoQwMV6y7agWZdD56fYHU7tsn5wdsHsCrzE8FgoJXwsmC6X4tAaCp5fsy
         8TxOwtCxqRwKbihjOmdbGfVR6o5TNoCkp/rS6K3Vj1HjcLntT876hEqwAMWTFCwTlDX6
         uePtqiJXUhkoTjB5MVqn3unLakhX4Fr5YqyRIPkbr4ZDfO8HlXY1WArgKFZajd4l8Mg2
         jIwHMJidxDfYW99d7+JPcqe4qtyjCJ5VCNbf/DkZiAAyrI6d11EAUr7mJD/kxNHQu6Td
         8+p2QoUzyivIiUbMGFQTfLasgyNheV3hPEtWU5qhZ/EwSCb6Gr25ADzMKyxdEDfhnRgs
         B8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iEZk7U6art2tiy5AhAkA3SUpHJfBRVG8B0TQ9i4RHzE=;
        b=Uh7/SmrzMhuXPm+swndlIwBwElqB0s9UJmf54MeJCl9cWdBokDyeYOAv9+/0XX7ld5
         zYvNrKrzc+OKVFKAek8gwOvojX7E05lX+dNrKXnG466XybfXYJpkZFXWXak0hSmAC9ax
         Oq7XGD4lFu+pPbRxLLW11FBJTlUu3AG4ig45QaBLHqCreeSw5oyZsxaU3oB5BKR4T/FH
         6tor1ESDX7QBxvMGQhnBqJzTIDllMe/Afsdppa3gmofWcdXdmZKuozm4S23OpRqt8Qav
         9MoMVklCShGtq+cuoopVK98nyEwb2+ylNAFcyHRA6GdfJeZM+U9XMz2WuQQtMZklnI45
         PS2Q==
X-Gm-Message-State: AGi0PuYfhlxTANdYwkJWHdfPgZLRhBPFrc4dBoHhUEK281FGcmUThhNz
        pEbo/pKCzWo+hdS6Sf6HHLX+b8wMTbwIZlLB6MDJ+Q==
X-Google-Smtp-Source: APiQypLARoPbr6wIFD5dQ1Q2SpXSURtuc0B4d5qzKJtOqc75qfe3LHx7A9F9skcYpBzOWsStMfz3dtl2sMoGOCgVen8=
X-Received: by 2002:a17:907:212c:: with SMTP id qo12mr18895358ejb.357.1586117948775;
 Sun, 05 Apr 2020 13:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200405185451.3963937-1-mattst88@gmail.com> <20200405185451.3963937-4-mattst88@gmail.com>
 <20200405190748.GB16352@darkstar.musicnaut.iki.fi>
In-Reply-To: <20200405190748.GB16352@darkstar.musicnaut.iki.fi>
From:   Matt Turner <mattst88@gmail.com>
Date:   Sun, 5 Apr 2020 13:18:56 -0700
Message-ID: <CAEdQ38HQ+tb+ZQ2-7tGQSsuz=6fcKa5++-dMOdhcUs=ZzbBFwQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] second: Fix typo'd operator
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     "David S . Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Sun, Apr 5, 2020 at 12:23 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Sun, Apr 05, 2020 at 11:54:50AM -0700, Matt Turner wrote:
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> >  second/disk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/second/disk.c b/second/disk.c
> > index 40234b3..b81a465 100644
> > --- a/second/disk.c
> > +++ b/second/disk.c
> > @@ -293,7 +293,7 @@ int silo_disk_read(char *buff, int size, unsigned long long offset)
> >       if (!net) {
> >           if (prom_vers != PROM_P1275) {
> >                   if (((romvec->pv_printrev >> 16) < 2 ||
> > -                      ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev && 0xffff) < 6))
> > +                      ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev & 0xffff) < 6))
> >                       && offset >= 0x40000000) {
> >                       printf ("Buggy old PROMs don't allow reading past 1GB from start of the disk. Send complaints to SMCC\n");
> >                       return -1;
>
> I think it's worth mentioning in the commit log that this is changing
> the behaviour... After the patch only < 2.6 PROMs will fail (which is
> probably correct), instead of every 2.* like now.

Sure, that's fair.

> BTW, I guess you found this error after a GCC warning, not in real use?

Correct.
