Return-Path: <sparclinux+bounces-1168-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181C8BEAF0
	for <lists+sparclinux@lfdr.de>; Tue,  7 May 2024 19:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED21F2821F4
	for <lists+sparclinux@lfdr.de>; Tue,  7 May 2024 17:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489CC16D320;
	Tue,  7 May 2024 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lIpXG8KP"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C616C873
	for <sparclinux@vger.kernel.org>; Tue,  7 May 2024 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104609; cv=none; b=fDrJTdVVLTPjw1I8WAnIMa9zQ0mKToBp0YeOw58RJLlfl+MspfcaM8/Rmhv9iqdyUa+ZoJQNFNMIFUSg9Acmuw87t0PZKa5qZd6nc3x5x+vfFpKP6MgSvdYaVe6NpOvU0NGG1qqUV8Qp7mVP+4Lz4P6CxZCMiiKj7NwhqUq2w6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104609; c=relaxed/simple;
	bh=2WVuSd42XVbejvGzvbE/XdmU6u71Lu82dpSc5WCFvqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf4U0wlT1grSVjxZ14XkjaiLCMYCkSwjSIDGdXDwKR/1KNQ49jqlG0+Uh/xlTScVDRf40k6DRKSgY8OsGJ9bFUgogyXq8nIf4T3Ba6p8I7vZynzQnW5e+ryy2kF2VQyIDbF8iwlKdwg1EQtClr1ehXbTUOtWvOdSjDsa3FP9YD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lIpXG8KP; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-792639cf4faso344393285a.1
        for <sparclinux@vger.kernel.org>; Tue, 07 May 2024 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715104606; x=1715709406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu9WbbBrtYOSeavstfMRlNJlMm/0/4MuzUdv+q+e+RU=;
        b=lIpXG8KPmCMXpUh7JZ5V/2Srhwf1899y4M6b9Z4m2rUYLhAVXEKRAj2RbS/QyN5GNf
         2R8Y4+kgBdJGnCvROMTlZNIII1WTss+Y5khV/PgrQo+7sFWO045oo8Cqya9djusUOWdw
         LjZeH6XKCmyZLORSKOBUwlvwrfH4qmIGzYQkzC0FW+KOzcd1qDlIaV378bwVFn5loS4F
         wqiIsJ0r9R80fgWfGYfaMSewGq3VGJUQqs2m7pEBn1QuVVPuWPc+JHx7ApEjyrIF6254
         hWGm76/BZ+9Oo3kYlmqV0lfJs1bxJo0/Ebfpx75oRZa2ZnfSRTfebpn97TzpAwwECN+Z
         +lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715104606; x=1715709406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu9WbbBrtYOSeavstfMRlNJlMm/0/4MuzUdv+q+e+RU=;
        b=SLMKfnA7d4n2NgvudterxbvQfqYVq+Oj3KygSaykWcBeSgvhz7FtcEl8EKrONZbHT+
         kmshX2l9s/iDr9O7KFmyKNy688B7bntzPsqne8XvU2DeKdOiqObM0jxQQl0mypZmXGkL
         qMRE6qJO4/U4jRrmfliYsHALgeq4gGojvD5WDwDHsPTN+aMJaQHijyGQ1XCxAtaQ8EcH
         kD5CyZN3dYVtl0E0cRA6K6x9l2pO7KFhxkijkU5f+27oQBSyAdNQ8pIux14eGCt+koIo
         iv6WthM000GOYQU8+dPMKJG53X5oZV31CzFRhDY+ehOVQTljQu3VwUcaLC3HpiBgXjkW
         vD1g==
X-Forwarded-Encrypted: i=1; AJvYcCXlO+Lgo9XKx1VQ8UIB6aYiOXNvA0dj9IWzclQstohdkAiRnVAveUiSRzxkn+fhaMQWhCQAQ/ZU5GBCM/sxitVR46cDDxaWlftNFg==
X-Gm-Message-State: AOJu0Yw9033nKP+0CHe8US+m4/tEjPB5rc603CXqdTS3ILq898cV6kIx
	xZg9ulRH5yEnRamWq/7/rL3E1cM0Tm90sRW6fo7jWwboOE9MhUwbW1ZKLN/L3kI=
X-Google-Smtp-Source: AGHT+IGCzj6XuEJPrKRVtB6HNDvjYgTlCCuf3Mc1RlNFJ90uDv9nZUQTLULizJXrrgrWoRFfeuAAuA==
X-Received: by 2002:a05:620a:5a4b:b0:790:7345:2791 with SMTP id af79cd13be357-792b274eabbmr46464985a.56.1715104606118;
        Tue, 07 May 2024 10:56:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm5127446qkb.25.2024.05.07.10.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 10:56:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4P3U-00022m-Vn;
	Tue, 07 May 2024 14:56:44 -0300
Date: Tue, 7 May 2024 14:56:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>,
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
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Florian Westphal <fw@strlen.de>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Aleksander Lobakin <aleksander.lobakin@intel.com>,
	Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Richard Gobert <richardbgobert@gmail.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240507175644.GJ4718@ziepe.ca>
References: <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca>
 <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>

On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
> On 5/7/24 17:48, Jason Gunthorpe wrote:
> > On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
> > 
> > > 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> > > think in the past you said it's a uapi you don't link but in the face
> > > of this pushback you may want to reconsider.
> > 
> > dmabuf does not force a uapi, you can acquire your pages however you
> > want and wrap them up in a dmabuf. No uapi at all.
> > 
> > The point is that dmabuf already provides ops that do basically what
> > is needed here. We don't need ops calling ops just because dmabuf's
> > ops are not understsood or not perfect. Fixup dmabuf.
> 
> Those ops, for example, are used to efficiently return used buffers
> back to the kernel, which is uapi, I don't see how dmabuf can be
> fixed up to cover it.

Sure, but that doesn't mean you can't use dma buf for the other parts
of the flow. The per-page lifetime is a different topic than the
refcounting and access of the entire bulk of memory.

Jason

