Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B5F22F33D
	for <lists+sparclinux@lfdr.de>; Mon, 27 Jul 2020 17:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgG0PAi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Jul 2020 11:00:38 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:44026 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgG0PAi (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 27 Jul 2020 11:00:38 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 180BE2002B;
        Mon, 27 Jul 2020 17:00:30 +0200 (CEST)
Date:   Mon, 27 Jul 2020 17:00:29 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200727150029.GA3835495@ravnborg.org>
References: <20200725191012.GA434957@ravnborg.org>
 <CAKMK7uFAjUTmsPJY7YW5_N34DS8XMvboDcxo6EwiQ2XRSqK_hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFAjUTmsPJY7YW5_N34DS8XMvboDcxo6EwiQ2XRSqK_hQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pcZqCyVeAAAA:8 a=QyXUC8HyAAAA:8
        a=20KFwNOVAAAA:8 a=J1Y8HTJGAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
        a=25-AhOLfAAAA:8 a=5hS7gsBYLqtl4gt-n28A:9 a=YB4YzlU5riCJnl6y:21
        a=kimdc023-DlMoo-J:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=SGy6VSG0Ue1xmPAwIFl9:22 a=y1Q9-5lHfBjTkpIzbSAN:22
        a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=dnuY3_Gu-P7Vi9ynLKQe:22
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Daniel

On Mon, Jul 27, 2020 at 11:20:13AM +0200, Daniel Vetter wrote:
> On Sat, Jul 25, 2020 at 9:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > From 1323a7433691aee112a9b2df8041b5024895a77e Mon Sep 17 00:00:00 2001
> > From: Sam Ravnborg <sam@ravnborg.org>
> > Date: Thu, 9 Jul 2020 21:30:16 +0200
> > Subject: [PATCH v2 1/1] drm/drm_fb_helper: fix fbdev with sparc64
> >
> > Recent kernels have been reported to panic using the bochs_drm framebuffer under
> > qemu-system-sparc64 which was bisected to commit 7a0483ac4ffc "drm/bochs: switch to
> > generic drm fbdev emulation". The backtrace indicates that the shadow framebuffer
> > copy in drm_fb_helper_dirty_blit_real() is trying to access the real framebuffer
> > using a virtual address rather than use an IO access typically implemented using a
> > physical (ASI_PHYS) access on SPARC.
> >
> > The fix is to replace the memcpy with memcpy_toio() from io.h.
> >
> > memcpy_toio() uses writeb() where the original fbdev code
> > used sbus_memcpy_toio(). The latter uses sbus_writeb().
> >
> > The difference between writeb() and sbus_memcpy_toio() is
> > that writeb() writes bytes in little-endian, where sbus_writeb() writes
> > bytes in big-endian. As endian does not matter for byte writes they are
> > the same. So we can safely use memcpy_toio() here.
> >
> > For many architectures memcpy_toio() is a simple memcpy().
> > One side-effect that is unknown is if this has any impact on other
> > architectures.
> > So far the analysis tells that this change is OK for other arch's.
> > but testing would be good.
> 
> The rules are that officially we have to use the io functions for
> __mmio pointers. We just drop these sparse annotations on the floor.
> I'd replace this with something like:
> 
> "Note that this only fixes bochs, in general fbdev helpers still have
> issues with mixing up system memory and mmio space. Fixing that will
> require a lot more work."
OK, done.

> 
> > v2:
> >   - Added missing __iomem cast (kernel test robot)
> >   - Made changelog readable and fix typos (Mark)
> >   - Add flag to select iomem - and set it in the bochs driver
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: sparclinux@vger.kernel.org
> > Link: https://patchwork.freedesktop.org/patch/msgid/20200709193016.291267-1-sam@ravnborg.org
> > ---
> >
> > This fix introducing a flag in mode_config is at best a band-aid
> > solution until we have a proper fix.
> > We need to propagate the info about iomem so it is not a driver flag
> > thing.
> >
> > There is also the issue with sys* versus cfb* functions, where cfb*
> > functions are used for iomem.
> > I did not manage to make the bochs driver work with the cfb* functions,
> > for some unknown reason booting would be stuck waiting for the console
> > mutex when usign the cfb* functions.
> >
> > I consider this fix OK to get the kernel working for sparc64 with the
> > bochs driver for now. And with the fbdev_uses_iomem flag no other
> > drivers will see any changes.
> >
> >         Sam
> >
> >  drivers/gpu/drm/bochs/bochs_kms.c | 1 +
> >  drivers/gpu/drm/drm_fb_helper.c   | 6 +++++-
> >  include/drm/drm_mode_config.h     | 9 +++++++++
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> > index 05d8373888e8..079f46f5cdb6 100644
> > --- a/drivers/gpu/drm/bochs/bochs_kms.c
> > +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> > @@ -146,6 +146,7 @@ int bochs_kms_init(struct bochs_device *bochs)
> >         bochs->dev->mode_config.preferred_depth = 24;
> >         bochs->dev->mode_config.prefer_shadow = 0;
> >         bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> > +       bochs->dev->mode_config.fbdev_use_iomem = true;
> >         bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
> >
> >         bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 5609e164805f..89cfd68ef400 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -399,7 +399,11 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> >         unsigned int y;
> >
> >         for (y = clip->y1; y < clip->y2; y++) {
> > -               memcpy(dst, src, len);
> > +               if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> > +                       memcpy(dst, src, len);
> > +               else
> > +                       memcpy_toio((void __iomem *)dst, src, len);
> > +
> >                 src += fb->pitches[0];
> >                 dst += fb->pitches[0];
> >         }
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index 6c3ef49b46b3..c24c066bdd9c 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -865,6 +865,15 @@ struct drm_mode_config {
> >          */
> >         bool prefer_shadow_fbdev;
> >
> > +       /**
> > +        * @fbdev_use_iomem:
> > +        *
> > +        * Set to true if framebuffer reside in iomem.
> > +        * When set to true memcpy_toio() is used when copying the framebuffer in
> > +        * drm_fb_helper.drm_fb_helper_dirty_blit_real()
> 
> I'd add a "FIXME: This should be replaced with a per-mapping is_iomem
> flag (like ttm does), and then used everywhere in fbdev code."
>
OK.

> With those two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Thanks.
Applied to drm-misc-fixes and will push out when build testing finish.

	Sam
> 
> > +        */
> > +       bool fbdev_use_iomem;
> > +
> >         /**
> >          * @quirk_addfb_prefer_xbgr_30bpp:
> >          *
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
