Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B4C21BF0B
	for <lists+sparclinux@lfdr.de>; Fri, 10 Jul 2020 23:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgGJVMK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 10 Jul 2020 17:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGJVMH (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 10 Jul 2020 17:12:07 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90461C08C5DC
        for <sparclinux@vger.kernel.org>; Fri, 10 Jul 2020 14:12:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id n2so5685374edr.5
        for <sparclinux@vger.kernel.org>; Fri, 10 Jul 2020 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DBmedCYSo6ZfyDFSKXvvnu1ic71xYTJyTog2TIacjs=;
        b=gMbOq/Hs7LKU3Yd13xvxEgCsFLxUkZxW8V/GiLsxSZl+wu37ukDW1fSweNUAJpIgF9
         TI3r1g8YmqfpHnfIogFYwzoboSi2uIJ5q4de1IDitLKLsnvvRjVANtea7EcnmPa+sbUX
         HRnLuasB0vPP9pKm99soCkBp2UzAguzQngictBI9P1DM4svhsUt/BgnKVqs9cjAJEX9v
         Vk0kfQ5Nx+mpvmDH+Rll6LKVXOK/0aM/OirE148kzSbsL2Lf/kCFtaLV/HgpzhEXttKE
         wwlej4ppgd73wSxFbKz6b4VoX3uSCdIGlCH2kVUAYw4slxeJxZCv5QSiw6sDlhiMYY2m
         KynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DBmedCYSo6ZfyDFSKXvvnu1ic71xYTJyTog2TIacjs=;
        b=SfQbCafOmultADguNrxukupkpcxgYibA+2FxKrhNYPJpMIu/yjud062G9EtVBRjv5/
         YKWtBDofQf1FcGyTd+Ylq6tS1hXq3XPwH3bAU79GKKmZ3Qxjt5ODCq1GxmAFIImR6aqq
         4r7+ecMLsiuZ9FemYOblDZ9zrwUB/YFLSPqbhVrnulqqfRBjS2ugIY3hAIREKxVGYBM0
         rofleyovdFVnDXWJmQjVdbnJTtaE7cqbbnJNaUm8onv8ixhNJQpCa00m+Ju5GBRy1Ey/
         gr9GJmfK9EVw4C4r5XJP2lgRjm0bKWQzylpHzQHNwK2DWD+8otlPuKLiJC+ZSUpLwxBz
         yrUw==
X-Gm-Message-State: AOAM530m5aqR5po1noyKC50/xEpE9CigVkVnpXeQDBWcOx+TDuDCh5rU
        aesvzdPB+gyF0ZlS5tX9dZIqrvdaigh/DE8+90s=
X-Google-Smtp-Source: ABdhPJzXTa8Qn5mgMQs8rYSE4QoQxTLzuqXS3vC7v8xPLvYv1KkPU/RuHEmYqvxD2wY41aVKYdmkvjbjreRXTSvGVXY=
X-Received: by 2002:a50:fa07:: with SMTP id b7mr77435275edq.298.1594415526080;
 Fri, 10 Jul 2020 14:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200709193016.291267-1-sam@ravnborg.org> <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <18725e54-517d-75dc-282d-96d27e34d8b8@ilande.co.uk>
In-Reply-To: <18725e54-517d-75dc-282d-96d27e34d8b8@ilande.co.uk>
From:   Dave Airlie <airlied@gmail.com>
Date:   Sat, 11 Jul 2020 07:11:54 +1000
Message-ID: <CAPM=9twjJs2mnNzxSQDBrOmDyp5iqM3ANhLwQ9N5kWEAKC0aZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        sparclinux@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > but I'd like to have someone with more architecture expertise ack this
> > as well.
>
> Agreed. All my testing is using the bochs_drm framebuffer under qemu-system-sparc64
> (a sun4u machine) so it would be nice to get an ACK from Dave or someone else who can
> vouch for this on real hardware.

I'm not sure there exists real hardware that would come down this
path, I believe the last sparc64 with a GPU is a mach64, or maybe an
r128 card.

Otherwise I think using the memcpy io should be fine here on all architectures.

Dave.
