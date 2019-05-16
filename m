Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67734208FF
	for <lists+sparclinux@lfdr.de>; Thu, 16 May 2019 16:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfEPODz (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 16 May 2019 10:03:55 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33611 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfEPODy (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 16 May 2019 10:03:54 -0400
Received: by mail-ot1-f67.google.com with SMTP id 66so3556435otq.0
        for <sparclinux@vger.kernel.org>; Thu, 16 May 2019 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ucVxbOUWrZZfDk/EU6PatKkf44/FaoRbkOnctoq4RZ0=;
        b=gfpj8t048K9YVTN68kQxa+FHJsU/2ANQn9m7IrGbqPQ/o0kHghHsG/uJc4zd0VpsFW
         tt+lyUarxKBI29oVO1Q7sF6b60g/Y4zexIgF4+6YB95Zr7oBm41HjsNb+60bflVmIM/a
         UKZ8eN6pNZNVROnG/kopqrr9ADEgcqic3lsaeqN3/9cIUca8DzVHJlNdufwkTOFf0fvt
         WuJWnXkH3Px0YXQ3FCfU3bP9mLp8nfVLzMr3JYliO8GXvlga8zbDUkxdoqZiZYSZv54T
         LbJwnBwECMCyoIPfR+yi8OKgHUx1TaxeYr/Z3Fe86n//upCOfxiL1JyMYYPQMvqWFEUj
         axYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucVxbOUWrZZfDk/EU6PatKkf44/FaoRbkOnctoq4RZ0=;
        b=ds7EdF7orta3OfqIKzSWCJDsRbeCSsEvMIu1cPM9zCQzV+NMQyl+/AT98uzXpJ1yQ8
         hRsAE/OduY29HXT74q+iC4oLjppXtq0M258fUVaxOrG0LztKUtPl0adNTHhxtxzGZDpk
         4qzcxymAFsxZItkvJN8sQ/rLouuJITSXvkHOxdSCDpUgnsFq24ovL3BbrossYfVWKl1V
         QI1cPbjYgjYKgqTJizRKFNABNrJFOr7nK8niULECumwU5iQ0p3pODvuL2lmwuPU9pXBr
         IFd7qKghi2LGesgZTFExmoWxJs0g3LRnNWKxrfR4fBL0HiPQ/sboJ8FLF2CVhMk+aXJZ
         1+Tw==
X-Gm-Message-State: APjAAAX0qpDomUkisN1srOTHo5HITwdXSf5iDqrdDlopiZC2ObQm6b+l
        WD6tHnbKaru7FlbQVX61ghzx90hHFB+vN9VPBSlE8Q==
X-Google-Smtp-Source: APXvYqyBb5F3egziJpog88dFflIwgg+mGPtRq5YXqoN1sjx7sxZUEswiE+BHUSh78yMMJxAxYlD3ql7CsUOCTyJayJE=
X-Received: by 2002:a9d:6954:: with SMTP id p20mr9094093oto.337.1558015433692;
 Thu, 16 May 2019 07:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190515100400.3450-1-christian@brauner.io> <CAKOZuesPF+ftwqsNDMBy1LpwJgWTNuQm9-E=C90sSTBYEEsDww@mail.gmail.com>
 <20190516130813.i66ujfzftbgpqhnh@brauner.io>
In-Reply-To: <20190516130813.i66ujfzftbgpqhnh@brauner.io>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 16 May 2019 16:03:27 +0200
Message-ID: <CAG48ez05OtBi_yX+071TrrfK3zKOn9h1kFyPr5rttiqQAZ0sEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
To:     Christian Brauner <christian@brauner.io>,
        Daniel Colascione <dancol@google.com>
Cc:     Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aleksa Sarai <cyphar@cyphar.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, May 16, 2019 at 3:08 PM Christian Brauner <christian@brauner.io> wrote:
> On Wed, May 15, 2019 at 10:45:06AM -0700, Daniel Colascione wrote:
> > On Wed, May 15, 2019 at 3:04 AM Christian Brauner <christian@brauner.io> wrote:
> > >
> > > This adds the pidfd_open() syscall. It allows a caller to retrieve pollable
> > > pidfds for a process which did not get created via CLONE_PIDFD, i.e. for a
> > > process that is created via traditional fork()/clone() calls that is only
> > > referenced by a PID:
[...]
> > > +/**
> > > + * pidfd_open() - Open new pid file descriptor.
> > > + *
> > > + * @pid:   pid for which to retrieve a pidfd
> > > + * @flags: flags to pass
> > > + *
> > > + * This creates a new pid file descriptor with the O_CLOEXEC flag set for
> > > + * the process identified by @pid. Currently, the process identified by
> > > + * @pid must be a thread-group leader. This restriction currently exists
> > > + * for all aspects of pidfds including pidfd creation (CLONE_PIDFD cannot
> > > + * be used with CLONE_THREAD) and pidfd polling (only supports thread group
> > > + * leaders).
> > > + *
> > > + * Return: On success, a cloexec pidfd is returned.
> > > + *         On error, a negative errno number will be returned.
> > > + */
> > > +SYSCALL_DEFINE2(pidfd_open, pid_t, pid, unsigned int, flags)
> > > +{
[...]
> > > +       if (pid <= 0)
> > > +               return -EINVAL;
> >
> > WDYT of defining pid == 0 to mean "open myself"?
>
> I'm torn. It be a nice shortcut of course but pid being 0 is usually an
> indicator for child processes. So unless the getpid() before
> pidfd_open() is an issue I'd say let's leave it as is. If you really
> want the shortcut might -1 be better?

Joining the bikeshed painting club: Please don't allow either 0 or -1
as shortcut for "self". James Forshaw found an Android security bug a
while back (https://bugs.chromium.org/p/project-zero/issues/detail?id=727)
that passed a PID to getpidcon(), except that the PID was 0
(placeholder for oneway binder transactions), and then the service
thought it was talking to itself. You could pick some other number and
provide a #define for that, but I think pidfd_open(getpid(), ...)
makes more sense.
