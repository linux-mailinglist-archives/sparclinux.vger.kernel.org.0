Return-Path: <sparclinux+bounces-1959-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55195588A
	for <lists+sparclinux@lfdr.de>; Sat, 17 Aug 2024 17:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB5F1F2166E
	for <lists+sparclinux@lfdr.de>; Sat, 17 Aug 2024 15:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A855A149E1A;
	Sat, 17 Aug 2024 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U9+1GQSU"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82519621
	for <sparclinux@vger.kernel.org>; Sat, 17 Aug 2024 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723907632; cv=none; b=QyLEJWCdz34MYO5tKx/zn0tv+MmMowoPmAqtASbCjiyEoev2/lrUqqADrQTA+Tg+38F9sxOtlImylNFTE4GOC5iYAbqbdRibsHHGL7E5zOvo2XUA6YQVN1vgh3YBj/8WYlYiQf2+hF/s3JtM6qcyy/Fey0HDUOff0gOBLRdno7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723907632; c=relaxed/simple;
	bh=f4FKGxVYQxxLRQXGi6/ad1xe8zUcE9oY9HGYW6YKezU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+Ozg/5Hh1LHo2t+N+pog+k2tF68lEbSnlKe8Qy6XhIDPcS16LTRZeerce8kyA+BZkEqHjInlNXAwXrCrbbHenZtit4F856g5qfbTwaNeAH6NBoXVFWLCk1J0SWr3UEbnnKsqGHn2A1rdVIDDJs1nJb2pEcuQBHziiGBtDhECp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U9+1GQSU; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6bf6beda0c0so17198746d6.1
        for <sparclinux@vger.kernel.org>; Sat, 17 Aug 2024 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723907629; x=1724512429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8fuP4rXSYs0IsxsahVa0Q55YFfnXxVc+PpufNcWYNA=;
        b=U9+1GQSUeEWxIibtppep4qqj4OpdA4mm2tCOuBsqsxkbvUJXxxoHvC/1DD8XHYEu8i
         WjEgJp64Wh0LjJMNctGnsHDdI4LWWS4i1de+9JlsKLbjhuxqNGnqQc6jEWF/WIZdyoE8
         Ood0I9cMludlmhZXLRIR99I6NTR03YjLyd2UU8aPRBzFY2EVJN3zKFaiACpBDkuLmbAs
         KhMnNOiWEb+OtTL7MMrHZDKy9Eh+cAn0nWsdeIFVr9qOqYdsd6BN0FHrwHGsI7Ewhy3K
         sam5K1XJncYJcHKCyUHyfaQ13LVvQhnOQYzacwOTyK4ahx+PK34TLjUH1vu5Rlz3DzPk
         osJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723907629; x=1724512429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8fuP4rXSYs0IsxsahVa0Q55YFfnXxVc+PpufNcWYNA=;
        b=Zus7hkIOezfbtXls7H7tl4cepArAASYfoegr6uG1rpeHlheXmnzIL+zAXP8aO49/L5
         4u9pMaRHLG/SWXDLUef3Mz92XCWJS8OCvvriWLZ6hHWRv06WR69kHELvJHXxhVNOn9sL
         8e3MwqZ0aaDjS6ZrjYLiuBRSTX/Cc4zAnkRUifzpBxli4QzDXVgA9i+GvJ6kVHEz3R0N
         Lt8hHH/DKmXRk3bPUF/LgRf3IHaw+BAOwDM6Nn8hT7gDwDL4UgaVN8Y3XOcqsoevECzP
         FOEl74t6SGyUpBSw+MIN/Ck2gzsJF+c3EMEhEhcfQHeTG0SeW5UuQRqj8SAKp1XWffLi
         KrfA==
X-Forwarded-Encrypted: i=1; AJvYcCViZLoUAqXmwch7f2sm0TCPQTmh1ZJuWAmZg1VlapRm2o1bJBju28tf2a+pUhxCSTf61y4PMz2rZN0uWjYvSuesNQ2+pYNPZ3+CEw==
X-Gm-Message-State: AOJu0YyK1r3soirz9IeV0KwDxh2Ge9OMsTgVnQFR1WFK4qTZVInaw7/1
	6p5xqnPK60Mlf4dQni2alHQqWSnu9upKQyCt7QiuCp738JD6TLsyznAURapnIqLmKVAikFLPbum
	ao+djnu64VFrw+G2WXBet1hfM7a/Hs6cOOBuf
X-Google-Smtp-Source: AGHT+IEVoTrHdVFvEzEpKQmmtV0mdfaBBccZW7R2wrmBmSZjuFbL1LJHUNlqx3hUH+/ws9eu5VXMD1mp4i3r/g0VSRU=
X-Received: by 2002:a0c:f40d:0:b0:6bf:79c1:b9aa with SMTP id
 6a1803df08f44-6bf8950a6c2mr26142936d6.33.1723907629272; Sat, 17 Aug 2024
 08:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813211317.3381180-10-almasrymina@google.com> <CAMArcTW=mg2gF_e6spPWOCuQdDAWSuKTCdCNPWGqcU1ciq30EQ@mail.gmail.com>
In-Reply-To: <CAMArcTW=mg2gF_e6spPWOCuQdDAWSuKTCdCNPWGqcU1ciq30EQ@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 17 Aug 2024 11:13:34 -0400
Message-ID: <CAHS8izOqGMiZNkfQ6G-29UuG64GVo7L+fAzWn5A1713cDAgbgg@mail.gmail.com>
Subject: Re: [PATCH net-next v19 09/13] tcp: RX path for devmem TCP
To: Taehee Yoo <ap420073@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 9:58=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> On Wed, Aug 14, 2024 at 6:13=E2=80=AFAM Mina Almasry <almasrymina@google.=
com> wrote:
> >
>
> Hi Mina,
>
> > In tcp_recvmsg_locked(), detect if the skb being received by the user
> > is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVME=
M
> > flag - pass it to tcp_recvmsg_devmem() for custom handling.
> >
> > tcp_recvmsg_devmem() copies any data in the skb header to the linear
> > buffer, and returns a cmsg to the user indicating the number of bytes
> > returned in the linear buffer.
> >
> > tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> > and returns to the user a cmsg_devmem indicating the location of the
> > data in the dmabuf device memory. cmsg_devmem contains this information=
:
> >
> > 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
>
> I have been testing this patch and I found a bug.

Thanks Taehee. It's exciting to see that you have gotten this far in
your testing!! You seem to have devmem TCP (almost) fully working!!
May I ask which driver this is? I assume it's bnxt. Do you have the
driver support somewhere on github or something? I'm curious what your
driver implementation looks like.

> While testing it with the ncdevmem cmd, it fails to validate buffers
> after some period.
> This is because tcp_recvmsg_dmabuf() can't handle skb properly when
> the parameter offset !=3D 0.

Sadly I'm unable to reproduce this issue, but I think I know where to
suspect the bug is. Thanks for taking the time to root cause this and
provide a fix.

...

> > +               offset =3D 0;
>
> If the offset is 5000 and only 4500 bytes are skipped at this point,
> the offset should be 500, not 0.
> We need to add a condition to set the offset correctly.
>

I highly suspect this is a regression that was introduced in v13. In
v12 Pavel asked if offset can just be set to 0 here, and I didn't see
any reason why not, so I made the change:

    -+          offset =3D offset - start;
    ++          offset =3D 0;

It looks like we missed something. I suspect reverting that may
resolve the issue, because __skb_copy_datagram() in earlier kernels
modified offset like this and it's well tested. Can you test with this
change reverted? Diff like so:

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 40e7335dae6e..984e28c5d096 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2522,7 +2522,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk,
const struct sk_buff *skb,
                 */
                skb =3D skb_shinfo(skb)->frag_list ?: skb->next;

-               offset =3D 0;
+               offset =3D offset - start;
        } while (skb);

        if (remaining_len) {

I'm running a long test to try to reproduce this issue, but I have ran
many long tests before and was not able to. For some reason my setup
is not able to reproduce this edge case. Are you doing anything
special with ncdevmem? Or simply running commands like these on the
server client?

server: ./ncdevmem -s SERVER -c CLIENT -l -p 5224 -v 7
client: yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | tr \\n \\0 |
nc SERVER 5224 -p 5224


--=20
Thanks,
Mina

