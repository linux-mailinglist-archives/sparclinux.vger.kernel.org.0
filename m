Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E36751559
	for <lists+sparclinux@lfdr.de>; Thu, 13 Jul 2023 02:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjGMAeO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 12 Jul 2023 20:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjGMAeM (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 12 Jul 2023 20:34:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B30918E;
        Wed, 12 Jul 2023 17:34:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAA67619E3;
        Thu, 13 Jul 2023 00:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C4EC433CD;
        Thu, 13 Jul 2023 00:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689208450;
        bh=h0GsuVfwe0mSJLf0CUYKSs4tBJsF9ZFlVOYHCDQ2FTM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GahPxDoylll4i3tp/d3OvcPh8d1ShV9I+8WcM7ZT2D2sLN6p2rKK/m09g2zRz4qcy
         F2rySwRVdeC9m/VNG8y7Auf5xjQ8GGv7sxGAjv2QnHfsO5P2qPwfEVHDHz4upR1Stb
         0svGsYKHnp2OnB4tcPiWlEDxQzWwM037lnQ5L+3SmZzdANAN1VFD3JCu1h0EOXahy2
         jebbI+IQsmVRtyUUQ3Fkwsj2y53ZoC9wenHyp41klp+7y3eG/WWnkmRP3fLSUhA9Gk
         m47jp8V7hlVaFKOXnHMbs0HZL2xB8/Oj1RPqDKYfLvCFdmDCBJtnDQ5ekkthJ0BbY4
         WtUWhH+ZPTeKw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so219121a12.1;
        Wed, 12 Jul 2023 17:34:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLYKsp7176Jaq1X0/6t09aUmTF5uuvryeSofiQXslGbkBDo2Kq/p
        r5xqAsLJQ/5Ij5DkFqZpzGOv7MwGAcOgLAekxNU=
X-Google-Smtp-Source: APBJJlEQ6/L9+3l57KhL+DrBeyOgp7Hj5REivD3lG0Hw7HlvPx05nt5j8UOGP7wiPPCSny/+2qvXQ5HhjYPk4/43tWc=
X-Received: by 2002:aa7:de0d:0:b0:51e:1c5c:b97f with SMTP id
 h13-20020aa7de0d000000b0051e1c5cb97fmr669974edv.2.1689208448407; Wed, 12 Jul
 2023 17:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230707095415.1449376-1-arnd@kernel.org> <20230707095415.1449376-4-arnd@kernel.org>
In-Reply-To: <20230707095415.1449376-4-arnd@kernel.org>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 12 Jul 2023 20:33:57 -0400
X-Gmail-Original-Message-ID: <CAJF2gTQGCmfMH2S4hns76ttqM8K-4dO-rhkE6vL+w9akajpwvw@mail.gmail.com>
Message-ID: <CAJF2gTQGCmfMH2S4hns76ttqM8K-4dO-rhkE6vL+w9akajpwvw@mail.gmail.com>
Subject: Re: [PATCH 4/4] vgacon, arch/*: remove unused screen_info definitions
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
        Helge Deller <deller@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

csky:
Acked-by: Guo Ren <guoren@kernel.org>

On Fri, Jul 7, 2023 at 5:56=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA
> console driver in an allmodconfig build.
>
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/kernel/setup.c          | 12 ------------
>  arch/hexagon/kernel/Makefile      |  2 --
>  arch/hexagon/kernel/screen_info.c |  3 ---
>  arch/nios2/kernel/setup.c         |  5 -----
>  arch/sh/kernel/setup.c            |  5 -----
>  arch/sparc/kernel/setup_32.c      | 13 -------------
>  arch/sparc/kernel/setup_64.c      | 13 -------------
>  arch/xtensa/kernel/setup.c        | 12 ------------
>  8 files changed, 65 deletions(-)
>  delete mode 100644 arch/hexagon/kernel/screen_info.c
>
> diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
> index 106fbf0b6f3b4..51012e90780d6 100644
> --- a/arch/csky/kernel/setup.c
> +++ b/arch/csky/kernel/setup.c
> @@ -8,22 +8,10 @@
>  #include <linux/of_fdt.h>
>  #include <linux/start_kernel.h>
>  #include <linux/dma-map-ops.h>
> -#include <linux/screen_info.h>
>  #include <asm/sections.h>
>  #include <asm/mmu_context.h>
>  #include <asm/pgalloc.h>
>
> -#ifdef CONFIG_DUMMY_CONSOLE
> -struct screen_info screen_info =3D {
> -       .orig_video_lines       =3D 30,
> -       .orig_video_cols        =3D 80,
> -       .orig_video_mode        =3D 0,
> -       .orig_video_ega_bx      =3D 0,
> -       .orig_video_isVGA       =3D 1,
> -       .orig_video_points      =3D 8
> -};
> -#endif
> -
>  static void __init csky_memblock_init(void)
>  {
>         unsigned long lowmem_size =3D PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET=
_OFFSET);
> diff --git a/arch/hexagon/kernel/Makefile b/arch/hexagon/kernel/Makefile
> index e73cb321630ec..3fdf937eb572e 100644
> --- a/arch/hexagon/kernel/Makefile
> +++ b/arch/hexagon/kernel/Makefile
> @@ -17,5 +17,3 @@ obj-y +=3D vm_vectors.o
>  obj-$(CONFIG_HAS_DMA) +=3D dma.o
>
>  obj-$(CONFIG_STACKTRACE) +=3D stacktrace.o
> -
> -obj-$(CONFIG_VGA_CONSOLE) +=3D screen_info.o
> diff --git a/arch/hexagon/kernel/screen_info.c b/arch/hexagon/kernel/scre=
en_info.c
> deleted file mode 100644
> index 1e1ceb18bafe7..0000000000000
> --- a/arch/hexagon/kernel/screen_info.c
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#include <linux/screen_info.h>
> -
> -struct screen_info screen_info;
> diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
> index 8582ed9658447..da122a5fa43b2 100644
> --- a/arch/nios2/kernel/setup.c
> +++ b/arch/nios2/kernel/setup.c
> @@ -19,7 +19,6 @@
>  #include <linux/memblock.h>
>  #include <linux/initrd.h>
>  #include <linux/of_fdt.h>
> -#include <linux/screen_info.h>
>
>  #include <asm/mmu_context.h>
>  #include <asm/sections.h>
> @@ -36,10 +35,6 @@ static struct pt_regs fake_regs =3D { 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0, 0, 0, 0,
>                                         0, 0, 0, 0, 0, 0,
>                                         0};
>
> -#ifdef CONFIG_VT
> -struct screen_info screen_info;
> -#endif
> -
>  /* Copy a short hook instruction sequence to the exception address */
>  static inline void copy_exception_handler(unsigned int addr)
>  {
> diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
> index b3da2757faaf3..3d80515298d26 100644
> --- a/arch/sh/kernel/setup.c
> +++ b/arch/sh/kernel/setup.c
> @@ -7,7 +7,6 @@
>   *  Copyright (C) 1999  Niibe Yutaka
>   *  Copyright (C) 2002 - 2010 Paul Mundt
>   */
> -#include <linux/screen_info.h>
>  #include <linux/ioport.h>
>  #include <linux/init.h>
>  #include <linux/initrd.h>
> @@ -69,10 +68,6 @@ EXPORT_SYMBOL(cpu_data);
>  struct sh_machine_vector sh_mv =3D { .mv_name =3D "generic", };
>  EXPORT_SYMBOL(sh_mv);
>
> -#ifdef CONFIG_VT
> -struct screen_info screen_info;
> -#endif
> -
>  extern int root_mountflags;
>
>  #define RAMDISK_IMAGE_START_MASK       0x07FF
> diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
> index 34ef7febf0d56..e3b72a7b46d37 100644
> --- a/arch/sparc/kernel/setup_32.c
> +++ b/arch/sparc/kernel/setup_32.c
> @@ -17,7 +17,6 @@
>  #include <linux/initrd.h>
>  #include <asm/smp.h>
>  #include <linux/user.h>
> -#include <linux/screen_info.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/seq_file.h>
> @@ -51,18 +50,6 @@
>
>  #include "kernel.h"
>
> -struct screen_info screen_info =3D {
> -       0, 0,                   /* orig-x, orig-y */
> -       0,                      /* unused */
> -       0,                      /* orig-video-page */
> -       0,                      /* orig-video-mode */
> -       128,                    /* orig-video-cols */
> -       0,0,0,                  /* ega_ax, ega_bx, ega_cx */
> -       54,                     /* orig-video-lines */
> -       0,                      /* orig-video-isVGA */
> -       16                      /* orig-video-points */
> -};
> -
>  /* Typing sync at the prom prompt calls the function pointed to by
>   * romvec->pv_synchook which I set to the following function.
>   * This should sync all filesystems and return, for now it just
> diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
> index 6546ca9d4d3f1..6a4797dec34b4 100644
> --- a/arch/sparc/kernel/setup_64.c
> +++ b/arch/sparc/kernel/setup_64.c
> @@ -15,7 +15,6 @@
>  #include <linux/ptrace.h>
>  #include <asm/smp.h>
>  #include <linux/user.h>
> -#include <linux/screen_info.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/seq_file.h>
> @@ -68,18 +67,6 @@
>  DEFINE_SPINLOCK(ns87303_lock);
>  EXPORT_SYMBOL(ns87303_lock);
>
> -struct screen_info screen_info =3D {
> -       0, 0,                   /* orig-x, orig-y */
> -       0,                      /* unused */
> -       0,                      /* orig-video-page */
> -       0,                      /* orig-video-mode */
> -       128,                    /* orig-video-cols */
> -       0, 0, 0,                /* unused, ega_bx, unused */
> -       54,                     /* orig-video-lines */
> -       0,                      /* orig-video-isVGA */
> -       16                      /* orig-video-points */
> -};
> -
>  static void
>  prom_console_write(struct console *con, const char *s, unsigned int n)
>  {
> diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
> index aba3ff4e60d85..3f22d0537818d 100644
> --- a/arch/xtensa/kernel/setup.c
> +++ b/arch/xtensa/kernel/setup.c
> @@ -19,7 +19,6 @@
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/proc_fs.h>
> -#include <linux/screen_info.h>
>  #include <linux/kernel.h>
>  #include <linux/percpu.h>
>  #include <linux/reboot.h>
> @@ -49,17 +48,6 @@
>  #include <asm/timex.h>
>  #include <asm/traps.h>
>
> -#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_DUMMY_CONSOLE)
> -struct screen_info screen_info =3D {
> -       .orig_x =3D 0,
> -       .orig_y =3D 24,
> -       .orig_video_cols =3D 80,
> -       .orig_video_lines =3D 24,
> -       .orig_video_isVGA =3D 1,
> -       .orig_video_points =3D 16,
> -};
> -#endif
> -
>  #ifdef CONFIG_BLK_DEV_INITRD
>  extern unsigned long initrd_start;
>  extern unsigned long initrd_end;
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren
