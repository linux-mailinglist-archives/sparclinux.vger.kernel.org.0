Return-Path: <sparclinux+bounces-1163-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7D8BEA2F
	for <lists+sparclinux@lfdr.de>; Tue,  7 May 2024 19:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44DB31C21F80
	for <lists+sparclinux@lfdr.de>; Tue,  7 May 2024 17:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCDF15ECD6;
	Tue,  7 May 2024 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DHVH+PJS"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290A157A41
	for <sparclinux@vger.kernel.org>; Tue,  7 May 2024 17:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102124; cv=none; b=Rh0WTBvUed4hBOHXx2BmHF18zgckG0o24e5MyXXg0NydJIgJ7+iLWgYdRqLwYy1z/adyTqExIhi0H1HY6RQSX9wjefjU8WMtT9HGmKtD4T8rFHK54DWlDDwAuKKmJ1Y9q0z14u0ZjTX0OkQJlanXmp8Kumm74Si75oi+fVL5y2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102124; c=relaxed/simple;
	bh=yDxPlO4WrIjeqkPQr1tWVOcKWMzq48rRYXAZ9FQA6wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJplZqUCeCKW1/EtASSvF6mgTw3oiRtl38w55b7l3PWPvtXbNwq1naURaQVotKqQTiVs43uFm02NSq86Z863m/xhbP5QBrkYgEnM6PKtAsLx1c9Vc4EJ98cDqLCDkLBqPsvFrRO59RpxvQuMDbj2/4SsoWZ3SqRA6rWzCg1We58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DHVH+PJS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51fea3031c3so4378154e87.0
        for <sparclinux@vger.kernel.org>; Tue, 07 May 2024 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715102121; x=1715706921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMvfDOvPFL6UptO1Upug97aOGGLmrRd7m4cshxAtOPQ=;
        b=DHVH+PJSt+j3Gp/cozTNkkDJnbDqF2r++Ogk1sm40sQX41ebmP3mWEMJRHew18VwPl
         M1TynCnHRXFkOQBnMQrBTICWB0z1X108PACkFUqFsMuFbcXbIzz24oIBfI6I9kC/Ywjx
         u13yMmDlBh987AE8fZqQn2AH0d+ze+dODMUnIUuorvjuKc53okGRiXe3dyznQFRBcBA9
         dwDf5v8qiOe6LQj6XiRe/Lh5QTy+Ff45pg4OPPNqHlnmYDlC6x/IQVlFhvV72PVhhAMf
         ElRcfWRZJEWBagn6/qLskFjVUV1MuYX9fXq3KzsvhLtsOzzFiN4IA8ITJs4X3yAJVq0P
         BMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715102121; x=1715706921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMvfDOvPFL6UptO1Upug97aOGGLmrRd7m4cshxAtOPQ=;
        b=osxmglhF9SxDOGhN6kcKd7D+tAVlPYpqVdbbK2zb1HMny81AoN7YRs6tImXRQvgAPQ
         gXYypPlcfDViSUhCYstE90lTWaHTMNem2PWiIgbmNuUpvJap0whAKPqDRbsX2pcKYaWg
         j6lbbGz/pvNVZpaNhUONiVGZrcTxhIZEqHs08eqmiXA9EcUnA0Yj41ad9DzelsCRhdLT
         ni1I6wlD+J2m9YToX79zEJv3QnA/NTq4LiSqof0/daqweWleE7ib4BazJs/QEtnzdQXm
         QRPQGveK0f0HpoY3T7rk3HYDvu8P3i3ynQcfYgddmlwGWCL74dGKyDdLf6nXKi9Lm09b
         eyTA==
X-Forwarded-Encrypted: i=1; AJvYcCU71DF/BRdRdLhY0dAgFIf+PHgeMyCi9fM/+UF2bWFpoFUhNXql3tHBkQDAn3BMvZPzZmeZyRFjsl/X8U2p+7/uzYe0K+nd3DNBZA==
X-Gm-Message-State: AOJu0Yyn8jTDFq+57gi2eZ72t/fsvzziHUiyAUNwA7OEGUdn355FCbE8
	GfaYMR12MaePLJxtFkOuGJ6jv0LM5Zgg+sneXCufIZiI/sOMMO4C+4AINMNAm/R75PWSEPlxaK6
	NHOZ1qdr2Rtp5F1qmwXjGmL/pqixaRVO977O6
X-Google-Smtp-Source: AGHT+IH8jTguB4ri/cRuFQ0IHVasVwe3SvRIiHk57+cBoV4oS/mWn0OvKI+w8EfgKRV7I77H/Y54420FE4KlaYtCWMA=
X-Received: by 2002:ac2:5dfb:0:b0:51f:36ed:ee43 with SMTP id
 2adb3069b0e04-5217c760288mr120513e87.31.1715102120263; Tue, 07 May 2024
 10:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com> <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org> <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org> <54b1bf11-0f9a-4e9e-9e5c-7d81e066fc7c@gmail.com>
In-Reply-To: <54b1bf11-0f9a-4e9e-9e5c-7d81e066fc7c@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 May 2024 10:15:08 -0700
Message-ID: <CAHS8izNL-phg3y9xiQbx7A2wQE3ZZKXiQA0oFW9mgj4ONk7GSw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
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
	Amritha Nambiar <amritha.nambiar@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, 
	Aleksander Lobakin <aleksander.lobakin@intel.com>, Michael Lass <bevan@bi-co.net>, 
	Jiri Pirko <jiri@resnulli.us>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Richard Gobert <richardbgobert@gmail.com>, 
	Sridhar Samudrala <sridhar.samudrala@intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
	Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 9:55=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 5/7/24 17:23, Christoph Hellwig wrote:
> > On Tue, May 07, 2024 at 01:18:57PM -0300, Jason Gunthorpe wrote:
> >> On Tue, May 07, 2024 at 05:05:12PM +0100, Pavel Begunkov wrote:
> >>>> even in tree if you give them enough rope, and they should not have
> >>>> that rope when the only sensible options are page/folio based kernel
> >>>> memory (incuding large/huge folios) and dmabuf.
> >>>
> >>> I believe there is at least one deep confusion here, considering you
> >>> previously mentioned Keith's pre-mapping patches. The "hooks" are not
> >>> that about in what format you pass memory, it's arguably the least
> >>> interesting part for page pool, more or less it'd circulate whatever
> >>> is given. It's more of how to have a better control over buffer lifet=
ime
> >>> and implement a buffer pool passing data to users and empty buffers
> >>> back.
> >>
> >> Isn't that more or less exactly what dmabuf is? Why do you need
> >> another almost dma-buf thing for another project?
> >
> > That's the exact point I've been making since the last round of
> > the series.  We don't need to reinvent dmabuf poorly in every
> > subsystem, but instead fix the odd parts in it and make it suitable
> > for everyone.
>
> Someone would need to elaborate how dma-buf is like that addition
> to page pool infra.

I think I understand what Jason is requesting here, and I'll take a
shot at elaborating. AFAICT what he's saying is technically feasible
and addresses the nack while giving you the uapi you want. It just
requires a bit (a lot?) of work on your end unfortunately.

CONFIG_UDMABUF takes in a memfd, converts it to a dmabuf, and returns
it to userspace. See udmabuf_create().

I think what Jason is saying here, is that you can write similar code
to udmabuf_creat() that takes in a io_uring memory region, and
converts it to a dmabuf inside the kernel.

I haven't looked at your series yet too closely (sorry!), but I assume
you currently have a netlink API that binds an io_uring memory region
to the NIC rx-queue page_pool, right? That netlink API would need to
be changed to:

1. Take in the io_uring memory.
2. Convert it to a dmabuf like udmabuf_create() does.
3. Bind the resulting dmabuf to the rx-queue page_pool.

There would be more changes needed vis-a-vis the clean up path and
lifetime management, but I think this is the general idea.

This would give you the uapi you want, while the page_pool never seen
non-dmabuf memory (addresses the nack, I think).


--=20
Thanks,
Mina

