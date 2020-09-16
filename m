Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5BA26CAAE
	for <lists+sparclinux@lfdr.de>; Wed, 16 Sep 2020 22:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgIPRdQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 16 Sep 2020 13:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgIPRdN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 16 Sep 2020 13:33:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2E5C0A3BDC
        for <sparclinux@vger.kernel.org>; Wed, 16 Sep 2020 05:24:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z1so6721288wrt.3
        for <sparclinux@vger.kernel.org>; Wed, 16 Sep 2020 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=l8kjoyfFJu+D8mOuRZf0tG7/TCcNZBbZs3fWorKgkQY=;
        b=J/liHQ0EIWObpZg3n9l2Grq7i/9Ph0+zlI5egK9nl/jkr5rSDSqoqJ3L9BfGE0YrBg
         6YLOylfP0g+FHwlZTGgqH0B+/2Ka8VT6sAEvX5RqiCvrH6SQouNOXlyxrkC0jgRqfSXt
         qU0s4WO4LgkrsYnfAuEj5ABJpMn1ygWLFQn/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=l8kjoyfFJu+D8mOuRZf0tG7/TCcNZBbZs3fWorKgkQY=;
        b=TEQWK/W36No+LFk4cSIg8pJS989gKnZetpzK5nBEZw11hip5X4Xm78nXHyBCpG2nIq
         9OjGa762n5gZuhvbeg+FiMBqhykDyGVAmd83tau3ha9OB/kLgAZpVYLLv63v2hgLScTO
         dOu/x8dS0tI09HzJtJHDsaTrkitGLfNIIlpM9L06dB3E2k9vOtmXZy18nNHGv5YaHVSt
         70FGFFCoRkyaNWW5yStsdRe2L2sR/Zy/mQCRVZ0fsOOj3ZRl/CzhTsRx2mdDgm78v76a
         JoAXHtYlXZvmheFXF2WPxWQxJbAMfE/26Xxwbwq7pvOx6vvLeymB3cJ0jmImTD2KGw5O
         a8UQ==
X-Gm-Message-State: AOAM531lsmwoF9PKXVFwFGQ43OaqGu/upAGZaD+Rc4VBdOrezEOb0IKs
        TSIZEbibOFv5aTL4gimasZo54g==
X-Google-Smtp-Source: ABdhPJxyu4DwSY4BIVWxJ6Hc2i1yJDRluPIhg3ID8mT2aS2WZiy2nGaJoOjxR85EDt24rNjWMu8++w==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr24212577wrm.118.1600259049514;
        Wed, 16 Sep 2020 05:24:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 10sm5165242wmi.37.2020.09.16.05.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:24:08 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:24:05 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, airlied@linux.ie, sam@ravnborg.org,
        mark.cave-ayland@ilande.co.uk, kraxel@redhat.com,
        davem@davemloft.net, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        thomas.hellstrom@intel.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
Message-ID: <20200916122405.GQ438822@phenom.ffwll.local>
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Sep 16, 2020 at 12:48:20PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.09.20 um 11:37 schrieb Daniel Vetter:
> > On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
> >> Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
> >> of dma-buf memory in kernel address space. The functions operate with plain
> >> addresses and the assumption is that the memory can be accessed with load
> >> and store operations. This is not the case on some architectures (e.g.,
> >> sparc64) where I/O memory can only be accessed with dedicated instructions.
> >>
> >> This patchset introduces struct dma_buf_map, which contains the address of
> >> a buffer and a flag that tells whether system- or I/O-memory instructions
> >> are required.
> >>
> >> Some background: updating the DRM framebuffer console on sparc64 makes the
> >> kernel panic. This is because the framebuffer memory cannot be accessed with
> >> system-memory instructions. We currently employ a workaround in DRM to
> >> address this specific problem. [1]
> >>
> >> To resolve the problem, we'd like to address it at the most common point,
> >> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> >> instructions are required and exports this information to it's users. The
> >> new structure struct dma_buf_map stores the buffer address and a flag that
> >> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> >> can then access the memory accordingly.
> >>
> >> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> >> and it's interfaces. Further patches can update dma-buf users. For example,
> >> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> >>
> >> Further work: TTM, one of DRM's memory managers, already exports an
> >> is_iomem flag of its own. It could later be switched over to exporting struct
> >> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> >> fbdev console to operate on I/O memory. These could possibly be switched over
> >> to the generic fbdev emulation, as soon as the generic code uses struct
> >> dma_buf_map.
> >>
> >> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> >> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
> > 
> > lgtm, imo ready to convert the follow-up patches over to this. But I think
> > would be good to get at least some ack from the ttm side for the overall
> > plan.
> 
> Yup, it would be nice if TTM could had out these types automatically.
> Then all TTM-based drivers would automatically support it.
> 
> > 
> > Also, I think we should put all the various helpers (writel/readl, memset,
> > memcpy, whatever else) into the dma-buf-map.h helper, so that most code
> > using this can just treat it as an abstract pointer type and never look
> > underneath it.
> 
> We have some framebuffer helpers that rely on pointer arithmetic, so
> we'd need that too. No big deal wrt code, but I was worried about the
> overhead. If a loop goes over framebuffer memory, there's an if/else
> branch for each access to the memory buffer.

If we make all the helpers static inline, then the compiler should be able
to see that dma_buf_map.is_iomem is always the same, and produced really
optimized code for it by pulling that check out from all the loops.

So should only result in somewhat verbose code of having to call
dma_buf_map pointer arthimetic helpers, but not in bad generated code.
Still worth double-checking I think, since e.g. on x86 the generated code
should be the same for both cases (but maybe the compiler doesn't see
through the inline asm to realize that, so we might end up with 2 copies).
-Daniel


> 
> Best regards
> Thomas
> 
> > -Daniel
> > 
> >>
> >> Thomas Zimmermann (3):
> >>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
> >>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
> >>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
> >>
> >>  Documentation/driver-api/dma-buf.rst          |   3 +
> >>  drivers/dma-buf/dma-buf.c                     |  40 +++---
> >>  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
> >>  drivers/gpu/drm/drm_prime.c                   |  14 +-
> >>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
> >>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
> >>  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
> >>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
> >>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
> >>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
> >>  include/drm/drm_prime.h                       |   5 +-
> >>  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
> >>  include/linux/dma-buf.h                       |  11 +-
> >>  15 files changed, 274 insertions(+), 82 deletions(-)
> >>  create mode 100644 include/linux/dma-buf-map.h
> >>
> >> --
> >> 2.28.0
> >>
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
