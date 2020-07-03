Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9492133C2
	for <lists+sparclinux@lfdr.de>; Fri,  3 Jul 2020 07:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgGCFz4 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 3 Jul 2020 01:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgGCFz4 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 3 Jul 2020 01:55:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA91C08C5DD
        for <sparclinux@vger.kernel.org>; Thu,  2 Jul 2020 22:55:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so20041455wrl.8
        for <sparclinux@vger.kernel.org>; Thu, 02 Jul 2020 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N2oW/lSzMEnmi80ieRgaOd15NbgL+GSvOlUfcPQg7eg=;
        b=wVwI8lqOxF+fugSZ99h3jsyyb7+aebTN0QG92MEnWOR57eXVvMlpXP/6Ksv3goJRes
         Hk/RdoTyJ4GAgomn8lHi+v1Cny3kuRgvMzmDZkbw6XJ7i/GbIaPettIiImsdR0HIpLCE
         RMjvdrjtQv4r1+ynmbw1G6Z9VGHIKnscmzCXfqFOylwq/m6O8k1wHz0QnmZlsevGNHad
         /SfTWTlFRGTq3GXff0JHK3oYikOysv3ZBg0g8/nDfQruPVOXB/sDW4dBDjRmVM1WqHAn
         EqcQCkyQfVCT41h6sZgjYKAV3yqLVK2TRP7J4nugh5k3T/P2x4Vw9ktqHJvDfxAkMEuD
         6D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N2oW/lSzMEnmi80ieRgaOd15NbgL+GSvOlUfcPQg7eg=;
        b=ncgJa6MYplWTECtnocsfyhyxSVoddw8i35ILs9/ynsICiL8sCRTXds7VIBdAJp6jJK
         yDtrEtUnSFm7kSlugmSyhF62SPqXaQK6JJ8P/+xtUFe5FIrRJUx6C8ZaLMqRJDkjTjDo
         ToGYKN0/jtgayAOg/wuKtEakiYt15Azfxkeqm2wr/e5GYb8UNa569JYGtGIlm3g1iSZF
         ZFGmvGBBITOpK4GDWgvAEZ6MzK05x6btlV0DRj3Da8if9H9jnqttr4yhHfyChJczgzT7
         PxbKMwjt14qEnGDX4+De+MDMov0dCd/be8p9irTOaPWW6Qp8m5wpIm/tY/qh11lbePE+
         2XWQ==
X-Gm-Message-State: AOAM532YPdHE6LQ60nJnmzXiaJe59mEVYyGeN6v3+6+GIROELenAFkwa
        dIxmm9yn5SMBVkR3lOgrM8RGiin/pyxtUg==
X-Google-Smtp-Source: ABdhPJz87XgK4fztr/Mz+d1gwH7Nrxy0cHppk3kVltJaNtv0HrPH1jz09Cdks4Fc+n/fjEYZ6G4V/Q==
X-Received: by 2002:a5d:4283:: with SMTP id k3mr34321391wrq.322.1593755754196;
        Thu, 02 Jul 2020 22:55:54 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id u10sm12283538wml.29.2020.07.02.22.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 22:55:53 -0700 (PDT)
Date:   Fri, 3 Jul 2020 07:55:51 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc:     davem@davemloft.net, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc: sparc64_defconfig: add necessary configs for qemu
Message-ID: <20200703055551.GA14096@Red>
References: <1593694973-34113-1-git-send-email-clabbe@baylibre.com>
 <275363bb-2f36-f7f3-aa7e-4a2fc6901d63@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <275363bb-2f36-f7f3-aa7e-4a2fc6901d63@ilande.co.uk>
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Jul 02, 2020 at 08:58:40PM +0100, Mark Cave-Ayland wrote:
> On 02/07/2020 14:02, Corentin Labbe wrote:
> 
> > The sparc64 qemu machines uses pcnet32 network hardware by default, so for
> > simple boot testing using qemu, having PCNET32 is useful.
> > Same for its storage which is a PATA_CMD64.
> 
> Which version of QEMU are you using? qemu-system-sparc64 switched to using a hme NIC
> by default in version 2.11 (see
> https://wiki.qemu.org/Documentation/Platforms/SPARC#Changes_to_sun4u_machine_from_2.11_onwards)
> which is well over 2 years ago...
> 

You are right, I verfied in the code and it is sunhme by default.
So I will verify it works and send a v2.
