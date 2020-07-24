Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC222BD34
	for <lists+sparclinux@lfdr.de>; Fri, 24 Jul 2020 06:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgGXExp (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 Jul 2020 00:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgGXExp (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 24 Jul 2020 00:53:45 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CCBC0619D3
        for <sparclinux@vger.kernel.org>; Thu, 23 Jul 2020 21:53:45 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gg18so5245251ejb.6
        for <sparclinux@vger.kernel.org>; Thu, 23 Jul 2020 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ECIMxVQIqS2fenLhAF9Jv7ENpg9UMYbbkH01h0ISWw=;
        b=jAsKoTvuVEfhtaHW58GqIWs1qUBq8RZQUf+h2Jnx+7BsvAq+VBcFncIbLmKfKCqXy2
         3s7FOozyRTHmShreYjcDhQtFOR0bIU/itcgKUGex1zAWEDLOTn5jUBmMbDcDHXmyq9Dp
         rnnTIVJ10w4fjtla6Qt/R51VebfPdUG5pd222di6gueIcrBuXrC0wsEXlkkHMLfYlo1j
         FhFiXVzKIVklDSwta4EQHZQSylHl3g7eAjMb+CWx4BRTXpXdsf6pUP9/wApKwKHSrsSp
         vyzUcPpMck05Wu/B8y0ck2qGfcKUld+R6K6RxFPBPlNEAq18UH8Ktrb07Pvufu1ynI6O
         dxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ECIMxVQIqS2fenLhAF9Jv7ENpg9UMYbbkH01h0ISWw=;
        b=oeWLfqi1hIyyOuO5L38Vajli44rh8qCPu0JDKqHb+p3DwcKImI5cKp9VPfodGeiqk4
         CD+BaxQJuSMQ+wKDLF5K/zOVtX2zDLgNxLq4aRKtoPstDkysgtAS9+5Gn0MSfJFHRshM
         4mECbeBv/hSyu6hQD5+5PfDs1sWfqc1/LPsNhXJ7YROlX/c6Z9yyffbLGLaVK3Dxgbdm
         FFGJn8Wrx+HdLc7ViiwltdgU1/AU+gSzwT74jdkWLD6GiQiQiEGos+nqBVh/8264Iwnl
         jafuCNiiRQ6SWNDqjK5DhEXbSOWWK/rXMlZLTZSOH3lcr20P1RyyapA85+Sa1VZuVJaj
         fHLg==
X-Gm-Message-State: AOAM532EBFHILRIM/gSaKra+M7hHhFYMwxJuTMzGGxTjbpHBS3bhgUBM
        GaCkLAYv/u7Z5CJUEsx/ZFmqNCFUZFisdbVoKkY=
X-Google-Smtp-Source: ABdhPJxmK2dbTlmGoGhWW26bF3p3+ofoFEBs/+kZAIsnKsgez6FDfqD3gZVrAkS7Jjds/S/5Zt6Z7O+gH9v6Q+oOnvM=
X-Received: by 2002:a17:906:4158:: with SMTP id l24mr7350482ejk.101.1595566423726;
 Thu, 23 Jul 2020 21:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200709193016.291267-1-sam@ravnborg.org> <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local> <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
 <20200714084141.GW3278063@phenom.ffwll.local> <a3fdd8b9-bf2b-dcd7-63b7-91f379865a6c@suse.de>
In-Reply-To: <a3fdd8b9-bf2b-dcd7-63b7-91f379865a6c@suse.de>
From:   Dave Airlie <airlied@gmail.com>
Date:   Fri, 24 Jul 2020 14:53:30 +1000
Message-ID: <CAPM=9tyoJhvudNake+w=e4S9dQ8MT_bQEF9USuj=_vHBRLzA8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Gerd Hoffmann <kraxel@redhat.com>, sparclinux@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, 14 Jul 2020 at 18:56, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 14.07.20 um 10:41 schrieb Daniel Vetter:
> > On Tue, Jul 14, 2020 at 08:41:58AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 13.07.20 um 18:21 schrieb Daniel Vetter:
> >>> On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> >>>> Hi
> >>>>
> >>>> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> >>>>> Mark reported that sparc64 would panic while booting using qemu.
> >>>>> Mark bisected this to a patch that introduced generic fbdev emulation to
> >>>>> the bochs DRM driver.
> >>>>> Mark pointed out that a similar bug was fixed before where
> >>>>> the sys helpers was replaced by cfb helpers.
> >>>>>
> >>>>> The culprint here is that the framebuffer reside in IO memory which
> >>>>> requires SPARC ASI_PHYS (physical) loads and stores.
> >>>>>
> >>>>> The current bohcs DRM driver uses a shadow buffer.
> >>>>> So all copying to the framebuffer happens in
> >>>>> drm_fb_helper_dirty_blit_real().
> >>>>>
> >>>>> The fix is to replace the memcpy with memcpy_toio() from io.h.
> >>>>>
> >>>>> memcpy_toio() uses writeb() where the original fbdev code
> >>>>> used sbus_memcpy_toio(). The latter uses sbus_writeb().
> >>>>>
> >>>>> The difference between writeb() and sbus_memcpy_toio() is
> >>>>> that writeb() writes bytes in little-endian, where sbus_writeb() writes
> >>>>> bytes in big-endian. As endian does not matter for byte writes they are
> >>>>> the same. So we can safely use memcpy_toio() here.
> >>>>>
> >>>>> For many architectures memcpy_toio() is a simple memcpy().
> >>>>> One sideeffect that is unknow is if this has any impact on other
> >>>>> architectures.
> >>>>> So far the analysis tells that this change is OK for other arch's.
> >>>>> but testing would be good.
> >>>>>
> >>>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >>>>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>>>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>>>> Cc: "David S. Miller" <davem@davemloft.net>
> >>>>> Cc: sparclinux@vger.kernel.org
> >>>>
> >>>> So this actually is a problem in practice. Do you know how userspace
> >>>> handles this?
> >>>>
> >>>> For this patch
> >>>>
> >>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>
> >>>> but I'd like to have someone with more architecture expertise ack this
> >>>> as well.
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> ---
> >>>>>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >>>>> index 5609e164805f..4d05b0ab1592 100644
> >>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>>>> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> >>>>>   unsigned int y;
> >>>>>
> >>>>>   for (y = clip->y1; y < clip->y2; y++) {
> >>>>> -         memcpy(dst, src, len);
> >>>>> +         memcpy_toio(dst, src, len);
> >>>
> >>> I don't think we can do this unconditionally, there's fbdev-helper drivers
> >>> using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
> >>> to fix this properly I think.
> >>
> >> I once has a patch set for this problem, but it didn't make it. [1]
> >>
> >> Buffers can move between I/O and system memory, so a simple flag would
> >> not work. I'd propose this
> >>
> >> bool drm_gem_is_iomem(struct drm_gem_object *obj)
> >> {
> >>      if (obj->funcs && obj->funcs->is_iomem)
> >>              return obj->funcs->is_iomem(obj);
> >>      return false;
> >> }
> >>
> >> Most GEM implmentations wouldn't bother, but VRAM helpers could set the
> >> is_iomem function and return the current state. Fbdev helpers can then
> >> pick the correct memcpy_*() function.
> >
> > Hm wasn't the (long term at least) idea to add the is_iomem flag to the
> > vmap functions? is_iomem is kinda only well-defined if there's a vmap of
> > the buffer around (which also pins it), or in general when the buffer is
> > pinned. Outside of that an ->is_iomem function doesn't make much sense.
>
> Oh. From how I understood the original discussion, you shoot down the
> idea because sparse would not support it well?
>
> The other idea was to add an additional vmap_iomem() helper that returns
> an__iomem pointer. Can we try that?
>
Did we get anywhere with this yet?

Dave.
