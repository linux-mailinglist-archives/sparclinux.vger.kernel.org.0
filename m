Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB6222C074
	for <lists+sparclinux@lfdr.de>; Fri, 24 Jul 2020 10:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGXIJn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 Jul 2020 04:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgGXIJn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 24 Jul 2020 04:09:43 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E406CC0619D3
        for <sparclinux@vger.kernel.org>; Fri, 24 Jul 2020 01:09:42 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id d4so6390434otk.2
        for <sparclinux@vger.kernel.org>; Fri, 24 Jul 2020 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u5WUEiZQnTzlqtDgNNXx/FqFurAeXgz8pOyQpPHE4t8=;
        b=SDXPTA/HGCTJKrnaW1Xrtkxowy+uFFdQ7usysrz++2vNgGJD3FtsH+BOFxh5ZvHkR6
         HWxX+uTvJz59xyS1wxWEqPWBeJUufj6WObvLKi1Uv2xl3Ji+2p7Hh7Dd3pqxF9FX3IT1
         hH6h4tF+4WZk6YefOCSvdp0jD0op5IwhHp4Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5WUEiZQnTzlqtDgNNXx/FqFurAeXgz8pOyQpPHE4t8=;
        b=goJZtjjKJe5k1B1tSHyYY/QXHGEzwZEDarUfDu7oM8mIyq2jKo/GnH7VlqvMB6LxAl
         sBfxzNOvorhAMN1YCAihIEUnmfWjl/FiAVgI4AzkEbCO80km8M5zxi9j5LcZ+60rymMM
         0xyr10fSjVaZiLFEib8yxjVc9GPNqXgh9mywUeues6m6UmXv6AZmPJ959Y+XNGwMcs8S
         ZTaQjfVwrbiOmAleltpeoaoBnmnjBNaKs8ZZr0tmnp7RgmgNMbr5EmWB6iwN881zwx1I
         Mg9VypXxnAXuizaSL0TIgXgTkVbra//X3I/dYTzt25knGwk7PYBcFGPdZ+7J1T1Qhflr
         eSTw==
X-Gm-Message-State: AOAM531TN173Nnic43+Uk0xV3kpNRnDkadY0i7ETbkER3SgAzpsfqYKl
        48lYwRh8X714YrbFqyJb04k5DJs6I9dJRUbPuOUSYg==
X-Google-Smtp-Source: ABdhPJxrcn73s+oeNAhDxP1Hfx1gAd9s6xWRszh9+1yFGeaWJuXHIZfHeiyh/Fi8iVbRRSALUJpKIUV88cYAQs2eDqM=
X-Received: by 2002:a05:6830:1613:: with SMTP id g19mr7466756otr.303.1595578181467;
 Fri, 24 Jul 2020 01:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200709193016.291267-1-sam@ravnborg.org> <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local> <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
 <20200714084141.GW3278063@phenom.ffwll.local> <a3fdd8b9-bf2b-dcd7-63b7-91f379865a6c@suse.de>
 <CAPM=9tyoJhvudNake+w=e4S9dQ8MT_bQEF9USuj=_vHBRLzA8Q@mail.gmail.com> <20200724062359.GA612640@ravnborg.org>
In-Reply-To: <20200724062359.GA612640@ravnborg.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 24 Jul 2020 10:09:30 +0200
Message-ID: <CAKMK7uHRxXeduoQHs-FmX2nZp966fUs6h8-+ecJjiPm4E6ARwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Gerd Hoffmann <kraxel@redhat.com>, sparclinux@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Jul 24, 2020 at 8:24 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
>  Hi Dave.
>  On Fri, Jul 24, 2020 at 02:53:30PM +1000, Dave Airlie wrote:
> > On Tue, 14 Jul 2020 at 18:56, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi
> > >
> > > Am 14.07.20 um 10:41 schrieb Daniel Vetter:
> > > > On Tue, Jul 14, 2020 at 08:41:58AM +0200, Thomas Zimmermann wrote:
> > > >> Hi
> > > >>
> > > >> Am 13.07.20 um 18:21 schrieb Daniel Vetter:
> > > >>> On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> > > >>>> Hi
> > > >>>>
> > > >>>> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> > > >>>>> Mark reported that sparc64 would panic while booting using qemu.
> > > >>>>> Mark bisected this to a patch that introduced generic fbdev emulation to
> > > >>>>> the bochs DRM driver.
> > > >>>>> Mark pointed out that a similar bug was fixed before where
> > > >>>>> the sys helpers was replaced by cfb helpers.
> > > >>>>>
> > > >>>>> The culprint here is that the framebuffer reside in IO memory which
> > > >>>>> requires SPARC ASI_PHYS (physical) loads and stores.
> > > >>>>>
> > > >>>>> The current bohcs DRM driver uses a shadow buffer.
> > > >>>>> So all copying to the framebuffer happens in
> > > >>>>> drm_fb_helper_dirty_blit_real().
> > > >>>>>
> > > >>>>> The fix is to replace the memcpy with memcpy_toio() from io.h.
> > > >>>>>
> > > >>>>> memcpy_toio() uses writeb() where the original fbdev code
> > > >>>>> used sbus_memcpy_toio(). The latter uses sbus_writeb().
> > > >>>>>
> > > >>>>> The difference between writeb() and sbus_memcpy_toio() is
> > > >>>>> that writeb() writes bytes in little-endian, where sbus_writeb() writes
> > > >>>>> bytes in big-endian. As endian does not matter for byte writes they are
> > > >>>>> the same. So we can safely use memcpy_toio() here.
> > > >>>>>
> > > >>>>> For many architectures memcpy_toio() is a simple memcpy().
> > > >>>>> One sideeffect that is unknow is if this has any impact on other
> > > >>>>> architectures.
> > > >>>>> So far the analysis tells that this change is OK for other arch's.
> > > >>>>> but testing would be good.
> > > >>>>>
> > > >>>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > >>>>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > >>>>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > >>>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > >>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > >>>>> Cc: "David S. Miller" <davem@davemloft.net>
> > > >>>>> Cc: sparclinux@vger.kernel.org
> > > >>>>
> > > >>>> So this actually is a problem in practice. Do you know how userspace
> > > >>>> handles this?
> > > >>>>
> > > >>>> For this patch
> > > >>>>
> > > >>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > >>>>
> > > >>>> but I'd like to have someone with more architecture expertise ack this
> > > >>>> as well.
> > > >>>>
> > > >>>> Best regards
> > > >>>> Thomas
> > > >>>>
> > > >>>>> ---
> > > >>>>>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> > > >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>>>>
> > > >>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > >>>>> index 5609e164805f..4d05b0ab1592 100644
> > > >>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> > > >>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > >>>>> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> > > >>>>>   unsigned int y;
> > > >>>>>
> > > >>>>>   for (y = clip->y1; y < clip->y2; y++) {
> > > >>>>> -         memcpy(dst, src, len);
> > > >>>>> +         memcpy_toio(dst, src, len);
> > > >>>
> > > >>> I don't think we can do this unconditionally, there's fbdev-helper drivers
> > > >>> using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
> > > >>> to fix this properly I think.
> > > >>
> > > >> I once has a patch set for this problem, but it didn't make it. [1]
> > > >>
> > > >> Buffers can move between I/O and system memory, so a simple flag would
> > > >> not work. I'd propose this
> > > >>
> > > >> bool drm_gem_is_iomem(struct drm_gem_object *obj)
> > > >> {
> > > >>      if (obj->funcs && obj->funcs->is_iomem)
> > > >>              return obj->funcs->is_iomem(obj);
> > > >>      return false;
> > > >> }
> > > >>
> > > >> Most GEM implmentations wouldn't bother, but VRAM helpers could set the
> > > >> is_iomem function and return the current state. Fbdev helpers can then
> > > >> pick the correct memcpy_*() function.
> > > >
> > > > Hm wasn't the (long term at least) idea to add the is_iomem flag to the
> > > > vmap functions? is_iomem is kinda only well-defined if there's a vmap of
> > > > the buffer around (which also pins it), or in general when the buffer is
> > > > pinned. Outside of that an ->is_iomem function doesn't make much sense.
> > >
> > > Oh. From how I understood the original discussion, you shoot down the
> > > idea because sparse would not support it well?
> > >
> > > The other idea was to add an additional vmap_iomem() helper that returns
> > > an__iomem pointer. Can we try that?
> > >
> > Did we get anywhere with this yet?
>
> A few on the work I did so far.
> Using qemu the original reported bug was fixed only be replacing a
> memcpy with memcpy_toio.
> But this looks like only a half solution as we would still use the sys_*
> variants to copy data to the framebuffer, and tye do not cope with
> frambuffer in dedicated IO memory.
>
> But I have not managed to get it work wiht qemu when using the cfb_*
> variants. I end up in a deadlock waiting for the console lock.
> So far my debuggin have not told me why I lock up the boot waiting for
> the console lock and I am stuck on that.
>
> I could send the patch memcpy => memcpy_toio but I am afraid it may not
> work on real HW as we do not cover the sys_* => cfb_*

Let's focus on the single memcpy_toio for the regression fix only for
now, that seems to be enough to get the system back to booting. Note
that we don't want the cfb helpers for the case where fbdev emulation
has a staging buffer in system memory, i.e. when the memcpy_toio
matters. So fixing that really should be all that's needed.

Fixing sys vs cfb is more a case of making it possible of other
drivers to also use the generic fbdev support, so that we can support
the case of framebuffer in io space without the dirtyfb staging upload
buffer. So minimal regression fix, more feature work (like the sys vs
cfb stuff) goes into -next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
