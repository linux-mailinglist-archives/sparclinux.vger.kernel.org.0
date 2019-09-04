Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33696A975A
	for <lists+sparclinux@lfdr.de>; Thu,  5 Sep 2019 01:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbfIDXvh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 4 Sep 2019 19:51:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45683 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbfIDXvh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 4 Sep 2019 19:51:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id r134so382121lff.12
        for <sparclinux@vger.kernel.org>; Wed, 04 Sep 2019 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
        b=Cnu5WYs/aAthmsXfnwtWzL5CNjpaY23sMnhFtcX1zve3r2rc/Ho+dRzPF32HPRMBnj
         gveXLtTDU7YHSGctyOcfke7l1YNaudqputmw6AJ3ZcUOsNYmqHCIu9DY9WHGlywCQ4Su
         iCCcCFmwH9f6fkeMSqS83pY7B6dx4aSlHZljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
        b=ubPVhS/ShmwBxSf+2PCg8DTInthMQt7qd5xD/9dHvrbRA83XY4poLNWlUwKO6/Lt06
         lLxMZa/dMaKLDT9khWdNOoRdu1ZPZkiPn3L265byRc1HH4+4NYP21tQtLpPpPzvl4pFa
         w3C3pGTuP0X2TgbvbD1/1imp6++9T00LoUAVFauP+jzWCuArHNVADm38HawKbZnfXZM+
         LApQTA1w2yDaYPBwsJD4YobH50Y6APH0ItfZwWv9IR6ADso+pjX1t9f3jIha4QyrHS2h
         njhRJVKfFHhgOSo2Z9J+tRtnnviM3eV3Jhv/qYr8US4gYYnNFcDEjH+b4x06UM1WEjX9
         Ft0g==
X-Gm-Message-State: APjAAAXgCZWE3CiJGq7/5lfdmluqKJy536OVjST5NS79zCNBbj2Xab89
        NoelnnY0qe/ClbZkB0+1I25sJGcZncg=
X-Google-Smtp-Source: APXvYqz1jxSMl0Fsa1ifmzxWTLJd8pamkJ7UAaDtPpC0S39zdrgmkTBHA3OMATXrDxyw2mtHvh3P8A==
X-Received: by 2002:ac2:55b1:: with SMTP id y17mr444789lfg.74.1567641094533;
        Wed, 04 Sep 2019 16:51:34 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id c21sm50068ljj.6.2019.09.04.16.51.34
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 16:51:34 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u14so426619ljj.11
        for <sparclinux@vger.kernel.org>; Wed, 04 Sep 2019 16:51:34 -0700 (PDT)
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr127121lja.180.1567640710863;
 Wed, 04 Sep 2019 16:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
 <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com> <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
 <20592.1567636276@warthog.procyon.org.uk> <CAHk-=wg7Wq1kj8kZ+SSpfU_o991woW60NWca9yBA2ccs2eNx8Q@mail.gmail.com>
 <20190904232911.GN1131@ZenIV.linux.org.uk>
In-Reply-To: <20190904232911.GN1131@ZenIV.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 16:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     David Howells <dhowells@redhat.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Sep 4, 2019 at 4:29 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Sep 04, 2019 at 03:38:20PM -0700, Linus Torvalds wrote:
> > On Wed, Sep 4, 2019 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
> > >
> > > It ought to be reasonably easy to make them per-sb at least, I think.  We
> > > don't allow cross-super rename, right?
> >
> > Right now the sequence count handling very much depends on it being a
> > global entity on the reader side, at least.
> >
> > And while the rename sequence count could (and probably should) be
> > per-sb, the same is very much not true of the mount one.
>
> Huh?  That will cost us having to have a per-superblock dentry
> hash table; recall that lockless lockup can give false negatives
> if something gets moved from chain to chain, and rename_lock is
> first and foremost used to catch those and retry.  If we split
> it on per-superblock basis, we can't have dentries from different
> superblocks in the same chain anymore...

That's exactly the "very much depends on it being a global entity on
the reader side" thing.

I'm not convinced that's the _only_ way to handle things. Maybe a
combination of (wild handwaving) per-hashqueue sequence count and some
clever scheme for pathname handling could work.

I've not personally seen a load where the global rename lock has been
a problem (very few things really do a lot of renames), but
system-wide locks do make me nervous.

We have other (and worse) ones. tasklist_lock comes to mind.

             Linus
