Return-Path: <sparclinux+bounces-1303-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219790215F
	for <lists+sparclinux@lfdr.de>; Mon, 10 Jun 2024 14:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F0F1C21538
	for <lists+sparclinux@lfdr.de>; Mon, 10 Jun 2024 12:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498187BB13;
	Mon, 10 Jun 2024 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fqDNmK54"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9C7F492
	for <sparclinux@vger.kernel.org>; Mon, 10 Jun 2024 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021791; cv=none; b=NUaDa8OAvqqyJPKZztxYmankq6J0djzxtoFQyV9RBu4JJ+dPqYBxeufZNyOfbstdi48mpeozSqtMwvnpcFtp/0FIU/H6mdpGC3vwwpmu0bNewp9kqCGAjckljO5WL/NTvQUlq8ZlSJhfZnd1I4geuR3/6T2bAC7wYUvGwf6ECCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021791; c=relaxed/simple;
	bh=wqKQas949IIXrsipBtEwY28UkuazUZ16a21oKmwHiv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnJsBz8jiP+UlSkvrY8kh7DV5cAQj4u5vX9PiNhlK8qVvDN5UMgaPFFRKPcGM1R2luJ4IKdoLPGFLCz+K2+aKF0UDMxTw5ON1E0sK7588TcFqtpMl1zZEmbZL2gwyO4nNCKCjHHo16lVGdeT94hIP45IGDcwjsDn8bspWRxup1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fqDNmK54; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a0849f5a8so42129667b3.2
        for <sparclinux@vger.kernel.org>; Mon, 10 Jun 2024 05:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718021788; x=1718626588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLBhiGTWQPkGSzXF44ZdseZQqm/Ay7CrbOb4xYeFmxw=;
        b=fqDNmK54kqBa6EQtJoGnldfHFauQ6kcsHN8jJRtx3a3rll3Um/eyPaj3jVHFB+tyw7
         oWllKFUvqeIWDHF887kAzWvvU2KdZlizeuujfZw56cW3rHyG0oOcnpydIhz7FnSl+hXL
         U1KjenD06DybeKg4nnOats3t12CBNccFG6N8XmD8XbhnL0U0M5o2hd2PsPLpd5/9lTX1
         NjMsJx1Nc/2JFedHyuBzS1TuVPQ0pno023UGN7oqWLiAo0tvFSQm4VVsGEzDH5kI2kIh
         JYXjXf1y56GIE8lsAofXPKrSTQcUoBAoqT3pE/mAb6WpQ96S6WM6PKQTPTnkDqCnPnsn
         7TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718021788; x=1718626588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLBhiGTWQPkGSzXF44ZdseZQqm/Ay7CrbOb4xYeFmxw=;
        b=KA0dJNh9YCnqPnpWAnMArq4dHehfbWRh7oE2bxh7yka4HUHBnnljmnCB09lD9RKXXL
         ls20ETgYyJbpmoTqO/mFTm3tkqJ+PZQ4IlIbz+7mpF3WdNZYm9rUOBeG1c68iRAGueIi
         7J3c+zxqisxi0KUPMExWsesua6V8fcF1X9QVKe6vS19fdpesgOdD5Q0//yzjj6FXj6Qx
         7B+PKhlSjDhH9l6V50iQtwAwCJzI6ZCM4Ecyunb4wXnbUUomS8ksSlNqTZUAWOeHcFCG
         WVhCBGf1LUGI+MDD+fCgWyJYquzzAArZur3AkvyIrzv1Z3lHJ+Ik2wDMe0nqjBnZm0Ag
         Zsrw==
X-Forwarded-Encrypted: i=1; AJvYcCW3UuFYQR1M3aiG8PTq1F6fa6w2fSCU207IHKuN6Hw4wFWRGYU+hZhZt/JviPGMeF2UfpePkOAa8LrRhAoX3xGVZHPDeSEgKxrQGQ==
X-Gm-Message-State: AOJu0YxBzU6PWTRnbYx3RNRYWE3QuljUMzW+oDUNlN27yfy+jVT1+F6N
	i2Psel6Fuv3dSWULRYCKS94/dahopdnfsS2rLJzd767qC3nQipWjMDK+ncFi4l8=
X-Google-Smtp-Source: AGHT+IHKUHpBEHdEL4hUatHn2U1DbF50V0YQ7tp+HSd+jRZUj7MSdsNfIMBQ/mHVI5dhq2ZCcmRiZw==
X-Received: by 2002:a81:6fd5:0:b0:627:dca5:407b with SMTP id 00721157ae682-62cd55c0a56mr87073917b3.13.1718021786857;
        Mon, 10 Jun 2024 05:16:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6213dfsm45360126d6.23.2024.06.10.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 05:16:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sGdwn-00Di9E-NN;
	Mon, 10 Jun 2024 09:16:25 -0300
Date: Mon, 10 Jun 2024 09:16:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Wei <dw@davidwei.uk>, David Ahern <dsahern@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240610121625.GI791043@ziepe.ca>
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>

On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
> On 6/10/24 01:37, David Wei wrote:
> > On 2024-06-07 17:52, Jason Gunthorpe wrote:
> > > IMHO it seems to compose poorly if you can only use the io_uring
> > > lifecycle model with io_uring registered memory, and not with DMABUF
> > > memory registered through Mina's mechanism.
> > 
> > By this, do you mean io_uring must be exclusively used to use this
> > feature?
> > 
> > And you'd rather see the two decoupled, so userspace can register w/ say
> > dmabuf then pass it to io_uring?
> 
> Personally, I have no clue what Jason means. You can just as
> well say that it's poorly composable that write(2) to a disk
> cannot post a completion into a XDP ring, or a netlink socket,
> or io_uring's main completion queue, or name any other API.

There is no reason you shouldn't be able to use your fast io_uring
completion and lifecycle flow with DMABUF backed memory. Those are not
widly different things and there is good reason they should work
together.

Pretending they are totally different just because two different
people wrote them is a very siloed view.

> The devmem TCP callback can implement it in a way feasible to
> the project, but it cannot directly post events to an unrelated
> API like io_uring. And devmem attaches buffers to a socket,
> for which a ring for returning buffers might even be a nuisance.

If you can't compose your io_uring completion mechanism with a DMABUF
provided backing store then I think it needs more work.

Jason

