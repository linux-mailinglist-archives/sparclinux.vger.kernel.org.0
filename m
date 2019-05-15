Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D16F1F791
	for <lists+sparclinux@lfdr.de>; Wed, 15 May 2019 17:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfEOPay (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 15 May 2019 11:30:54 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39687 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfEOPas (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 15 May 2019 11:30:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id e24so406214edq.6
        for <sparclinux@vger.kernel.org>; Wed, 15 May 2019 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aA/9xJj7LTMF1BWw8aRur3CJhiNYxnU3NsvAQ/tm1xk=;
        b=cVOJomieev/iQakiPOTryvyjScY68JwrcjZ9tnp9aeBqv3wRx4Edk6Zam5C4dpe1lU
         ogJ1bz/0uxayIY+dTGNRsGRKQE6a7udSOJYX/3GGdfJsVPiUlo9NIVE5wtEn+5hBwiSU
         gwP9J1DGbHYliH8LbuzUv/B66fmaNK+5+P4Nf0pkHXalxp2DHQe3TjDimH0gP6oUwq5l
         okb7EvO9DMTE9eTKyMdqlLNyrY47JfXoH49cTCN0H2L4KRmjYeMaDxi5FvoPvo3asXpV
         5VjgjpZVUupeOdTmVGMkhRg4ZLi1nCgbsXBRTgk7m9FRnUbqV0616Vj7CPnf3pkdvUzD
         ZpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aA/9xJj7LTMF1BWw8aRur3CJhiNYxnU3NsvAQ/tm1xk=;
        b=NH2ysKcObDtL8s+G4yEzwFaAAr0NWaAXvaDJubHb/FBLg0u2p5GrgeKPJQWFHxu6yC
         waxXO+AkKxZ1eX5K6hrkbiDOF6cIA0ERW97Lj4i4I096AcZsru4eo/WcvC987iAVNrEc
         xT5RjKGR2/wD2gqdZQn8pCxI4x71EryGocL5CA+CdKAuER7LjJX1dhKcgnSFwWls49Vz
         LGX4wu8n629KvSLSMYOUypXG6T/zlZwK/8BPGeDb9wr7PFl/2lSsf1fGY9k3wRT6c3Y7
         2cWCZ2nsLpxQinzUNr7HEwBMgUtt7UbMzIra7ICduuL/bK8KpMehtbV/v91Sos6QvI4d
         kkJg==
X-Gm-Message-State: APjAAAW4XpE5pPDTYxaFMyjntB+oh8h2jB3waLA6S+WEiwVtNvDSe3ht
        mTcPchMEzMwoYXU4auNTiNjikA==
X-Google-Smtp-Source: APXvYqw0QCYB7YlBSERFfTRieSPZ+dY7tEzUwoL9QiWp8tjx2MbhTffXtauytMVbchs42mNvhzDMIw==
X-Received: by 2002:a50:99ca:: with SMTP id n10mr44141540edb.279.1557934246270;
        Wed, 15 May 2019 08:30:46 -0700 (PDT)
Received: from brauner.io ([193.96.224.243])
        by smtp.gmail.com with ESMTPSA id d4sm924077edk.46.2019.05.15.08.30.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 15 May 2019 08:30:45 -0700 (PDT)
Date:   Wed, 15 May 2019 17:30:42 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     jannh@google.com, viro@zeniv.linux.org.uk,
        torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, dhowells@redhat.com, akpm@linux-foundation.org,
        cyphar@cyphar.com, ebiederm@xmission.com,
        elena.reshetova@intel.com, keescook@chromium.org,
        luto@amacapital.net, luto@kernel.org, tglx@linutronix.de,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] pid: add pidfd_open()
Message-ID: <20190515153041.cshzaj7xhf2p4zv7@brauner.io>
References: <20190515100400.3450-1-christian@brauner.io>
 <20190515143857.GB18892@redhat.com>
 <20190515144927.f2yxyi6w6lhn3xx7@brauner.io>
 <20190515151912.GE18892@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190515151912.GE18892@redhat.com>
User-Agent: NeoMutt/20180716
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, May 15, 2019 at 05:19:13PM +0200, Oleg Nesterov wrote:
> On 05/15, Christian Brauner wrote:
> >
> > On Wed, May 15, 2019 at 04:38:58PM +0200, Oleg Nesterov wrote:
> > >
> > > it seems that you can do a single check
> > >
> > > 	tsk = pid_task(p, PIDTYPE_TGID);
> > > 	if (!tsk)
> > > 		ret = -ESRCH;
> > >
> > > this even looks more correct if we race with exec changing the leader.
> >
> > The logic here being that you can only reach the thread_group leader
> > from struct pid if PIDTYPE_PID == PIDTYPE_TGID for this struct pid?
> 
> Not exactly... it is not that PIDTYPE_PID == PIDTYPE_TGID for this pid,
> struct pid has no "type" or something like this.
> 
> The logic is that pid->tasks[PIDTYPE_XXX] is the list of task which use
> this pid as "XXX" type.
> 
> For example, clone(CLONE_THREAD) creates a pid which has a single non-
> empty list, pid->tasks[PIDTYPE_PID]. This pid can't be used as TGID or
> SID.
> 
> So if pid_task(PIDTYPE_TGID) returns non-NULL we know that this pid was
> used for a group-leader, see copy_process() which does

Ah, this was what I was asking myself when I worked on thread-specific
signal sending. This clarifies quite a lot of things!

Though I wonder how one reliably gets a the PGID or SID from a
PIDTYPE_PID.

> 
> 	if (thread_group_leader(p))
> 		attach_pid(p, PIDTYPE_TGID);
> 
> 
> If we race with exec which changes the leader pid_task(TGID) can return
> the old leader. We do not care, but this means that we should not check
> thread_group_leader().

Nice!

Thank you, Oleg! :)
Christian
