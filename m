Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8F8396AD
	for <lists+sparclinux@lfdr.de>; Fri,  7 Jun 2019 22:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbfFGUS5 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 7 Jun 2019 16:18:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46793 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729482AbfFGUS5 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 7 Jun 2019 16:18:57 -0400
Received: by mail-lf1-f66.google.com with SMTP id l26so2513554lfh.13
        for <sparclinux@vger.kernel.org>; Fri, 07 Jun 2019 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+IlYOcz6MNUONhjjBYHuT8/QTI8M6rG//OnFFoEPmts=;
        b=JamJvjNSga7wum4UHIzRpQ2ggGqR3TS0Ky3ghoX7KcWNz8Sk+A3tuB7WPgceeqShLW
         nkFVY32F//ZpHLDi01RoWYF0DRnMpUJfvGw13D4xRwu8fxepDRERdpAgOw7kRX4gPwDp
         1UYD90Jfac/Amyi8nekd0EYx6+jSjy9ePtfCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IlYOcz6MNUONhjjBYHuT8/QTI8M6rG//OnFFoEPmts=;
        b=IoDR/usRwTzgJGn4TottfpEC+3/ojQHVtxLiCyipH5eR4zdsK6zHaVP3Y51xNhX5km
         WXrqETYm7Hj00wwKQSkr4hJKoZPUKt7YfkxtEUZ1oSTfqVTEKPF/Cgyys316JUCNjOga
         kjroVrzE2A63H0SPwHLJN1GPCKra9W4XcxE9+UaNg+FU36yDSReHfyyauZ4kzrI7YpZT
         VpuQD2aU5jazstdo105BzFLkNFdGiD5RhwfOUoLz3qRDDrCTiLEqgMVWf6kX0rQtAaGM
         OSKbrELrzCGPeUIV+h8VjMVebrnvwYbHruG0vmwNuS8h1O7GNf22bd63S/pWUTqyt1m+
         CaPQ==
X-Gm-Message-State: APjAAAUGegj6dx8YrjyHWEZG8BQIIJDxrXO07F1TPuLexwAtMVPvtwnP
        Yf1xkO25vKprAD9rraWlj7CannfjD8KqYw==
X-Google-Smtp-Source: APXvYqyOb9D57pj4k2+C3K2SVc/unuPJ/IVzGTAIslLfS1BefX9tS7B+y8J6pg1LIQo2l7QjwRydaA==
X-Received: by 2002:ac2:5b05:: with SMTP id v5mr28243557lfn.38.1559938735572;
        Fri, 07 Jun 2019 13:18:55 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id q7sm601554ljc.45.2019.06.07.13.18.55
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 13:18:55 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id o13so2813789lji.5
        for <sparclinux@vger.kernel.org>; Fri, 07 Jun 2019 13:18:55 -0700 (PDT)
X-Received: by 2002:a2e:4246:: with SMTP id p67mr29114030lja.44.1559938267141;
 Fri, 07 Jun 2019 13:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <c8311f9b759e254308a8e57d9f6eb17728a686a7.1559649879.git.andreyknvl@google.com>
In-Reply-To: <c8311f9b759e254308a8e57d9f6eb17728a686a7.1559649879.git.andreyknvl@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 7 Jun 2019 13:10:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjKy5503vYoj3ZizGz69iBos69wdrEujojuri67vV=BVQ@mail.gmail.com>
Message-ID: <CAHk-=wjKy5503vYoj3ZizGz69iBos69wdrEujojuri67vV=BVQ@mail.gmail.com>
Subject: Re: [PATCH v2] uaccess: add noop untagged_addr definition
To:     Andrey Konovalov <andreyknvl@google.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Jun 4, 2019 at 5:04 AM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Architectures that support memory tagging have a need to perform untagging
> (stripping the tag) in various parts of the kernel. This patch adds an
> untagged_addr() macro, which is defined as noop for architectures that do
> not support memory tagging.

Ok, applied directly to my tree so that people can use this
independently starting with rc4 (which I might release tomorrow rather
than Sunday because I have some travel).

                  Linus
