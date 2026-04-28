Return-Path: <sparclinux+bounces-6749-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH61I0GI8GnuUQEAu9opvQ
	(envelope-from <sparclinux+bounces-6749-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Tue, 28 Apr 2026 12:13:21 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33074825B5
	for <lists+sparclinux@lfdr.de>; Tue, 28 Apr 2026 12:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B05EB3225532
	for <lists+sparclinux@lfdr.de>; Tue, 28 Apr 2026 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A2E34D929;
	Tue, 28 Apr 2026 09:31:37 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A63A759A
	for <sparclinux@vger.kernel.org>; Tue, 28 Apr 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368697; cv=none; b=QQaysvM8lGBlnwVsIWayOtr2oFajn3eNJt2lqxQkEwOdH55puzC++T9DKPoufSvaXobf610MDQXCGfb4ELZO/JdF4Bpg4GK/64FXgVbcpY8pTw1U3Et/NXYBQlFCUHWUIHURq36AD/ic9+Gq31iVfC5SPJzutBUOUCqGve1pP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368697; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow4cyuGZ2Fe8Itm1XyiOt7lDYJuLZVfzmzhvJipoc9D7CnTZi6tD0dKyioSupfiRZMm3sdjeeqx0F9dFtVO/3YiWx2IVtclk216C++Q6c0ApBD6mUpB26YZAHi4vxTqNSR7tA4rn692Vc/FtDYzVtSqu4Dx60cRfHOj8wnh7lYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so312068766b.1
        for <sparclinux@vger.kernel.org>; Tue, 28 Apr 2026 02:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368693; x=1777973493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=JRYCeS5629ZnQATtftDvHnB+jGelQGUMkhQY/v/vKfDUabUTloOY1GpC1Fb2wQ+ZQW
         hXZT9AgDd1QJKnzNSsydBTN2FDMD7O+HmwPZZgF8CP76fg+Ej5fqBOyAyXJ5B+BKqxBs
         8yFs2Sk0GCwTV1BfCEr3DLX4rsd/YRMD7QHDEtOISDvdLhMy0ZxAgmmJ7fG/wEZGAXHr
         OeUlBJqKk9ypi8wY5Ih3j/neHMroAw4sCN9MwICKf96Ks0tZdlrUt6sR2VykmBOYsy/F
         14x32+eSS1XLhmvMlY4aew2hY5mTp/CQy7CqhxzhCUP3+veOayjzN0TDBiyzj9Us/MSv
         /ldQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nhNKKZLUBRQjJmHKKeWdP622sTkkbq7WcLIs/z622TI+sdCqlT4Z3/Qnz+0NJG6l/4/JEFERd6TYd@vger.kernel.org
X-Gm-Message-State: AOJu0YxDftK7jPEZqfVyJKkGdM1pm75TDGpuFPpgOs3+QZ0EGiRBv98P
	mOYy5JDD0zKe6x48IapXJ8sGrnf/oizkrxtYujpPmPuHAV0L96XYuU6E9pLtoz03qGQ=
X-Gm-Gg: AeBDievH2Bt30RYPLigkrDeRbrOiaqAgT59oH4Dh/fZO3RwR8XOliSpY+WxJhXe/zjI
	Q+OspNWxWVU8BU7pbA2rEHIRaDR4hq6iVJVkAWjFkS/5+5b1QKV1NmFJ+c48pfPSJpjzd1iU2kI
	nOVG8OEWaD4arL6KNEi+mH6T9zlyhD8kU3lsKxvyyZBgV4TofLEXwVqpZyqbc9tAwmnenUmYsoE
	dpBJcPxgfhVbU2Bz93HNqA8SkRFba1IlXXPlPtXmXt/M2ilvWBhfO2okknJg2isOZLR8Gjp2UHN
	bkYMjrqUHXhtUxP8bB9yNTsW0rfv+nVY2yqSCTQ2xXQpKQSR+hJ/h4hnfGVKf8c03qmGl6lKErn
	EKWhlp71vbhfel0fBDbzQBtZe81iOE5LrM4dNfre38j77VPCz+kf+kaqPps6Msa14pKx9QwDyab
	f4EVp35fwkPhAYMCohLSGjYLtvfHz8sqBNwd7siagSAlTxgaTDn+Tb5/AgX5OIjvQ9cbnrsQQ=
X-Received: by 2002:a17:907:6d19:b0:ba7:1191:6402 with SMTP id a640c23a62f3a-bb804727ae1mr126310866b.27.1777368692982;
        Tue, 28 Apr 2026 02:31:32 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853e9e0sm75870766b.4.2026.04.28.02.31.32
        for <sparclinux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:31:32 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso15351016a12.1
        for <sparclinux@vger.kernel.org>; Tue, 28 Apr 2026 02:31:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NgwqFaaxaF+fj0XbrH+nMXY+A2KBZrLSFV5APTBEzElZOCxkQ4rW9n4Omna+Rt6ctmRjRwPwAVB1I@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E33074825B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6749-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,sparclinux@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.109];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

