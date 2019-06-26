Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB7C55CE6
	for <lists+sparclinux@lfdr.de>; Wed, 26 Jun 2019 02:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFZA2m (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 25 Jun 2019 20:28:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37891 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFZA2m (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 25 Jun 2019 20:28:42 -0400
Received: by mail-io1-f68.google.com with SMTP id j6so1164916ioa.5
        for <sparclinux@vger.kernel.org>; Tue, 25 Jun 2019 17:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/uR/4PciUq//wm8VvTrYpqXShwr7/kFFKyCPyP8pcs=;
        b=YeX/xFTe86cLjtEiwNDGr0CKTn6yvfRoFVYAyjGpJqcjyjOauh0oSms8qNpsPWv76x
         eRvUUgmWL0+6wScBbr8rD2ZZ/RfhNpAX4UKm1peplkD8GmwmOk+8uVKUsB9hanwxe3Dm
         H0krLG+sD5Fzr71HJU1x0kXlYQzuI9cWXt4LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/uR/4PciUq//wm8VvTrYpqXShwr7/kFFKyCPyP8pcs=;
        b=NAMl0EkUW1zWBLLhsC26YJtqLTKKEpOlwG1EUMy4vtZKjsTCVzItczGRNO56iPBr23
         7i68LxRnWDXh0+i38M612WhSYqtPWm670IanMpgs9NxRzVsLqdC3J/5Jh7AzJoJpSD+z
         9IbaIyA0AlS5l2OZqZGYQwt9aPZyK+uYvzLBnbQpkdfzerXbxDvI5MWPi/xkRJADB8ZF
         hdYA8R5weIZN5YrS2u/GDz3MFfgQ5ShO6HWzo4DbPQVqpDZvEJs87a8T6rFMdJYB+T/9
         alCHYprkMUdBJBhxaoKn7Wlf9EpjuHAoGOgrYkhdto3amLr++TpuGiZ9iSDkmtwa7RNJ
         itag==
X-Gm-Message-State: APjAAAVEZEfKgo0EpAzjsXIm+HYBx9Z1DXaACerBGM62ie5wYadL7Em8
        y/eD01P0F6QWZY5OgyLhhvPwCjdytRjqjLAjoQrg3pKhApcO/w==
X-Google-Smtp-Source: APXvYqxX0Qrt909cJIALCW0svY89PQl3z7r/J2jSYrLO+BEo6+PoMkKF1jAWxKfLc2PBHctF8DPoeOKanHzXan7VOSY=
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr1751422iod.254.1561508921439;
 Tue, 25 Jun 2019 17:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
In-Reply-To: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jun 2019 08:28:30 +0800
Message-ID: <CAADWXX8wdEPNZ26SFJUfwrhQson3HPTrZ7D2jju3RhEeMuc+QQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
To:     Hoan Tran OS <hoan@os.amperecomputing.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "David S . Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Open Source Submission <patches@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This is not a comment on the patch series itself, it is a comment on the emails.

Your email is mis-configured and ends up all being marked as spam for
me, because you go through the wrong smtp server (or maybe your smtp
server itself is miconfigured)

All your emails fail dmarc, because the "From" header is
os.amperecomputing.com, but the DKIM signature is for
amperemail.onmicrosoft.com.

End result: it wil all go into the spam box of anybody who checks DKIM.

                       Linus

On Wed, Jun 26, 2019 at 6:30 AM Hoan Tran OS
<hoan@os.amperecomputing.com> wrote:
>
> This patch set enables CONFIG_NODES_SPAN_OTHER_NODES by default
> for NUMA. [...]
