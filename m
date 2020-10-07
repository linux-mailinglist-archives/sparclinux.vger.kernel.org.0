Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7D3285DD2
	for <lists+sparclinux@lfdr.de>; Wed,  7 Oct 2020 13:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgJGLHZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 7 Oct 2020 07:07:25 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55807 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgJGLHX (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 7 Oct 2020 07:07:23 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MFL4B-1kAQtf0kIb-00FgTQ; Wed, 07 Oct 2020 13:07:22 +0200
Received: by mail-qk1-f172.google.com with SMTP id s4so2154757qkf.7;
        Wed, 07 Oct 2020 04:07:21 -0700 (PDT)
X-Gm-Message-State: AOAM530I3FnQRJpTJ6aSFHpdwsFvISnTtTOhARmj5ZJjbGs66pJZslPe
        nSDZdeFQBdpCOaEo/97epcqxJXfZlY6eS6U/aDc=
X-Google-Smtp-Source: ABdhPJzv49GK72G1X8a28drCtbBnhsqm87k5a2dAC3nqOLHjuohsHhfE83fzukBmdWOct5Xcuk6frrtwL5rFwz31X4E=
X-Received: by 2002:a37:b686:: with SMTP id g128mr2180775qkf.286.1602068840973;
 Wed, 07 Oct 2020 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
 <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
 <20201007085911.GA17356@lst.de> <CAK8P3a2w1Q4coFLnW4sDQEC_01uwWWUkuGyqj=r=x3jtB8uhNA@mail.gmail.com>
 <20201007104046.GB24327@lst.de>
In-Reply-To: <20201007104046.GB24327@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 13:07:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Message-ID: <CAK8P3a1JdeCxr16+wAnYqLwJBuLqTgS7h-UCoiXD5OijQ-evyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rOrBrvb30/YQ2GkeltCxczg6eoQx6rFDvU0z0VK1h7cVATtQU0U
 8llwJPUcfTNW7kNgh0oB83woSlVqRrMIcLAJ51m44fVfo1ALnF7ndJYrvZ/nnfHhI6jVFS5
 KVORfDi2iourk0tpszdmypLf6oUavWS/exH9R07K3T0gaaqkNh0vvrRMQtk5KzkbjmE9FY8
 nUQeOHGm5JDY4LmgqZDkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G5l//q7FVic=:zJU+ueK/kSTd2xZjGwsXnZ
 /IYipCbxjg82SfgkM3eIgrxbUO9OQlawMgScs3Qup+uLsfqXcu7ub+QOASMcReRjUBTReRVai
 CZxrCBPt3JWfck8xn7h2RxaFUfJ/asxWKZBcitessIBJxDDbbk0bHMVAl1u2Zdn2S016o/q/0
 V+SDkZC08BJNTSYLWZStD4QgODXQEY7x0zqgK3KeKNdXNKx0eJrbakr4QSnJrc1hMuHdKti7s
 lCztUv2HWGW+95ZPY8gLzAsJAYzh5iwKhjUgiZ60bnmjYROvBHL7kN7t+3+5IOU0Qe8cA++LM
 OZAFbC7ciMupZvF4A8OdA66SbWM/143ZWXtcjW4Q12VOoEFNGTVsngtzQCf97PR+TkQ2xDs2e
 I0G8m/W1/W4Vav06gXJ7VRJ4oLo6o+WyvgJdwqq4M05004QZAUAawOh8N04wbOOpb6+ZIFl5b
 +7rBrtUw2CDckcGJeNGe3cpGsN7lYdfMyrV70TBi7OpD0d9Aaid4mHCg2aSE5EUyyX1/IwoY8
 ysOZQfalV8ojadU83BuCW7Nqsug/PPQm3Cr1d5QxMILkH2mzooPfe6/ygNAt3kFG1jdvspyOi
 FGKFblGrI3bXJpDgLfpKil9M+/ewQAtfbQonBjI370m67NfhJ4quroEcxQ0k6nQiZxEd5n+93
 aE9FgwdYH/7U8rmpIHJSfilYyG2uWTegjXyxDTmzSFA1eelNrvvhRohuVCTYlAhIn1sBST0pK
 WHLnzctjXz2w+Goe9R99p2KFE6ONUr1lXYOmWTBwEi0vDE4qZ/6ho/F3kSETqAsa7a89MqpAS
 pEXW9t6+bis0YH/hVDRuJ8G279ANHadsYL/71dOiPJL6uQGerkWRXJExXR4ZzF46itMOWG6
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Wed, Oct 7, 2020 at 12:40 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Oct 07, 2020 at 11:28:58AM +0200, Arnd Bergmann wrote:
> > The only one I have actually given up on is the atomisp staging driver,
> > which uses an awful hack, copying the x86 implementation of
> > copy_in_user()/compat_alloc_user_space() into the driver.
>
> That is gross.  Just mark the driver as broken for now.

Ah, it seems that Hans has already done that in commit 57e6b6f2303e
("media: atomisp_fops.c: disable atomisp_compat_ioctl32"), which
removes the only reference to this code. In this case, I think a one-line
change to stop building that file would be best, then if anyone ever
wants to fix the bug that Hans and Sakari found, they get to do also
deal with replacing compat_alloc_user_space().

I'll send a patch for that right away, the patch I have in my tree was
so evil that I hadn't dared submit that, but it was useful for
compile-testing the compat_alloc_user_space() removal patch.

   Arnd
