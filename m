Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197DC1FA2DB
	for <lists+sparclinux@lfdr.de>; Mon, 15 Jun 2020 23:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgFOVei (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 15 Jun 2020 17:34:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51040 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731476AbgFOVei (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 15 Jun 2020 17:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592256876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ItwxuioZVdA5XdCXR1QbAewm4+8qdb0KbH1lb+9ehrA=;
        b=gVPACN6xO1SeIGsjRKFWvtdrnZBydlA/xLaXlBTA9ukZGl8rrSHTnjN2uogdd2Fc4Dt43t
        N034oGy0lR/F8iU1msOQSncDNnrtFpLzDG+Yj7bkEUSC/23fQh5XZcOAkeqq2c9/GUp5z8
        vlzphSUVDu2xnhW42LAOptOJw/OIneY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-Dcxba9-uMhmGDKRVGFE9pQ-1; Mon, 15 Jun 2020 17:34:34 -0400
X-MC-Unique: Dcxba9-uMhmGDKRVGFE9pQ-1
Received: by mail-qv1-f69.google.com with SMTP id 59so14083872qvb.4
        for <sparclinux@vger.kernel.org>; Mon, 15 Jun 2020 14:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ItwxuioZVdA5XdCXR1QbAewm4+8qdb0KbH1lb+9ehrA=;
        b=oR5EqFfcvd8625GBuup42s3QH9cMs3AdpWlsBORc49g/6ueIBRrRJwB7hZiOiyADUr
         9x1+rPn+mk55bb9LnaiSafKz3qcEVmrjGwPLreB6m4neFcGTh3Vyif6eG6g7dzfQ9WTt
         3MzzAGskUVg+yEbgeJgrDZQ7cFFUKMsYLxesr9wlMaTDLdDXHfzkE2Dj6V6pJOV5ahLc
         i0CJ/OE7+OZwWc49OdQkdFpx791/U44GCGN1OI4WNQLV2X957yilNxjxzqHn7fUgTvaX
         LheihnEJdkbnvj8n7iXyClqvzp4x6jRCXkIcmM2/eHbB1Rit2gB1Ur1eXNTou9QzMPZX
         e29A==
X-Gm-Message-State: AOAM533dTPdUSYqn7XcGUNuIfUtCNK9sT+GwH/X8dZh5JT8Bt/q8IMZl
        JLWnajPpUNj2FtKMn6CBI3MnswyYliYGX7lJgOlPCTiFXcpPXGl3uuykykadmzQwUkXjSInD/S1
        vvWl6hUrzd+XqbGSeNnCSvA==
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr25540566qvq.117.1592256874105;
        Mon, 15 Jun 2020 14:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0iHGiHde51cucRTUPE7NzfM/1jQRbNlFV4ChXmFExBXup/Ay4TPRKGywEeToUwHIWcL2Psg==
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr25540552qvq.117.1592256873805;
        Mon, 15 Jun 2020 14:34:33 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id f30sm12961493qtb.9.2020.06.15.14.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 14:34:33 -0700 (PDT)
Date:   Mon, 15 Jun 2020 17:34:31 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200615213431.GC111927@xz-x1>
References: <20200610174811.44b94525@thinkpad>
 <20200610165023.GA67179@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610165023.GA67179@xz-x1>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Jun 10, 2020 at 12:50:23PM -0400, Peter Xu wrote:
> On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> > Hi,
> 
> Hi, Gerald,
> 
> > 
> > Some architectures have their page fault accounting code inside the fault
> > retry loop, and rely on only going through that code once. Before commit
> > 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> > ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> > 
> > That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> > architectures, and introduced a subtle change to page fault accounting
> > logic in the affected archs. It is now possible to go through the retry
> > loop multiple times, and the affected archs would then account multiple
> > page faults instead of just one.
> > 
> > This was found by coincidence in s390 code, and a quick check showed that
> > there are quite a lot of other architectures that seem to be affected in a
> > similar way. I'm preparing a fix for s390, by moving the accounting behind
> > the retry loop, similar to x86. It is not completely straight-forward, so
> > I leave the fix for other archs to the respective maintainers.
> 
> Sorry for not noticing this before.  The accounting part should definitely be
> put at least into a check against fault_flag_allow_retry_first() to mimic what
> was done before.  And I agree it would be even better to put it after the retry
> logic, so if any of the page faults gets a major fault, it'll be accounted as a
> major fault which makes more sense to me, just like what x86 is doing now with:
> 
> 	major |= fault & VM_FAULT_MAJOR;
> 
> I'm not sure what's the preference of the arch maintainers, just let me know if
> it's preferred to use a single series to address this issue for all affected
> archs (or the archs besides s390), then I'll do.

To make sure this won't fall through the cracks... I'll give it a shot with a
single series to address this issue for all archs.  Although it might not be
easy to do accounting directly in handle_mm_fault(), it might be still a chance
to introduce a helper so the accounting can be done in general code.

Thanks,

-- 
Peter Xu

