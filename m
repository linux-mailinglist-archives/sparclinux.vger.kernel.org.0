Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F7F21DB97
	for <lists+sparclinux@lfdr.de>; Mon, 13 Jul 2020 18:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbgGMQWE (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 13 Jul 2020 12:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMQWD (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 13 Jul 2020 12:22:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C6BC061755
        for <sparclinux@vger.kernel.org>; Mon, 13 Jul 2020 09:22:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a6so343781wmm.0
        for <sparclinux@vger.kernel.org>; Mon, 13 Jul 2020 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=078asBrUdAzX6V4HRPDBswsi0+2eriabHhVz3ArnjDc=;
        b=aTKEK4S4PUIHVkAv6JErkNzh79Z888tYpNCRggfGNw1cGGVXzogegCneDgnPlBG92U
         /N7YfWn1mzKs/he6l8dclI1/IBckZPQ23xCWTgMDT0uYnAbgm15utkRoHL2Al5aa86Cy
         DPSlkDzEIEh/pyhVNKrn61LCgjEE+1+qvpkj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=078asBrUdAzX6V4HRPDBswsi0+2eriabHhVz3ArnjDc=;
        b=iju/44k8Pdxp/GaqSSegAuaa9OUeGfaOStmtZAV0GhXyHOXhfg16fJmQYhXdXLCfSB
         OIMD8BZGqHs2zwWITryxd3+5M/3DjQqpcwJ18+VOCnoP7JjlCL6giR0wG6Ale4jWoors
         SqEXm+rQBfzgRJjxYi0rmeJb3ehcMkh4ms0FEASISOQAvRXARRHsK0HGGAuLEDXs5/We
         yeoZbYU+uLCsNR6qr0wmm+GcfKI7bfd5BERKuJP6QXfzI4gK849oR9piIouCO8fWxgiq
         iQa6F7L2/jvI8DC2sfG6770XE0GuGETQd7ZNa6CHZibaJT9EzrTLGx+RycfIBmkA3Y8p
         2i+g==
X-Gm-Message-State: AOAM531nnxdDQJNGMb1c483sa9FHbVbb8pGxuuyguiEWBwBmNHnFtqm3
        x/nJOn3G8aRM3wzHUMiVFKukAw==
X-Google-Smtp-Source: ABdhPJwKF+xm8MFfAd0R5CoC3HwdOVssXV+RtQHlZXNvp4a2iUOVusv5GEmhSnWhuWC0Zddy4pgeFQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr159705wmh.108.1594657322307;
        Mon, 13 Jul 2020 09:22:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u8sm24532517wrt.28.2020.07.13.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 09:22:01 -0700 (PDT)
Date:   Mon, 13 Jul 2020 18:21:59 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        sparclinux@vger.kernel.org,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200713162159.GR3278063@phenom.ffwll.local>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> > Mark reported that sparc64 would panic while booting using qemu.
> > Mark bisected this to a patch that introduced generic fbdev emulation to
> > the bochs DRM driver.
> > Mark pointed out that a similar bug was fixed before where
> > the sys helpers was replaced by cfb helpers.
> > 
> > The culprint here is that the framebuffer reside in IO memory which
> > requires SPARC ASI_PHYS (physical) loads and stores.
> > 
> > The current bohcs DRM driver uses a shadow buffer.
> > So all copying to the framebuffer happens in
> > drm_fb_helper_dirty_blit_real().
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
> > One sideeffect that is unknow is if this has any impact on other
> > architectures.
> > So far the analysis tells that this change is OK for other arch's.
> > but testing would be good.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: sparclinux@vger.kernel.org
> 
> So this actually is a problem in practice. Do you know how userspace
> handles this?
> 
> For this patch
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> but I'd like to have someone with more architecture expertise ack this
> as well.
> 
> Best regards
> Thomas
> 
> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 5609e164805f..4d05b0ab1592 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> >  	unsigned int y;
> >  
> >  	for (y = clip->y1; y < clip->y2; y++) {
> > -		memcpy(dst, src, len);
> > +		memcpy_toio(dst, src, len);

I don't think we can do this unconditionally, there's fbdev-helper drivers
using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
to fix this properly I think.

What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
version, for which we don't have any drivers really. But I do think we
need to differentiate between memcpy and memcpy_tio. That's what this
entire annoying _cfb_ vs _sys_ business is all about, and also what gem
vram helpers have to deal with.
-Daniel

> >  		src += fb->pitches[0];
> >  		dst += fb->pitches[0];
> >  	}
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




> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
