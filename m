Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71452A4D96
	for <lists+sparclinux@lfdr.de>; Tue,  3 Nov 2020 18:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgKCRzZ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 3 Nov 2020 12:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgKCRzZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 3 Nov 2020 12:55:25 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813C9C0613D1
        for <sparclinux@vger.kernel.org>; Tue,  3 Nov 2020 09:55:23 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id b9so9076258edu.10
        for <sparclinux@vger.kernel.org>; Tue, 03 Nov 2020 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o0HUqTtrB0uneYNpLQNhQJ6FusME7LjWI9KZLqRyy8M=;
        b=HlBdVjW42hUSJkakIiVHCgxY07l6tlPx/MKTOg49MQqEt9fKpSl2tO6bNlSfEMf3/D
         yOb2ZUXxHpDZzPlQCZuCKgGgj4iIodCB3C8y4WCLAE53N4IY/fO4MumxqPXGllxVBzjJ
         AuMTxQdvsElAjMkZERbVlQwjny9JwixE30+4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0HUqTtrB0uneYNpLQNhQJ6FusME7LjWI9KZLqRyy8M=;
        b=DQxhq4dN+WphVd8GCZNmD4vg7wMeQNmGlN6wmxww5eZZO1JJqJkl7WVLTPlrBcTDKA
         Kqhgx1Qq9mM6/gYb/FSKswfgT7NrRGJ76K3OnwlaxISq1BDJ2o4NQ8TjG/yWn2+W5hfI
         6DfL8Izs7qgE9eVSQnSXEroitM6JPS4NaoV7E6eQnjxgOYXUAmzBYFMXJmSn0LmlX5Us
         JaDeZipSQPRhWWpey7f20KpL0EEJlUcsaEYTGZm+q6vWWwpl1vS0JKhU9wt4yhrEaplH
         mbM/HyakHGvLQZqCa7rM5wY2W+XWU091Z/jajjUrZ3RUuUUxv7+C4dWTGQuCZXFdgznX
         D2yg==
X-Gm-Message-State: AOAM531q86VkXmFq4alICBNfs/W/QlkekOeJpfUOjDAWNKP6kb9ZYZg2
        b91XJP7gNtSriujE8onxcxuVPRwKT0WAJA==
X-Google-Smtp-Source: ABdhPJzZR3hYeC0fOJxfGAnLNWF00zeXttkPgM1gSdrekNNxAgPGTn2HnbL+IKRA4pwPyArkwDjM5A==
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr4953476edb.235.1604426122031;
        Tue, 03 Nov 2020 09:55:22 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id f9sm5482274ejd.85.2020.11.03.09.55.21
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:55:21 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id oq3so23625600ejb.7
        for <sparclinux@vger.kernel.org>; Tue, 03 Nov 2020 09:55:21 -0800 (PST)
X-Received: by 2002:a19:4815:: with SMTP id v21mr8859386lfa.603.1604425706752;
 Tue, 03 Nov 2020 09:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20201103092712.714480842@linutronix.de> <20201103095858.827582066@linutronix.de>
In-Reply-To: <20201103095858.827582066@linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 3 Nov 2020 09:48:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Message-ID: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Subject: Re: [patch V3 22/37] highmem: High implementation details and
 document API
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Benjamin LaHaise <bcrl@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-aio@kvack.org, Chris Mason <clm@fb.com>,
        Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>,
        linux-btrfs <linux-btrfs@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Dave Airlie <airlied@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        nouveau@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Nov 3, 2020 at 2:33 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> +static inline void *kmap(struct page *page)
> +{
> +       void *addr;
> +
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               addr = page_address(page);
> +       else
> +               addr = kmap_high(page);
> +       kmap_flush_tlb((unsigned long)addr);
> +       return addr;
> +}
> +
> +static inline void kunmap(struct page *page)
> +{
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               return;
> +       kunmap_high(page);
> +}

I have no complaints about the patch, but it strikes me that if people
want to actually have much better debug coverage, this is where it
should be (I like the "every other address" thing too, don't get me
wrong).

In particular, instead of these PageHighMem(page) tests, I think
something like this would be better:

   #ifdef CONFIG_DEBUG_HIGHMEM
     #define page_use_kmap(page) ((page),1)
   #else
     #define page_use_kmap(page) PageHighMem(page)
   #endif

adn then replace those "if (!PageHighMem(page))" tests with "if
(!page_use_kmap())" instead.

IOW, in debug mode, it would _always_ remap the page, whether it's
highmem or not. That would really stress the highmem code and find any
fragilities.

No?

Anyway, this is all sepatrate from the series, which still looks fine
to me. Just a reaction to seeing the patch, and Thomas' earlier
mention that the highmem debugging doesn't actually do much.

               Linus
