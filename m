Return-Path: <sparclinux+bounces-1273-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C78FF2DF
	for <lists+sparclinux@lfdr.de>; Thu,  6 Jun 2024 18:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1411F277D1
	for <lists+sparclinux@lfdr.de>; Thu,  6 Jun 2024 16:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7B7198E60;
	Thu,  6 Jun 2024 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJhdTGIx"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED4198A1D
	for <sparclinux@vger.kernel.org>; Thu,  6 Jun 2024 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692595; cv=none; b=kRU+ItLPp26vzCPMu3A+6siUfxaZThm2wvvVqDdXtvX1+Lc9cR0Xd3zVTSgLrkUrDG8ohoAeO3ZBUWdODpE+51Pdh7O4dH1/CE+rl+bSfa5wGNSGP+4gr2MnbF2ICqo1T90DnV58BllyMqXF+jwjENF2Ss8ULCqNirm4+LevTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692595; c=relaxed/simple;
	bh=QlINFaI4LTvEN0VfK5cNmlEbpI0ZCm9ojcKkqo+H+CY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB3U9jhDNrhmJsOB/3rUnBsuBwkYjn9z5C7WOre4dB2rMSz18y5Y8CuAGq4Y0A0rQ2JNVckHSDZ+lBaVbwo+3uB3XWiTxZdKl0jFnK+/Ww4Hnsf+mEbI7EUFvwGFMWNnNIdFnRwNBvamlTSL3lYTDu3QihGJqhtAE6kVQ0EIZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJhdTGIx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a68b54577aaso149647766b.3
        for <sparclinux@vger.kernel.org>; Thu, 06 Jun 2024 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717692590; x=1718297390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXklq3VgB30R+o4fq7okdZC1G76cerOH8ymTCu7s03o=;
        b=FJhdTGIxctQIk6xOF7Zd1CW+slog1vE6ixCwSs90XTWdHvLrBkGDpnZvoFXFyz1T1o
         V4F8vhBb8Z9pLu4Hey3uN7SpOw98HEw5zZfZg9nMeeIq15SzcDrkfc3yFfMIQ7cGDLhS
         uzuog7ycVldhDgR/tnY8wgKRLn4ZW48PynK4NO30CtEOjuoJprXwbn/n4AAzAzVSv1eV
         YT0AOV+hEMO0OE5fYOn1IKcOU5GzjY3ixs74XLG4XOqY9urvq4k+mtpko+C7uMZ+/mT5
         RJdnLuvYqSwOku/GHAfZY23nQtqTtYRUtFX7oZeCPiXA05AnDfx9g6sPjP2AepkKYJom
         UYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717692590; x=1718297390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXklq3VgB30R+o4fq7okdZC1G76cerOH8ymTCu7s03o=;
        b=BAI/IMtU1xbMndAaKXgPUqAlqhIz6oYl4y3PLgJqzIMage6Y05z/jSon++ksq+KS16
         weT5b5d5AnWSsje6tKdIbROdTDtCJ43CXxd2cqNA7bD0ClyP+9XRqAlJP+LTISJ8EnP2
         IDS1+u+po4Pkk4ICXEO93PgBTX3MzyN2hH3dTfkknDG8pL30yP3y1YeVoxpcPQ9amkKM
         +MKwuT0rZaJsP32v2UsK2xeBGn70zyRXvq2gg2+XJk9jJmGbEEbZdfMkx84FnuDANaPu
         RkVsQvhepo6je3PMJ5x3e5PmgIqcRDj/CmV7REZs7NWeb4A6ORgstdOQNo1ji7nUMTLg
         XZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaWnKuHccq3HlOA/vYvL4XopRhAJ0J3JBdo0jtAfiJYwfrpdNEjg8Sf4Li/sf2OV7a8yi3vH59DxFc5m8PV40ivS5RMJjFggaIlQ==
X-Gm-Message-State: AOJu0YzDnJuySF27TBkdrw0Wn9EQrTlg9Pa3YO06/nVck8m+8G4wwp2X
	OI5GMYtPghAugXaZB4SWMq8hBHlH8JOmqHt0zQmtiqjekV02WB3RVcGAnzqC55A3d0sLUC6P3OI
	XmQp0bOplJjA41NVthosFF8ss0jqNk+dNdP2V
X-Google-Smtp-Source: AGHT+IH2yDy4H26F3I2+8dO9xS+2+lL/iHck43y2iBW4jw1+n0fE7mBk6YXmrPpbRP2wxNUQ12+YElL3P5ewJrljwbU=
X-Received: by 2002:a17:907:7786:b0:a68:c9fa:f19f with SMTP id
 a640c23a62f3a-a6cdb0f542cmr7959966b.53.1717692590194; Thu, 06 Jun 2024
 09:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-11-almasrymina@google.com> <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
In-Reply-To: <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Jun 2024 09:49:38 -0700
Message-ID: <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v10 10/14] net: add support for skbs with
 unreadable frags
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 3:46=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > diff --git a/net/core/gro.c b/net/core/gro.c
> > index 26f09c3e830b7..7b9d018f552bd 100644
> > --- a/net/core/gro.c
> > +++ b/net/core/gro.c
> > @@ -422,6 +422,9 @@ static void gro_pull_from_frag0(struct sk_buff *skb=
, int grow)
> >  {
> >       struct skb_shared_info *pinfo =3D skb_shinfo(skb);
> >
> > +     if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> > +             return;
> > +
> >       BUG_ON(skb->end - skb->tail < grow);
> >
> >       memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
> > @@ -443,7 +446,7 @@ static void gro_try_pull_from_frag0(struct sk_buff =
*skb)
> >  {
> >       int grow =3D skb_gro_offset(skb) - skb_headlen(skb);
> >
> > -     if (grow > 0)
> > +     if (grow > 0 && skb_frags_readable(skb))
> >               gro_pull_from_frag0(skb, grow);
> >  }
>
> I'm unsure if this was already mentioned, so please pardon the eventual
> duplicate...
>
> The above code is quite critical performance wise, and the previous
> patch already prevent frag0 from being set to a non paged frag,


Hi Paolo!

The last patch, d4d25dd237a61 ("net: support non paged skb frags"),
AFAICT doesn't prevent frag0 from being a non-paged frag. What we do
is set ->frag0=3Dskb->data, then prevent it from being reset to
skb_frag_address() for non-paged skbs. ->frag0 will likely actually be
a bad value for non-paged frags, so we need to check in
gro_pul_from_frag0() so that we don't accidentally pull from a bad
->frag0 value.

What I think I should do here is what you said. I should make sure
frag0 and frag0_len is not set if it's a non-paged frag. Then, we
don't need special checks in gro_pull_from_frag0 I think, because
skb_gro_may_pull() should detect that frag0_len is 0 and should
prevent a pull.

I will apply this fix to the next iteration for your review. Let me
know if I missed something.


> so what
> about dropping the above additional checks?
>


--
Thanks,
Mina

