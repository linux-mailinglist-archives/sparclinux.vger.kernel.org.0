Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA5521EB9E
	for <lists+sparclinux@lfdr.de>; Tue, 14 Jul 2020 10:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgGNIlq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 14 Jul 2020 04:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgGNIlp (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 14 Jul 2020 04:41:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E5BC061755
        for <sparclinux@vger.kernel.org>; Tue, 14 Jul 2020 01:41:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o2so4082170wmh.2
        for <sparclinux@vger.kernel.org>; Tue, 14 Jul 2020 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/Jd4c0WBcnRS0cd4fRvCiVdvCcz4Bz7vlXm1iqEjsmU=;
        b=cQnNWiwv1BfjrBjCWhnIMToP/tRQKHBHPUH+ngtQ0uGUG0QlmDfpUSRN9kKM7FBEUq
         iPUdnFcDLQRE04cbLo5Ce1LTvy9/zvEUcNTGg5GeWOReMKJ59SZdnegbgJqYaRwK3dE1
         bKjsb0WZ868lmYmkFUWUTb66BxUN1OrxVTcJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/Jd4c0WBcnRS0cd4fRvCiVdvCcz4Bz7vlXm1iqEjsmU=;
        b=X1tS758t9orrmri/qndg2wsuNPAUOtXcQK//58WVRG6A1nyJ/q6MV4/2IJ7XQ1Zu87
         lDQ5CVL3A/PRnACUjnq/DNHtL1jhWw9R2JvYx5Js55AkH+6VXu4Qs0uTowTWKWxzvqlV
         BVMNUc8RAgeJ9ovp6Yzq+xAnCUmcfGs7FOkHc0M5bLUEQS6EMQvRcrs75SfLCcOluOa/
         r/oI5GqbtJiVVSnon1azRw+C1FsdJWpGKHouq0aExlHzWwk7qgdFWgxak9fAs/G1Vhaa
         rP61ZGKKsAv3qmQdGdLpWA6EqmUurLlBVX3xvTF1PGOOzGPbpppo8AVZle656QUvbKTz
         wa/g==
X-Gm-Message-State: AOAM533dC2jRXIkdwKZsXJ8m6/RfzqlUmJuPGYfk2qA1LNM6g2ogojs7
        IO4tGRtBGfoURwFi3pe4IhxIhw==
X-Google-Smtp-Source: ABdhPJwbUmSG/acKsZeu4cBPlQ7IB8rNeOHEqy3Nuj6uLQs9miLVibvjrd2C7rIqiK7W7MFrPFWJsA==
X-Received: by 2002:a1c:668b:: with SMTP id a133mr3193352wmc.10.1594716103802;
        Tue, 14 Jul 2020 01:41:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q188sm3502396wma.46.2020.07.14.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 01:41:43 -0700 (PDT)
Date:   Tue, 14 Jul 2020 10:41:41 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
        sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200714084141.GW3278063@phenom.ffwll.local>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
 <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jul 14, 2020 at 08:41:58AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.07.20 um 18:21 schrieb Daniel Vetter:
> > On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> >>> Mark reported that sparc64 would panic while booting using qemu.
> >>> Mark bisected this to a patch that introduced generic fbdev emulation to
> >>> the bochs DRM driver.
> >>> Mark pointed out that a similar bug was fixed before where
> >>> the sys helpers was replaced by cfb helpers.
> >>>
> >>> The culprint here is that the framebuffer reside in IO memory which
> >>> requires SPARC ASI_PHYS (physical) loads and stores.
> >>>
> >>> The current bohcs DRM driver uses a shadow buffer.
> >>> So all copying to the framebuffer happens in
> >>> drm_fb_helper_dirty_blit_real().
> >>>
> >>> The fix is to replace the memcpy with memcpy_toio() from io.h.
> >>>
> >>> memcpy_toio() uses writeb() where the original fbdev code
> >>> used sbus_memcpy_toio(). The latter uses sbus_writeb().
> >>>
> >>> The difference between writeb() and sbus_memcpy_toio() is
> >>> that writeb() writes bytes in little-endian, where sbus_writeb() writes
> >>> bytes in big-endian. As endian does not matter for byte writes they are
> >>> the same. So we can safely use memcpy_toio() here.
> >>>
> >>> For many architectures memcpy_toio() is a simple memcpy().
> >>> One sideeffect that is unknow is if this has any impact on other
> >>> architectures.
> >>> So far the analysis tells that this change is OK for other arch's.
> >>> but testing would be good.
> >>>
> >>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>> Cc: "David S. Miller" <davem@davemloft.net>
> >>> Cc: sparclinux@vger.kernel.org
> >>
> >> So this actually is a problem in practice. Do you know how userspace
> >> handles this?
> >>
> >> For this patch
> >>
> >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> but I'd like to have someone with more architecture expertise ack this
> >> as well.
> >>
> >> Best regards
> >> Thomas
> >>
> >>> ---
> >>>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >>> index 5609e164805f..4d05b0ab1592 100644
> >>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> >>>  	unsigned int y;
> >>>  
> >>>  	for (y = clip->y1; y < clip->y2; y++) {
> >>> -		memcpy(dst, src, len);
> >>> +		memcpy_toio(dst, src, len);
> > 
> > I don't think we can do this unconditionally, there's fbdev-helper drivers
> > using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
> > to fix this properly I think.
> 
> I once has a patch set for this problem, but it didn't make it. [1]
> 
> Buffers can move between I/O and system memory, so a simple flag would
> not work. I'd propose this
> 
> bool drm_gem_is_iomem(struct drm_gem_object *obj)
> {
> 	if (obj->funcs && obj->funcs->is_iomem)
> 		return obj->funcs->is_iomem(obj);
> 	return false;
> }
> 
> Most GEM implmentations wouldn't bother, but VRAM helpers could set the
> is_iomem function and return the current state. Fbdev helpers can then
> pick the correct memcpy_*() function.

Hm wasn't the (long term at least) idea to add the is_iomem flag to the
vmap functions? is_iomem is kinda only well-defined if there's a vmap of
the buffer around (which also pins it), or in general when the buffer is
pinned. Outside of that an ->is_iomem function doesn't make much sense.
-Daniel

> 
> Best regards
> Thomas
> 
> [1]
> https://lore.kernel.org/dri-devel/20191106093121.21762-1-tzimmermann@suse.de/
> 
> > 
> > What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
> > version, for which we don't have any drivers really. But I do think we
> > need to differentiate between memcpy and memcpy_tio. That's what this
> > entire annoying _cfb_ vs _sys_ business is all about, and also what gem
> > vram helpers have to deal with.
> > -Daniel
> > 
> >>>  		src += fb->pitches[0];
> >>>  		dst += fb->pitches[0];
> >>>  	}
> >>>
> >>
> >> -- 
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 Nürnberg, Germany
> >> (HRB 36809, AG Nürnberg)
> >> Geschäftsführer: Felix Imendörffer
> >>
> > 
> > 
> > 
> > 
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
