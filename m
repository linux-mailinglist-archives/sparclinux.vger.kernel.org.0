Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1EE2A94C9
	for <lists+sparclinux@lfdr.de>; Wed,  4 Sep 2019 23:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfIDVQw (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 4 Sep 2019 17:16:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40874 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfIDVQw (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 4 Sep 2019 17:16:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id 7so168256ljw.7
        for <sparclinux@vger.kernel.org>; Wed, 04 Sep 2019 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hgF2nRVhP2Z9Hk/CZOFcXhAAs++h0MvE3fMY8xcOeYw=;
        b=V0fXrvG/y6fw7T3tD/KUlmTDsOhByRFRgMw+QxPA9hiU5TDgpngn7HfopRM+i/LJMb
         k2AA+nRMkFxYb/ldSeHBR5el3bmmhNNCMxw9ToB+OOlkWRR6wchZHlLiKsQK9TmfmvjP
         dVvrUijYkfU5Fh9X3uECYhU3OGmtsUJMmdGfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgF2nRVhP2Z9Hk/CZOFcXhAAs++h0MvE3fMY8xcOeYw=;
        b=d/XyhYQIDMb3xas6DOOq7xncnpAxxQ+UCQ2jfXsDNFbD43gANW/UluT9A396U3cs+G
         HcaHMS4y9LpoCGLXQnVJwAHMqqo6qow5x62TGxPiu/fzO74qtk16yFrXWBPMqyLmTmrj
         NSyE5rU+7z6rvnBlUmQ1Z3F6dywdkUobNwIhq9/IS1EQ2zp2MuEATnonC7GF5weOKi/C
         omRTrCesWzDSESdYbtAyTDEu7+DMrYl9ADMc0TUMxTHApXg2b/qg7pP0ScqTLmDDb3mB
         R596LYVJFv6TWCSF+O0Hz3HJSab+DcyTQOw1VO3LYXM8vQE0nf7dhnCMQNWm8kTmAC4s
         1iow==
X-Gm-Message-State: APjAAAUTOr1OxFdZk9eIDR+9r0ZpU4zFFe/QSwAlT59ycmAd0ZpIjXDZ
        ZkY3bGFAGUQqmSM+CyT/xMKLaElzk3I=
X-Google-Smtp-Source: APXvYqw/ie3HEB7gsMnU/fDgbCpFf0HnAZNxPRdhFGlSICIX6s34IRFM7oV7KnJOtzZcKGIRHi7QcA==
X-Received: by 2002:a2e:9c99:: with SMTP id x25mr6703916lji.9.1567631809968;
        Wed, 04 Sep 2019 14:16:49 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id f19sm2177075ljc.72.2019.09.04.14.16.49
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 14:16:49 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id u14so144852ljj.11
        for <sparclinux@vger.kernel.org>; Wed, 04 Sep 2019 14:16:49 -0700 (PDT)
X-Received: by 2002:a2e:8507:: with SMTP id j7mr10579330lji.156.1567631404184;
 Wed, 04 Sep 2019 14:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
In-Reply-To: <20190904201933.10736-11-cyphar@cyphar.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 14:09:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
Message-ID: <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
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

On Wed, Sep 4, 2019 at 1:23 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> This patch allows for LOOKUP_BENEATH and LOOKUP_IN_ROOT to safely permit
> ".." resolution (in the case of LOOKUP_BENEATH the resolution will still
> fail if ".." resolution would resolve a path outside of the root --
> while LOOKUP_IN_ROOT will chroot(2)-style scope it). Magic-link jumps
> are still disallowed entirely because now they could result in
> inconsistent behaviour if resolution encounters a subsequent ".."[*].

This is the only patch in the series that makes me go "umm".

Why is it ok to re-initialize m_seq, which is used by other things
too? I think it's because we're out of RCU lookup, but there's no
comment about it, and it looks iffy to me. I'd rather have a separate
sequence count that doesn't have two users with different lifetime
rules.

But even apart from that, I think from a "patch continuity" standpoint
it would be better to introduce the sequence counts as just an error
condition first - iow, not have the "path_is_under()" check, but just
return -EXDEV if the sequence number doesn't match.

So you'd have three stages:

 1) ".." always returns -EXDEV

 2) ".." returns -EXDEV if there was a concurrent rename/mount

 3) ".." returns -EXDEV if there was a concurrent rename/mount and we
reset the sequence numbers and check if you escaped.

becasue the sequence number reset really does make me go "hmm", plus I
get this nagging little feeling in the back of my head that you can
cause nasty O(n^2) lookup cost behavior with deep paths, lots of "..",
and repeated path_is_under() calls.

So (1) sounds safe. (2) sounds simple. And (3) is where I think subtle
things start happening.

Also, I'm not 100% convinced that (3) is needed at all. I think the
retry could be done in user space instead, which needs to have a
fallback anyway. Yes? No?

                 Linus
